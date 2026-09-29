import 'achievements.dart';

/// 30 öğrenme dili
enum LearnLang {
  en,
  es,
  de,
  fr,
  nl,
  ar, // mevcut 6
  pt,
  it,
  ru,
  zh,
  ja,
  ko, // yaygın 6
  tr,
  pl,
  sv,
  da,
  no,
  fi, // Avrupa 6
  el,
  cs,
  ro,
  hu,
  hi,
  th, // karma 6
  vi,
  id,
  uk,
  he,
  fa,
  sw, // global 6
}

/// 30 arayüz dili (aynı set)
enum UiLang {
  tr,
  en,
  es,
  de,
  fr,
  nl,
  ar,
  pt,
  it,
  ru,
  zh,
  ja,
  ko,
  pl,
  sv,
  da,
  no,
  fi,
  el,
  cs,
  ro,
  hu,
  hi,
  th,
  vi,
  id,
  uk,
  he,
  fa,
  sw,
}

enum Motive { work, travel, exam, life }

enum Cefr { a1, a2, b1, b2 }

/// Onboarding'in "En çok nerede zorlanıyorsun?" sorusunun cevabı.
/// `PlanGenerator` bunu ilk derslerin egzersiz ağırlığına çevirir
/// (bkz. lib/features/onboarding/plan_generator.dart).
enum StrugglePoint { vocabulary, speaking, grammar, listening }

/// Onboarding'in "Ne zaman pratik yapmak istersin?" sorusunun cevabı.
/// Hatırlatma bildirimi saatine eşlenir (bkz. `SessionController.setPracticeSchedule`).
enum PracticeTimeOfDay { morning, afternoon, evening }

enum Weekday { mon, tue, wed, thu, fri, sat, sun }

/// Kullanıcının konuşma pratiğinde tercih ettiği akış. Herkese aynı sabit
/// Duy→Gölgele→Konuş→Düzelt döngüsünü dayatmak yerine, onboarding'de
/// seçilen bu tercihe göre adımlar atlanır/tekrarlanır — bkz.
/// `SpeakSessionScreen._stepOrderFor` (lib/features/speak/speak_screens.dart).
enum LearningStyle { balanced, speakingFirst, listeningHeavy }

enum AppThemePreference {
  system,
  light,
  dark,
  amber,
  legendary,
  legendaryLight,
}

extension LearnLangX on LearnLang {
  String get code => name;

  /// Arapça, İbranice, Farsça sağdan sola yazılır — hedef dil metni bu
  /// dillerde gösterilirken Directionality.rtl uygulanmalı.
  bool get isRtl =>
      this == LearnLang.ar || this == LearnLang.he || this == LearnLang.fa;

  String flag() => switch (this) {
    LearnLang.en => '🇬🇧',
    LearnLang.es => '🇪🇸',
    LearnLang.de => '🇩🇪',
    LearnLang.fr => '🇫🇷',
    LearnLang.nl => '🇳🇱',
    LearnLang.ar => '🇸🇦',
    LearnLang.pt => '🇵🇹',
    LearnLang.it => '🇮🇹',
    LearnLang.ru => '🇷🇺',
    LearnLang.zh => '🇨🇳',
    LearnLang.ja => '🇯🇵',
    LearnLang.ko => '🇰🇷',
    LearnLang.tr => '🇹🇷',
    LearnLang.pl => '🇵🇱',
    LearnLang.sv => '🇸🇪',
    LearnLang.da => '🇩🇰',
    LearnLang.no => '🇳🇴',
    LearnLang.fi => '🇫🇮',
    LearnLang.el => '🇬🇷',
    LearnLang.cs => '🇨🇿',
    LearnLang.ro => '🇷🇴',
    LearnLang.hu => '🇭🇺',
    LearnLang.hi => '🇮🇳',
    LearnLang.th => '🇹🇭',
    LearnLang.vi => '🇻🇳',
    LearnLang.id => '🇮🇩',
    LearnLang.uk => '🇺🇦',
    LearnLang.he => '🇮🇱',
    LearnLang.fa => '🇮🇷',
    LearnLang.sw => '🇰🇪',
  };

  /// Tüm 30 UI dilinde etiket
  String label(UiLang ui) {
    final map = _langLabels[this];
    if (map == null) return name.toUpperCase();
    return map[ui] ?? map[UiLang.en] ?? name;
  }
}

