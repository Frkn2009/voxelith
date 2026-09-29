/// Telaffuz geri bildiriminin türü — UI bunu `I18n` ile kullanıcının
/// arayüz diline çevirir (bkz. `UiStrings.pronunciationFeedback`).
enum PronunciationFeedback { noAudio, notEnough, excellent, good, fair, weak }

class PronunciationAssessment {
  const PronunciationAssessment({
    required this.overall,
    required this.phonemeAccuracy,
    required this.fluency,
    required this.clarity,
    required this.feedback,
    required this.feedbackKind,
  });

  final int overall;
  final int phonemeAccuracy;
  final int fluency;
  final int clarity;

  /// Türkçe geri bildirim metni (geriye dönük uyumluluk için). Ekranlar
  /// bunun yerine [feedbackKind]'ı yerelleştirerek göstermeli.
  final String feedback;
  final PronunciationFeedback feedbackKind;
}

/// STT'nin akustik çözümlemesini dil-duyarlı fonem dizisiyle değerlendirir.
/// Ham metin eşleşmesinden farklı olarak yazım varyasyonlarını ses birimlerine
/// indirger ve ekleme/silme/değiştirme hatalarını ayrı ayrı cezalandırır.
class PhonemeScorer {
  static PronunciationAssessment assess({
    required String expected,
    required String heard,
    required String languageCode,
    double acousticConfidence = -1,
  }) {
    if (heard.trim().isEmpty) {
      return const PronunciationAssessment(
        overall: 0,
        phonemeAccuracy: 0,
        fluency: 0,
        clarity: 0,
        feedback: 'Ses algılanmadı. Mikrofona yakın ve doğal hızda tekrar et.',
        feedbackKind: PronunciationFeedback.noAudio,
      );
    }

    final target = _phonemes(expected, languageCode);
    final actual = _phonemes(heard, languageCode);
    if (target.isEmpty || actual.isEmpty) {
      return const PronunciationAssessment(
        overall: 0,
        phonemeAccuracy: 0,
        fluency: 0,
        clarity: 0,
        feedback: 'Değerlendirilecek yeterli ses birimi bulunamadı.',
        feedbackKind: PronunciationFeedback.notEnough,
      );
    }

    final distance = _levenshtein(target, actual);
    final phoneme = ((1 - distance / target.length.clamp(1, 9999)) * 100)
        .round()
        .clamp(0, 100)
        .toInt();
    final expectedWords = _words(expected);
    final heardWords = _words(heard);
    final lengthRatio = heardWords.length / expectedWords.length.clamp(1, 9999);
    final fluency = (100 - ((1 - lengthRatio.clamp(.0, 2.0)).abs() * 70))
        .round()
        .clamp(0, 100)
        .toInt();
    final confidence = acousticConfidence < 0
        ? phoneme / 100
        : acousticConfidence.clamp(.0, 1.0);
    final clarity = (phoneme * .55 + confidence * 100 * .45)
        .round()
        .clamp(0, 100)
        .toInt();
    final overall = (phoneme * .6 + fluency * .2 + clarity * .2)
        .round()
        .clamp(0, 100)
        .toInt();

    final feedback = switch (overall) {
      >= 90 => 'Ses birimleri çok net. Aynı ritmi koru.',
      >= 75 => 'İyi telaffuz. Son heceleri biraz daha belirgin söyle.',
      >= 55 => 'Anlaşılır; cümleyi yavaşlatıp sesleri birbirine bağla.',
      _ => 'Önce yavaş dinle, ardından kelime kelime tekrar et.',
    };
    final feedbackKind = switch (overall) {
      >= 90 => PronunciationFeedback.excellent,
      >= 75 => PronunciationFeedback.good,
      >= 55 => PronunciationFeedback.fair,
      _ => PronunciationFeedback.weak,
    };
    return PronunciationAssessment(
      overall: overall,
      phonemeAccuracy: phoneme,
      fluency: fluency,
      clarity: clarity,
      feedback: feedback,
      feedbackKind: feedbackKind,
    );
  }

