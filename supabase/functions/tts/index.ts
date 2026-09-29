import { createClient } from 'https://esm.sh/@supabase/supabase-js@2';

const corsHeaders = {
  'Access-Control-Allow-Origin': '*',
  'Access-Control-Allow-Headers': 'authorization, apikey, content-type, x-client-info',
};

function json(body: unknown, status = 200) {
  return new Response(JSON.stringify(body), {
    status,
    headers: { ...corsHeaders, 'Content-Type': 'application/json; charset=utf-8' },
  });
}

function base64FromArrayBuffer(buffer: ArrayBuffer): string {
  const bytes = new Uint8Array(buffer);
  let binary = '';
  const chunkSize = 0x8000;
  for (let i = 0; i < bytes.length; i += chunkSize) {
    binary += String.fromCharCode(...bytes.subarray(i, i + chunkSize));
  }
  return btoa(binary);
}

const TTS_CACHE_BUCKET = 'tts-cache';

// Aynı (ses, metin) çifti tekrar istendiğinde ElevenLabs'e yeniden ödeme
// yapmamak için içerik-adresli önbellek anahtarı. Ders cümleleri sabit
// olduğu için bu anahtar tüm kullanıcılar arasında paylaşılır.
async function cacheKeyFor(voiceId: string, text: string): Promise<string> {
  const data = new TextEncoder().encode(`${voiceId}::${text}`);
  const digest = await crypto.subtle.digest('SHA-256', data);
  return Array.from(new Uint8Array(digest))
    .map((byte) => byte.toString(16).padStart(2, '0'))
    .join('');
}

// Per-language voice override lookup. Operatör ElevenLabs Voice Library'den
// her dil için gerçek bir ses seçtikten sonra `supabase secrets set
// ELEVENLABS_VOICE_ID_<LANG>=<id>` çalıştırır (örn. ELEVENLABS_VOICE_ID_JA=...).
// Hiçbiri ayarlanmadıysa tüm diller mevcut tek varsayılan sese düşer — regresyon yok.
function resolveVoiceId(
  requestedVoiceId: string | undefined,
  lang: string | undefined,
  defaultVoiceId: string,
): string {
  if (requestedVoiceId) return requestedVoiceId;
  if (lang) {
    const perLangVoiceId = Deno.env.get(`ELEVENLABS_VOICE_ID_${lang.toUpperCase()}`);
    if (perLangVoiceId) return perLangVoiceId;
  }
  return defaultVoiceId;
}