extension UiLangX on UiLang {
  String get code => name;
  String nativeName() => switch (this) {
    UiLang.tr => 'Türkçe',
    UiLang.en => 'English',
    UiLang.es => 'Español',
    UiLang.de => 'Deutsch',
    UiLang.fr => 'Français',
    UiLang.nl => 'Nederlands',
    UiLang.ar => 'العربية',
    UiLang.pt => 'Português',
    UiLang.it => 'Italiano',
    UiLang.ru => 'Русский',
    UiLang.zh => '中文',
    UiLang.ja => '日本語',
    UiLang.ko => '한국어',
    UiLang.pl => 'Polski',
    UiLang.sv => 'Svenska',
    UiLang.da => 'Dansk',
    UiLang.no => 'Norsk',
    UiLang.fi => 'Suomi',
    UiLang.el => 'Ελληνικά',
    UiLang.cs => 'Čeština',
    UiLang.ro => 'Română',
    UiLang.hu => 'Magyar',
    UiLang.hi => 'हिन्दी',
    UiLang.th => 'ไทย',
    UiLang.vi => 'Tiếng Việt',
    UiLang.id => 'Bahasa',
    UiLang.uk => 'Українська',
    UiLang.he => 'עברית',
    UiLang.fa => 'فارسی',
    UiLang.sw => 'Kiswahili',
  };
}

