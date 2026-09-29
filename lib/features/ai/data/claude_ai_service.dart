import 'dart:async';

import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../core/l10n/i18n_ui.dart';
import '../../../core/supabase_config.dart';
import '../domain/ai_feedback.dart';
import 'ai_service.dart';
import 'fake_ai_service.dart';

/// Anthropic Claude ile çalışan gerçek AI servis — iki katmanlı düşüş zinciri:
///
/// 1. Supabase `ai-feedback` Edge Function'ı dener (`_callSupabase`) —
///    gerçek anahtar sadece sunucuda barınır, istemci hiçbir zaman anahtar
///    taşımaz. Oturum açık ve fonksiyon deploy edilmişse bu her zaman
///    çalışır (bkz. `supabase/functions/ai-feedback/index.ts`).
/// 2. Olmazsa/başarısız olursa (ağ, zaman aşımı, kimlik doğrulama, oturum
///    yok) sessizce [FakeAiService]'e düşer. Bu servis asla exception
///    fırlatmaz; UI her zaman bir sonuç alır.
///
/// Bilerek YOK: istemciden doğrudan Anthropic'e bağlanan bir yol. Böyle bir
/// yol, gerçek API anahtarını derlenmiş uygulamanın içine (dart-define ile
/// bile olsa) gömer — anahtar APK/IPA'dan ters mühendislikle çıkarılabilir
/// ve başkası hesabımıza fatura çıkarabilir. Anahtar SADECE sunucuda kalır.
class ClaudeAiService implements AiService {
  ClaudeAiService({AiService? fallback})
    : _fallback = fallback ?? FakeAiService();

  final AiService _fallback;

  static const Duration _timeout = Duration(seconds: 25);

  /// `supabase/functions/ai-feedback` Edge Function'ını çağırır. Oturum
  /// yoksa, Supabase yapılandırılmamışsa veya fonksiyon henüz deploy
  /// edilmemişse (ya da başka bir sebeple başarısız olursa) sessizce
  /// `null` döner — çağıran taraf bir sonraki katmana düşer.
  /// `error` doluysa `data` her zaman null'dur ve tam tersi — çağıran taraf
  /// `error == 'plus_required'` durumunu sessizce yutup sahteye düşmek
  /// yerine kullanıcıya net bir Plus yönlendirmesi göstermek için ayrıca
  /// kontrol edebilsin diye ikisi ayrı tutuluyor.
  Future<({Map<String, dynamic>? data, String? error})> _callSupabase(
    String op,
    Map<String, dynamic> params,
  ) async {
    if (!SupaConfig.isSet) return (data: null, error: null);
    final client = Supabase.instance.client;
    if (client.auth.currentSession == null) return (data: null, error: null);
    try {
      final response = await client.functions
          .invoke('ai-feedback', body: {'op': op, ...params})
          .timeout(_timeout);
      final data = response.data;
      if (data is! Map) return (data: null, error: null);
      final error = data['error'];
      if (error is String) return (data: null, error: error);
      return (data: data.cast<String, dynamic>(), error: null);
    } catch (_) {
      return (data: null, error: null);
    }
  }

  /// Kullanıcı bir ödüllü reklamı sonuna kadar izleyip AdMob'dan gerçek
  /// ödülü aldıktan SONRA çağrılır (bkz. AiFeedbackScreen). Sunucuda
  /// bugünkü ai-feedback sınırını 1 artırır, günde en fazla 5 kez —
  /// [UserProfile.maxRewardedAdsPerDay] ile aynı sınır (bkz.
  /// supabase/functions/ai-feedback/index.ts -> AD_BONUS_MAX).
  ///
  /// Döner: yeni bonus sayısı (0-5) kazanıldıysa, `null` sunucuya
  /// ulaşılamadıysa/oturum yoksa, `-1` bugünkü 5 reklam sınırına zaten
  /// ulaşılmışsa.
  Future<int?> claimFeedbackAdBonus() async {
    final remote = await _callSupabase('claim_ad_bonus', const {});
    if (remote.error == 'ad_bonus_limit_reached') return -1;
    final bonus = remote.data?['bonus'];
    return bonus is num ? bonus.toInt() : null;
  }

  // ---------------------------------------------------------------------
  // AiService
  // ---------------------------------------------------------------------

