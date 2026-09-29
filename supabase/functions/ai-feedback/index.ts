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

/// Modelin bazen kod bloğuna ("```json ... ```") ya da açıklama metnine
/// sardığı JSON'u savunmacı biçimde çıkarır — istemci tarafındaki
/// ClaudeAiService._extractJsonObject ile aynı mantık.
function extractJsonObject(rawText: string): Record<string, unknown> {
  let s = rawText.trim();
  if (s.startsWith('```')) {
    const firstNewline = s.indexOf('\n');
    if (firstNewline !== -1) s = s.slice(firstNewline + 1);
    if (s.endsWith('```')) s = s.slice(0, -3);
    s = s.trim();
  }
  const start = s.indexOf('{');
  const end = s.lastIndexOf('}');
  if (start === -1 || end === -1 || end < start) {
    throw new Error('no_json_object_found');
  }
  const parsed = JSON.parse(s.slice(start, end + 1));
  if (typeof parsed !== 'object' || parsed === null) throw new Error('not_an_object');
  return parsed as Record<string, unknown>;
}

async function callClaude(
  apiKey: string,
  system: string,
  userPrompt: string,
  maxTokens: number,
  model: string,
): Promise<Record<string, unknown>> {
  const response = await fetch('https://api.anthropic.com/v1/messages', {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
      'x-api-key': apiKey,
      'anthropic-version': '2023-06-01',
    },
    body: JSON.stringify({
      model,
      max_tokens: maxTokens,
      system,
      ...(model.startsWith('claude-sonnet') ? { output_config: { effort: 'low' } } : {}),
      messages: [{ role: 'user', content: userPrompt }],
    }),
  });
  if (!response.ok) {
    console.error('Claude provider failed', response.status, await response.text());
    throw new Error('provider_unavailable');
  }
  const data = await response.json();
  const text = data?.content?.find((b: { type: string }) => b.type === 'text')?.text;
  if (typeof text !== 'string' || !text.trim()) throw new Error('empty_provider_response');
  return extractJsonObject(text);
}