/// Dil etiketleri — TR ve EN her dil için sağlanır, diğerleri varsa eklenir
final Map<LearnLang, Map<UiLang, String>> _langLabels = {
  LearnLang.en: {
    UiLang.tr: 'İngilizce',
    UiLang.en: 'English',
    UiLang.es: 'Inglés',
    UiLang.de: 'Englisch',
    UiLang.fr: 'Anglais',
    UiLang.nl: 'Engels',
    UiLang.ar: 'الإنجليزية',
    UiLang.pt: 'Inglês',
    UiLang.it: 'Inglese',
    UiLang.ru: 'Английский',
    UiLang.zh: '英语',
    UiLang.ja: '英語',
    UiLang.ko: '영어',
  },
  LearnLang.es: {
    UiLang.tr: 'İspanyolca',
    UiLang.en: 'Spanish',
    UiLang.es: 'Español',
    UiLang.de: 'Spanisch',
    UiLang.fr: 'Espagnol',
    UiLang.nl: 'Spaans',
    UiLang.ar: 'الإسبانية',
    UiLang.pt: 'Espanhol',
    UiLang.it: 'Spagnolo',
    UiLang.ru: 'Испанский',
    UiLang.zh: '西班牙语',
    UiLang.ja: 'スペイン語',
    UiLang.ko: '스페인어',
  },
  LearnLang.de: {
    UiLang.tr: 'Almanca',
    UiLang.en: 'German',
    UiLang.es: 'Alemán',
    UiLang.de: 'Deutsch',
    UiLang.fr: 'Allemand',
    UiLang.nl: 'Duits',
    UiLang.ar: 'الألمانية',
    UiLang.pt: 'Alemão',
    UiLang.it: 'Tedesco',
    UiLang.ru: 'Немецкий',
    UiLang.zh: '德语',
    UiLang.ja: 'ドイツ語',
    UiLang.ko: '독일어',
  },
  LearnLang.fr: {
    UiLang.tr: 'Fransızca',
    UiLang.en: 'French',
    UiLang.es: 'Francés',
    UiLang.de: 'Französisch',
    UiLang.fr: 'Français',
    UiLang.nl: 'Frans',
    UiLang.ar: 'الفرنسية',
    UiLang.pt: 'Francês',
    UiLang.it: 'Francese',
    UiLang.ru: 'Французский',
    UiLang.zh: '法语',
    UiLang.ja: 'フランス語',
    UiLang.ko: '프랑스어',
  },
  LearnLang.nl: {
    UiLang.tr: 'Flemenkçe',
    UiLang.en: 'Dutch',
    UiLang.es: 'Neerlandés',
    UiLang.de: 'Niederländisch',
    UiLang.fr: 'Néerlandais',
    UiLang.nl: 'Nederlands',
    UiLang.ar: 'الهولندية',
  },
  LearnLang.ar: {
    UiLang.tr: 'Arapça',
    UiLang.en: 'Arabic',
    UiLang.es: 'Árabe',
    UiLang.de: 'Arabisch',
    UiLang.fr: 'Arabe',
    UiLang.nl: 'Arabisch',
    UiLang.ar: 'العربية',
  },
  LearnLang.pt: {
    UiLang.tr: 'Portekizce',
    UiLang.en: 'Portuguese',
    UiLang.es: 'Portugués',
    UiLang.de: 'Portugiesisch',
    UiLang.fr: 'Portugais',
    UiLang.pt: 'Português',
  },
  LearnLang.it: {
    UiLang.tr: 'İtalyanca',
    UiLang.en: 'Italian',
    UiLang.es: 'Italiano',
    UiLang.de: 'Italienisch',
    UiLang.fr: 'Italien',
    UiLang.it: 'Italiano',
  },
  LearnLang.ru: {
    UiLang.tr: 'Rusça',
    UiLang.en: 'Russian',
    UiLang.es: 'Ruso',
    UiLang.de: 'Russisch',
    UiLang.fr: 'Russe',
    UiLang.ru: 'Русский',
  },
  LearnLang.zh: {
    UiLang.tr: 'Çince',
    UiLang.en: 'Chinese',
    UiLang.es: 'Chino',
    UiLang.de: 'Chinesisch',
    UiLang.fr: 'Chinois',
    UiLang.zh: '中文',
  },
  LearnLang.ja: {
    UiLang.tr: 'Japonca',
    UiLang.en: 'Japanese',
    UiLang.es: 'Japonés',
    UiLang.de: 'Japanisch',
    UiLang.fr: 'Japonais',
    UiLang.ja: '日本語',
  },
  LearnLang.ko: {
    UiLang.tr: 'Korece',
    UiLang.en: 'Korean',
    UiLang.es: 'Coreano',
    UiLang.de: 'Koreanisch',
    UiLang.fr: 'Coréen',
    UiLang.ko: '한국어',
  },
  LearnLang.tr: {
    UiLang.tr: 'Türkçe',
    UiLang.en: 'Turkish',
    UiLang.es: 'Turco',
    UiLang.de: 'Türkisch',
    UiLang.fr: 'Turc',
  },
  LearnLang.pl: {
    UiLang.tr: 'Lehçe',
    UiLang.en: 'Polish',
    UiLang.es: 'Polaco',
    UiLang.de: 'Polnisch',
    UiLang.fr: 'Polonais',
    UiLang.pl: 'Polski',
  },
  LearnLang.sv: {
    UiLang.tr: 'İsveççe',
    UiLang.en: 'Swedish',
    UiLang.es: 'Sueco',
    UiLang.de: 'Schwedisch',
    UiLang.fr: 'Suédois',
    UiLang.sv: 'Svenska',
  },
  LearnLang.da: {
    UiLang.tr: 'Danca',
    UiLang.en: 'Danish',
    UiLang.es: 'Danés',
    UiLang.de: 'Dänisch',
    UiLang.fr: 'Danois',
    UiLang.da: 'Dansk',
  },
  LearnLang.no: {
    UiLang.tr: 'Norveççe',
    UiLang.en: 'Norwegian',
    UiLang.es: 'Noruego',
    UiLang.de: 'Norwegisch',
    UiLang.fr: 'Norvégien',
    UiLang.no: 'Norsk',
  },
  LearnLang.fi: {
    UiLang.tr: 'Fince',
    UiLang.en: 'Finnish',
    UiLang.es: 'Finlandés',
    UiLang.de: 'Finnisch',
    UiLang.fr: 'Finnois',
    UiLang.fi: 'Suomi',
  },
  LearnLang.el: {
    UiLang.tr: 'Yunanca',
    UiLang.en: 'Greek',
    UiLang.es: 'Griego',
    UiLang.de: 'Griechisch',
    UiLang.fr: 'Grec',
    UiLang.el: 'Ελληνικά',
  },
  LearnLang.cs: {
    UiLang.tr: 'Çekçe',
    UiLang.en: 'Czech',
    UiLang.es: 'Checo',
    UiLang.de: 'Tschechisch',
    UiLang.fr: 'Tchèque',
    UiLang.cs: 'Čeština',
  },
  LearnLang.ro: {
    UiLang.tr: 'Romence',
    UiLang.en: 'Romanian',
    UiLang.es: 'Rumano',
    UiLang.de: 'Rumänisch',
    UiLang.fr: 'Roumain',
    UiLang.ro: 'Română',
  },
  LearnLang.hu: {
    UiLang.tr: 'Macarca',
    UiLang.en: 'Hungarian',
    UiLang.es: 'Húngaro',
    UiLang.de: 'Ungarisch',
    UiLang.fr: 'Hongrois',
    UiLang.hu: 'Magyar',
  },
  LearnLang.hi: {
    UiLang.tr: 'Hintçe',
    UiLang.en: 'Hindi',
    UiLang.es: 'Hindi',
    UiLang.de: 'Hindi',
    UiLang.fr: 'Hindi',
    UiLang.hi: 'हिन्दी',
  },
  LearnLang.th: {
    UiLang.tr: 'Tayca',
    UiLang.en: 'Thai',
    UiLang.es: 'Tailandés',
    UiLang.de: 'Thailändisch',
    UiLang.fr: 'Thaï',
    UiLang.th: 'ไทย',
  },
  LearnLang.vi: {
    UiLang.tr: 'Vietnamca',
    UiLang.en: 'Vietnamese',
    UiLang.es: 'Vietnamita',
    UiLang.de: 'Vietnamesisch',
    UiLang.fr: 'Vietnamien',
    UiLang.vi: 'Tiếng Việt',
  },
  LearnLang.id: {
    UiLang.tr: 'Endonezce',
    UiLang.en: 'Indonesian',
    UiLang.es: 'Indonesio',
    UiLang.de: 'Indonesisch',
    UiLang.fr: 'Indonésien',
    UiLang.id: 'Bahasa Indonesia',
  },
  LearnLang.uk: {
    UiLang.tr: 'Ukraynaca',
    UiLang.en: 'Ukrainian',
    UiLang.es: 'Ucraniano',
    UiLang.de: 'Ukrainisch',
    UiLang.fr: 'Ukrainien',
    UiLang.uk: 'Українська',
  },
  LearnLang.he: {
    UiLang.tr: 'İbranice',
    UiLang.en: 'Hebrew',
    UiLang.es: 'Hebreo',
    UiLang.de: 'Hebräisch',
    UiLang.fr: 'Hébreu',
    UiLang.he: 'עברית',
  },
  LearnLang.fa: {
    UiLang.tr: 'Farsça',
    UiLang.en: 'Persian',
    UiLang.es: 'Persa',
    UiLang.de: 'Persisch',
    UiLang.fr: 'Persan',
    UiLang.fa: 'فارسی',
  },
  LearnLang.sw: {
    UiLang.tr: 'Svahili',
    UiLang.en: 'Swahili',
    UiLang.es: 'Suajili',
    UiLang.de: 'Swahili',
    UiLang.fr: 'Swahili',
    UiLang.sw: 'Kiswahili',
  },
};

