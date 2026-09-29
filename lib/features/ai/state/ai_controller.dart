import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/features.dart';
import '../data/ai_service.dart';
import '../data/claude_ai_service.dart';
import '../data/fake_ai_service.dart';
import '../domain/ai_feedback.dart';

/// Gerçek Claude API'ye bağlı servis. `VOXELITH_ANTHROPIC_API_KEY`
/// dart-define'ı girilmediyse (veya API çağrısı başarısız olursa)
/// [ClaudeAiService] kendi içinde sessizce çevrimdışı/fake moda düşer —
/// uygulama hiçbir zaman bloklanmaz veya çökmez.
final claudeAiServiceProvider = Provider<ClaudeAiService>((ref) {
  return ClaudeAiService();
});

final aiServiceProvider = Provider<AiService>((ref) {
  // Ücretli AI kapalıyken (varsayılan) cihaz içi şablon servis kullanılır.
  if (!Features.paidCloudApis) return FakeAiService();
  return ref.watch(claudeAiServiceProvider);
});

final dailySummaryProvider =
    FutureProvider.family<LessonSummary, DailySummaryParams>((
      ref,
      params,
    ) async {
      final ai = ref.read(aiServiceProvider);
      return ai.generateDailySummary(
        reviewedCount: params.reviewed,
        difficultCount: params.difficult,
        masteredCount: params.mastered,
        targetLanguage: params.lang,
        streakDays: params.streak,
      );
    });

class DailySummaryParams {
  const DailySummaryParams({
    required this.reviewed,
    required this.difficult,
    required this.mastered,
    required this.lang,
    required this.streak,
  });

  final int reviewed;
  final int difficult;
  final int mastered;
  final String lang;
  final int streak;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DailySummaryParams &&
          reviewed == other.reviewed &&
          difficult == other.difficult &&
          mastered == other.mastered &&
          lang == other.lang &&
          streak == other.streak;

  @override
  int get hashCode => Object.hash(reviewed, difficult, mastered, lang, streak);
}