  static List<String> _phonemes(String input, String language) {
    var value = input.toLowerCase();
    if (language == 'tr') {
      value = value.replaceAll('ş', 'ʃ').replaceAll('ç', 'tʃ');
    }
    const accents = {
      'á': 'a',
      'à': 'a',
      'â': 'a',
      'ä': 'e',
      'ã': 'a',
      'å': 'o',
      'é': 'e',
      'è': 'e',
      'ê': 'e',
      'ë': 'e',
      'í': 'i',
      'ì': 'i',
      'î': 'i',
      'ï': 'i',
      'ó': 'o',
      'ò': 'o',
      'ô': 'o',
      'ö': 'oe',
      'õ': 'o',
      'ú': 'u',
      'ù': 'u',
      'û': 'u',
      'ü': 'ue',
      'ý': 'i',
      'ç': 's',
      'ş': 'sh',
      'ğ': '',
      'ı': 'i',
      'ñ': 'ny',
      'ß': 'ss',
    };
    accents.forEach((from, to) => value = value.replaceAll(from, to));

    final rules = <String, String>{
      if (language == 'en') ...{
        'tion': 'shun',
        'th': 'θ',
        'sh': 'ʃ',
        'ch': 'tʃ',
        'ph': 'f',
        'qu': 'kw',
        'ng': 'ŋ',
      },
      if (language == 'es') ...{
        'll': 'y',
        'rr': 'r',
        'qu': 'k',
        'gue': 'ge',
        'gui': 'gi',
        'j': 'x',
        'z': 's',
      },
      if (language == 'de') ...{
        'sch': 'ʃ',
        'ch': 'x',
        'ei': 'ay',
        'ie': 'i',
        'eu': 'oy',
        'z': 'ts',
        'w': 'v',
      },
      if (language == 'fr') ...{
        'eau': 'o',
        'ou': 'u',
        'oi': 'wa',
        'ch': 'ʃ',
        'gn': 'ny',
        'ph': 'f',
      },
      if (language == 'pt') ...{'nh': 'ny', 'lh': 'ly', 'ch': 'ʃ', 'ão': 'aw'},
      if (language == 'it') ...{
        'gli': 'ly',
        'gn': 'ny',
        'ch': 'k',
        'ci': 'tʃi',
        'ce': 'tʃe',
      },
      if (language == 'nl') ...{'sch': 'sx', 'ij': 'ay', 'oe': 'u'},
      if (language == 'tr') ...{'ş': 'ʃ', 'ç': 'tʃ', 'c': 'dʒ'},
      'ts': 'ʦ',
      'dz': 'ʣ',
    };
    final ordered = rules.keys.toList()
      ..sort((a, b) => b.length.compareTo(a.length));
    for (final pattern in ordered) {
      value = value.replaceAll(pattern, ' ${rules[pattern]} ');
    }
    value = value.replaceAll(
      RegExp(r'[^\p{L}\p{M}\p{N}θʃŋʦʣʒ\s]', unicode: true),
      ' ',
    );
    return value
        .split(RegExp(r'\s+'))
        .where((part) => part.isNotEmpty)
        .expand((part) => part.runes.map(String.fromCharCode))
        .toList(growable: false);
  }

  static List<String> _words(String value) => value
      .toLowerCase()
      .replaceAll(RegExp(r'[^\p{L}\p{M}\p{N}\s]', unicode: true), ' ')
      .split(RegExp(r'\s+'))
      .where((word) => word.isNotEmpty)
      .toList(growable: false);

  static int _levenshtein(List<String> expected, List<String> actual) {
    var previous = List<int>.generate(actual.length + 1, (index) => index);
    for (var row = 0; row < expected.length; row++) {
      final current = List<int>.filled(actual.length + 1, 0)..[0] = row + 1;
      for (var column = 0; column < actual.length; column++) {
        final cost = expected[row] == actual[column] ? 0 : 1;
        current[column + 1] = _min3(
          previous[column + 1] + 1,
          current[column] + 1,
          previous[column] + cost,
        );
      }
      previous = current;
    }
    return previous.last;
  }

  static int _min3(int a, int b, int c) =>
      a < b ? (a < c ? a : c) : (b < c ? b : c);
}