class Phrase {
  const Phrase({
    required this.id,
    required this.target,
    required this.gloss,
    this.ipa,
    this.hint,
  });

  final String id;
  final String target;
  final Map<UiLang, String> gloss;
  final String? ipa;
  final String? hint;

  String glossFor(UiLang ui) =>
      gloss[ui] ??
      ContentOverlay.lookup('p.$id', ui) ??
      gloss[UiLang.en] ??
      ContentOverlay.lookup('p.$id', UiLang.en) ??
      target;
}

/// Dart kaynağında olmayan çevirileri (`assets/content/i18n/<ui>.json`) modele
/// bağlayan kanca. `ContentStore` açılışta doldurur; testlerde boş kalır ve
/// her şey eskisi gibi Dart'taki haritalardan gelir.
///
/// Anahtarlar: `p.<phraseId>` cümle çevirisi, `s.<scenarioId>` senaryo
/// başlığı, `g.<scenarioId>` gramer kuralı, `tp.<scenarioId>.<i>` konuşma
/// adımı yönergesi, `st.<storyId>` / `ss.<storyId>.<i>` kitaplık.
class ContentOverlay {
  static String? Function(String key, UiLang ui)? resolver;

  static String? lookup(String key, UiLang ui) {
    final value = resolver?.call(key, ui);
    return (value == null || value.isEmpty) ? null : value;
  }
}

class SpeakTurn {
  const SpeakTurn({
    required this.prompt,
    required this.expected,
    this.scaffold,
  });

  final String prompt;
  final String expected;
  final String? scaffold;
}

/// A single explicit grammar rule attached to a [Scenario], with one
/// correct and one incorrect example so the learner sees the contrast
/// rather than only being told the rule in the abstract.
class GrammarNote {
  const GrammarNote({
    required this.rule,
    required this.goodExample,
    required this.badExample,
  });

  final Map<UiLang, String> rule;
  final String goodExample;
  final String badExample;

  String ruleFor(UiLang ui, {String? scenarioId}) =>
      rule[ui] ??
      (scenarioId == null
          ? null
          : ContentOverlay.lookup('g.$scenarioId', ui)) ??
      rule[UiLang.en] ??
      '';
}

class Scenario {
  const Scenario({
    required this.id,
    required this.lang,
    required this.cefr,
    required this.minutes,
    required this.titles,
    required this.phrases,
    required this.turns,
    required this.clipLine,
    this.grammarNote,
  });

  final String id;
  final LearnLang lang;
  final Cefr cefr;
  final int minutes;
  final Map<UiLang, String> titles;
  final List<Phrase> phrases;
  final List<SpeakTurn> turns;
  final String clipLine;
  final GrammarNote? grammarNote;

  String title(UiLang ui) =>
      titles[ui] ??
      ContentOverlay.lookup('s.$id', ui) ??
      titles[UiLang.en] ??
      id;

  /// Konuşma adımı yönergesi — Dart'ta yalnızca İngilizce yazılı.
  String turnPromptFor(int index, UiLang ui) =>
      ContentOverlay.lookup('tp.$id.$index', ui) ?? turns[index].prompt;
}

