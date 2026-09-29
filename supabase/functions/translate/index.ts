import { createClient } from 'https://esm.sh/@supabase/supabase-js@2';

const corsHeaders = {
  'Access-Control-Allow-Origin': '*',
  'Access-Control-Allow-Headers': 'authorization, apikey, content-type, x-client-info',
};

const supportedLanguages = new Set([
  'en', 'es', 'de', 'fr', 'nl', 'ar', 'pt', 'it', 'ru', 'zh',
  'ja', 'ko', 'tr', 'pl', 'sv', 'da', 'no', 'fi', 'el', 'cs',
  'ro', 'hu', 'hi', 'th', 'vi', 'id', 'uk', 'he', 'fa', 'sw',
]);

function json(body: unknown, status = 200) {
  return new Response(JSON.stringify(body), {
    status,
    headers: { ...corsHeaders, 'Content-Type': 'application/json; charset=utf-8' },
  });
}

function decodeHtml(value: string) {
  const entities: Record<string, string> = {
    '&amp;': '&', '&quot;': '"', '&#39;': "'", '&lt;': '<', '&gt;': '>',
  };
  return value.replace(/&(?:amp|quot|#39|lt|gt);/g, (match) => entities[match]);
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
  const googleApiKey = Deno.env.get('GOOGLE_TRANSLATE_API_KEY');
  if (!supabaseUrl || !serviceRoleKey || !googleApiKey) {
    return json({ error: 'service_not_configured' }, 503);
  }

  const admin = createClient(supabaseUrl, serviceRoleKey, {
    auth: { persistSession: false, autoRefreshToken: false },
  });
  const jwt = authorization.slice('Bearer '.length);
  const { data: userData, error: userError } = await admin.auth.getUser(jwt);
  if (userError || !userData.user) return json({ error: 'invalid_session' }, 401);

  // Plus hakkı istemcideki değiştirilebilir profil alanından değil, yalnızca
  // ödeme webhook'unun yazabildiği subscriptions tablosundan doğrulanır.
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

  // Maliyet denetiminde bulundu: bu fonksiyonun günlük bir üst sınırı hiç
  // yoktu (~$0.006/çağrı worst-case, 300 karakter üst sınırıyla) — bir Plus
  // kullanıcı (ya da çalınmış bir oturum) günde sınırsız çağırabiliyordu.
  // Business, 3 kat daha yüksek fiyatını karşılayan gerçek bir değer olarak
  // 15/gün alır. Bkz. docs/MALIYET_ANALIZI_2026_09.md.
  const TRANSLATE_DAILY_LIMIT = 6;
  const TRANSLATE_BUSINESS_DAILY_LIMIT = 15;
  const { data: allowed, error: usageError } = await admin.rpc('try_consume_ai_usage', {
    p_user_id: userData.user.id,
    p_op: 'translate',
    p_limit: isBusiness ? TRANSLATE_BUSINESS_DAILY_LIMIT : TRANSLATE_DAILY_LIMIT,
  });
  if (usageError) return json({ error: 'usage_check_failed' }, 502);
  if (!allowed) return json({ error: 'daily_limit_reached' }, 429);

  let payload: { text?: unknown; from?: unknown; to?: unknown };
  try {
    payload = await request.json();
  } catch (_) {
    return json({ error: 'invalid_json' }, 400);
  }
  const text = typeof payload.text === 'string' ? payload.text.trim() : '';
  const from = typeof payload.from === 'string' ? payload.from : '';
  const to = typeof payload.to === 'string' ? payload.to : '';
  if (!text || text.length > 300 || !supportedLanguages.has(from) || !supportedLanguages.has(to) || from === to) {
    return json({ error: 'invalid_request' }, 400);
  }

  const endpoint = new URL('https://translation.googleapis.com/language/translate/v2');
  endpoint.searchParams.set('key', googleApiKey);
  const providerResponse = await fetch(endpoint, {
    method: 'POST',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify({ q: text, source: from, target: to, format: 'text' }),
  });
  if (!providerResponse.ok) {
    console.error('Cloud translation provider failed', providerResponse.status);
    return json({ error: 'provider_unavailable' }, 502);
  }

  const providerData = await providerResponse.json();
  const translated = providerData?.data?.translations?.[0]?.translatedText;
  if (typeof translated !== 'string' || !translated.trim()) {
    return json({ error: 'empty_provider_response' }, 502);
  }

  return json({
    translatedText: decodeHtml(translated.trim()),
    provider: 'google-cloud-translation',
  });
});
