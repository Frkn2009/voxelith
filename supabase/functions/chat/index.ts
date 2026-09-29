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

const languageNames: Record<string, string> = {
  en: 'English', es: 'Spanish', de: 'German', fr: 'French', nl: 'Dutch',
  ar: 'Arabic', pt: 'Portuguese', it: 'Italian', ru: 'Russian', zh: 'Chinese',
  ja: 'Japanese', ko: 'Korean', tr: 'Turkish', pl: 'Polish', sv: 'Swedish',
  da: 'Danish', no: 'Norwegian', fi: 'Finnish', el: 'Greek', cs: 'Czech',
  ro: 'Romanian', hu: 'Hungarian', hi: 'Hindi', th: 'Thai', vi: 'Vietnamese',
  id: 'Indonesian', uk: 'Ukrainian', he: 'Hebrew', fa: 'Persian', sw: 'Swahili',
};

function json(body: unknown, status = 200) {
  return new Response(JSON.stringify(body), {
    status,
    headers: { ...corsHeaders, 'Content-Type': 'application/json; charset=utf-8' },
  });
}

interface HistoryTurn {
  role: 'user' | 'ai';
  text: string;
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

  // Canlı AI konuşma partneri Plus özelliğidir — hak yalnızca ödeme
  // webhook'unun yazdığı subscriptions tablosundan doğrulanır.
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

  // ~$0.0011/tur (Claude Haiku 4.5) — 4 Eylül'deki maliyet denetiminde
  // 25'ten 20'ye düşürüldü ki tüm AI/ses kalemlerinin toplamı aylık
  // abonelik ücretini aşmasın. Business, $200/yıl fiyatını karşılayan
  // gerçek bir değer olarak 50/gün alır. bkz. docs/MALIYET_ANALIZI_2026_09.md.
  const CHAT_DAILY_LIMIT = 20;
  const CHAT_BUSINESS_DAILY_LIMIT = 50;
  const { data: allowed, error: usageError } = await admin.rpc('try_consume_ai_usage', {
    p_user_id: userData.user.id,
    p_op: 'chat',
    p_limit: isBusiness ? CHAT_BUSINESS_DAILY_LIMIT : CHAT_DAILY_LIMIT,
  });
  if (usageError) return json({ error: 'usage_check_failed' }, 502);
  if (!allowed) return json({ error: 'daily_limit_reached' }, 429);

  let payload: {
    message?: unknown;
    targetLanguage?: unknown;
    nativeLanguage?: unknown;
    level?: unknown;
    history?: unknown;
  };
  try {
    payload = await request.json();
  } catch (_) {
    return json({ error: 'invalid_json' }, 400);
  }

  const message = typeof payload.message === 'string' ? payload.message.trim() : '';
  const targetLanguage = typeof payload.targetLanguage === 'string' ? payload.targetLanguage : '';
  const nativeLanguage = typeof payload.nativeLanguage === 'string' ? payload.nativeLanguage : 'en';
  const level = typeof payload.level === 'string' ? payload.level : 'a1';
  const rawHistory = Array.isArray(payload.history) ? payload.history : [];

  if (!message || message.length > 500 || !supportedLanguages.has(targetLanguage)) {
    return json({ error: 'invalid_request' }, 400);
  }

  const history: HistoryTurn[] = rawHistory
    .filter((turn): turn is HistoryTurn =>
      turn && (turn.role === 'user' || turn.role === 'ai') && typeof turn.text === 'string',
    )
    .slice(-8)
    .map((turn) => ({ role: turn.role, text: turn.text.slice(0, 500) }));

  const targetName = languageNames[targetLanguage] ?? targetLanguage;
  const nativeName = languageNames[nativeLanguage] ?? 'English';

  const systemPrompt =
    `You are Voxelith, a warm and encouraging conversation partner helping a ${level.toUpperCase()} ` +
    `level learner practise spoken ${targetName}. Reply only in ${targetName}, in 1-3 short ` +
    `natural sentences suitable to be read aloud. Stay strictly in character as a friendly human ` +
    `conversation partner, never mention being an AI. If the learner makes a clear grammar or ` +
    `word-choice mistake, gently model the correct form inside your reply rather than lecturing. ` +
    `If the learner seems completely lost, add one short ${nativeName} hint in parentheses at the ` +
    `end of your reply. Keep the conversation moving with a light follow-up question.`;

  const anthropicMessages = [
    ...history.map((turn) => ({
      role: turn.role === 'user' ? 'user' : 'assistant',
      content: turn.text,
    })),
    { role: 'user', content: message },
  ];

  const providerResponse = await fetch('https://api.anthropic.com/v1/messages', {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
      'x-api-key': anthropicApiKey,
      'anthropic-version': '2023-06-01',
    },
    body: JSON.stringify({
      model: 'claude-haiku-4-5-20251001',
      max_tokens: 200,
      system: systemPrompt,
      messages: anthropicMessages,
    }),
  });

  if (!providerResponse.ok) {
    console.error('Chat provider failed', providerResponse.status, await providerResponse.text());
    return json({ error: 'provider_unavailable' }, 502);
  }

  const providerData = await providerResponse.json();
  const reply = providerData?.content?.[0]?.text;
  if (typeof reply !== 'string' || !reply.trim()) {
    return json({ error: 'empty_provider_response' }, 502);
  }

  return json({ reply: reply.trim() });
});