enum XpRank { rookie, learner, speaker, master, legend }

/// Görünen rütbe adları arayüz diline göre `I18n.xpRankLabel` ile gelir
/// (lib/core/l10n/i18n_ui.dart).
extension XpRankX on XpRank {
  int get minimumXp => switch (this) {
    XpRank.rookie => 0,
    XpRank.learner => 500,
    XpRank.speaker => 1500,
    XpRank.master => 4000,
    XpRank.legend => 10000,
  };
}

enum AdReward { speakTime, xp, interpreterTime }

class UserProfile {
  const UserProfile({
    required this.profileId,
    required this.profileName,
    required this.uiLang,
    required this.learnLang,
    required this.motive,
    required this.cefr,
    required this.dailyGoalMin,
    required this.onboarded,
    required this.isPlus,
    required this.isBusiness,
    required this.interpreterSecondsUsed,
    required this.interpreterDayKey,
    required this.bonusInterpreterSeconds,
    required this.streak,
    this.streakFreezes = 0,
    this.freezeRefillWeekKey = '',
    required this.lastPracticeDayKey,
    required this.totalXp,
    required this.dailyXp,
    required this.xpDayKey,
    required this.completedScenes,
    required this.gamesCompleted,
    required this.completedLanguages,
    required this.achievements,
    required this.notificationsEnabled,
    required this.reminderHour,
    required this.themePreference,
    required this.phrasesKnown,
    required this.speakSecondsUsed,
    required this.speakDayKey,
    required this.bonusSpeakSeconds,
    required this.adsWatchedToday,
    required this.lastAdEpoch,
    required this.joinedEventId,
    required this.learnedIds,
    required this.srs,
    required this.completedSceneIds,
    required this.learningStyle,
    this.strugglePoint,
    this.practiceDays = const {},
    this.practiceTimeOfDay,
    this.onboardedDayKey = '',
    this.day1ReturnLogged = false,
  });

  final String profileId;
  final String profileName;
  final UiLang uiLang;
  final LearnLang learnLang;
  final Motive motive;
  final Cefr cefr;
  final int dailyGoalMin;
  final bool onboarded;
  final bool isPlus;
  final bool isBusiness;
  final int interpreterSecondsUsed;
  final String interpreterDayKey;
  final int bonusInterpreterSeconds;
  final int streak;

  /// Seri koruma hakkı (en fazla [maxStreakFreezes]). Kaçırılan bir gün
  /// bir hak harcanarak kapatılır; seri kırılmaz. Plus her hafta dolar,
  /// ücretsiz kullanıcı her 7 günlük seride bir tane kazanır.
  final int streakFreezes;

  /// Plus haftalık dolumunun en son yapıldığı haftanın anahtarı (yyyy-mm-dd,
  /// haftanın pazartesisi).
  final String freezeRefillWeekKey;

  static const maxStreakFreezes = 2;
  final String lastPracticeDayKey;
  final int totalXp;
  final int dailyXp;
  final String xpDayKey;
  final int completedScenes;
  final int gamesCompleted;
  final Set<LearnLang> completedLanguages;
  final Set<Achievement> achievements;
  final bool notificationsEnabled;
  final int reminderHour;
  final AppThemePreference themePreference;
  final int phrasesKnown;
  final int speakSecondsUsed;
  final String speakDayKey;
  final int bonusSpeakSeconds;
  final int adsWatchedToday;
  final int lastAdEpoch;
  final String joinedEventId;
  final Set<String> learnedIds;
  final Map<String, int> srs;
  final Set<String> completedSceneIds;
  final LearningStyle learningStyle;
  final StrugglePoint? strugglePoint;
  final Set<Weekday> practiceDays;
  final PracticeTimeOfDay? practiceTimeOfDay;

  /// Onboarding'in bittiği gün (`yyyy-MM-dd`) — `day1_return` event'inin
  /// tam olarak "kayıttan sonraki ilk dönüş günü"nde ateşlenmesi için.
  final String onboardedDayKey;
  final bool day1ReturnLogged;

