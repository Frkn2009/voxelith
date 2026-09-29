import '../../data/content/catalog.dart';
import '../../data/models/models.dart';

/// `goal` (Motive) → hangi içerik anlatımının plan özetinde kullanılacağı.
/// Not: Scenario'larda henüz bir "tema/track" etiketi yok (yalnızca
/// dil+CEFR seviyesi var), o yüzden bu sadece özet metni ve ileride
/// içerik seçimini önceliklendirmek için kullanılacak bir etikettir —
/// ders listesi bugün için seviyeye göre filtrelenir.
enum ContentTrack { dailyConversation, workVocabulary, examGrammar, general }

extension MotiveTrackX on Motive {
  ContentTrack get contentTrack => switch (this) {
    Motive.travel => ContentTrack.dailyConversation,
    Motive.work => ContentTrack.workVocabulary,
    Motive.exam => ContentTrack.examGrammar,
    Motive.life => ContentTrack.general,
  };
}

/// `strugglePoint` → ilk derslerde hangi egzersiz türünün öne çıkarılacağı.
/// Gerçek egzersiz motoruna (FSRS/SpeakSessionScreen) henüz bağlanmadı;
/// bu alan onboarding sonrası bir sonraki adımda o motoru beslemek için
/// profilde saklanır (bkz. `SessionController.setStrugglePoint`).
enum ExerciseWeighting { listeningRecognitionHeavy, spacedVocabCards, balanced }

extension StrugglePointWeightX on StrugglePoint {
  ExerciseWeighting get exerciseWeighting => switch (this) {
    StrugglePoint.speaking => ExerciseWeighting.listeningRecognitionHeavy,
    StrugglePoint.vocabulary => ExerciseWeighting.spacedVocabCards,
    StrugglePoint.grammar => ExerciseWeighting.balanced,
    StrugglePoint.listening => ExerciseWeighting.balanced,
  };
}

enum LessonLength { short, medium, long }

class GeneratedPlan {
  const GeneratedPlan({
    required this.track,
    required this.exerciseWeighting,
    required this.lessonLength,
    required this.previewLessonTitles,
  });

  final ContentTrack track;
  final ExerciseWeighting exerciseWeighting;
  final LessonLength lessonLength;
  final List<String> previewLessonTitles;
}

/// `OnboardingAnswers`'ı (burada doğrudan `UserProfile`'ın onboarding
/// alanları) alıp bir `GeneratedPlan` üreten saf fonksiyon — network/state
/// yok, tekrar üretilebilir.
class PlanGenerator {
  PlanGenerator._();

  static GeneratedPlan generate(UserProfile profile) {
    final lessonLength = switch (profile.dailyGoalMin) {
      <= 5 => LessonLength.short,
      >= 15 => LessonLength.long,
      _ => LessonLength.medium,
    };
    final weighting =
        profile.strugglePoint?.exerciseWeighting ?? ExerciseWeighting.balanced;
    return GeneratedPlan(
      track: profile.motive.contentTrack,
      exerciseWeighting: weighting,
      lessonLength: lessonLength,
      previewLessonTitles: _previewTitles(profile),
    );
  }

  static List<String> _previewTitles(UserProfile profile) {
    final scenarios = Catalog.forLang(
      profile.learnLang,
    ).where((s) => s.cefr == profile.cefr).toList();
    final pool = scenarios.isNotEmpty
        ? scenarios
        : Catalog.forLang(profile.learnLang);
    return pool.take(3).map((s) => s.title(profile.uiLang)).toList();
  }
}