  @override
  Future<AiFeedback> generateSentenceFeedback({
    required String sourceText,
    required String userAnswer,
    required String targetLanguage,
    required String nativeLanguage,
  }) async {
    final remote = await _callSupabase('feedback', {
      'sourceText': sourceText,
      'userAnswer': userAnswer,
      'targetLanguage': targetLanguage,
      'nativeLanguage': nativeLanguage,
    });
    final i18n = aiFeedbackI18n(nativeLanguage);
    if (remote.error == 'plus_required') {
      // Ücretsiz kullanıcı günlük tadımlık hakkını kullandı — sessizce
      // sahteye düşmek yerine özelliğin gerçek olduğunu ve Plus'ta
      // sınırsız devam ettiğini gösteren net bir yönlendirme.
      return AiFeedback(
        userAnswer: userAnswer,
        correctedAnswer: sourceText,
        score: 0,
        tips: [i18n.aiFreeUsedTip1, i18n.aiFreeUsedTip2],
        // '🔒' öneki AiFeedbackScreen'in paywall yönlendirmesini tetikler.
        encouragement: i18n.aiFreeUsedEncouragement,
      );
    }
    if (remote.error == 'daily_limit_reached') {
      // Plus kullanıcı günlük 15 hakkını doldurdu. Burada sessizce
      // FakeAiService'e düşmek, ödeme yapan kullanıcıya farkında olmadan
      // sahte bir AI cevabı göstermek anlamına gelirdi — bunun yerine
      // durumu açıkça bildiriyoruz (paywall'a yönlendirmiyoruz, zaten Plus).
      return AiFeedback(
        userAnswer: userAnswer,
        correctedAnswer: sourceText,
        score: 0,
        tips: [i18n.aiDailyLimitTip1, i18n.aiDailyLimitTip2],
        // '⏳' öneki AiFeedbackScreen'in limit durumunu tetikler.
        encouragement: i18n.aiDailyLimitEncouragement,
      );
    }
    final data = remote.data;
    if (data != null) {
      final tipsRaw = data['tips'];
      final tips = tipsRaw is List
          ? tipsRaw.map((e) => e.toString()).where((s) => s.isNotEmpty).toList()
          : <String>[];
      return AiFeedback(
        userAnswer: userAnswer,
        correctedAnswer:
            (data['correctedAnswer'] as Object?)?.toString() ?? sourceText,
        score: _asScore(data['score']),
        tips: tips.isEmpty ? [i18n.aiTryAgainTip] : tips,
        encouragement: (data['encouragement'] as Object?)?.toString() ?? '',
      );
    }
    return _fallback.generateSentenceFeedback(
      sourceText: sourceText,
      userAnswer: userAnswer,
      targetLanguage: targetLanguage,
      nativeLanguage: nativeLanguage,
    );
  }

  @override
  Future<AiScenario> generateScenario({
    required String topic,
    required String level,
    required String targetLanguage,
    required String nativeLanguage,
  }) async {
    final remote = await _callSupabase('scenario', {
      'topic': topic,
      'level': level,
      'targetLanguage': targetLanguage,
      'nativeLanguage': nativeLanguage,
    });
    final data = remote.data;
    if (data != null) {
      final dialogueRaw = data['dialogue'];
      final dialogue = <AiDialogueLine>[];
      if (dialogueRaw is List) {
        for (final item in dialogueRaw) {
          if (item is Map) {
            dialogue.add(
              AiDialogueLine(
                speaker: (item['speaker'] as Object?)?.toString() ?? '',
                text: (item['text'] as Object?)?.toString() ?? '',
                translation: (item['translation'] as Object?)?.toString() ?? '',
              ),
            );
          }
        }
      }
      final vocabRaw = data['vocabulary'];
      final vocabulary = <AiVocabItem>[];
      if (vocabRaw is List) {
        for (final item in vocabRaw) {
          if (item is Map) {
            vocabulary.add(
              AiVocabItem(
                word: (item['word'] as Object?)?.toString() ?? '',
                translation: (item['translation'] as Object?)?.toString() ?? '',
                example: (item['example'] as Object?)?.toString() ?? '',
              ),
            );
          }
        }
      }
      if (dialogue.isNotEmpty && vocabulary.isNotEmpty) {
        return AiScenario(
          topic: topic,
          level: level,
          dialogue: dialogue,
          vocabulary: vocabulary,
        );
      }
    }
    return _fallback.generateScenario(
      topic: topic,
      level: level,
      targetLanguage: targetLanguage,
      nativeLanguage: nativeLanguage,
    );
  }

  @override
  Future<LessonSummary> generateDailySummary({
    required int reviewedCount,
    required int difficultCount,
    required int masteredCount,
    required String targetLanguage,
    required int streakDays,
  }) async {
    final remote = await _callSupabase('summary', {
      'targetLanguage': targetLanguage,
      'reviewedCount': reviewedCount,
      'difficultCount': difficultCount,
      'masteredCount': masteredCount,
      'streakDays': streakDays,
    });
    final data = remote.data;
    if (data != null) {
      final message = (data['message'] as Object?)?.toString();
      if (message != null && message.isNotEmpty) {
        return LessonSummary(
          reviewedCount: reviewedCount,
          masteredCount: masteredCount,
          difficultWords: const [],
          message: message,
          streakDays: streakDays,
        );
      }
    }
    return _fallback.generateDailySummary(
      reviewedCount: reviewedCount,
      difficultCount: difficultCount,
      masteredCount: masteredCount,
      targetLanguage: targetLanguage,
      streakDays: streakDays,
    );
  }

  static int _asScore(Object? raw) {
    final n = raw is num ? raw.toInt() : int.tryParse('$raw') ?? 0;
    return n.clamp(0, 100).toInt();
  }
}