  static const empty = UserProfile(
    profileId: 'main',
    profileName: 'Ana Profil',
    uiLang: UiLang.tr,
    learnLang: LearnLang.es,
    motive: Motive.travel,
    cefr: Cefr.a1,
    dailyGoalMin: 12,
    onboarded: false,
    isPlus: false,
    isBusiness: false,
    interpreterSecondsUsed: 0,
    interpreterDayKey: '',
    bonusInterpreterSeconds: 0,
    streak: 0,
    lastPracticeDayKey: '',
    totalXp: 0,
    dailyXp: 0,
    xpDayKey: '',
    completedScenes: 0,
    gamesCompleted: 0,
    completedLanguages: {},
    achievements: {},
    notificationsEnabled: true,
    reminderHour: 19,
    themePreference: AppThemePreference.system,
    phrasesKnown: 0,
    speakSecondsUsed: 0,
    speakDayKey: '',
    bonusSpeakSeconds: 0,
    adsWatchedToday: 0,
    lastAdEpoch: 0,
    joinedEventId: '',
    learnedIds: {},
    srs: {},
    completedSceneIds: {},
    learningStyle: LearningStyle.balanced,
  );

  static const maxRewardedAdsPerDay = 5;

  int get speakAllowance => isPlus ? 3600 : 30 + bonusSpeakSeconds;

  int remainingSpeakSeconds() {
    if (isPlus) return 3600;
    return (speakAllowance - speakSecondsUsed).clamp(0, speakAllowance);
  }

  bool get canWatchAd =>
      !isPlus && !isBusiness && adsWatchedToday < maxRewardedAdsPerDay;

  /// Toplantı Çevirmeni günlük saniye kotası: Free 5dk (+ödüllü video ile
  /// bonus), Plus 2sa, Business 8sa — Plus'ın aksine burada üst katmanlarda
  /// da gerçek bir günlük tavan var, sınırsız değil (iş toplantısı
  /// senaryosunda ses/çeviri maliyeti sürekli akıyor).
  int get interpreterAllowance {
    if (isBusiness) return 8 * 3600;
    if (isPlus) return 2 * 3600;
    return 5 * 60 + bonusInterpreterSeconds;
  }

  int get interpreterSecondsLeft =>
      (interpreterAllowance - interpreterSecondsUsed).clamp(
        0,
        interpreterAllowance,
      );

  bool get canUseInterpreter => interpreterSecondsLeft > 0;

  int get nextAdCooldownSeconds => 180 + (adsWatchedToday * 31) % 121;

  bool canShowInterstitial([DateTime? moment]) {
    if (!canWatchAd) return false;
    final now = (moment ?? DateTime.now()).millisecondsSinceEpoch ~/ 1000;
    return now - lastAdEpoch >= nextAdCooldownSeconds;
  }

  static const dailyXpGoal = 100;

  XpRank get xpRank {
    for (final rank in XpRank.values.reversed) {
      if (totalXp >= rank.minimumXp) return rank;
    }
    return XpRank.rookie;
  }

  XpRank? get nextXpRank {
    final index = XpRank.values.indexOf(xpRank);
    return index == XpRank.values.length - 1 ? null : XpRank.values[index + 1];
  }

  double get rankProgress {
    final next = nextXpRank;
    if (next == null) return 1;
    final currentMinimum = xpRank.minimumXp;
    return ((totalXp - currentMinimum) / (next.minimumXp - currentMinimum))
        .clamp(0, 1)
        .toDouble();
  }

  double get dailyXpProgress => (dailyXp / dailyXpGoal).clamp(0, 1).toDouble();