function asScore(raw: unknown): number {
  const n = typeof raw === 'number' ? raw : parseInt(String(raw), 10) || 0;
  return Math.min(100, Math.max(0, n));
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
  const anthropicApiKey = Deno.env.get('ANTHROPIC_API_KEY');
  if (!supabaseUrl || !serviceRoleKey || !anthropicApiKey) {
    return json({ error: 'service_not_configured' }, 503);
  }

  const admin = createClient(supabaseUrl, serviceRoleKey, {
    auth: { persistSession: false, autoRefreshToken: false },
  });
  const jwt = authorization.slice('Bearer '.length);
  const { data: userData, error: userError } = await admin.auth.getUser(jwt);
  if (userError || !userData.user) return json({ error: 'invalid_session' }, 401);

  // Freemium teaser (3 Eylül 2026 kararı): ücretsiz kullanıcı günde 1 kez
  // deneyebilir — özelliğin varlığını ve değerini görsün, sonra Plus'a
  // yönlensin. Plus kullanıcı günde 15'e kadar, Business günde 40'a kadar
  // (Business'ın $200/yıl fiyatını gerçek bir değerle karşılamak için 4
  // Eylül'de eklendi — bkz. docs/MALIYET_ANALIZI_2026_09.md).
  // Sıfır maliyet kuralı (29 Eylül 2026): ücretsiz kullanıcıya bedava AI
  // çağrısı yok. Her hak ödüllü bir reklamla kazanılır (claim_ad_bonus) ve
  // ücretsiz çağrılar ucuz modele gider — bir çağrının maliyeti (~$0.0011)
  // bir ödüllü reklam gösteriminin gelirinin altında kalır.
  const FREE_DAILY_LIMIT = 0;
  const PAID_MODEL = 'claude-sonnet-5';
  const FREE_MODEL = 'claude-haiku-4-5-20251001';
  const PLUS_DAILY_LIMIT = 15;
  const BUSINESS_DAILY_LIMIT = 40;
  // Var olan ödüllü reklam sınırıyla aynı (bkz.
  // lib/data/models/models.dart -> UserProfile.maxRewardedAdsPerDay).
  const AD_BONUS_MAX = 5;

  const { data: subscription } = await admin
    .from('subscriptions')
    .select('status, plan, current_period_end')
    .eq('user_id', userData.user.id)
    .in('status', ['active', 'trialing'])
    .maybeSingle();
  const periodEnd = subscription?.current_period_end
    ? new Date(subscription.current_period_end).getTime()
    : 0;
  const isPlus = Boolean(subscription) && periodEnd > Date.now();
  const isBusiness = isPlus && subscription?.plan === 'business';

  let payload: Record<string, unknown>;
  try {
    payload = await request.json();
  } catch (_) {
    return json({ error: 'invalid_json' }, 400);
  }

  const op = typeof payload.op === 'string' ? payload.op : '';
  const str = (v: unknown) => (typeof v === 'string' ? v : '');

  // İstemci, kullanıcı bir ödüllü reklamı sonuna kadar izleyip AdMob'dan
  // gerçek ödülü aldıktan SONRA bunu çağırır (bkz. ai_feedback_screen.dart)
  // — günlük ai-feedback sayacını TÜKETMEZ, yalnızca sonraki çağrılar için
  // sınırı bir artırır. Plus kullanıcının zaten geniş bir günlük hakkı
  // olduğu için bu yalnızca ücretsiz kullanıcıya uygulanır.
  if (op === 'claim_ad_bonus') {
    if (isPlus) return json({ error: 'not_applicable' }, 400);
    const { data: bonus, error: bonusError } = await admin.rpc('grant_ai_feedback_ad_bonus', {
      p_user_id: userData.user.id,
      p_max_bonus: AD_BONUS_MAX,
    });
    if (bonusError) return json({ error: 'usage_check_failed' }, 502);
    if (bonus === -1) return json({ error: 'ad_bonus_limit_reached' }, 429);
    return json({ bonus });
  }

  const { data: allowed, error: usageError } = await admin.rpc('try_consume_ai_usage', {
    p_user_id: userData.user.id,
    p_op: 'feedback',
    p_limit: isBusiness ? BUSINESS_DAILY_LIMIT : isPlus ? PLUS_DAILY_LIMIT : FREE_DAILY_LIMIT,
  });
  if (usageError) return json({ error: 'usage_check_failed' }, 502);
  if (!allowed) return json({ error: isPlus ? 'daily_limit_reached' : 'plus_required' }, isPlus ? 429 : 403);

  try {
    if (op === 'feedback') {
      const sourceText = str(payload.sourceText);
      const userAnswer = str(payload.userAnswer);
      const targetLanguage = str(payload.targetLanguage);
      const nativeLanguage = str(payload.nativeLanguage);
      if (!sourceText || !targetLanguage) return json({ error: 'invalid_request' }, 400);

      const system =
        'You are a supportive, precise language-learning coach for the ' +
        `"${targetLanguage}" language. Given the expected sentence and the ` +
        "learner's answer, evaluate it and respond with STRICT JSON only " +
        '(no markdown, no prose outside the JSON object) matching exactly ' +
        'this shape:\n' +
        '{"score": <integer 0-100>, "correctedAnswer": <string, the ' +
        'ideal/corrected version of the expected sentence>, "tips": ' +
        '[<2 to 3 short actionable strings>], "encouragement": <one short ' +
        'upbeat string>}\n' +
        `Write "correctedAnswer", "tips", and "encouragement" in the ` +
        `learner's UI language, which is "${nativeLanguage}". Be honest but ` +
        'kind; score reflects grammatical and semantic closeness to the ' +
        'expected sentence, not just word overlap.';
      const user =
        `Expected sentence (${targetLanguage}): "${sourceText}"\n` +
        `Learner's answer: "${userAnswer}"`;

      const result = await callClaude(anthropicApiKey, system, user, 1024, isPlus ? PAID_MODEL : FREE_MODEL);
      const tipsRaw = result.tips;
      const tips = Array.isArray(tipsRaw)
        ? tipsRaw.map((t) => String(t)).filter((t) => t.length > 0)
        : [];
      return json({
        userAnswer,
        correctedAnswer: typeof result.correctedAnswer === 'string' ? result.correctedAnswer : sourceText,
        score: asScore(result.score),
        tips: tips.length > 0 ? tips : ['Tekrar dene!'],
        encouragement: typeof result.encouragement === 'string' ? result.encouragement : '',
      });
    }

    if (op === 'scenario') {
      const topic = str(payload.topic);
      const level = str(payload.level);
      const targetLanguage = str(payload.targetLanguage);
      const nativeLanguage = str(payload.nativeLanguage);
      if (!topic || !targetLanguage) return json({ error: 'invalid_request' }, 400);

      const system =
        'You are a language-learning content generator for the ' +
        `"${targetLanguage}" language, CEFR level "${level}". Respond with ` +
        'STRICT JSON only (no markdown, no prose outside the JSON object) ' +
        'matching exactly this shape:\n' +
        '{"dialogue": [{"speaker": <string>, "text": <string, in ' +
        `${targetLanguage}>, "translation": <string, in ${nativeLanguage}>}, ` +
        '... 3 to 6 lines total, alternating between a tutor character and ' +
        'the learner (use "Sen" / "You" placeholder text for the learner ' +
        'lines)], "vocabulary": [{"word": <string, in ' +
        `${targetLanguage}>, "translation": <string, in ${nativeLanguage}>, ` +
        '"example": <string, an example sentence in ' +
        `${targetLanguage}>}, ... 3 to 5 items]}\n` +
        `Keep sentences short and appropriate for level "${level}". Topic: ` +
        `"${topic}".`;

      const result = await callClaude(anthropicApiKey, system, 'Generate the scenario now.', 1536, isPlus ? PAID_MODEL : FREE_MODEL);
      const dialogueRaw = Array.isArray(result.dialogue) ? result.dialogue : [];
      const dialogue = dialogueRaw
        .filter((d): d is Record<string, unknown> => typeof d === 'object' && d !== null)
        .map((d) => ({
          speaker: str(d.speaker),
          text: str(d.text),
          translation: str(d.translation),
        }));
      const vocabRaw = Array.isArray(result.vocabulary) ? result.vocabulary : [];
      const vocabulary = vocabRaw
        .filter((v): v is Record<string, unknown> => typeof v === 'object' && v !== null)
        .map((v) => ({
          word: str(v.word),
          translation: str(v.translation),
          example: str(v.example),
        }));
      if (dialogue.length === 0 || vocabulary.length === 0) {
        return json({ error: 'incomplete_scenario' }, 502);
      }
      return json({ topic, level, dialogue, vocabulary });
    }

    if (op === 'summary') {
      const targetLanguage = str(payload.targetLanguage);
      const reviewedCount = Number(payload.reviewedCount) || 0;
      const difficultCount = Number(payload.difficultCount) || 0;
      const masteredCount = Number(payload.masteredCount) || 0;
      const streakDays = Number(payload.streakDays) || 0;
      if (!targetLanguage) return json({ error: 'invalid_request' }, 400);

      const system =
        'You are an encouraging language-learning coach. Given a ' +
        `learner's daily practice stats for ${targetLanguage}, respond with ` +
        'STRICT JSON only (no markdown, no prose outside the JSON object) ' +
        'matching exactly this shape:\n' +
        '{"message": <one short upbeat summary string, written in the ' +
        'same language as the stats context, celebrating progress and ' +
        'gently nudging further practice>}\n' +
        'Do not invent specific vocabulary words — you were not given ' +
        'any, only counts.';
      const user = `reviewedCount=${reviewedCount}, difficultCount=${difficultCount}, masteredCount=${masteredCount}, streakDays=${streakDays}`;

      const result = await callClaude(anthropicApiKey, system, user, 512, isPlus ? PAID_MODEL : FREE_MODEL);
      const message = typeof result.message === 'string' ? result.message : '';
      if (!message) return json({ error: 'incomplete_summary' }, 502);
      return json({
        reviewedCount,
        masteredCount,
        message,
        streakDays,
      });
    }

    return json({ error: 'unknown_op' }, 400);
  } catch (err) {
    return json({ error: err instanceof Error ? err.message : 'provider_unavailable' }, 502);
  }
});
