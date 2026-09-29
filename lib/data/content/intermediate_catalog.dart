import '../models/models.dart';

/// A1 cümlelerini karışık sırayla tekrar ettiren iki paket üretir. Yeni
/// içerik değildir; bu yüzden A1 olarak ve "tekrar" adıyla işaretlenir
/// (eskiden A2/B1 etiketliydi — yanıltıcıydı). Kimlikler değişmedi, kullanıcı
/// ilerlemesi korunur. Gerçek A2+ içerik: docs/AI_ICERIK_PROMPTLARI.md.
class IntermediateCatalog {
  static List<Scenario> build(LearnLang language, List<Scenario> foundation) {
    if (foundation.length < 6) return const [];
    return [
      _scenario(
        language: language,
        level: Cefr.a1,
        suffix: 'a2_route',
        minutes: 9,
        titleTr: 'Karışık tekrar 1',
        titleEn: 'Mixed review 1',
        sources: [
          foundation[0].phrases[0],
          foundation[1].phrases[0],
          foundation[2].phrases[0],
          foundation[3].phrases[0],
        ],
        prompts: const [
          'Start the situation politely.',
          'Explain what you already arranged.',
          'Ask for the next place or step.',
          'Close the exchange naturally.',
        ],
      ),
      _scenario(
        language: language,
        level: Cefr.a1,
        suffix: 'b1_solve',
        minutes: 12,
        titleTr: 'Karışık tekrar 2',
        titleEn: 'Mixed review 2',
        sources: [
          foundation[1].phrases[1],
          foundation[2].phrases[2],
          foundation[4].phrases[0],
          foundation[4].phrases[1],
          foundation[5].phrases[2],
        ],
        prompts: const [
          'Clarify one important condition.',
          'Say what you did not understand.',
          'Describe what you are looking for.',
          'Ask about the cost or condition.',
          'Request a practical solution.',
        ],
      ),
    ];
  }

  static Scenario _scenario({
    required LearnLang language,
    required Cefr level,
    required String suffix,
    required int minutes,
    required String titleTr,
    required String titleEn,
    required List<Phrase> sources,
    required List<String> prompts,
  }) {
    final phrases = <Phrase>[
      for (var index = 0; index < sources.length; index++)
        Phrase(
          id: '${language.name}_${suffix}_$index',
          target: sources[index].target,
          gloss: Map<UiLang, String>.unmodifiable(sources[index].gloss),
          ipa: sources[index].ipa,
          hint: sources[index].hint,
        ),
    ];
    return Scenario(
      id: '${language.name}_$suffix',
      lang: language,
      cefr: level,
      minutes: minutes,
      titles: {UiLang.tr: titleTr, UiLang.en: titleEn},
      phrases: phrases,
      turns: [
        for (var index = 0; index < phrases.length; index++)
          SpeakTurn(
            prompt: prompts[index],
            expected: phrases[index].target,
            scaffold: index == 0 ? null : phrases[index - 1].target,
          ),
      ],
      clipLine: phrases.first.target,
    );
  }
}