  UserProfile copyWith({
    String? profileId,
    String? profileName,
    UiLang? uiLang,
    LearnLang? learnLang,
    Motive? motive,
    Cefr? cefr,
    int? dailyGoalMin,
    bool? onboarded,
    bool? isPlus,
    bool? isBusiness,
    int? interpreterSecondsUsed,
    String? interpreterDayKey,
    int? bonusInterpreterSeconds,
    int? streak,
    int? streakFreezes,
    String? freezeRefillWeekKey,
    String? lastPracticeDayKey,
    int? totalXp,
    int? dailyXp,
    String? xpDayKey,
    int? completedScenes,
    int? gamesCompleted,
    Set<LearnLang>? completedLanguages,
    Set<Achievement>? achievements,
    bool? notificationsEnabled,
    int? reminderHour,
    AppThemePreference? themePreference,
    int? phrasesKnown,
    int? speakSecondsUsed,
    String? speakDayKey,
    int? bonusSpeakSeconds,
    int? adsWatchedToday,
    int? lastAdEpoch,
    String? joinedEventId,
    Set<String>? learnedIds,
    Map<String, int>? srs,
    Set<String>? completedSceneIds,
    LearningStyle? learningStyle,
    StrugglePoint? strugglePoint,
    Set<Weekday>? practiceDays,
    PracticeTimeOfDay? practiceTimeOfDay,
    String? onboardedDayKey,
    bool? day1ReturnLogged,
  }) {
    return UserProfile(
      profileId: profileId ?? this.profileId,
      profileName: profileName ?? this.profileName,
      uiLang: uiLang ?? this.uiLang,
      learnLang: learnLang ?? this.learnLang,
      motive: motive ?? this.motive,
      cefr: cefr ?? this.cefr,
      dailyGoalMin: dailyGoalMin ?? this.dailyGoalMin,
      onboarded: onboarded ?? this.onboarded,
      isPlus: isPlus ?? this.isPlus,
      isBusiness: isBusiness ?? this.isBusiness,
      interpreterSecondsUsed:
          interpreterSecondsUsed ?? this.interpreterSecondsUsed,
      interpreterDayKey: interpreterDayKey ?? this.interpreterDayKey,
      bonusInterpreterSeconds:
          bonusInterpreterSeconds ?? this.bonusInterpreterSeconds,
      streak: streak ?? this.streak,
      streakFreezes: streakFreezes ?? this.streakFreezes,
      freezeRefillWeekKey: freezeRefillWeekKey ?? this.freezeRefillWeekKey,
      lastPracticeDayKey: lastPracticeDayKey ?? this.lastPracticeDayKey,
      totalXp: totalXp ?? this.totalXp,
      dailyXp: dailyXp ?? this.dailyXp,
      xpDayKey: xpDayKey ?? this.xpDayKey,
      completedScenes: completedScenes ?? this.completedScenes,
      gamesCompleted: gamesCompleted ?? this.gamesCompleted,
      completedLanguages: completedLanguages ?? this.completedLanguages,
      achievements: achievements ?? this.achievements,
      notificationsEnabled: notificationsEnabled ?? this.notificationsEnabled,
      reminderHour: reminderHour ?? this.reminderHour,
      themePreference: themePreference ?? this.themePreference,
      phrasesKnown: phrasesKnown ?? this.phrasesKnown,
      speakSecondsUsed: speakSecondsUsed ?? this.speakSecondsUsed,
      speakDayKey: speakDayKey ?? this.speakDayKey,
      bonusSpeakSeconds: bonusSpeakSeconds ?? this.bonusSpeakSeconds,
      adsWatchedToday: adsWatchedToday ?? this.adsWatchedToday,
      lastAdEpoch: lastAdEpoch ?? this.lastAdEpoch,
      joinedEventId: joinedEventId ?? this.joinedEventId,
      learnedIds: learnedIds ?? this.learnedIds,
      srs: srs ?? this.srs,
      completedSceneIds: completedSceneIds ?? this.completedSceneIds,
      learningStyle: learningStyle ?? this.learningStyle,
      strugglePoint: strugglePoint ?? this.strugglePoint,
      practiceDays: practiceDays ?? this.practiceDays,
      practiceTimeOfDay: practiceTimeOfDay ?? this.practiceTimeOfDay,
      onboardedDayKey: onboardedDayKey ?? this.onboardedDayKey,
      day1ReturnLogged: day1ReturnLogged ?? this.day1ReturnLogged,
    );
  }

  Map<String, dynamic> toJson() => {
    'profileId': profileId,
    'profileName': profileName,
    'uiLang': uiLang.name,
    'learnLang': learnLang.name,
    'motive': motive.name,
    'cefr': cefr.name,
    'dailyGoalMin': dailyGoalMin,
    'onboarded': onboarded,
    'isPlus': isPlus,
    'isBusiness': isBusiness,
    'interpreterSecondsUsed': interpreterSecondsUsed,
    'interpreterDayKey': interpreterDayKey,
    'bonusInterpreterSeconds': bonusInterpreterSeconds,
    'streak': streak,
    'streakFreezes': streakFreezes,
    'freezeRefillWeekKey': freezeRefillWeekKey,
    'lastPracticeDayKey': lastPracticeDayKey,
    'totalXp': totalXp,
    'dailyXp': dailyXp,
    'xpDayKey': xpDayKey,
    'completedScenes': completedScenes,
    'gamesCompleted': gamesCompleted,
    'completedLanguages': completedLanguages
        .map((language) => language.name)
        .toList(),
    'achievements': achievements
        .map((achievement) => achievement.name)
        .toList(),
    'notificationsEnabled': notificationsEnabled,
    'reminderHour': reminderHour,
    'themePreference': themePreference.name,
    'phrasesKnown': phrasesKnown,
    'speakSecondsUsed': speakSecondsUsed,
    'speakDayKey': speakDayKey,
    'bonusSpeakSeconds': bonusSpeakSeconds,
    'adsWatchedToday': adsWatchedToday,
    'lastAdEpoch': lastAdEpoch,
    'joinedEventId': joinedEventId,
    'learnedIds': learnedIds.toList(),
    'srs': srs,
    'completedSceneIds': completedSceneIds.toList(),
    'learningStyle': learningStyle.name,
    'strugglePoint': strugglePoint?.name,
    'practiceDays': practiceDays.map((day) => day.name).toList(),
    'practiceTimeOfDay': practiceTimeOfDay?.name,
    'onboardedDayKey': onboardedDayKey,
    'day1ReturnLogged': day1ReturnLogged,
  };