Deno.serve(async (request) => {
  if (request.method === 'OPTIONS') return new Response('ok', { headers: corsHeaders });
  // Sıfır maliyet: ücretli dış API'ler varsayılan olarak kapalı. Açmak için
  // Supabase secret: VOXELITH_PAID_APIS=true (bkz. lib/core/features.dart).
  if (Deno.env.get('VOXELITH_PAID_APIS') !== 'true') {
    return json({ error: 'feature_disabled' }, 410);
  }
  if (request.method !== 'POST') return json({ error: 'method_not_allowed' }, 405);

  const authorization = request.headers.get('Authorization');
  if (!authorization?.startsWith('Bearer ')) return json({ error: 'authentication_required' }, 401);

  const supabaseUrl = Deno.env.get('SUPABASE_URL');
  const serviceRoleKey = Deno.env.get('SUPABASE_SERVICE_ROLE_KEY');
  const elevenLabsApiKey = Deno.env.get('ELEVENLABS_API_KEY');
  const defaultVoiceId = Deno.env.get('ELEVENLABS_VOICE_ID') ?? '21m00Tcm4TlvDq8ikWAM'; // "Rachel" — ElevenLabs varsayılan çok dilli ses
  if (!supabaseUrl || !serviceRoleKey || !elevenLabsApiKey) {
    return json({ error: 'service_not_configured' }, 503);
  }

  const admin = createClient(supabaseUrl, serviceRoleKey, {
    auth: { persistSession: false, autoRefreshToken: false },
  });
  const jwt = authorization.slice('Bearer '.length);
  const { data: userData, error: userError } = await admin.auth.getUser(jwt);
  if (userError || !userData.user) return json({ error: 'invalid_session' }, 401);

  // Premium ses karakter başına ücretli — yalnızca Plus üyeler kullanabilir,
  // aynı chat/translate fonksiyonlarındaki subscriptions kontrolü.
  const { data: subscription } = await admin
    .from('subscriptions')
    .select('status, plan, current_period_end')
    .eq('user_id', userData.user.id)
    .in('status', ['active', 'trialing'])
    .maybeSingle();
  const periodEnd = subscription?.current_period_end
    ? new Date(subscription.current_period_end).getTime()
    : 0;
  if (!subscription || periodEnd <= Date.now()) return json({ error: 'plus_required' }, 403);
  const isBusiness = subscription.plan === 'business';

  let payload: { text?: unknown; voiceId?: unknown; lang?: unknown };
  try {
    payload = await request.json();
  } catch (_) {
    return json({ error: 'invalid_json' }, 400);
  }
  const text = typeof payload.text === 'string' ? payload.text.trim() : '';
  const requestedVoiceId = typeof payload.voiceId === 'string' && payload.voiceId.length > 0
    ? payload.voiceId
    : undefined;
  const lang = typeof payload.lang === 'string' && payload.lang.length > 0 ? payload.lang : undefined;
  const voiceId = resolveVoiceId(requestedVoiceId, lang, defaultVoiceId);
  if (!text || text.length > 400) return json({ error: 'invalid_request' }, 400);

  // Ders cümleleri sabittir (Scenario/Phrase/SpeakTurn içeriği) — aynı
  // (ses, metin) çifti daha önce üretildiyse ElevenLabs'e hiç gitmeden
  // önbellekten döneriz. Bu isabet ücretsizdir, bu yüzden günlük limite
  // saymayız; yalnızca gerçekten yeni bir sentez limitten düşer.
  const cacheKey = await cacheKeyFor(voiceId, text);
  const cachePath = `${cacheKey}.mp3`;
  const { data: cached } = await admin.storage.from(TTS_CACHE_BUCKET).download(cachePath);
  if (cached) {
    const cachedBuffer = await cached.arrayBuffer();
    if (cachedBuffer.byteLength > 0) {
      return json({ audioBase64: base64FromArrayBuffer(cachedBuffer), mime: 'audio/mpeg' });
    }
  }

  // Plus == pratikte sınırsız konuşma süresi (bkz. UserProfile.speakAllowance),
  // yani TTS oynatma sayısında da istemci tarafında bir tavan yok. ~$0.0045/
  // oynatma — en pahalı tek kalem bu, 4 Eylül'deki maliyet denetiminde
  // 40'tan 8'e düşürüldü ki TÜM AI/ses kalemlerinin toplam worst-case'i
  // aylık abonelik ücretini (~$65/yıl ≈ $5.42/ay) aşmasın. Business, 3 kat
  // daha yüksek fiyatını ($200/yıl) karşılayan gerçek bir değer olarak
  // 20/gün alır — bkz. docs/MALIYET_ANALIZI_2026_09.md. Bu limit yalnızca
  // önbellekte olmayan, gerçekten ElevenLabs'e giden istekler için geçerlidir.
  const TTS_DAILY_LIMIT = 8;
  const TTS_BUSINESS_DAILY_LIMIT = 20;
  const { data: allowed, error: usageError } = await admin.rpc('try_consume_ai_usage', {
    p_user_id: userData.user.id,
    p_op: 'tts',
    p_limit: isBusiness ? TTS_BUSINESS_DAILY_LIMIT : TTS_DAILY_LIMIT,
  });
  if (usageError) return json({ error: 'usage_check_failed' }, 502);
  if (!allowed) return json({ error: 'daily_limit_reached' }, 429);

  const endpoint = `https://api.elevenlabs.io/v1/text-to-speech/${voiceId}`;
  const voiceSettings = { stability: 0.6, similarity_boost: 0.85, use_speaker_boost: true };

  async function synthesize(modelId: string): Promise<Response> {
    return fetch(endpoint, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        'xi-api-key': elevenLabsApiKey,
        Accept: 'audio/mpeg',
      },
      body: JSON.stringify({ text, model_id: modelId, voice_settings: voiceSettings }),
    });
  }

  // eleven_v3 (GA since Feb 2026) is ElevenLabs' most natural/expressive
  // model — same overage price as the older multilingual_v2 ($0.10/1k
  // chars either way), tuned above toward a warm, consistent, non-robotic
  // read rather than dramatic expressiveness (this is a language lesson
  // voice, not a narrator). If v3 isn't available on the account's current
  // plan/region, fall back once to multilingual_v2 rather than surfacing
  // an error and losing the premium voice entirely for that request.
  let providerResponse = await synthesize('eleven_v3');
  if (!providerResponse.ok) {
    console.error('ElevenLabs eleven_v3 failed, retrying with multilingual_v2', providerResponse.status);
    providerResponse = await synthesize('eleven_multilingual_v2');
  }

  if (!providerResponse.ok) {
    console.error('ElevenLabs TTS failed', providerResponse.status, await providerResponse.text());
    return json({ error: 'provider_unavailable' }, 502);
  }

  const audioBuffer = await providerResponse.arrayBuffer();
  if (audioBuffer.byteLength === 0) return json({ error: 'empty_provider_response' }, 502);

  // Sonraki her istek (herhangi bir kullanıcıdan) bu isabeti önbellekten
  // alsın diye sakla. Yükleme başarısız olsa bile yanıtı geciktirmeyiz ya
  // da düşürmeyiz — önbellek yalnızca bir optimizasyon, doğruluk kaynağı
  // değil.
  try {
    await admin.storage.from(TTS_CACHE_BUCKET).upload(cachePath, audioBuffer, {
      contentType: 'audio/mpeg',
      upsert: true,
    });
  } catch (cacheWriteError) {
    console.error('TTS cache write failed', cacheWriteError);
  }

  return json({ audioBase64: base64FromArrayBuffer(audioBuffer), mime: 'audio/mpeg' });
});