  factory UserProfile.fromJson(Map<String, dynamic> j) {
    return UserProfile(
      profileId: j['profileId'] as String? ?? 'main',
      profileName: j['profileName'] as String? ?? 'Ana Profil',
      uiLang:
          UiLang.values.asNameMap()[j['uiLang'] as String? ?? 'tr'] ??
          UiLang.tr,
      learnLang:
          LearnLang.values.asNameMap()[j['learnLang'] as String? ?? 'es'] ??
          LearnLang.es,
      motive:
          Motive.values.asNameMap()[j['motive'] as String? ?? 'travel'] ??
          Motive.travel,
      cefr: Cefr.values.asNameMap()[j['cefr'] as String? ?? 'a1'] ?? Cefr.a1,
      dailyGoalMin: j['dailyGoalMin'] as int? ?? 12,
      onboarded: j['onboarded'] as bool? ?? false,
      isPlus: j['isPlus'] as bool? ?? false,
      isBusiness: j['isBusiness'] as bool? ?? false,
      interpreterSecondsUsed:
          (j['interpreterSecondsUsed'] as num?)?.toInt() ?? 0,
      interpreterDayKey: j['interpreterDayKey'] as String? ?? '',
      bonusInterpreterSeconds:
          (j['bonusInterpreterSeconds'] as num?)?.toInt() ?? 0,
      streak: (j['streak'] as num?)?.toInt() ?? 0,
      streakFreezes: (j['streakFreezes'] as num?)?.toInt() ?? 0,
      freezeRefillWeekKey: j['freezeRefillWeekKey'] as String? ?? '',
      lastPracticeDayKey: j['lastPracticeDayKey'] as String? ?? '',
      totalXp: (j['totalXp'] as num?)?.toInt() ?? 0,
      dailyXp: (j['dailyXp'] as num?)?.toInt() ?? 0,
      xpDayKey: j['xpDayKey'] as String? ?? '',
      completedScenes: (j['completedScenes'] as num?)?.toInt() ?? 0,
      gamesCompleted: (j['gamesCompleted'] as num?)?.toInt() ?? 0,
      completedLanguages: (j['completedLanguages'] as List? ?? const [])
          .map((value) => LearnLang.values.asNameMap()['$value'])
          .whereType<LearnLang>()
          .toSet(),
      achievements: (j['achievements'] as List? ?? const [])
          .map((value) => Achievement.values.asNameMap()['$value'])
          .whereType<Achievement>()
          .toSet(),
      notificationsEnabled: j['notificationsEnabled'] as bool? ?? true,
      reminderHour: (j['reminderHour'] as num?)?.toInt() ?? 19,
      themePreference:
          AppThemePreference.values
              .asNameMap()[j['themePreference'] as String? ?? 'system'] ??
          AppThemePreference.system,
      phrasesKnown: j['phrasesKnown'] as int? ?? 0,
      speakSecondsUsed: j['speakSecondsUsed'] as int? ?? 0,
      speakDayKey: j['speakDayKey'] as String? ?? '',
      bonusSpeakSeconds: j['bonusSpeakSeconds'] as int? ?? 0,
      adsWatchedToday: (j['adsWatchedToday'] as num?)?.toInt() ?? 0,
      lastAdEpoch: (j['lastAdEpoch'] as num?)?.toInt() ?? 0,
      joinedEventId: j['joinedEventId'] as String? ?? '',
      learnedIds: {...(j['learnedIds'] as List? ?? const []).cast<String>()},
      srs: ((j['srs'] as Map?) ?? const {}).map(
        (k, v) => MapEntry('$k', (v as num).toInt()),
      ),
      completedSceneIds: {
        ...(j['completedSceneIds'] as List? ?? const []).cast<String>(),
      },
      learningStyle:
          LearningStyle.values.asNameMap()[j['learningStyle'] as String? ??
              'balanced'] ??
          LearningStyle.balanced,
      strugglePoint: StrugglePoint.values
          .asNameMap()[j['strugglePoint'] as String?],
      practiceDays: (j['practiceDays'] as List? ?? const [])
          .map((value) => Weekday.values.asNameMap()['$value'])
          .whereType<Weekday>()
          .toSet(),
      practiceTimeOfDay: PracticeTimeOfDay.values
          .asNameMap()[j['practiceTimeOfDay'] as String?],
      onboardedDayKey: j['onboardedDayKey'] as String? ?? '',
      day1ReturnLogged: j['day1ReturnLogged'] as bool? ?? false,
    );
  }
}
