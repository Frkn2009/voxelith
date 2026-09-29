// GENERATED — 30 language A1 catalog
// ignore_for_file: lines_longer_than_80_chars

import '../models/models.dart';
import 'content_store.dart';
import 'intermediate_catalog.dart';
import 'professional_catalog.dart';
import 'extra/catalog_extra_batch_a.dart';
import 'extra/catalog_extra_batch_b.dart';
import 'extra/catalog_extra_batch_c.dart';
import 'extra/catalog_extra_batch_d.dart';
import 'extra/catalog_extra_batch_e.dart';
import 'extra/catalog_extra_batch_f.dart';
import 'extra/catalog_extra_batch_g.dart';
import 'extra/catalog_extra_batch_h.dart';
import 'extra/catalog_extra_batch_j.dart';
import 'extra/catalog_extra_batch_k.dart';
import 'expanded_catalog_tr.dart';
import 'expanded_catalog_ja.dart';
import 'expanded_catalog_pt.dart';
import 'expanded_catalog_it.dart';
import 'expanded_catalog_pl.dart';
import 'expanded_catalog_sv.dart';
import 'expanded_catalog_da.dart';
import 'expanded_catalog_no.dart';
import 'expanded_catalog_fi.dart';
import 'expanded_catalog_el.dart';
import 'expanded_catalog_cs.dart';
import 'expanded_catalog_ro.dart';
import 'expanded_catalog_hu.dart';
import 'expanded_catalog_hi.dart';
import 'expanded_catalog_th.dart';

class Catalog {
  static List<Scenario> forLang(LearnLang lang) {
    final foundation = _all.where((scenario) => scenario.lang == lang).toList();
    return [
      ...foundation,
      ...IntermediateCatalog.build(lang, foundation),
      ...ProfessionalCatalog.build(lang),
      ...ExpandedCatalogTr.build(lang),
      ...ExpandedCatalogJa.build(lang),
      ...ExpandedCatalogPt.build(lang),
      ...ExpandedCatalogIt.build(lang),
      ...ExpandedCatalogPl.build(lang),
      ...ExpandedCatalogSv.build(lang),
      ...ExpandedCatalogDa.build(lang),
      ...ExpandedCatalogNo.build(lang),
      ...ExpandedCatalogFi.build(lang),
      ...ExpandedCatalogEl.build(lang),
      ...ExpandedCatalogCs.build(lang),
      ...ExpandedCatalogRo.build(lang),
      ...ExpandedCatalogHu.build(lang),
      ...ExpandedCatalogHi.build(lang),
      ...ExpandedCatalogTh.build(lang),
      ...ContentStore.scenariosFor(lang),
    ];
  }

  static Scenario? byId(String id) {
    for (final language in LearnLang.values) {
      for (final scenario in forLang(language)) {
        if (scenario.id == id) return scenario;
      }
    }
    return null;
  }

  static Phrase? phraseById(String id) {
    for (final language in LearnLang.values) {
      for (final scenario in forLang(language)) {
        for (final phrase in scenario.phrases) {
          if (phrase.id == id) return phrase;
        }
      }
    }
    return null;
  }

  /// [maxLevel] verilirse yalnızca o seviye ve altındaki senaryoların
  /// kelimeleri kullanılır (oyunlar kullanıcının seviyesini aşmasın diye).
  /// Filtre çok az kelime bırakırsa (deste kilitlenmesin diye) filtresiz
  /// tüm havuza düşülür.
  static List<Phrase> allPhrases(LearnLang lang, {Cefr? maxLevel}) {
    final scenarios = forLang(lang);
    if (maxLevel == null) return scenarios.expand((s) => s.phrases).toList();
    final leveled = scenarios
        .where((s) => s.cefr.index <= maxLevel.index)
        .expand((s) => s.phrases)
        .toList();
    return leveled.length >= 8
        ? leveled
        : scenarios.expand((s) => s.phrases).toList();
  }

  static final List<Scenario> _all = [
    Scenario(
      id: 'en_cafe',
      lang: LearnLang.en,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Kafede sipariş', UiLang.en: 'Ordering at a café'},
      clipLine: 'A coffee, please.',
      phrases: [
        Phrase(
          id: 'en_cafe_0',
          target: 'A coffee, please.',
          gloss: {
            UiLang.tr: 'Bir kahve, lütfen.',
            UiLang.en: 'A coffee, please.',
          },
        ),
        Phrase(
          id: 'en_cafe_1',
          target: 'How much is that?',
          gloss: {UiLang.tr: 'Ne kadar?', UiLang.en: 'How much is that?'},
        ),
        Phrase(
          id: 'en_cafe_2',
          target: 'Thank you very much.',
          gloss: {
            UiLang.tr: 'Çok teşekkür ederim.',
            UiLang.en: 'Thank you very much.',
          },
        ),
      ],
      turns: [
        SpeakTurn(prompt: 'What can I get you?', expected: 'A coffee, please.'),
        SpeakTurn(prompt: 'How much?', expected: 'How much is that?'),
      ],
    ),
    Scenario(
      id: 'en_hotel',
      lang: LearnLang.en,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Otele giriş', UiLang.en: 'Hotel check-in'},
      clipLine: 'I have a reservation.',
      phrases: [
        Phrase(
          id: 'en_hotel_0',
          target: 'I have a reservation.',
          gloss: {
            UiLang.tr: 'Rezervasyonum var.',
            UiLang.en: 'I have a reservation.',
          },
        ),
        Phrase(
          id: 'en_hotel_1',
          target: 'Is breakfast included?',
          gloss: {
            UiLang.tr: 'Kahvaltı dahil mi?',
            UiLang.en: 'Is breakfast included?',
          },
        ),
        Phrase(
          id: 'en_hotel_2',
          target: 'Thank you very much.',
          gloss: {
            UiLang.tr: 'Çok teşekkür ederim.',
            UiLang.en: 'Thank you very much.',
          },
        ),
      ],
      turns: [
        SpeakTurn(prompt: 'Good evening.', expected: 'I have a reservation.'),
        SpeakTurn(prompt: 'Any questions?', expected: 'Is breakfast included?'),
      ],
    ),
    Scenario(
      id: 'en_dir',
      lang: LearnLang.en,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Yol sormak', UiLang.en: 'Asking the way'},
      clipLine: 'Excuse me, where is the station?',
      phrases: [
        Phrase(
          id: 'en_dir_0',
          target: 'Excuse me, where is the station?',
          gloss: {
            UiLang.tr: 'Afedersiniz, istasyon nerede?',
            UiLang.en: 'Excuse me, where is the station?',
          },
        ),
        Phrase(
          id: 'en_dir_1',
          target: 'Thank you very much.',
          gloss: {
            UiLang.tr: 'Çok teşekkür ederim.',
            UiLang.en: 'Thank you very much.',
          },
        ),
        Phrase(
          id: 'en_dir_2',
          target: 'I do not understand.',
          gloss: {UiLang.tr: 'Anlamıyorum.', UiLang.en: 'I do not understand.'},
        ),
      ],
      turns: [
        SpeakTurn(
          prompt: 'You stop someone.',
          expected: 'Excuse me, where is the station?',
        ),
        SpeakTurn(prompt: 'They point.', expected: 'Thank you very much.'),
      ],
    ),
    Scenario(
      id: 'en_hi',
      lang: LearnLang.en,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Tanışmak', UiLang.en: 'Introducing yourself'},
      clipLine: 'Hi, my name is Deniz.',
      phrases: [
        Phrase(
          id: 'en_hi_0',
          target: 'Hi, my name is Deniz.',
          gloss: {
            UiLang.tr: 'Merhaba, adım Deniz.',
            UiLang.en: 'Hi, my name is Deniz.',
          },
        ),
        Phrase(
          id: 'en_hi_1',
          target: 'I am from Turkey.',
          gloss: {UiLang.tr: 'Türkiye\'denim.', UiLang.en: 'I am from Turkey.'},
        ),
        Phrase(
          id: 'en_hi_2',
          target: 'Thank you very much.',
          gloss: {
            UiLang.tr: 'Çok teşekkür ederim.',
            UiLang.en: 'Thank you very much.',
          },
        ),
      ],
      turns: [
        SpeakTurn(
          prompt: 'Someone says hello.',
          expected: 'Hi, my name is Deniz.',
        ),
        SpeakTurn(prompt: 'Where are you from?', expected: 'I am from Turkey.'),
      ],
    ),
    Scenario(
      id: 'en_flat',
      lang: LearnLang.en,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Ev bakmak', UiLang.en: 'Viewing a flat'},
      clipLine: 'I am looking for a flat.',
      phrases: [
        Phrase(
          id: 'en_flat_0',
          target: 'I am looking for a flat.',
          gloss: {
            UiLang.tr: 'Daire arıyorum.',
            UiLang.en: 'I am looking for a flat.',
          },
        ),
        Phrase(
          id: 'en_flat_1',
          target: 'How much is the rent?',
          gloss: {
            UiLang.tr: 'Kira ne kadar?',
            UiLang.en: 'How much is the rent?',
          },
        ),
        Phrase(
          id: 'en_flat_2',
          target: 'Can you help me?',
          gloss: {
            UiLang.tr: 'Bana yardım edebilir misiniz?',
            UiLang.en: 'Can you help me?',
          },
        ),
      ],
      turns: [
        SpeakTurn(
          prompt: 'The agent asks.',
          expected: 'I am looking for a flat.',
        ),
        SpeakTurn(
          prompt: 'They show a listing.',
          expected: 'How much is the rent?',
        ),
      ],
    ),
    Scenario(
      id: 'es_cafe',
      lang: LearnLang.es,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Kafede sipariş', UiLang.en: 'Ordering at a café'},
      clipLine: 'Un café, por favor.',
      phrases: [
        Phrase(
          id: 'es_cafe_0',
          target: 'Un café, por favor.',
          gloss: {
            UiLang.tr: 'Bir kahve, lütfen.',
            UiLang.en: 'A coffee, please.',
          },
        ),
        Phrase(
          id: 'es_cafe_1',
          target: '¿Cuánto es?',
          gloss: {UiLang.tr: 'Ne kadar?', UiLang.en: 'How much is that?'},
        ),
        Phrase(
          id: 'es_cafe_2',
          target: 'Muchas gracias.',
          gloss: {
            UiLang.tr: 'Çok teşekkür ederim.',
            UiLang.en: 'Thank you very much.',
          },
        ),
      ],
      turns: [
        SpeakTurn(
          prompt: 'What can I get you?',
          expected: 'Un café, por favor.',
        ),
        SpeakTurn(prompt: 'How much?', expected: '¿Cuánto es?'),
      ],
    ),
    Scenario(
      id: 'es_hotel',
      lang: LearnLang.es,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Otele giriş', UiLang.en: 'Hotel check-in'},
      clipLine: 'Tengo una reserva.',
      phrases: [
        Phrase(
          id: 'es_hotel_0',
          target: 'Tengo una reserva.',
          gloss: {
            UiLang.tr: 'Rezervasyonum var.',
            UiLang.en: 'I have a reservation.',
          },
        ),
        Phrase(
          id: 'es_hotel_1',
          target: '¿El desayuno está incluido?',
          gloss: {
            UiLang.tr: 'Kahvaltı dahil mi?',
            UiLang.en: 'Is breakfast included?',
          },
        ),
        Phrase(
          id: 'es_hotel_2',
          target: 'Muchas gracias.',
          gloss: {
            UiLang.tr: 'Çok teşekkür ederim.',
            UiLang.en: 'Thank you very much.',
          },
        ),
      ],
      turns: [
        SpeakTurn(prompt: 'Good evening.', expected: 'Tengo una reserva.'),
        SpeakTurn(
          prompt: 'Any questions?',
          expected: '¿El desayuno está incluido?',
        ),
      ],
    ),
    Scenario(
      id: 'es_dir',
      lang: LearnLang.es,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Yol sormak', UiLang.en: 'Asking the way'},
      clipLine: 'Perdón, ¿dónde está la estación?',
      phrases: [
        Phrase(
          id: 'es_dir_0',
          target: 'Perdón, ¿dónde está la estación?',
          gloss: {
            UiLang.tr: 'Afedersiniz, istasyon nerede?',
            UiLang.en: 'Excuse me, where is the station?',
          },
        ),
        Phrase(
          id: 'es_dir_1',
          target: 'Muchas gracias.',
          gloss: {
            UiLang.tr: 'Çok teşekkür ederim.',
            UiLang.en: 'Thank you very much.',
          },
        ),
        Phrase(
          id: 'es_dir_2',
          target: 'No entiendo.',
          gloss: {UiLang.tr: 'Anlamıyorum.', UiLang.en: 'I do not understand.'},
        ),
      ],
      turns: [
        SpeakTurn(
          prompt: 'You stop someone.',
          expected: 'Perdón, ¿dónde está la estación?',
        ),
        SpeakTurn(prompt: 'They point.', expected: 'Muchas gracias.'),
      ],
    ),
    Scenario(
      id: 'es_hi',
      lang: LearnLang.es,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Tanışmak', UiLang.en: 'Introducing yourself'},
      clipLine: 'Hola, me llamo Deniz.',
      phrases: [
        Phrase(
          id: 'es_hi_0',
          target: 'Hola, me llamo Deniz.',
          gloss: {
            UiLang.tr: 'Merhaba, adım Deniz.',
            UiLang.en: 'Hi, my name is Deniz.',
          },
        ),
        Phrase(
          id: 'es_hi_1',
          target: 'Soy de Turquía.',
          gloss: {UiLang.tr: 'Türkiye\'denim.', UiLang.en: 'I am from Turkey.'},
        ),
        Phrase(
          id: 'es_hi_2',
          target: 'Muchas gracias.',
          gloss: {
            UiLang.tr: 'Çok teşekkür ederim.',
            UiLang.en: 'Thank you very much.',
          },
        ),
      ],
      turns: [
        SpeakTurn(
          prompt: 'Someone says hello.',
          expected: 'Hola, me llamo Deniz.',
        ),
        SpeakTurn(prompt: 'Where are you from?', expected: 'Soy de Turquía.'),
      ],
    ),
    Scenario(
      id: 'es_flat',
      lang: LearnLang.es,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Ev bakmak', UiLang.en: 'Viewing a flat'},
      clipLine: 'Estoy buscando un piso.',
      phrases: [
        Phrase(
          id: 'es_flat_0',
          target: 'Estoy buscando un piso.',
          gloss: {
            UiLang.tr: 'Daire arıyorum.',
            UiLang.en: 'I am looking for a flat.',
          },
        ),
        Phrase(
          id: 'es_flat_1',
          target: '¿Cuánto es el alquiler?',
          gloss: {
            UiLang.tr: 'Kira ne kadar?',
            UiLang.en: 'How much is the rent?',
          },
        ),
        Phrase(
          id: 'es_flat_2',
          target: '¿Puede ayudarme?',
          gloss: {
            UiLang.tr: 'Bana yardım edebilir misiniz?',
            UiLang.en: 'Can you help me?',
          },
        ),
      ],
      turns: [
        SpeakTurn(
          prompt: 'The agent asks.',
          expected: 'Estoy buscando un piso.',
        ),
        SpeakTurn(
          prompt: 'They show a listing.',
          expected: '¿Cuánto es el alquiler?',
        ),
      ],
    ),
    Scenario(
      id: 'de_cafe',
      lang: LearnLang.de,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Kafede sipariş', UiLang.en: 'Ordering at a café'},
      clipLine: 'Einen Kaffee, bitte.',
      phrases: [
        Phrase(
          id: 'de_cafe_0',
          target: 'Einen Kaffee, bitte.',
          gloss: {
            UiLang.tr: 'Bir kahve, lütfen.',
            UiLang.en: 'A coffee, please.',
          },
        ),
        Phrase(
          id: 'de_cafe_1',
          target: 'Was kostet das?',
          gloss: {UiLang.tr: 'Ne kadar?', UiLang.en: 'How much is that?'},
        ),
        Phrase(
          id: 'de_cafe_2',
          target: 'Vielen Dank.',
          gloss: {
            UiLang.tr: 'Çok teşekkür ederim.',
            UiLang.en: 'Thank you very much.',
          },
        ),
      ],
      turns: [
        SpeakTurn(
          prompt: 'What can I get you?',
          expected: 'Einen Kaffee, bitte.',
        ),
        SpeakTurn(prompt: 'How much?', expected: 'Was kostet das?'),
      ],
    ),
    Scenario(
      id: 'de_hotel',
      lang: LearnLang.de,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Otele giriş', UiLang.en: 'Hotel check-in'},
      clipLine: 'Ich habe eine Reservierung.',
      phrases: [
        Phrase(
          id: 'de_hotel_0',
          target: 'Ich habe eine Reservierung.',
          gloss: {
            UiLang.tr: 'Rezervasyonum var.',
            UiLang.en: 'I have a reservation.',
          },
        ),
        Phrase(
          id: 'de_hotel_1',
          target: 'Ist Frühstück inklusive?',
          gloss: {
            UiLang.tr: 'Kahvaltı dahil mi?',
            UiLang.en: 'Is breakfast included?',
          },
        ),
        Phrase(
          id: 'de_hotel_2',
          target: 'Vielen Dank.',
          gloss: {
            UiLang.tr: 'Çok teşekkür ederim.',
            UiLang.en: 'Thank you very much.',
          },
        ),
      ],
      turns: [
        SpeakTurn(
          prompt: 'Good evening.',
          expected: 'Ich habe eine Reservierung.',
        ),
        SpeakTurn(
          prompt: 'Any questions?',
          expected: 'Ist Frühstück inklusive?',
        ),
      ],
    ),
    Scenario(
      id: 'de_dir',
      lang: LearnLang.de,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Yol sormak', UiLang.en: 'Asking the way'},
      clipLine: 'Entschuldigung, wo ist der Bahnhof?',
      phrases: [
        Phrase(
          id: 'de_dir_0',
          target: 'Entschuldigung, wo ist der Bahnhof?',
          gloss: {
            UiLang.tr: 'Afedersiniz, istasyon nerede?',
            UiLang.en: 'Excuse me, where is the station?',
          },
        ),
        Phrase(
          id: 'de_dir_1',
          target: 'Vielen Dank.',
          gloss: {
            UiLang.tr: 'Çok teşekkür ederim.',
            UiLang.en: 'Thank you very much.',
          },
        ),
        Phrase(
          id: 'de_dir_2',
          target: 'Ich verstehe nicht.',
          gloss: {UiLang.tr: 'Anlamıyorum.', UiLang.en: 'I do not understand.'},
        ),
      ],
      turns: [
        SpeakTurn(
          prompt: 'You stop someone.',
          expected: 'Entschuldigung, wo ist der Bahnhof?',
        ),
        SpeakTurn(prompt: 'They point.', expected: 'Vielen Dank.'),
      ],
    ),
    Scenario(
      id: 'de_hi',
      lang: LearnLang.de,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Tanışmak', UiLang.en: 'Introducing yourself'},
      clipLine: 'Hallo, ich heiße Deniz.',
      phrases: [
        Phrase(
          id: 'de_hi_0',
          target: 'Hallo, ich heiße Deniz.',
          gloss: {
            UiLang.tr: 'Merhaba, adım Deniz.',
            UiLang.en: 'Hi, my name is Deniz.',
          },
        ),
        Phrase(
          id: 'de_hi_1',
          target: 'Ich komme aus der Türkei.',
          gloss: {UiLang.tr: 'Türkiye\'denim.', UiLang.en: 'I am from Turkey.'},
        ),
        Phrase(
          id: 'de_hi_2',
          target: 'Vielen Dank.',
          gloss: {
            UiLang.tr: 'Çok teşekkür ederim.',
            UiLang.en: 'Thank you very much.',
          },
        ),
      ],
      turns: [
        SpeakTurn(
          prompt: 'Someone says hello.',
          expected: 'Hallo, ich heiße Deniz.',
        ),
        SpeakTurn(
          prompt: 'Where are you from?',
          expected: 'Ich komme aus der Türkei.',
        ),
      ],
    ),
    Scenario(
      id: 'de_flat',
      lang: LearnLang.de,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Ev bakmak', UiLang.en: 'Viewing a flat'},
      clipLine: 'Ich suche eine Wohnung.',
      phrases: [
        Phrase(
          id: 'de_flat_0',
          target: 'Ich suche eine Wohnung.',
          gloss: {
            UiLang.tr: 'Daire arıyorum.',
            UiLang.en: 'I am looking for a flat.',
          },
        ),
        Phrase(
          id: 'de_flat_1',
          target: 'Wie hoch ist die Miete?',
          gloss: {
            UiLang.tr: 'Kira ne kadar?',
            UiLang.en: 'How much is the rent?',
          },
        ),
        Phrase(
          id: 'de_flat_2',
          target: 'Können Sie mir helfen?',
          gloss: {
            UiLang.tr: 'Bana yardım edebilir misiniz?',
            UiLang.en: 'Can you help me?',
          },
        ),
      ],
      turns: [
        SpeakTurn(
          prompt: 'The agent asks.',
          expected: 'Ich suche eine Wohnung.',
        ),
        SpeakTurn(
          prompt: 'They show a listing.',
          expected: 'Wie hoch ist die Miete?',
        ),
      ],
    ),
    Scenario(
      id: 'fr_cafe',
      lang: LearnLang.fr,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Kafede sipariş', UiLang.en: 'Ordering at a café'},
      clipLine: 'Un café, s\'il vous plaît.',
      phrases: [
        Phrase(
          id: 'fr_cafe_0',
          target: 'Un café, s\'il vous plaît.',
          gloss: {
            UiLang.tr: 'Bir kahve, lütfen.',
            UiLang.en: 'A coffee, please.',
          },
        ),
        Phrase(
          id: 'fr_cafe_1',
          target: 'Ça fait combien ?',
          gloss: {UiLang.tr: 'Ne kadar?', UiLang.en: 'How much is that?'},
        ),
        Phrase(
          id: 'fr_cafe_2',
          target: 'Merci beaucoup.',
          gloss: {
            UiLang.tr: 'Çok teşekkür ederim.',
            UiLang.en: 'Thank you very much.',
          },
        ),
      ],
      turns: [
        SpeakTurn(
          prompt: 'What can I get you?',
          expected: 'Un café, s\'il vous plaît.',
        ),
        SpeakTurn(prompt: 'How much?', expected: 'Ça fait combien ?'),
      ],
    ),
    Scenario(
      id: 'fr_hotel',
      lang: LearnLang.fr,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Otele giriş', UiLang.en: 'Hotel check-in'},
      clipLine: 'J\'ai une réservation.',
      phrases: [
        Phrase(
          id: 'fr_hotel_0',
          target: 'J\'ai une réservation.',
          gloss: {
            UiLang.tr: 'Rezervasyonum var.',
            UiLang.en: 'I have a reservation.',
          },
        ),
        Phrase(
          id: 'fr_hotel_1',
          target: 'Le petit-déjeuner est inclus ?',
          gloss: {
            UiLang.tr: 'Kahvaltı dahil mi?',
            UiLang.en: 'Is breakfast included?',
          },
        ),
        Phrase(
          id: 'fr_hotel_2',
          target: 'Merci beaucoup.',
          gloss: {
            UiLang.tr: 'Çok teşekkür ederim.',
            UiLang.en: 'Thank you very much.',
          },
        ),
      ],
      turns: [
        SpeakTurn(prompt: 'Good evening.', expected: 'J\'ai une réservation.'),
        SpeakTurn(
          prompt: 'Any questions?',
          expected: 'Le petit-déjeuner est inclus ?',
        ),
      ],
    ),
    Scenario(
      id: 'fr_dir',
      lang: LearnLang.fr,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Yol sormak', UiLang.en: 'Asking the way'},
      clipLine: 'Pardon, où est la gare ?',
      phrases: [
        Phrase(
          id: 'fr_dir_0',
          target: 'Pardon, où est la gare ?',
          gloss: {
            UiLang.tr: 'Afedersiniz, istasyon nerede?',
            UiLang.en: 'Excuse me, where is the station?',
          },
        ),
        Phrase(
          id: 'fr_dir_1',
          target: 'Merci beaucoup.',
          gloss: {
            UiLang.tr: 'Çok teşekkür ederim.',
            UiLang.en: 'Thank you very much.',
          },
        ),
        Phrase(
          id: 'fr_dir_2',
          target: 'Je ne comprends pas.',
          gloss: {UiLang.tr: 'Anlamıyorum.', UiLang.en: 'I do not understand.'},
        ),
      ],
      turns: [
        SpeakTurn(
          prompt: 'You stop someone.',
          expected: 'Pardon, où est la gare ?',
        ),
        SpeakTurn(prompt: 'They point.', expected: 'Merci beaucoup.'),
      ],
    ),
    Scenario(
      id: 'fr_hi',
      lang: LearnLang.fr,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Tanışmak', UiLang.en: 'Introducing yourself'},
      clipLine: 'Salut, je m\'appelle Deniz.',
      phrases: [
        Phrase(
          id: 'fr_hi_0',
          target: 'Salut, je m\'appelle Deniz.',
          gloss: {
            UiLang.tr: 'Merhaba, adım Deniz.',
            UiLang.en: 'Hi, my name is Deniz.',
          },
        ),
        Phrase(
          id: 'fr_hi_1',
          target: 'Je viens de Turquie.',
          gloss: {UiLang.tr: 'Türkiye\'denim.', UiLang.en: 'I am from Turkey.'},
        ),
        Phrase(
          id: 'fr_hi_2',
          target: 'Merci beaucoup.',
          gloss: {
            UiLang.tr: 'Çok teşekkür ederim.',
            UiLang.en: 'Thank you very much.',
          },
        ),
      ],
      turns: [
        SpeakTurn(
          prompt: 'Someone says hello.',
          expected: 'Salut, je m\'appelle Deniz.',
        ),
        SpeakTurn(
          prompt: 'Where are you from?',
          expected: 'Je viens de Turquie.',
        ),
      ],
    ),
    Scenario(
      id: 'fr_flat',
      lang: LearnLang.fr,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Ev bakmak', UiLang.en: 'Viewing a flat'},
      clipLine: 'Je cherche un appartement.',
      phrases: [
        Phrase(
          id: 'fr_flat_0',
          target: 'Je cherche un appartement.',
          gloss: {
            UiLang.tr: 'Daire arıyorum.',
            UiLang.en: 'I am looking for a flat.',
          },
        ),
        Phrase(
          id: 'fr_flat_1',
          target: 'C\'est combien le loyer ?',
          gloss: {
            UiLang.tr: 'Kira ne kadar?',
            UiLang.en: 'How much is the rent?',
          },
        ),
        Phrase(
          id: 'fr_flat_2',
          target: 'Pouvez-vous m\'aider ?',
          gloss: {
            UiLang.tr: 'Bana yardım edebilir misiniz?',
            UiLang.en: 'Can you help me?',
          },
        ),
      ],
      turns: [
        SpeakTurn(
          prompt: 'The agent asks.',
          expected: 'Je cherche un appartement.',
        ),
        SpeakTurn(
          prompt: 'They show a listing.',
          expected: 'C\'est combien le loyer ?',
        ),
      ],
    ),
    Scenario(
      id: 'nl_cafe',
      lang: LearnLang.nl,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Kafede sipariş', UiLang.en: 'Ordering at a café'},
      clipLine: 'Een koffie, alstublieft.',
      phrases: [
        Phrase(
          id: 'nl_cafe_0',
          target: 'Een koffie, alstublieft.',
          gloss: {
            UiLang.tr: 'Bir kahve, lütfen.',
            UiLang.en: 'A coffee, please.',
          },
        ),
        Phrase(
          id: 'nl_cafe_1',
          target: 'Hoeveel is dat?',
          gloss: {UiLang.tr: 'Ne kadar?', UiLang.en: 'How much is that?'},
        ),
        Phrase(
          id: 'nl_cafe_2',
          target: 'Hartelijk dank.',
          gloss: {
            UiLang.tr: 'Çok teşekkür ederim.',
            UiLang.en: 'Thank you very much.',
          },
        ),
      ],
      turns: [
        SpeakTurn(
          prompt: 'What can I get you?',
          expected: 'Een koffie, alstublieft.',
        ),
        SpeakTurn(prompt: 'How much?', expected: 'Hoeveel is dat?'),
      ],
    ),
    Scenario(
      id: 'nl_hotel',
      lang: LearnLang.nl,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Otele giriş', UiLang.en: 'Hotel check-in'},
      clipLine: 'Ik heb een reservering.',
      phrases: [
        Phrase(
          id: 'nl_hotel_0',
          target: 'Ik heb een reservering.',
          gloss: {
            UiLang.tr: 'Rezervasyonum var.',
            UiLang.en: 'I have a reservation.',
          },
        ),
        Phrase(
          id: 'nl_hotel_1',
          target: 'Is het ontbijt inbegrepen?',
          gloss: {
            UiLang.tr: 'Kahvaltı dahil mi?',
            UiLang.en: 'Is breakfast included?',
          },
        ),
        Phrase(
          id: 'nl_hotel_2',
          target: 'Hartelijk dank.',
          gloss: {
            UiLang.tr: 'Çok teşekkür ederim.',
            UiLang.en: 'Thank you very much.',
          },
        ),
      ],
      turns: [
        SpeakTurn(prompt: 'Good evening.', expected: 'Ik heb een reservering.'),
        SpeakTurn(
          prompt: 'Any questions?',
          expected: 'Is het ontbijt inbegrepen?',
        ),
      ],
    ),
    Scenario(
      id: 'nl_dir',
      lang: LearnLang.nl,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Yol sormak', UiLang.en: 'Asking the way'},
      clipLine: 'Pardon, waar is het station?',
      phrases: [
        Phrase(
          id: 'nl_dir_0',
          target: 'Pardon, waar is het station?',
          gloss: {
            UiLang.tr: 'Afedersiniz, istasyon nerede?',
            UiLang.en: 'Excuse me, where is the station?',
          },
        ),
        Phrase(
          id: 'nl_dir_1',
          target: 'Hartelijk dank.',
          gloss: {
            UiLang.tr: 'Çok teşekkür ederim.',
            UiLang.en: 'Thank you very much.',
          },
        ),
        Phrase(
          id: 'nl_dir_2',
          target: 'Ik begrijp het niet.',
          gloss: {UiLang.tr: 'Anlamıyorum.', UiLang.en: 'I do not understand.'},
        ),
      ],
      turns: [
        SpeakTurn(
          prompt: 'You stop someone.',
          expected: 'Pardon, waar is het station?',
        ),
        SpeakTurn(prompt: 'They point.', expected: 'Hartelijk dank.'),
      ],
    ),
    Scenario(
      id: 'nl_hi',
      lang: LearnLang.nl,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Tanışmak', UiLang.en: 'Introducing yourself'},
      clipLine: 'Hoi, ik heet Deniz.',
      phrases: [
        Phrase(
          id: 'nl_hi_0',
          target: 'Hoi, ik heet Deniz.',
          gloss: {
            UiLang.tr: 'Merhaba, adım Deniz.',
            UiLang.en: 'Hi, my name is Deniz.',
          },
        ),
        Phrase(
          id: 'nl_hi_1',
          target: 'Ik kom uit Turkije.',
          gloss: {UiLang.tr: 'Türkiye\'denim.', UiLang.en: 'I am from Turkey.'},
        ),
        Phrase(
          id: 'nl_hi_2',
          target: 'Hartelijk dank.',
          gloss: {
            UiLang.tr: 'Çok teşekkür ederim.',
            UiLang.en: 'Thank you very much.',
          },
        ),
      ],
      turns: [
        SpeakTurn(
          prompt: 'Someone says hello.',
          expected: 'Hoi, ik heet Deniz.',
        ),
        SpeakTurn(
          prompt: 'Where are you from?',
          expected: 'Ik kom uit Turkije.',
        ),
      ],
    ),
    Scenario(
      id: 'nl_flat',
      lang: LearnLang.nl,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Ev bakmak', UiLang.en: 'Viewing a flat'},
      clipLine: 'Ik zoek een woning.',
      phrases: [
        Phrase(
          id: 'nl_flat_0',
          target: 'Ik zoek een woning.',
          gloss: {
            UiLang.tr: 'Daire arıyorum.',
            UiLang.en: 'I am looking for a flat.',
          },
        ),
        Phrase(
          id: 'nl_flat_1',
          target: 'Wat is de huur?',
          gloss: {
            UiLang.tr: 'Kira ne kadar?',
            UiLang.en: 'How much is the rent?',
          },
        ),
        Phrase(
          id: 'nl_flat_2',
          target: 'Kunt u mij helpen?',
          gloss: {
            UiLang.tr: 'Bana yardım edebilir misiniz?',
            UiLang.en: 'Can you help me?',
          },
        ),
      ],
      turns: [
        SpeakTurn(prompt: 'The agent asks.', expected: 'Ik zoek een woning.'),
        SpeakTurn(prompt: 'They show a listing.', expected: 'Wat is de huur?'),
      ],
    ),
    Scenario(
      id: 'ar_cafe',
      lang: LearnLang.ar,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Kafede sipariş', UiLang.en: 'Ordering at a café'},
      clipLine: 'قهوة، من فضلك.',
      phrases: [
        Phrase(
          id: 'ar_cafe_0',
          target: 'قهوة، من فضلك.',
          gloss: {
            UiLang.tr: 'Bir kahve, lütfen.',
            UiLang.en: 'A coffee, please.',
          },
        ),
        Phrase(
          id: 'ar_cafe_1',
          target: 'كم الحساب؟',
          gloss: {UiLang.tr: 'Ne kadar?', UiLang.en: 'How much is that?'},
        ),
        Phrase(
          id: 'ar_cafe_2',
          target: 'شكرا جزيلا.',
          gloss: {
            UiLang.tr: 'Çok teşekkür ederim.',
            UiLang.en: 'Thank you very much.',
          },
        ),
      ],
      turns: [
        SpeakTurn(prompt: 'What can I get you?', expected: 'قهوة، من فضلك.'),
        SpeakTurn(prompt: 'How much?', expected: 'كم الحساب؟'),
      ],
    ),
    Scenario(
      id: 'ar_hotel',
      lang: LearnLang.ar,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Otele giriş', UiLang.en: 'Hotel check-in'},
      clipLine: 'عندي حجز.',
      phrases: [
        Phrase(
          id: 'ar_hotel_0',
          target: 'عندي حجز.',
          gloss: {
            UiLang.tr: 'Rezervasyonum var.',
            UiLang.en: 'I have a reservation.',
          },
        ),
        Phrase(
          id: 'ar_hotel_1',
          target: 'هل الفطور مشمول؟',
          gloss: {
            UiLang.tr: 'Kahvaltı dahil mi?',
            UiLang.en: 'Is breakfast included?',
          },
        ),
        Phrase(
          id: 'ar_hotel_2',
          target: 'شكرا جزيلا.',
          gloss: {
            UiLang.tr: 'Çok teşekkür ederim.',
            UiLang.en: 'Thank you very much.',
          },
        ),
      ],
      turns: [
        SpeakTurn(prompt: 'Good evening.', expected: 'عندي حجز.'),
        SpeakTurn(prompt: 'Any questions?', expected: 'هل الفطور مشمول؟'),
      ],
    ),
    Scenario(
      id: 'ar_dir',
      lang: LearnLang.ar,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Yol sormak', UiLang.en: 'Asking the way'},
      clipLine: 'عفوا، أين المحطة؟',
      phrases: [
        Phrase(
          id: 'ar_dir_0',
          target: 'عفوا، أين المحطة؟',
          gloss: {
            UiLang.tr: 'Afedersiniz, istasyon nerede?',
            UiLang.en: 'Excuse me, where is the station?',
          },
        ),
        Phrase(
          id: 'ar_dir_1',
          target: 'شكرا جزيلا.',
          gloss: {
            UiLang.tr: 'Çok teşekkür ederim.',
            UiLang.en: 'Thank you very much.',
          },
        ),
        Phrase(
          id: 'ar_dir_2',
          target: 'لا أفهم.',
          gloss: {UiLang.tr: 'Anlamıyorum.', UiLang.en: 'I do not understand.'},
        ),
      ],
      turns: [
        SpeakTurn(prompt: 'You stop someone.', expected: 'عفوا، أين المحطة؟'),
        SpeakTurn(prompt: 'They point.', expected: 'شكرا جزيلا.'),
      ],
    ),
    Scenario(
      id: 'ar_hi',
      lang: LearnLang.ar,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Tanışmak', UiLang.en: 'Introducing yourself'},
      clipLine: 'مرحبا، اسمي دنيز.',
      phrases: [
        Phrase(
          id: 'ar_hi_0',
          target: 'مرحبا، اسمي دنيز.',
          gloss: {
            UiLang.tr: 'Merhaba, adım Deniz.',
            UiLang.en: 'Hi, my name is Deniz.',
          },
        ),
        Phrase(
          id: 'ar_hi_1',
          target: 'أنا من تركيا.',
          gloss: {UiLang.tr: 'Türkiye\'denim.', UiLang.en: 'I am from Turkey.'},
        ),
        Phrase(
          id: 'ar_hi_2',
          target: 'شكرا جزيلا.',
          gloss: {
            UiLang.tr: 'Çok teşekkür ederim.',
            UiLang.en: 'Thank you very much.',
          },
        ),
      ],
      turns: [
        SpeakTurn(prompt: 'Someone says hello.', expected: 'مرحبا، اسمي دنيز.'),
        SpeakTurn(prompt: 'Where are you from?', expected: 'أنا من تركيا.'),
      ],
    ),
    Scenario(
      id: 'ar_flat',
      lang: LearnLang.ar,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Ev bakmak', UiLang.en: 'Viewing a flat'},
      clipLine: 'أبحث عن شقة.',
      phrases: [
        Phrase(
          id: 'ar_flat_0',
          target: 'أبحث عن شقة.',
          gloss: {
            UiLang.tr: 'Daire arıyorum.',
            UiLang.en: 'I am looking for a flat.',
          },
        ),
        Phrase(
          id: 'ar_flat_1',
          target: 'كم الإيجار؟',
          gloss: {
            UiLang.tr: 'Kira ne kadar?',
            UiLang.en: 'How much is the rent?',
          },
        ),
        Phrase(
          id: 'ar_flat_2',
          target: 'هل يمكنك مساعدتي؟',
          gloss: {
            UiLang.tr: 'Bana yardım edebilir misiniz?',
            UiLang.en: 'Can you help me?',
          },
        ),
      ],
      turns: [
        SpeakTurn(prompt: 'The agent asks.', expected: 'أبحث عن شقة.'),
        SpeakTurn(prompt: 'They show a listing.', expected: 'كم الإيجار؟'),
      ],
    ),
    Scenario(
      id: 'pt_cafe',
      lang: LearnLang.pt,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Kafede sipariş', UiLang.en: 'Ordering at a café'},
      clipLine: 'Um café, por favor.',
      phrases: [
        Phrase(
          id: 'pt_cafe_0',
          target: 'Um café, por favor.',
          gloss: {
            UiLang.tr: 'Bir kahve, lütfen.',
            UiLang.en: 'A coffee, please.',
          },
        ),
        Phrase(
          id: 'pt_cafe_1',
          target: 'Quanto custa?',
          gloss: {UiLang.tr: 'Ne kadar?', UiLang.en: 'How much is that?'},
        ),
        Phrase(
          id: 'pt_cafe_2',
          target: 'Muito obrigado.',
          gloss: {
            UiLang.tr: 'Çok teşekkür ederim.',
            UiLang.en: 'Thank you very much.',
          },
        ),
      ],
      turns: [
        SpeakTurn(
          prompt: 'What can I get you?',
          expected: 'Um café, por favor.',
        ),
        SpeakTurn(prompt: 'How much?', expected: 'Quanto custa?'),
      ],
    ),
    Scenario(
      id: 'pt_hotel',
      lang: LearnLang.pt,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Otele giriş', UiLang.en: 'Hotel check-in'},
      clipLine: 'Tenho uma reserva.',
      phrases: [
        Phrase(
          id: 'pt_hotel_0',
          target: 'Tenho uma reserva.',
          gloss: {
            UiLang.tr: 'Rezervasyonum var.',
            UiLang.en: 'I have a reservation.',
          },
        ),
        Phrase(
          id: 'pt_hotel_1',
          target: 'O pequeno-almoço está incluído?',
          gloss: {
            UiLang.tr: 'Kahvaltı dahil mi?',
            UiLang.en: 'Is breakfast included?',
          },
        ),
        Phrase(
          id: 'pt_hotel_2',
          target: 'Muito obrigado.',
          gloss: {
            UiLang.tr: 'Çok teşekkür ederim.',
            UiLang.en: 'Thank you very much.',
          },
        ),
      ],
      turns: [
        SpeakTurn(prompt: 'Good evening.', expected: 'Tenho uma reserva.'),
        SpeakTurn(
          prompt: 'Any questions?',
          expected: 'O pequeno-almoço está incluído?',
        ),
      ],
    ),
    Scenario(
      id: 'pt_dir',
      lang: LearnLang.pt,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Yol sormak', UiLang.en: 'Asking the way'},
      clipLine: 'Com licença, onde é a estação?',
      phrases: [
        Phrase(
          id: 'pt_dir_0',
          target: 'Com licença, onde é a estação?',
          gloss: {
            UiLang.tr: 'Afedersiniz, istasyon nerede?',
            UiLang.en: 'Excuse me, where is the station?',
          },
        ),
        Phrase(
          id: 'pt_dir_1',
          target: 'Muito obrigado.',
          gloss: {
            UiLang.tr: 'Çok teşekkür ederim.',
            UiLang.en: 'Thank you very much.',
          },
        ),
        Phrase(
          id: 'pt_dir_2',
          target: 'Não entendo.',
          gloss: {UiLang.tr: 'Anlamıyorum.', UiLang.en: 'I do not understand.'},
        ),
      ],
      turns: [
        SpeakTurn(
          prompt: 'You stop someone.',
          expected: 'Com licença, onde é a estação?',
        ),
        SpeakTurn(prompt: 'They point.', expected: 'Muito obrigado.'),
      ],
    ),
    Scenario(
      id: 'pt_hi',
      lang: LearnLang.pt,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Tanışmak', UiLang.en: 'Introducing yourself'},
      clipLine: 'Olá, meu nome é Deniz.',
      phrases: [
        Phrase(
          id: 'pt_hi_0',
          target: 'Olá, meu nome é Deniz.',
          gloss: {
            UiLang.tr: 'Merhaba, adım Deniz.',
            UiLang.en: 'Hi, my name is Deniz.',
          },
        ),
        Phrase(
          id: 'pt_hi_1',
          target: 'Eu sou da Turquia.',
          gloss: {UiLang.tr: 'Türkiye\'denim.', UiLang.en: 'I am from Turkey.'},
        ),
        Phrase(
          id: 'pt_hi_2',
          target: 'Muito obrigado.',
          gloss: {
            UiLang.tr: 'Çok teşekkür ederim.',
            UiLang.en: 'Thank you very much.',
          },
        ),
      ],
      turns: [
        SpeakTurn(
          prompt: 'Someone says hello.',
          expected: 'Olá, meu nome é Deniz.',
        ),
        SpeakTurn(
          prompt: 'Where are you from?',
          expected: 'Eu sou da Turquia.',
        ),
      ],
    ),
    Scenario(
      id: 'pt_flat',
      lang: LearnLang.pt,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Ev bakmak', UiLang.en: 'Viewing a flat'},
      clipLine: 'Estou à procura de um apartamento.',
      phrases: [
        Phrase(
          id: 'pt_flat_0',
          target: 'Estou à procura de um apartamento.',
          gloss: {
            UiLang.tr: 'Daire arıyorum.',
            UiLang.en: 'I am looking for a flat.',
          },
        ),
        Phrase(
          id: 'pt_flat_1',
          target: 'Quanto é a renda?',
          gloss: {
            UiLang.tr: 'Kira ne kadar?',
            UiLang.en: 'How much is the rent?',
          },
        ),
        Phrase(
          id: 'pt_flat_2',
          target: 'Pode ajudar-me?',
          gloss: {
            UiLang.tr: 'Bana yardım edebilir misiniz?',
            UiLang.en: 'Can you help me?',
          },
        ),
      ],
      turns: [
        SpeakTurn(
          prompt: 'The agent asks.',
          expected: 'Estou à procura de um apartamento.',
        ),
        SpeakTurn(
          prompt: 'They show a listing.',
          expected: 'Quanto é a renda?',
        ),
      ],
    ),
    Scenario(
      id: 'it_cafe',
      lang: LearnLang.it,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Kafede sipariş', UiLang.en: 'Ordering at a café'},
      clipLine: 'Un caffè, per favore.',
      phrases: [
        Phrase(
          id: 'it_cafe_0',
          target: 'Un caffè, per favore.',
          gloss: {
            UiLang.tr: 'Bir kahve, lütfen.',
            UiLang.en: 'A coffee, please.',
          },
        ),
        Phrase(
          id: 'it_cafe_1',
          target: 'Quanto costa?',
          gloss: {UiLang.tr: 'Ne kadar?', UiLang.en: 'How much is that?'},
        ),
        Phrase(
          id: 'it_cafe_2',
          target: 'Grazie mille.',
          gloss: {
            UiLang.tr: 'Çok teşekkür ederim.',
            UiLang.en: 'Thank you very much.',
          },
        ),
      ],
      turns: [
        SpeakTurn(
          prompt: 'What can I get you?',
          expected: 'Un caffè, per favore.',
        ),
        SpeakTurn(prompt: 'How much?', expected: 'Quanto costa?'),
      ],
    ),
    Scenario(
      id: 'it_hotel',
      lang: LearnLang.it,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Otele giriş', UiLang.en: 'Hotel check-in'},
      clipLine: 'Ho una prenotazione.',
      phrases: [
        Phrase(
          id: 'it_hotel_0',
          target: 'Ho una prenotazione.',
          gloss: {
            UiLang.tr: 'Rezervasyonum var.',
            UiLang.en: 'I have a reservation.',
          },
        ),
        Phrase(
          id: 'it_hotel_1',
          target: 'La colazione è inclusa?',
          gloss: {
            UiLang.tr: 'Kahvaltı dahil mi?',
            UiLang.en: 'Is breakfast included?',
          },
        ),
        Phrase(
          id: 'it_hotel_2',
          target: 'Grazie mille.',
          gloss: {
            UiLang.tr: 'Çok teşekkür ederim.',
            UiLang.en: 'Thank you very much.',
          },
        ),
      ],
      turns: [
        SpeakTurn(prompt: 'Good evening.', expected: 'Ho una prenotazione.'),
        SpeakTurn(
          prompt: 'Any questions?',
          expected: 'La colazione è inclusa?',
        ),
      ],
    ),
    Scenario(
      id: 'it_dir',
      lang: LearnLang.it,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Yol sormak', UiLang.en: 'Asking the way'},
      clipLine: 'Scusi, dov\'è la stazione?',
      phrases: [
        Phrase(
          id: 'it_dir_0',
          target: 'Scusi, dov\'è la stazione?',
          gloss: {
            UiLang.tr: 'Afedersiniz, istasyon nerede?',
            UiLang.en: 'Excuse me, where is the station?',
          },
        ),
        Phrase(
          id: 'it_dir_1',
          target: 'Grazie mille.',
          gloss: {
            UiLang.tr: 'Çok teşekkür ederim.',
            UiLang.en: 'Thank you very much.',
          },
        ),
        Phrase(
          id: 'it_dir_2',
          target: 'Non capisco.',
          gloss: {UiLang.tr: 'Anlamıyorum.', UiLang.en: 'I do not understand.'},
        ),
      ],
      turns: [
        SpeakTurn(
          prompt: 'You stop someone.',
          expected: 'Scusi, dov\'è la stazione?',
        ),
        SpeakTurn(prompt: 'They point.', expected: 'Grazie mille.'),
      ],
    ),
    Scenario(
      id: 'it_hi',
      lang: LearnLang.it,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Tanışmak', UiLang.en: 'Introducing yourself'},
      clipLine: 'Ciao, mi chiamo Deniz.',
      phrases: [
        Phrase(
          id: 'it_hi_0',
          target: 'Ciao, mi chiamo Deniz.',
          gloss: {
            UiLang.tr: 'Merhaba, adım Deniz.',
            UiLang.en: 'Hi, my name is Deniz.',
          },
        ),
        Phrase(
          id: 'it_hi_1',
          target: 'Sono dalla Turchia.',
          gloss: {UiLang.tr: 'Türkiye\'denim.', UiLang.en: 'I am from Turkey.'},
        ),
        Phrase(
          id: 'it_hi_2',
          target: 'Grazie mille.',
          gloss: {
            UiLang.tr: 'Çok teşekkür ederim.',
            UiLang.en: 'Thank you very much.',
          },
        ),
      ],
      turns: [
        SpeakTurn(
          prompt: 'Someone says hello.',
          expected: 'Ciao, mi chiamo Deniz.',
        ),
        SpeakTurn(
          prompt: 'Where are you from?',
          expected: 'Sono dalla Turchia.',
        ),
      ],
    ),
    Scenario(
      id: 'it_flat',
      lang: LearnLang.it,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Ev bakmak', UiLang.en: 'Viewing a flat'},
      clipLine: 'Cerco un appartamento.',
      phrases: [
        Phrase(
          id: 'it_flat_0',
          target: 'Cerco un appartamento.',
          gloss: {
            UiLang.tr: 'Daire arıyorum.',
            UiLang.en: 'I am looking for a flat.',
          },
        ),
        Phrase(
          id: 'it_flat_1',
          target: 'Quanto è l\'affitto?',
          gloss: {
            UiLang.tr: 'Kira ne kadar?',
            UiLang.en: 'How much is the rent?',
          },
        ),
        Phrase(
          id: 'it_flat_2',
          target: 'Può aiutarmi?',
          gloss: {
            UiLang.tr: 'Bana yardım edebilir misiniz?',
            UiLang.en: 'Can you help me?',
          },
        ),
      ],
      turns: [
        SpeakTurn(
          prompt: 'The agent asks.',
          expected: 'Cerco un appartamento.',
        ),
        SpeakTurn(
          prompt: 'They show a listing.',
          expected: 'Quanto è l\'affitto?',
        ),
      ],
    ),
    Scenario(
      id: 'ru_cafe',
      lang: LearnLang.ru,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Kafede sipariş', UiLang.en: 'Ordering at a café'},
      clipLine: 'Кофе, пожалуйста.',
      phrases: [
        Phrase(
          id: 'ru_cafe_0',
          target: 'Кофе, пожалуйста.',
          gloss: {
            UiLang.tr: 'Bir kahve, lütfen.',
            UiLang.en: 'A coffee, please.',
          },
        ),
        Phrase(
          id: 'ru_cafe_1',
          target: 'Сколько это стоит?',
          gloss: {UiLang.tr: 'Ne kadar?', UiLang.en: 'How much is that?'},
        ),
        Phrase(
          id: 'ru_cafe_2',
          target: 'Большое спасибо.',
          gloss: {
            UiLang.tr: 'Çok teşekkür ederim.',
            UiLang.en: 'Thank you very much.',
          },
        ),
      ],
      turns: [
        SpeakTurn(prompt: 'What can I get you?', expected: 'Кофе, пожалуйста.'),
        SpeakTurn(prompt: 'How much?', expected: 'Сколько это стоит?'),
      ],
    ),
    Scenario(
      id: 'ru_hotel',
      lang: LearnLang.ru,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Otele giriş', UiLang.en: 'Hotel check-in'},
      clipLine: 'У меня есть бронь.',
      phrases: [
        Phrase(
          id: 'ru_hotel_0',
          target: 'У меня есть бронь.',
          gloss: {
            UiLang.tr: 'Rezervasyonum var.',
            UiLang.en: 'I have a reservation.',
          },
        ),
        Phrase(
          id: 'ru_hotel_1',
          target: 'Завтрак включён?',
          gloss: {
            UiLang.tr: 'Kahvaltı dahil mi?',
            UiLang.en: 'Is breakfast included?',
          },
        ),
        Phrase(
          id: 'ru_hotel_2',
          target: 'Большое спасибо.',
          gloss: {
            UiLang.tr: 'Çok teşekkür ederim.',
            UiLang.en: 'Thank you very much.',
          },
        ),
      ],
      turns: [
        SpeakTurn(prompt: 'Good evening.', expected: 'У меня есть бронь.'),
        SpeakTurn(prompt: 'Any questions?', expected: 'Завтрак включён?'),
      ],
    ),
    Scenario(
      id: 'ru_dir',
      lang: LearnLang.ru,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Yol sormak', UiLang.en: 'Asking the way'},
      clipLine: 'Извините, где станция?',
      phrases: [
        Phrase(
          id: 'ru_dir_0',
          target: 'Извините, где станция?',
          gloss: {
            UiLang.tr: 'Afedersiniz, istasyon nerede?',
            UiLang.en: 'Excuse me, where is the station?',
          },
        ),
        Phrase(
          id: 'ru_dir_1',
          target: 'Большое спасибо.',
          gloss: {
            UiLang.tr: 'Çok teşekkür ederim.',
            UiLang.en: 'Thank you very much.',
          },
        ),
        Phrase(
          id: 'ru_dir_2',
          target: 'Я не понимаю.',
          gloss: {UiLang.tr: 'Anlamıyorum.', UiLang.en: 'I do not understand.'},
        ),
      ],
      turns: [
        SpeakTurn(
          prompt: 'You stop someone.',
          expected: 'Извините, где станция?',
        ),
        SpeakTurn(prompt: 'They point.', expected: 'Большое спасибо.'),
      ],
    ),
    Scenario(
      id: 'ru_hi',
      lang: LearnLang.ru,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Tanışmak', UiLang.en: 'Introducing yourself'},
      clipLine: 'Привет, меня зовут Дениз.',
      phrases: [
        Phrase(
          id: 'ru_hi_0',
          target: 'Привет, меня зовут Дениз.',
          gloss: {
            UiLang.tr: 'Merhaba, adım Deniz.',
            UiLang.en: 'Hi, my name is Deniz.',
          },
        ),
        Phrase(
          id: 'ru_hi_1',
          target: 'Я из Турции.',
          gloss: {UiLang.tr: 'Türkiye\'denim.', UiLang.en: 'I am from Turkey.'},
        ),
        Phrase(
          id: 'ru_hi_2',
          target: 'Большое спасибо.',
          gloss: {
            UiLang.tr: 'Çok teşekkür ederim.',
            UiLang.en: 'Thank you very much.',
          },
        ),
      ],
      turns: [
        SpeakTurn(
          prompt: 'Someone says hello.',
          expected: 'Привет, меня зовут Дениз.',
        ),
        SpeakTurn(prompt: 'Where are you from?', expected: 'Я из Турции.'),
      ],
    ),
    Scenario(
      id: 'ru_flat',
      lang: LearnLang.ru,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Ev bakmak', UiLang.en: 'Viewing a flat'},
      clipLine: 'Я ищу квартиру.',
      phrases: [
        Phrase(
          id: 'ru_flat_0',
          target: 'Я ищу квартиру.',
          gloss: {
            UiLang.tr: 'Daire arıyorum.',
            UiLang.en: 'I am looking for a flat.',
          },
        ),
        Phrase(
          id: 'ru_flat_1',
          target: 'Сколько стоит аренда?',
          gloss: {
            UiLang.tr: 'Kira ne kadar?',
            UiLang.en: 'How much is the rent?',
          },
        ),
        Phrase(
          id: 'ru_flat_2',
          target: 'Вы можете мне помочь?',
          gloss: {
            UiLang.tr: 'Bana yardım edebilir misiniz?',
            UiLang.en: 'Can you help me?',
          },
        ),
      ],
      turns: [
        SpeakTurn(prompt: 'The agent asks.', expected: 'Я ищу квартиру.'),
        SpeakTurn(
          prompt: 'They show a listing.',
          expected: 'Сколько стоит аренда?',
        ),
      ],
    ),
    Scenario(
      id: 'zh_cafe',
      lang: LearnLang.zh,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Kafede sipariş', UiLang.en: 'Ordering at a café'},
      clipLine: '请给我一杯咖啡。',
      phrases: [
        Phrase(
          id: 'zh_cafe_0',
          target: '请给我一杯咖啡。',
          gloss: {
            UiLang.tr: 'Bir kahve, lütfen.',
            UiLang.en: 'A coffee, please.',
          },
        ),
        Phrase(
          id: 'zh_cafe_1',
          target: '多少钱？',
          gloss: {UiLang.tr: 'Ne kadar?', UiLang.en: 'How much is that?'},
        ),
        Phrase(
          id: 'zh_cafe_2',
          target: '非常感谢。',
          gloss: {
            UiLang.tr: 'Çok teşekkür ederim.',
            UiLang.en: 'Thank you very much.',
          },
        ),
      ],
      turns: [
        SpeakTurn(prompt: 'What can I get you?', expected: '请给我一杯咖啡。'),
        SpeakTurn(prompt: 'How much?', expected: '多少钱？'),
      ],
    ),
    Scenario(
      id: 'zh_hotel',
      lang: LearnLang.zh,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Otele giriş', UiLang.en: 'Hotel check-in'},
      clipLine: '我有预订。',
      phrases: [
        Phrase(
          id: 'zh_hotel_0',
          target: '我有预订。',
          gloss: {
            UiLang.tr: 'Rezervasyonum var.',
            UiLang.en: 'I have a reservation.',
          },
        ),
        Phrase(
          id: 'zh_hotel_1',
          target: '包含早餐吗？',
          gloss: {
            UiLang.tr: 'Kahvaltı dahil mi?',
            UiLang.en: 'Is breakfast included?',
          },
        ),
        Phrase(
          id: 'zh_hotel_2',
          target: '非常感谢。',
          gloss: {
            UiLang.tr: 'Çok teşekkür ederim.',
            UiLang.en: 'Thank you very much.',
          },
        ),
      ],
      turns: [
        SpeakTurn(prompt: 'Good evening.', expected: '我有预订。'),
        SpeakTurn(prompt: 'Any questions?', expected: '包含早餐吗？'),
      ],
    ),
    Scenario(
      id: 'zh_dir',
      lang: LearnLang.zh,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Yol sormak', UiLang.en: 'Asking the way'},
      clipLine: '请问，车站在哪里？',
      phrases: [
        Phrase(
          id: 'zh_dir_0',
          target: '请问，车站在哪里？',
          gloss: {
            UiLang.tr: 'Afedersiniz, istasyon nerede?',
            UiLang.en: 'Excuse me, where is the station?',
          },
        ),
        Phrase(
          id: 'zh_dir_1',
          target: '非常感谢。',
          gloss: {
            UiLang.tr: 'Çok teşekkür ederim.',
            UiLang.en: 'Thank you very much.',
          },
        ),
        Phrase(
          id: 'zh_dir_2',
          target: '我不明白。',
          gloss: {UiLang.tr: 'Anlamıyorum.', UiLang.en: 'I do not understand.'},
        ),
      ],
      turns: [
        SpeakTurn(prompt: 'You stop someone.', expected: '请问，车站在哪里？'),
        SpeakTurn(prompt: 'They point.', expected: '非常感谢。'),
      ],
    ),
    Scenario(
      id: 'zh_hi',
      lang: LearnLang.zh,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Tanışmak', UiLang.en: 'Introducing yourself'},
      clipLine: '你好，我叫德尼兹。',
      phrases: [
        Phrase(
          id: 'zh_hi_0',
          target: '你好，我叫德尼兹。',
          gloss: {
            UiLang.tr: 'Merhaba, adım Deniz.',
            UiLang.en: 'Hi, my name is Deniz.',
          },
        ),
        Phrase(
          id: 'zh_hi_1',
          target: '我来自土耳其。',
          gloss: {UiLang.tr: 'Türkiye\'denim.', UiLang.en: 'I am from Turkey.'},
        ),
        Phrase(
          id: 'zh_hi_2',
          target: '非常感谢。',
          gloss: {
            UiLang.tr: 'Çok teşekkür ederim.',
            UiLang.en: 'Thank you very much.',
          },
        ),
      ],
      turns: [
        SpeakTurn(prompt: 'Someone says hello.', expected: '你好，我叫德尼兹。'),
        SpeakTurn(prompt: 'Where are you from?', expected: '我来自土耳其。'),
      ],
    ),
    Scenario(
      id: 'zh_flat',
      lang: LearnLang.zh,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Ev bakmak', UiLang.en: 'Viewing a flat'},
      clipLine: '我在找公寓。',
      phrases: [
        Phrase(
          id: 'zh_flat_0',
          target: '我在找公寓。',
          gloss: {
            UiLang.tr: 'Daire arıyorum.',
            UiLang.en: 'I am looking for a flat.',
          },
        ),
        Phrase(
          id: 'zh_flat_1',
          target: '房租多少？',
          gloss: {
            UiLang.tr: 'Kira ne kadar?',
            UiLang.en: 'How much is the rent?',
          },
        ),
        Phrase(
          id: 'zh_flat_2',
          target: '你能帮我吗？',
          gloss: {
            UiLang.tr: 'Bana yardım edebilir misiniz?',
            UiLang.en: 'Can you help me?',
          },
        ),
      ],
      turns: [
        SpeakTurn(prompt: 'The agent asks.', expected: '我在找公寓。'),
        SpeakTurn(prompt: 'They show a listing.', expected: '房租多少？'),
      ],
    ),
    Scenario(
      id: 'ja_cafe',
      lang: LearnLang.ja,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Kafede sipariş', UiLang.en: 'Ordering at a café'},
      clipLine: 'コーヒーをお願いします。',
      phrases: [
        Phrase(
          id: 'ja_cafe_0',
          target: 'コーヒーをお願いします。',
          gloss: {
            UiLang.tr: 'Bir kahve, lütfen.',
            UiLang.en: 'A coffee, please.',
          },
        ),
        Phrase(
          id: 'ja_cafe_1',
          target: 'いくらですか？',
          gloss: {UiLang.tr: 'Ne kadar?', UiLang.en: 'How much is that?'},
        ),
        Phrase(
          id: 'ja_cafe_2',
          target: 'ありがとうございます。',
          gloss: {
            UiLang.tr: 'Çok teşekkür ederim.',
            UiLang.en: 'Thank you very much.',
          },
        ),
      ],
      turns: [
        SpeakTurn(prompt: 'What can I get you?', expected: 'コーヒーをお願いします。'),
        SpeakTurn(prompt: 'How much?', expected: 'いくらですか？'),
      ],
    ),
    Scenario(
      id: 'ja_hotel',
      lang: LearnLang.ja,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Otele giriş', UiLang.en: 'Hotel check-in'},
      clipLine: '予約があります。',
      phrases: [
        Phrase(
          id: 'ja_hotel_0',
          target: '予約があります。',
          gloss: {
            UiLang.tr: 'Rezervasyonum var.',
            UiLang.en: 'I have a reservation.',
          },
        ),
        Phrase(
          id: 'ja_hotel_1',
          target: '朝食は含まれていますか？',
          gloss: {
            UiLang.tr: 'Kahvaltı dahil mi?',
            UiLang.en: 'Is breakfast included?',
          },
        ),
        Phrase(
          id: 'ja_hotel_2',
          target: 'ありがとうございます。',
          gloss: {
            UiLang.tr: 'Çok teşekkür ederim.',
            UiLang.en: 'Thank you very much.',
          },
        ),
      ],
      turns: [
        SpeakTurn(prompt: 'Good evening.', expected: '予約があります。'),
        SpeakTurn(prompt: 'Any questions?', expected: '朝食は含まれていますか？'),
      ],
    ),
    Scenario(
      id: 'ja_dir',
      lang: LearnLang.ja,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Yol sormak', UiLang.en: 'Asking the way'},
      clipLine: 'すみません、駅はどこですか？',
      phrases: [
        Phrase(
          id: 'ja_dir_0',
          target: 'すみません、駅はどこですか？',
          gloss: {
            UiLang.tr: 'Afedersiniz, istasyon nerede?',
            UiLang.en: 'Excuse me, where is the station?',
          },
        ),
        Phrase(
          id: 'ja_dir_1',
          target: 'ありがとうございます。',
          gloss: {
            UiLang.tr: 'Çok teşekkür ederim.',
            UiLang.en: 'Thank you very much.',
          },
        ),
        Phrase(
          id: 'ja_dir_2',
          target: '分かりません。',
          gloss: {UiLang.tr: 'Anlamıyorum.', UiLang.en: 'I do not understand.'},
        ),
      ],
      turns: [
        SpeakTurn(prompt: 'You stop someone.', expected: 'すみません、駅はどこですか？'),
        SpeakTurn(prompt: 'They point.', expected: 'ありがとうございます。'),
      ],
    ),
    Scenario(
      id: 'ja_hi',
      lang: LearnLang.ja,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Tanışmak', UiLang.en: 'Introducing yourself'},
      clipLine: 'こんにちは、デニズです。',
      phrases: [
        Phrase(
          id: 'ja_hi_0',
          target: 'こんにちは、デニズです。',
          gloss: {
            UiLang.tr: 'Merhaba, adım Deniz.',
            UiLang.en: 'Hi, my name is Deniz.',
          },
        ),
        Phrase(
          id: 'ja_hi_1',
          target: 'トルコから来ました。',
          gloss: {UiLang.tr: 'Türkiye\'denim.', UiLang.en: 'I am from Turkey.'},
        ),
        Phrase(
          id: 'ja_hi_2',
          target: 'ありがとうございます。',
          gloss: {
            UiLang.tr: 'Çok teşekkür ederim.',
            UiLang.en: 'Thank you very much.',
          },
        ),
      ],
      turns: [
        SpeakTurn(prompt: 'Someone says hello.', expected: 'こんにちは、デニズです。'),
        SpeakTurn(prompt: 'Where are you from?', expected: 'トルコから来ました。'),
      ],
    ),
    Scenario(
      id: 'ja_flat',
      lang: LearnLang.ja,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Ev bakmak', UiLang.en: 'Viewing a flat'},
      clipLine: 'アパートを探しています。',
      phrases: [
        Phrase(
          id: 'ja_flat_0',
          target: 'アパートを探しています。',
          gloss: {
            UiLang.tr: 'Daire arıyorum.',
            UiLang.en: 'I am looking for a flat.',
          },
        ),
        Phrase(
          id: 'ja_flat_1',
          target: '家賃はいくらですか？',
          gloss: {
            UiLang.tr: 'Kira ne kadar?',
            UiLang.en: 'How much is the rent?',
          },
        ),
        Phrase(
          id: 'ja_flat_2',
          target: '助けていただけますか？',
          gloss: {
            UiLang.tr: 'Bana yardım edebilir misiniz?',
            UiLang.en: 'Can you help me?',
          },
        ),
      ],
      turns: [
        SpeakTurn(prompt: 'The agent asks.', expected: 'アパートを探しています。'),
        SpeakTurn(prompt: 'They show a listing.', expected: '家賃はいくらですか？'),
      ],
    ),
    Scenario(
      id: 'ko_cafe',
      lang: LearnLang.ko,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Kafede sipariş', UiLang.en: 'Ordering at a café'},
      clipLine: '커피 한 잔 주세요.',
      phrases: [
        Phrase(
          id: 'ko_cafe_0',
          target: '커피 한 잔 주세요.',
          gloss: {
            UiLang.tr: 'Bir kahve, lütfen.',
            UiLang.en: 'A coffee, please.',
          },
        ),
        Phrase(
          id: 'ko_cafe_1',
          target: '얼마예요?',
          gloss: {UiLang.tr: 'Ne kadar?', UiLang.en: 'How much is that?'},
        ),
        Phrase(
          id: 'ko_cafe_2',
          target: '감사합니다.',
          gloss: {
            UiLang.tr: 'Çok teşekkür ederim.',
            UiLang.en: 'Thank you very much.',
          },
        ),
      ],
      turns: [
        SpeakTurn(prompt: 'What can I get you?', expected: '커피 한 잔 주세요.'),
        SpeakTurn(prompt: 'How much?', expected: '얼마예요?'),
      ],
    ),
    Scenario(
      id: 'ko_hotel',
      lang: LearnLang.ko,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Otele giriş', UiLang.en: 'Hotel check-in'},
      clipLine: '예약이 있습니다.',
      phrases: [
        Phrase(
          id: 'ko_hotel_0',
          target: '예약이 있습니다.',
          gloss: {
            UiLang.tr: 'Rezervasyonum var.',
            UiLang.en: 'I have a reservation.',
          },
        ),
        Phrase(
          id: 'ko_hotel_1',
          target: '아침 식사 포함인가요?',
          gloss: {
            UiLang.tr: 'Kahvaltı dahil mi?',
            UiLang.en: 'Is breakfast included?',
          },
        ),
        Phrase(
          id: 'ko_hotel_2',
          target: '감사합니다.',
          gloss: {
            UiLang.tr: 'Çok teşekkür ederim.',
            UiLang.en: 'Thank you very much.',
          },
        ),
      ],
      turns: [
        SpeakTurn(prompt: 'Good evening.', expected: '예약이 있습니다.'),
        SpeakTurn(prompt: 'Any questions?', expected: '아침 식사 포함인가요?'),
      ],
    ),
    Scenario(
      id: 'ko_dir',
      lang: LearnLang.ko,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Yol sormak', UiLang.en: 'Asking the way'},
      clipLine: '실례합니다, 역이 어디인가요?',
      phrases: [
        Phrase(
          id: 'ko_dir_0',
          target: '실례합니다, 역이 어디인가요?',
          gloss: {
            UiLang.tr: 'Afedersiniz, istasyon nerede?',
            UiLang.en: 'Excuse me, where is the station?',
          },
        ),
        Phrase(
          id: 'ko_dir_1',
          target: '감사합니다.',
          gloss: {
            UiLang.tr: 'Çok teşekkür ederim.',
            UiLang.en: 'Thank you very much.',
          },
        ),
        Phrase(
          id: 'ko_dir_2',
          target: '이해하지 못합니다.',
          gloss: {UiLang.tr: 'Anlamıyorum.', UiLang.en: 'I do not understand.'},
        ),
      ],
      turns: [
        SpeakTurn(prompt: 'You stop someone.', expected: '실례합니다, 역이 어디인가요?'),
        SpeakTurn(prompt: 'They point.', expected: '감사합니다.'),
      ],
    ),
    Scenario(
      id: 'ko_hi',
      lang: LearnLang.ko,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Tanışmak', UiLang.en: 'Introducing yourself'},
      clipLine: '안녕하세요, 저는 데니즈입니다.',
      phrases: [
        Phrase(
          id: 'ko_hi_0',
          target: '안녕하세요, 저는 데니즈입니다.',
          gloss: {
            UiLang.tr: 'Merhaba, adım Deniz.',
            UiLang.en: 'Hi, my name is Deniz.',
          },
        ),
        Phrase(
          id: 'ko_hi_1',
          target: '터키에서 왔습니다.',
          gloss: {UiLang.tr: 'Türkiye\'denim.', UiLang.en: 'I am from Turkey.'},
        ),
        Phrase(
          id: 'ko_hi_2',
          target: '감사합니다.',
          gloss: {
            UiLang.tr: 'Çok teşekkür ederim.',
            UiLang.en: 'Thank you very much.',
          },
        ),
      ],
      turns: [
        SpeakTurn(prompt: 'Someone says hello.', expected: '안녕하세요, 저는 데니즈입니다.'),
        SpeakTurn(prompt: 'Where are you from?', expected: '터키에서 왔습니다.'),
      ],
    ),
    Scenario(
      id: 'ko_flat',
      lang: LearnLang.ko,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Ev bakmak', UiLang.en: 'Viewing a flat'},
      clipLine: '아파트를 찾고 있습니다.',
      phrases: [
        Phrase(
          id: 'ko_flat_0',
          target: '아파트를 찾고 있습니다.',
          gloss: {
            UiLang.tr: 'Daire arıyorum.',
            UiLang.en: 'I am looking for a flat.',
          },
        ),
        Phrase(
          id: 'ko_flat_1',
          target: '임대료가 얼마인가요?',
          gloss: {
            UiLang.tr: 'Kira ne kadar?',
            UiLang.en: 'How much is the rent?',
          },
        ),
        Phrase(
          id: 'ko_flat_2',
          target: '도와주실 수 있나요?',
          gloss: {
            UiLang.tr: 'Bana yardım edebilir misiniz?',
            UiLang.en: 'Can you help me?',
          },
        ),
      ],
      turns: [
        SpeakTurn(prompt: 'The agent asks.', expected: '아파트를 찾고 있습니다.'),
        SpeakTurn(prompt: 'They show a listing.', expected: '임대료가 얼마인가요?'),
      ],
    ),
    Scenario(
      id: 'tr_cafe',
      lang: LearnLang.tr,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Kafede sipariş', UiLang.en: 'Ordering at a café'},
      clipLine: 'Bir kahve, lütfen.',
      phrases: [
        Phrase(
          id: 'tr_cafe_0',
          target: 'Bir kahve, lütfen.',
          gloss: {
            UiLang.tr: 'Bir kahve, lütfen.',
            UiLang.en: 'A coffee, please.',
          },
        ),
        Phrase(
          id: 'tr_cafe_1',
          target: 'Ne kadar?',
          gloss: {UiLang.tr: 'Ne kadar?', UiLang.en: 'How much is that?'},
        ),
        Phrase(
          id: 'tr_cafe_2',
          target: 'Çok teşekkür ederim.',
          gloss: {
            UiLang.tr: 'Çok teşekkür ederim.',
            UiLang.en: 'Thank you very much.',
          },
        ),
      ],
      turns: [
        SpeakTurn(
          prompt: 'What can I get you?',
          expected: 'Bir kahve, lütfen.',
        ),
        SpeakTurn(prompt: 'How much?', expected: 'Ne kadar?'),
      ],
    ),
    Scenario(
      id: 'tr_hotel',
      lang: LearnLang.tr,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Otele giriş', UiLang.en: 'Hotel check-in'},
      clipLine: 'Rezervasyonum var.',
      phrases: [
        Phrase(
          id: 'tr_hotel_0',
          target: 'Rezervasyonum var.',
          gloss: {
            UiLang.tr: 'Rezervasyonum var.',
            UiLang.en: 'I have a reservation.',
          },
        ),
        Phrase(
          id: 'tr_hotel_1',
          target: 'Kahvaltı dahil mi?',
          gloss: {
            UiLang.tr: 'Kahvaltı dahil mi?',
            UiLang.en: 'Is breakfast included?',
          },
        ),
        Phrase(
          id: 'tr_hotel_2',
          target: 'Çok teşekkür ederim.',
          gloss: {
            UiLang.tr: 'Çok teşekkür ederim.',
            UiLang.en: 'Thank you very much.',
          },
        ),
      ],
      turns: [
        SpeakTurn(prompt: 'Good evening.', expected: 'Rezervasyonum var.'),
        SpeakTurn(prompt: 'Any questions?', expected: 'Kahvaltı dahil mi?'),
      ],
    ),
    Scenario(
      id: 'tr_dir',
      lang: LearnLang.tr,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Yol sormak', UiLang.en: 'Asking the way'},
      clipLine: 'Afedersiniz, istasyon nerede?',
      phrases: [
        Phrase(
          id: 'tr_dir_0',
          target: 'Afedersiniz, istasyon nerede?',
          gloss: {
            UiLang.tr: 'Afedersiniz, istasyon nerede?',
            UiLang.en: 'Excuse me, where is the station?',
          },
        ),
        Phrase(
          id: 'tr_dir_1',
          target: 'Çok teşekkür ederim.',
          gloss: {
            UiLang.tr: 'Çok teşekkür ederim.',
            UiLang.en: 'Thank you very much.',
          },
        ),
        Phrase(
          id: 'tr_dir_2',
          target: 'Anlamıyorum.',
          gloss: {UiLang.tr: 'Anlamıyorum.', UiLang.en: 'I do not understand.'},
        ),
      ],
      turns: [
        SpeakTurn(
          prompt: 'You stop someone.',
          expected: 'Afedersiniz, istasyon nerede?',
        ),
        SpeakTurn(prompt: 'They point.', expected: 'Çok teşekkür ederim.'),
      ],
    ),
    Scenario(
      id: 'tr_hi',
      lang: LearnLang.tr,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Tanışmak', UiLang.en: 'Introducing yourself'},
      clipLine: 'Merhaba, adım Deniz.',
      phrases: [
        Phrase(
          id: 'tr_hi_0',
          target: 'Merhaba, adım Deniz.',
          gloss: {
            UiLang.tr: 'Merhaba, adım Deniz.',
            UiLang.en: 'Hi, my name is Deniz.',
          },
        ),
        Phrase(
          id: 'tr_hi_1',
          target: 'Türkiye\'denim.',
          gloss: {UiLang.tr: 'Türkiye\'denim.', UiLang.en: 'I am from Turkey.'},
        ),
        Phrase(
          id: 'tr_hi_2',
          target: 'Çok teşekkür ederim.',
          gloss: {
            UiLang.tr: 'Çok teşekkür ederim.',
            UiLang.en: 'Thank you very much.',
          },
        ),
      ],
      turns: [
        SpeakTurn(
          prompt: 'Someone says hello.',
          expected: 'Merhaba, adım Deniz.',
        ),
        SpeakTurn(prompt: 'Where are you from?', expected: 'Türkiye\'denim.'),
      ],
    ),
    Scenario(
      id: 'tr_flat',
      lang: LearnLang.tr,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Ev bakmak', UiLang.en: 'Viewing a flat'},
      clipLine: 'Daire arıyorum.',
      phrases: [
        Phrase(
          id: 'tr_flat_0',
          target: 'Daire arıyorum.',
          gloss: {
            UiLang.tr: 'Daire arıyorum.',
            UiLang.en: 'I am looking for a flat.',
          },
        ),
        Phrase(
          id: 'tr_flat_1',
          target: 'Kira ne kadar?',
          gloss: {
            UiLang.tr: 'Kira ne kadar?',
            UiLang.en: 'How much is the rent?',
          },
        ),
        Phrase(
          id: 'tr_flat_2',
          target: 'Bana yardım edebilir misiniz?',
          gloss: {
            UiLang.tr: 'Bana yardım edebilir misiniz?',
            UiLang.en: 'Can you help me?',
          },
        ),
      ],
      turns: [
        SpeakTurn(prompt: 'The agent asks.', expected: 'Daire arıyorum.'),
        SpeakTurn(prompt: 'They show a listing.', expected: 'Kira ne kadar?'),
      ],
    ),
    Scenario(
      id: 'pl_cafe',
      lang: LearnLang.pl,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Kafede sipariş', UiLang.en: 'Ordering at a café'},
      clipLine: 'Poproszę kawę.',
      phrases: [
        Phrase(
          id: 'pl_cafe_0',
          target: 'Poproszę kawę.',
          gloss: {
            UiLang.tr: 'Bir kahve, lütfen.',
            UiLang.en: 'A coffee, please.',
          },
        ),
        Phrase(
          id: 'pl_cafe_1',
          target: 'Ile to kosztuje?',
          gloss: {UiLang.tr: 'Ne kadar?', UiLang.en: 'How much is that?'},
        ),
        Phrase(
          id: 'pl_cafe_2',
          target: 'Dziękuję bardzo.',
          gloss: {
            UiLang.tr: 'Çok teşekkür ederim.',
            UiLang.en: 'Thank you very much.',
          },
        ),
      ],
      turns: [
        SpeakTurn(prompt: 'What can I get you?', expected: 'Poproszę kawę.'),
        SpeakTurn(prompt: 'How much?', expected: 'Ile to kosztuje?'),
      ],
    ),
    Scenario(
      id: 'pl_hotel',
      lang: LearnLang.pl,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Otele giriş', UiLang.en: 'Hotel check-in'},
      clipLine: 'Mam rezerwację.',
      phrases: [
        Phrase(
          id: 'pl_hotel_0',
          target: 'Mam rezerwację.',
          gloss: {
            UiLang.tr: 'Rezervasyonum var.',
            UiLang.en: 'I have a reservation.',
          },
        ),
        Phrase(
          id: 'pl_hotel_1',
          target: 'Czy śniadanie jest wliczone?',
          gloss: {
            UiLang.tr: 'Kahvaltı dahil mi?',
            UiLang.en: 'Is breakfast included?',
          },
        ),
        Phrase(
          id: 'pl_hotel_2',
          target: 'Dziękuję bardzo.',
          gloss: {
            UiLang.tr: 'Çok teşekkür ederim.',
            UiLang.en: 'Thank you very much.',
          },
        ),
      ],
      turns: [
        SpeakTurn(prompt: 'Good evening.', expected: 'Mam rezerwację.'),
        SpeakTurn(
          prompt: 'Any questions?',
          expected: 'Czy śniadanie jest wliczone?',
        ),
      ],
    ),
    Scenario(
      id: 'pl_dir',
      lang: LearnLang.pl,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Yol sormak', UiLang.en: 'Asking the way'},
      clipLine: 'Przepraszam, gdzie jest stacja?',
      phrases: [
        Phrase(
          id: 'pl_dir_0',
          target: 'Przepraszam, gdzie jest stacja?',
          gloss: {
            UiLang.tr: 'Afedersiniz, istasyon nerede?',
            UiLang.en: 'Excuse me, where is the station?',
          },
        ),
        Phrase(
          id: 'pl_dir_1',
          target: 'Dziękuję bardzo.',
          gloss: {
            UiLang.tr: 'Çok teşekkür ederim.',
            UiLang.en: 'Thank you very much.',
          },
        ),
        Phrase(
          id: 'pl_dir_2',
          target: 'Nie rozumiem.',
          gloss: {UiLang.tr: 'Anlamıyorum.', UiLang.en: 'I do not understand.'},
        ),
      ],
      turns: [
        SpeakTurn(
          prompt: 'You stop someone.',
          expected: 'Przepraszam, gdzie jest stacja?',
        ),
        SpeakTurn(prompt: 'They point.', expected: 'Dziękuję bardzo.'),
      ],
    ),
    Scenario(
      id: 'pl_hi',
      lang: LearnLang.pl,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Tanışmak', UiLang.en: 'Introducing yourself'},
      clipLine: 'Cześć, mam na imię Deniz.',
      phrases: [
        Phrase(
          id: 'pl_hi_0',
          target: 'Cześć, mam na imię Deniz.',
          gloss: {
            UiLang.tr: 'Merhaba, adım Deniz.',
            UiLang.en: 'Hi, my name is Deniz.',
          },
        ),
        Phrase(
          id: 'pl_hi_1',
          target: 'Jestem z Turcji.',
          gloss: {UiLang.tr: 'Türkiye\'denim.', UiLang.en: 'I am from Turkey.'},
        ),
        Phrase(
          id: 'pl_hi_2',
          target: 'Dziękuję bardzo.',
          gloss: {
            UiLang.tr: 'Çok teşekkür ederim.',
            UiLang.en: 'Thank you very much.',
          },
        ),
      ],
      turns: [
        SpeakTurn(
          prompt: 'Someone says hello.',
          expected: 'Cześć, mam na imię Deniz.',
        ),
        SpeakTurn(prompt: 'Where are you from?', expected: 'Jestem z Turcji.'),
      ],
    ),
    Scenario(
      id: 'pl_flat',
      lang: LearnLang.pl,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Ev bakmak', UiLang.en: 'Viewing a flat'},
      clipLine: 'Szukam mieszkania.',
      phrases: [
        Phrase(
          id: 'pl_flat_0',
          target: 'Szukam mieszkania.',
          gloss: {
            UiLang.tr: 'Daire arıyorum.',
            UiLang.en: 'I am looking for a flat.',
          },
        ),
        Phrase(
          id: 'pl_flat_1',
          target: 'Ile wynosi czynsz?',
          gloss: {
            UiLang.tr: 'Kira ne kadar?',
            UiLang.en: 'How much is the rent?',
          },
        ),
        Phrase(
          id: 'pl_flat_2',
          target: 'Czy może mi pan pomóc?',
          gloss: {
            UiLang.tr: 'Bana yardım edebilir misiniz?',
            UiLang.en: 'Can you help me?',
          },
        ),
      ],
      turns: [
        SpeakTurn(prompt: 'The agent asks.', expected: 'Szukam mieszkania.'),
        SpeakTurn(
          prompt: 'They show a listing.',
          expected: 'Ile wynosi czynsz?',
        ),
      ],
    ),
    Scenario(
      id: 'sv_cafe',
      lang: LearnLang.sv,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Kafede sipariş', UiLang.en: 'Ordering at a café'},
      clipLine: 'En kaffe, tack.',
      phrases: [
        Phrase(
          id: 'sv_cafe_0',
          target: 'En kaffe, tack.',
          gloss: {
            UiLang.tr: 'Bir kahve, lütfen.',
            UiLang.en: 'A coffee, please.',
          },
        ),
        Phrase(
          id: 'sv_cafe_1',
          target: 'Hur mycket kostar det?',
          gloss: {UiLang.tr: 'Ne kadar?', UiLang.en: 'How much is that?'},
        ),
        Phrase(
          id: 'sv_cafe_2',
          target: 'Tack så mycket.',
          gloss: {
            UiLang.tr: 'Çok teşekkür ederim.',
            UiLang.en: 'Thank you very much.',
          },
        ),
      ],
      turns: [
        SpeakTurn(prompt: 'What can I get you?', expected: 'En kaffe, tack.'),
        SpeakTurn(prompt: 'How much?', expected: 'Hur mycket kostar det?'),
      ],
    ),
    Scenario(
      id: 'sv_hotel',
      lang: LearnLang.sv,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Otele giriş', UiLang.en: 'Hotel check-in'},
      clipLine: 'Jag har en reservation.',
      phrases: [
        Phrase(
          id: 'sv_hotel_0',
          target: 'Jag har en reservation.',
          gloss: {
            UiLang.tr: 'Rezervasyonum var.',
            UiLang.en: 'I have a reservation.',
          },
        ),
        Phrase(
          id: 'sv_hotel_1',
          target: 'Ingår frukost?',
          gloss: {
            UiLang.tr: 'Kahvaltı dahil mi?',
            UiLang.en: 'Is breakfast included?',
          },
        ),
        Phrase(
          id: 'sv_hotel_2',
          target: 'Tack så mycket.',
          gloss: {
            UiLang.tr: 'Çok teşekkür ederim.',
            UiLang.en: 'Thank you very much.',
          },
        ),
      ],
      turns: [
        SpeakTurn(prompt: 'Good evening.', expected: 'Jag har en reservation.'),
        SpeakTurn(prompt: 'Any questions?', expected: 'Ingår frukost?'),
      ],
    ),
    Scenario(
      id: 'sv_dir',
      lang: LearnLang.sv,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Yol sormak', UiLang.en: 'Asking the way'},
      clipLine: 'Ursäkta, var är stationen?',
      phrases: [
        Phrase(
          id: 'sv_dir_0',
          target: 'Ursäkta, var är stationen?',
          gloss: {
            UiLang.tr: 'Afedersiniz, istasyon nerede?',
            UiLang.en: 'Excuse me, where is the station?',
          },
        ),
        Phrase(
          id: 'sv_dir_1',
          target: 'Tack så mycket.',
          gloss: {
            UiLang.tr: 'Çok teşekkür ederim.',
            UiLang.en: 'Thank you very much.',
          },
        ),
        Phrase(
          id: 'sv_dir_2',
          target: 'Jag förstår inte.',
          gloss: {UiLang.tr: 'Anlamıyorum.', UiLang.en: 'I do not understand.'},
        ),
      ],
      turns: [
        SpeakTurn(
          prompt: 'You stop someone.',
          expected: 'Ursäkta, var är stationen?',
        ),
        SpeakTurn(prompt: 'They point.', expected: 'Tack så mycket.'),
      ],
    ),
    Scenario(
      id: 'sv_hi',
      lang: LearnLang.sv,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Tanışmak', UiLang.en: 'Introducing yourself'},
      clipLine: 'Hej, jag heter Deniz.',
      phrases: [
        Phrase(
          id: 'sv_hi_0',
          target: 'Hej, jag heter Deniz.',
          gloss: {
            UiLang.tr: 'Merhaba, adım Deniz.',
            UiLang.en: 'Hi, my name is Deniz.',
          },
        ),
        Phrase(
          id: 'sv_hi_1',
          target: 'Jag kommer från Turkiet.',
          gloss: {UiLang.tr: 'Türkiye\'denim.', UiLang.en: 'I am from Turkey.'},
        ),
        Phrase(
          id: 'sv_hi_2',
          target: 'Tack så mycket.',
          gloss: {
            UiLang.tr: 'Çok teşekkür ederim.',
            UiLang.en: 'Thank you very much.',
          },
        ),
      ],
      turns: [
        SpeakTurn(
          prompt: 'Someone says hello.',
          expected: 'Hej, jag heter Deniz.',
        ),
        SpeakTurn(
          prompt: 'Where are you from?',
          expected: 'Jag kommer från Turkiet.',
        ),
      ],
    ),
    Scenario(
      id: 'sv_flat',
      lang: LearnLang.sv,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Ev bakmak', UiLang.en: 'Viewing a flat'},
      clipLine: 'Jag letar efter en lägenhet.',
      phrases: [
        Phrase(
          id: 'sv_flat_0',
          target: 'Jag letar efter en lägenhet.',
          gloss: {
            UiLang.tr: 'Daire arıyorum.',
            UiLang.en: 'I am looking for a flat.',
          },
        ),
        Phrase(
          id: 'sv_flat_1',
          target: 'Hur mycket är hyran?',
          gloss: {
            UiLang.tr: 'Kira ne kadar?',
            UiLang.en: 'How much is the rent?',
          },
        ),
        Phrase(
          id: 'sv_flat_2',
          target: 'Kan du hjälpa mig?',
          gloss: {
            UiLang.tr: 'Bana yardım edebilir misiniz?',
            UiLang.en: 'Can you help me?',
          },
        ),
      ],
      turns: [
        SpeakTurn(
          prompt: 'The agent asks.',
          expected: 'Jag letar efter en lägenhet.',
        ),
        SpeakTurn(
          prompt: 'They show a listing.',
          expected: 'Hur mycket är hyran?',
        ),
      ],
    ),
    Scenario(
      id: 'da_cafe',
      lang: LearnLang.da,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Kafede sipariş', UiLang.en: 'Ordering at a café'},
      clipLine: 'En kaffe, tak.',
      phrases: [
        Phrase(
          id: 'da_cafe_0',
          target: 'En kaffe, tak.',
          gloss: {
            UiLang.tr: 'Bir kahve, lütfen.',
            UiLang.en: 'A coffee, please.',
          },
        ),
        Phrase(
          id: 'da_cafe_1',
          target: 'Hvor meget koster det?',
          gloss: {UiLang.tr: 'Ne kadar?', UiLang.en: 'How much is that?'},
        ),
        Phrase(
          id: 'da_cafe_2',
          target: 'Mange tak.',
          gloss: {
            UiLang.tr: 'Çok teşekkür ederim.',
            UiLang.en: 'Thank you very much.',
          },
        ),
      ],
      turns: [
        SpeakTurn(prompt: 'What can I get you?', expected: 'En kaffe, tak.'),
        SpeakTurn(prompt: 'How much?', expected: 'Hvor meget koster det?'),
      ],
    ),
    Scenario(
      id: 'da_hotel',
      lang: LearnLang.da,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Otele giriş', UiLang.en: 'Hotel check-in'},
      clipLine: 'Jeg har en reservation.',
      phrases: [
        Phrase(
          id: 'da_hotel_0',
          target: 'Jeg har en reservation.',
          gloss: {
            UiLang.tr: 'Rezervasyonum var.',
            UiLang.en: 'I have a reservation.',
          },
        ),
        Phrase(
          id: 'da_hotel_1',
          target: 'Er morgenmad inkluderet?',
          gloss: {
            UiLang.tr: 'Kahvaltı dahil mi?',
            UiLang.en: 'Is breakfast included?',
          },
        ),
        Phrase(
          id: 'da_hotel_2',
          target: 'Mange tak.',
          gloss: {
            UiLang.tr: 'Çok teşekkür ederim.',
            UiLang.en: 'Thank you very much.',
          },
        ),
      ],
      turns: [
        SpeakTurn(prompt: 'Good evening.', expected: 'Jeg har en reservation.'),
        SpeakTurn(
          prompt: 'Any questions?',
          expected: 'Er morgenmad inkluderet?',
        ),
      ],
    ),
    Scenario(
      id: 'da_dir',
      lang: LearnLang.da,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Yol sormak', UiLang.en: 'Asking the way'},
      clipLine: 'Undskyld, hvor er stationen?',
      phrases: [
        Phrase(
          id: 'da_dir_0',
          target: 'Undskyld, hvor er stationen?',
          gloss: {
            UiLang.tr: 'Afedersiniz, istasyon nerede?',
            UiLang.en: 'Excuse me, where is the station?',
          },
        ),
        Phrase(
          id: 'da_dir_1',
          target: 'Mange tak.',
          gloss: {
            UiLang.tr: 'Çok teşekkür ederim.',
            UiLang.en: 'Thank you very much.',
          },
        ),
        Phrase(
          id: 'da_dir_2',
          target: 'Jeg forstår ikke.',
          gloss: {UiLang.tr: 'Anlamıyorum.', UiLang.en: 'I do not understand.'},
        ),
      ],
      turns: [
        SpeakTurn(
          prompt: 'You stop someone.',
          expected: 'Undskyld, hvor er stationen?',
        ),
        SpeakTurn(prompt: 'They point.', expected: 'Mange tak.'),
      ],
    ),
    Scenario(
      id: 'da_hi',
      lang: LearnLang.da,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Tanışmak', UiLang.en: 'Introducing yourself'},
      clipLine: 'Hej, jeg hedder Deniz.',
      phrases: [
        Phrase(
          id: 'da_hi_0',
          target: 'Hej, jeg hedder Deniz.',
          gloss: {
            UiLang.tr: 'Merhaba, adım Deniz.',
            UiLang.en: 'Hi, my name is Deniz.',
          },
        ),
        Phrase(
          id: 'da_hi_1',
          target: 'Jeg kommer fra Tyrkiet.',
          gloss: {UiLang.tr: 'Türkiye\'denim.', UiLang.en: 'I am from Turkey.'},
        ),
        Phrase(
          id: 'da_hi_2',
          target: 'Mange tak.',
          gloss: {
            UiLang.tr: 'Çok teşekkür ederim.',
            UiLang.en: 'Thank you very much.',
          },
        ),
      ],
      turns: [
        SpeakTurn(
          prompt: 'Someone says hello.',
          expected: 'Hej, jeg hedder Deniz.',
        ),
        SpeakTurn(
          prompt: 'Where are you from?',
          expected: 'Jeg kommer fra Tyrkiet.',
        ),
      ],
    ),
    Scenario(
      id: 'da_flat',
      lang: LearnLang.da,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Ev bakmak', UiLang.en: 'Viewing a flat'},
      clipLine: 'Jeg leder efter en lejlighed.',
      phrases: [
        Phrase(
          id: 'da_flat_0',
          target: 'Jeg leder efter en lejlighed.',
          gloss: {
            UiLang.tr: 'Daire arıyorum.',
            UiLang.en: 'I am looking for a flat.',
          },
        ),
        Phrase(
          id: 'da_flat_1',
          target: 'Hvad koster huslejen?',
          gloss: {
            UiLang.tr: 'Kira ne kadar?',
            UiLang.en: 'How much is the rent?',
          },
        ),
        Phrase(
          id: 'da_flat_2',
          target: 'Kan du hjælpe mig?',
          gloss: {
            UiLang.tr: 'Bana yardım edebilir misiniz?',
            UiLang.en: 'Can you help me?',
          },
        ),
      ],
      turns: [
        SpeakTurn(
          prompt: 'The agent asks.',
          expected: 'Jeg leder efter en lejlighed.',
        ),
        SpeakTurn(
          prompt: 'They show a listing.',
          expected: 'Hvad koster huslejen?',
        ),
      ],
    ),
    Scenario(
      id: 'no_cafe',
      lang: LearnLang.no,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Kafede sipariş', UiLang.en: 'Ordering at a café'},
      clipLine: 'En kaffe, takk.',
      phrases: [
        Phrase(
          id: 'no_cafe_0',
          target: 'En kaffe, takk.',
          gloss: {
            UiLang.tr: 'Bir kahve, lütfen.',
            UiLang.en: 'A coffee, please.',
          },
        ),
        Phrase(
          id: 'no_cafe_1',
          target: 'Hvor mye koster det?',
          gloss: {UiLang.tr: 'Ne kadar?', UiLang.en: 'How much is that?'},
        ),
        Phrase(
          id: 'no_cafe_2',
          target: 'Tusen takk.',
          gloss: {
            UiLang.tr: 'Çok teşekkür ederim.',
            UiLang.en: 'Thank you very much.',
          },
        ),
      ],
      turns: [
        SpeakTurn(prompt: 'What can I get you?', expected: 'En kaffe, takk.'),
        SpeakTurn(prompt: 'How much?', expected: 'Hvor mye koster det?'),
      ],
    ),
    Scenario(
      id: 'no_hotel',
      lang: LearnLang.no,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Otele giriş', UiLang.en: 'Hotel check-in'},
      clipLine: 'Jeg har en reservasjon.',
      phrases: [
        Phrase(
          id: 'no_hotel_0',
          target: 'Jeg har en reservasjon.',
          gloss: {
            UiLang.tr: 'Rezervasyonum var.',
            UiLang.en: 'I have a reservation.',
          },
        ),
        Phrase(
          id: 'no_hotel_1',
          target: 'Er frokost inkludert?',
          gloss: {
            UiLang.tr: 'Kahvaltı dahil mi?',
            UiLang.en: 'Is breakfast included?',
          },
        ),
        Phrase(
          id: 'no_hotel_2',
          target: 'Tusen takk.',
          gloss: {
            UiLang.tr: 'Çok teşekkür ederim.',
            UiLang.en: 'Thank you very much.',
          },
        ),
      ],
      turns: [
        SpeakTurn(prompt: 'Good evening.', expected: 'Jeg har en reservasjon.'),
        SpeakTurn(prompt: 'Any questions?', expected: 'Er frokost inkludert?'),
      ],
    ),
    Scenario(
      id: 'no_dir',
      lang: LearnLang.no,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Yol sormak', UiLang.en: 'Asking the way'},
      clipLine: 'Unnskyld, hvor er stasjonen?',
      phrases: [
        Phrase(
          id: 'no_dir_0',
          target: 'Unnskyld, hvor er stasjonen?',
          gloss: {
            UiLang.tr: 'Afedersiniz, istasyon nerede?',
            UiLang.en: 'Excuse me, where is the station?',
          },
        ),
        Phrase(
          id: 'no_dir_1',
          target: 'Tusen takk.',
          gloss: {
            UiLang.tr: 'Çok teşekkür ederim.',
            UiLang.en: 'Thank you very much.',
          },
        ),
        Phrase(
          id: 'no_dir_2',
          target: 'Jeg forstår ikke.',
          gloss: {UiLang.tr: 'Anlamıyorum.', UiLang.en: 'I do not understand.'},
        ),
      ],
      turns: [
        SpeakTurn(
          prompt: 'You stop someone.',
          expected: 'Unnskyld, hvor er stasjonen?',
        ),
        SpeakTurn(prompt: 'They point.', expected: 'Tusen takk.'),
      ],
    ),
    Scenario(
      id: 'no_hi',
      lang: LearnLang.no,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Tanışmak', UiLang.en: 'Introducing yourself'},
      clipLine: 'Hei, jeg heter Deniz.',
      phrases: [
        Phrase(
          id: 'no_hi_0',
          target: 'Hei, jeg heter Deniz.',
          gloss: {
            UiLang.tr: 'Merhaba, adım Deniz.',
            UiLang.en: 'Hi, my name is Deniz.',
          },
        ),
        Phrase(
          id: 'no_hi_1',
          target: 'Jeg kommer fra Tyrkia.',
          gloss: {UiLang.tr: 'Türkiye\'denim.', UiLang.en: 'I am from Turkey.'},
        ),
        Phrase(
          id: 'no_hi_2',
          target: 'Tusen takk.',
          gloss: {
            UiLang.tr: 'Çok teşekkür ederim.',
            UiLang.en: 'Thank you very much.',
          },
        ),
      ],
      turns: [
        SpeakTurn(
          prompt: 'Someone says hello.',
          expected: 'Hei, jeg heter Deniz.',
        ),
        SpeakTurn(
          prompt: 'Where are you from?',
          expected: 'Jeg kommer fra Tyrkia.',
        ),
      ],
    ),
    Scenario(
      id: 'no_flat',
      lang: LearnLang.no,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Ev bakmak', UiLang.en: 'Viewing a flat'},
      clipLine: 'Jeg leter etter en leilighet.',
      phrases: [
        Phrase(
          id: 'no_flat_0',
          target: 'Jeg leter etter en leilighet.',
          gloss: {
            UiLang.tr: 'Daire arıyorum.',
            UiLang.en: 'I am looking for a flat.',
          },
        ),
        Phrase(
          id: 'no_flat_1',
          target: 'Hva koster leien?',
          gloss: {
            UiLang.tr: 'Kira ne kadar?',
            UiLang.en: 'How much is the rent?',
          },
        ),
        Phrase(
          id: 'no_flat_2',
          target: 'Kan du hjelpe meg?',
          gloss: {
            UiLang.tr: 'Bana yardım edebilir misiniz?',
            UiLang.en: 'Can you help me?',
          },
        ),
      ],
      turns: [
        SpeakTurn(
          prompt: 'The agent asks.',
          expected: 'Jeg leter etter en leilighet.',
        ),
        SpeakTurn(
          prompt: 'They show a listing.',
          expected: 'Hva koster leien?',
        ),
      ],
    ),
    Scenario(
      id: 'fi_cafe',
      lang: LearnLang.fi,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Kafede sipariş', UiLang.en: 'Ordering at a café'},
      clipLine: 'Kahvi, kiitos.',
      phrases: [
        Phrase(
          id: 'fi_cafe_0',
          target: 'Kahvi, kiitos.',
          gloss: {
            UiLang.tr: 'Bir kahve, lütfen.',
            UiLang.en: 'A coffee, please.',
          },
        ),
        Phrase(
          id: 'fi_cafe_1',
          target: 'Paljonko se maksaa?',
          gloss: {UiLang.tr: 'Ne kadar?', UiLang.en: 'How much is that?'},
        ),
        Phrase(
          id: 'fi_cafe_2',
          target: 'Kiitos paljon.',
          gloss: {
            UiLang.tr: 'Çok teşekkür ederim.',
            UiLang.en: 'Thank you very much.',
          },
        ),
      ],
      turns: [
        SpeakTurn(prompt: 'What can I get you?', expected: 'Kahvi, kiitos.'),
        SpeakTurn(prompt: 'How much?', expected: 'Paljonko se maksaa?'),
      ],
    ),
    Scenario(
      id: 'fi_hotel',
      lang: LearnLang.fi,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Otele giriş', UiLang.en: 'Hotel check-in'},
      clipLine: 'Minulla on varaus.',
      phrases: [
        Phrase(
          id: 'fi_hotel_0',
          target: 'Minulla on varaus.',
          gloss: {
            UiLang.tr: 'Rezervasyonum var.',
            UiLang.en: 'I have a reservation.',
          },
        ),
        Phrase(
          id: 'fi_hotel_1',
          target: 'Sisältyykö aamiainen?',
          gloss: {
            UiLang.tr: 'Kahvaltı dahil mi?',
            UiLang.en: 'Is breakfast included?',
          },
        ),
        Phrase(
          id: 'fi_hotel_2',
          target: 'Kiitos paljon.',
          gloss: {
            UiLang.tr: 'Çok teşekkür ederim.',
            UiLang.en: 'Thank you very much.',
          },
        ),
      ],
      turns: [
        SpeakTurn(prompt: 'Good evening.', expected: 'Minulla on varaus.'),
        SpeakTurn(prompt: 'Any questions?', expected: 'Sisältyykö aamiainen?'),
      ],
    ),
    Scenario(
      id: 'fi_dir',
      lang: LearnLang.fi,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Yol sormak', UiLang.en: 'Asking the way'},
      clipLine: 'Anteeksi, missä on asema?',
      phrases: [
        Phrase(
          id: 'fi_dir_0',
          target: 'Anteeksi, missä on asema?',
          gloss: {
            UiLang.tr: 'Afedersiniz, istasyon nerede?',
            UiLang.en: 'Excuse me, where is the station?',
          },
        ),
        Phrase(
          id: 'fi_dir_1',
          target: 'Kiitos paljon.',
          gloss: {
            UiLang.tr: 'Çok teşekkür ederim.',
            UiLang.en: 'Thank you very much.',
          },
        ),
        Phrase(
          id: 'fi_dir_2',
          target: 'En ymmärrä.',
          gloss: {UiLang.tr: 'Anlamıyorum.', UiLang.en: 'I do not understand.'},
        ),
      ],
      turns: [
        SpeakTurn(
          prompt: 'You stop someone.',
          expected: 'Anteeksi, missä on asema?',
        ),
        SpeakTurn(prompt: 'They point.', expected: 'Kiitos paljon.'),
      ],
    ),
    Scenario(
      id: 'fi_hi',
      lang: LearnLang.fi,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Tanışmak', UiLang.en: 'Introducing yourself'},
      clipLine: 'Hei, nimeni on Deniz.',
      phrases: [
        Phrase(
          id: 'fi_hi_0',
          target: 'Hei, nimeni on Deniz.',
          gloss: {
            UiLang.tr: 'Merhaba, adım Deniz.',
            UiLang.en: 'Hi, my name is Deniz.',
          },
        ),
        Phrase(
          id: 'fi_hi_1',
          target: 'Olen Turkista.',
          gloss: {UiLang.tr: 'Türkiye\'denim.', UiLang.en: 'I am from Turkey.'},
        ),
        Phrase(
          id: 'fi_hi_2',
          target: 'Kiitos paljon.',
          gloss: {
            UiLang.tr: 'Çok teşekkür ederim.',
            UiLang.en: 'Thank you very much.',
          },
        ),
      ],
      turns: [
        SpeakTurn(
          prompt: 'Someone says hello.',
          expected: 'Hei, nimeni on Deniz.',
        ),
        SpeakTurn(prompt: 'Where are you from?', expected: 'Olen Turkista.'),
      ],
    ),
    Scenario(
      id: 'fi_flat',
      lang: LearnLang.fi,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Ev bakmak', UiLang.en: 'Viewing a flat'},
      clipLine: 'Etsin asuntoa.',
      phrases: [
        Phrase(
          id: 'fi_flat_0',
          target: 'Etsin asuntoa.',
          gloss: {
            UiLang.tr: 'Daire arıyorum.',
            UiLang.en: 'I am looking for a flat.',
          },
        ),
        Phrase(
          id: 'fi_flat_1',
          target: 'Paljonko vuokra on?',
          gloss: {
            UiLang.tr: 'Kira ne kadar?',
            UiLang.en: 'How much is the rent?',
          },
        ),
        Phrase(
          id: 'fi_flat_2',
          target: 'Voitko auttaa minua?',
          gloss: {
            UiLang.tr: 'Bana yardım edebilir misiniz?',
            UiLang.en: 'Can you help me?',
          },
        ),
      ],
      turns: [
        SpeakTurn(prompt: 'The agent asks.', expected: 'Etsin asuntoa.'),
        SpeakTurn(
          prompt: 'They show a listing.',
          expected: 'Paljonko vuokra on?',
        ),
      ],
    ),
    Scenario(
      id: 'el_cafe',
      lang: LearnLang.el,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Kafede sipariş', UiLang.en: 'Ordering at a café'},
      clipLine: 'Έναν καφέ, παρακαλώ.',
      phrases: [
        Phrase(
          id: 'el_cafe_0',
          target: 'Έναν καφέ, παρακαλώ.',
          gloss: {
            UiLang.tr: 'Bir kahve, lütfen.',
            UiLang.en: 'A coffee, please.',
          },
        ),
        Phrase(
          id: 'el_cafe_1',
          target: 'Πόσο κοστίζει;',
          gloss: {UiLang.tr: 'Ne kadar?', UiLang.en: 'How much is that?'},
        ),
        Phrase(
          id: 'el_cafe_2',
          target: 'Ευχαριστώ πολύ.',
          gloss: {
            UiLang.tr: 'Çok teşekkür ederim.',
            UiLang.en: 'Thank you very much.',
          },
        ),
      ],
      turns: [
        SpeakTurn(
          prompt: 'What can I get you?',
          expected: 'Έναν καφέ, παρακαλώ.',
        ),
        SpeakTurn(prompt: 'How much?', expected: 'Πόσο κοστίζει;'),
      ],
    ),
    Scenario(
      id: 'el_hotel',
      lang: LearnLang.el,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Otele giriş', UiLang.en: 'Hotel check-in'},
      clipLine: 'Έχω κράτηση.',
      phrases: [
        Phrase(
          id: 'el_hotel_0',
          target: 'Έχω κράτηση.',
          gloss: {
            UiLang.tr: 'Rezervasyonum var.',
            UiLang.en: 'I have a reservation.',
          },
        ),
        Phrase(
          id: 'el_hotel_1',
          target: 'Το πρωινό περιλαμβάνεται;',
          gloss: {
            UiLang.tr: 'Kahvaltı dahil mi?',
            UiLang.en: 'Is breakfast included?',
          },
        ),
        Phrase(
          id: 'el_hotel_2',
          target: 'Ευχαριστώ πολύ.',
          gloss: {
            UiLang.tr: 'Çok teşekkür ederim.',
            UiLang.en: 'Thank you very much.',
          },
        ),
      ],
      turns: [
        SpeakTurn(prompt: 'Good evening.', expected: 'Έχω κράτηση.'),
        SpeakTurn(
          prompt: 'Any questions?',
          expected: 'Το πρωινό περιλαμβάνεται;',
        ),
      ],
    ),
    Scenario(
      id: 'el_dir',
      lang: LearnLang.el,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Yol sormak', UiLang.en: 'Asking the way'},
      clipLine: 'Συγγνώμη, πού είναι ο σταθμός;',
      phrases: [
        Phrase(
          id: 'el_dir_0',
          target: 'Συγγνώμη, πού είναι ο σταθμός;',
          gloss: {
            UiLang.tr: 'Afedersiniz, istasyon nerede?',
            UiLang.en: 'Excuse me, where is the station?',
          },
        ),
        Phrase(
          id: 'el_dir_1',
          target: 'Ευχαριστώ πολύ.',
          gloss: {
            UiLang.tr: 'Çok teşekkür ederim.',
            UiLang.en: 'Thank you very much.',
          },
        ),
        Phrase(
          id: 'el_dir_2',
          target: 'Δεν καταλαβαίνω.',
          gloss: {UiLang.tr: 'Anlamıyorum.', UiLang.en: 'I do not understand.'},
        ),
      ],
      turns: [
        SpeakTurn(
          prompt: 'You stop someone.',
          expected: 'Συγγνώμη, πού είναι ο σταθμός;',
        ),
        SpeakTurn(prompt: 'They point.', expected: 'Ευχαριστώ πολύ.'),
      ],
    ),
    Scenario(
      id: 'el_hi',
      lang: LearnLang.el,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Tanışmak', UiLang.en: 'Introducing yourself'},
      clipLine: 'Γεια, με λένε Ντενίζ.',
      phrases: [
        Phrase(
          id: 'el_hi_0',
          target: 'Γεια, με λένε Ντενίζ.',
          gloss: {
            UiLang.tr: 'Merhaba, adım Deniz.',
            UiLang.en: 'Hi, my name is Deniz.',
          },
        ),
        Phrase(
          id: 'el_hi_1',
          target: 'Είμαι από την Τουρκία.',
          gloss: {UiLang.tr: 'Türkiye\'denim.', UiLang.en: 'I am from Turkey.'},
        ),
        Phrase(
          id: 'el_hi_2',
          target: 'Ευχαριστώ πολύ.',
          gloss: {
            UiLang.tr: 'Çok teşekkür ederim.',
            UiLang.en: 'Thank you very much.',
          },
        ),
      ],
      turns: [
        SpeakTurn(
          prompt: 'Someone says hello.',
          expected: 'Γεια, με λένε Ντενίζ.',
        ),
        SpeakTurn(
          prompt: 'Where are you from?',
          expected: 'Είμαι από την Τουρκία.',
        ),
      ],
    ),
    Scenario(
      id: 'el_flat',
      lang: LearnLang.el,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Ev bakmak', UiLang.en: 'Viewing a flat'},
      clipLine: 'Ψάχνω διαμέρισμα.',
      phrases: [
        Phrase(
          id: 'el_flat_0',
          target: 'Ψάχνω διαμέρισμα.',
          gloss: {
            UiLang.tr: 'Daire arıyorum.',
            UiLang.en: 'I am looking for a flat.',
          },
        ),
        Phrase(
          id: 'el_flat_1',
          target: 'Πόσο είναι το ενοίκιο;',
          gloss: {
            UiLang.tr: 'Kira ne kadar?',
            UiLang.en: 'How much is the rent?',
          },
        ),
        Phrase(
          id: 'el_flat_2',
          target: 'Μπορείτε να με βοηθήσετε;',
          gloss: {
            UiLang.tr: 'Bana yardım edebilir misiniz?',
            UiLang.en: 'Can you help me?',
          },
        ),
      ],
      turns: [
        SpeakTurn(prompt: 'The agent asks.', expected: 'Ψάχνω διαμέρισμα.'),
        SpeakTurn(
          prompt: 'They show a listing.',
          expected: 'Πόσο είναι το ενοίκιο;',
        ),
      ],
    ),
    Scenario(
      id: 'cs_cafe',
      lang: LearnLang.cs,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Kafede sipariş', UiLang.en: 'Ordering at a café'},
      clipLine: 'Kávu, prosím.',
      phrases: [
        Phrase(
          id: 'cs_cafe_0',
          target: 'Kávu, prosím.',
          gloss: {
            UiLang.tr: 'Bir kahve, lütfen.',
            UiLang.en: 'A coffee, please.',
          },
        ),
        Phrase(
          id: 'cs_cafe_1',
          target: 'Kolik to stojí?',
          gloss: {UiLang.tr: 'Ne kadar?', UiLang.en: 'How much is that?'},
        ),
        Phrase(
          id: 'cs_cafe_2',
          target: 'Děkuji mockrát.',
          gloss: {
            UiLang.tr: 'Çok teşekkür ederim.',
            UiLang.en: 'Thank you very much.',
          },
        ),
      ],
      turns: [
        SpeakTurn(prompt: 'What can I get you?', expected: 'Kávu, prosím.'),
        SpeakTurn(prompt: 'How much?', expected: 'Kolik to stojí?'),
      ],
    ),
    Scenario(
      id: 'cs_hotel',
      lang: LearnLang.cs,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Otele giriş', UiLang.en: 'Hotel check-in'},
      clipLine: 'Mám rezervaci.',
      phrases: [
        Phrase(
          id: 'cs_hotel_0',
          target: 'Mám rezervaci.',
          gloss: {
            UiLang.tr: 'Rezervasyonum var.',
            UiLang.en: 'I have a reservation.',
          },
        ),
        Phrase(
          id: 'cs_hotel_1',
          target: 'Je snídaně v ceně?',
          gloss: {
            UiLang.tr: 'Kahvaltı dahil mi?',
            UiLang.en: 'Is breakfast included?',
          },
        ),
        Phrase(
          id: 'cs_hotel_2',
          target: 'Děkuji mockrát.',
          gloss: {
            UiLang.tr: 'Çok teşekkür ederim.',
            UiLang.en: 'Thank you very much.',
          },
        ),
      ],
      turns: [
        SpeakTurn(prompt: 'Good evening.', expected: 'Mám rezervaci.'),
        SpeakTurn(prompt: 'Any questions?', expected: 'Je snídaně v ceně?'),
      ],
    ),
    Scenario(
      id: 'cs_dir',
      lang: LearnLang.cs,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Yol sormak', UiLang.en: 'Asking the way'},
      clipLine: 'Promiňte, kde je stanice?',
      phrases: [
        Phrase(
          id: 'cs_dir_0',
          target: 'Promiňte, kde je stanice?',
          gloss: {
            UiLang.tr: 'Afedersiniz, istasyon nerede?',
            UiLang.en: 'Excuse me, where is the station?',
          },
        ),
        Phrase(
          id: 'cs_dir_1',
          target: 'Děkuji mockrát.',
          gloss: {
            UiLang.tr: 'Çok teşekkür ederim.',
            UiLang.en: 'Thank you very much.',
          },
        ),
        Phrase(
          id: 'cs_dir_2',
          target: 'Nerozumím.',
          gloss: {UiLang.tr: 'Anlamıyorum.', UiLang.en: 'I do not understand.'},
        ),
      ],
      turns: [
        SpeakTurn(
          prompt: 'You stop someone.',
          expected: 'Promiňte, kde je stanice?',
        ),
        SpeakTurn(prompt: 'They point.', expected: 'Děkuji mockrát.'),
      ],
    ),
    Scenario(
      id: 'cs_hi',
      lang: LearnLang.cs,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Tanışmak', UiLang.en: 'Introducing yourself'},
      clipLine: 'Ahoj, jmenuji se Deniz.',
      phrases: [
        Phrase(
          id: 'cs_hi_0',
          target: 'Ahoj, jmenuji se Deniz.',
          gloss: {
            UiLang.tr: 'Merhaba, adım Deniz.',
            UiLang.en: 'Hi, my name is Deniz.',
          },
        ),
        Phrase(
          id: 'cs_hi_1',
          target: 'Jsem z Turecka.',
          gloss: {UiLang.tr: 'Türkiye\'denim.', UiLang.en: 'I am from Turkey.'},
        ),
        Phrase(
          id: 'cs_hi_2',
          target: 'Děkuji mockrát.',
          gloss: {
            UiLang.tr: 'Çok teşekkür ederim.',
            UiLang.en: 'Thank you very much.',
          },
        ),
      ],
      turns: [
        SpeakTurn(
          prompt: 'Someone says hello.',
          expected: 'Ahoj, jmenuji se Deniz.',
        ),
        SpeakTurn(prompt: 'Where are you from?', expected: 'Jsem z Turecka.'),
      ],
    ),
    Scenario(
      id: 'cs_flat',
      lang: LearnLang.cs,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Ev bakmak', UiLang.en: 'Viewing a flat'},
      clipLine: 'Hledám byt.',
      phrases: [
        Phrase(
          id: 'cs_flat_0',
          target: 'Hledám byt.',
          gloss: {
            UiLang.tr: 'Daire arıyorum.',
            UiLang.en: 'I am looking for a flat.',
          },
        ),
        Phrase(
          id: 'cs_flat_1',
          target: 'Kolik je nájem?',
          gloss: {
            UiLang.tr: 'Kira ne kadar?',
            UiLang.en: 'How much is the rent?',
          },
        ),
        Phrase(
          id: 'cs_flat_2',
          target: 'Můžete mi pomoci?',
          gloss: {
            UiLang.tr: 'Bana yardım edebilir misiniz?',
            UiLang.en: 'Can you help me?',
          },
        ),
      ],
      turns: [
        SpeakTurn(prompt: 'The agent asks.', expected: 'Hledám byt.'),
        SpeakTurn(prompt: 'They show a listing.', expected: 'Kolik je nájem?'),
      ],
    ),
    Scenario(
      id: 'ro_cafe',
      lang: LearnLang.ro,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Kafede sipariş', UiLang.en: 'Ordering at a café'},
      clipLine: 'O cafea, vă rog.',
      phrases: [
        Phrase(
          id: 'ro_cafe_0',
          target: 'O cafea, vă rog.',
          gloss: {
            UiLang.tr: 'Bir kahve, lütfen.',
            UiLang.en: 'A coffee, please.',
          },
        ),
        Phrase(
          id: 'ro_cafe_1',
          target: 'Cât costă?',
          gloss: {UiLang.tr: 'Ne kadar?', UiLang.en: 'How much is that?'},
        ),
        Phrase(
          id: 'ro_cafe_2',
          target: 'Mulțumesc foarte mult.',
          gloss: {
            UiLang.tr: 'Çok teşekkür ederim.',
            UiLang.en: 'Thank you very much.',
          },
        ),
      ],
      turns: [
        SpeakTurn(prompt: 'What can I get you?', expected: 'O cafea, vă rog.'),
        SpeakTurn(prompt: 'How much?', expected: 'Cât costă?'),
      ],
    ),
    Scenario(
      id: 'ro_hotel',
      lang: LearnLang.ro,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Otele giriş', UiLang.en: 'Hotel check-in'},
      clipLine: 'Am o rezervare.',
      phrases: [
        Phrase(
          id: 'ro_hotel_0',
          target: 'Am o rezervare.',
          gloss: {
            UiLang.tr: 'Rezervasyonum var.',
            UiLang.en: 'I have a reservation.',
          },
        ),
        Phrase(
          id: 'ro_hotel_1',
          target: 'Micul dejun e inclus?',
          gloss: {
            UiLang.tr: 'Kahvaltı dahil mi?',
            UiLang.en: 'Is breakfast included?',
          },
        ),
        Phrase(
          id: 'ro_hotel_2',
          target: 'Mulțumesc foarte mult.',
          gloss: {
            UiLang.tr: 'Çok teşekkür ederim.',
            UiLang.en: 'Thank you very much.',
          },
        ),
      ],
      turns: [
        SpeakTurn(prompt: 'Good evening.', expected: 'Am o rezervare.'),
        SpeakTurn(prompt: 'Any questions?', expected: 'Micul dejun e inclus?'),
      ],
    ),
    Scenario(
      id: 'ro_dir',
      lang: LearnLang.ro,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Yol sormak', UiLang.en: 'Asking the way'},
      clipLine: 'Scuzați, unde este gara?',
      phrases: [
        Phrase(
          id: 'ro_dir_0',
          target: 'Scuzați, unde este gara?',
          gloss: {
            UiLang.tr: 'Afedersiniz, istasyon nerede?',
            UiLang.en: 'Excuse me, where is the station?',
          },
        ),
        Phrase(
          id: 'ro_dir_1',
          target: 'Mulțumesc foarte mult.',
          gloss: {
            UiLang.tr: 'Çok teşekkür ederim.',
            UiLang.en: 'Thank you very much.',
          },
        ),
        Phrase(
          id: 'ro_dir_2',
          target: 'Nu înțeleg.',
          gloss: {UiLang.tr: 'Anlamıyorum.', UiLang.en: 'I do not understand.'},
        ),
      ],
      turns: [
        SpeakTurn(
          prompt: 'You stop someone.',
          expected: 'Scuzați, unde este gara?',
        ),
        SpeakTurn(prompt: 'They point.', expected: 'Mulțumesc foarte mult.'),
      ],
    ),
    Scenario(
      id: 'ro_hi',
      lang: LearnLang.ro,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Tanışmak', UiLang.en: 'Introducing yourself'},
      clipLine: 'Bună, mă numesc Deniz.',
      phrases: [
        Phrase(
          id: 'ro_hi_0',
          target: 'Bună, mă numesc Deniz.',
          gloss: {
            UiLang.tr: 'Merhaba, adım Deniz.',
            UiLang.en: 'Hi, my name is Deniz.',
          },
        ),
        Phrase(
          id: 'ro_hi_1',
          target: 'Sunt din Turcia.',
          gloss: {UiLang.tr: 'Türkiye\'denim.', UiLang.en: 'I am from Turkey.'},
        ),
        Phrase(
          id: 'ro_hi_2',
          target: 'Mulțumesc foarte mult.',
          gloss: {
            UiLang.tr: 'Çok teşekkür ederim.',
            UiLang.en: 'Thank you very much.',
          },
        ),
      ],
      turns: [
        SpeakTurn(
          prompt: 'Someone says hello.',
          expected: 'Bună, mă numesc Deniz.',
        ),
        SpeakTurn(prompt: 'Where are you from?', expected: 'Sunt din Turcia.'),
      ],
    ),
    Scenario(
      id: 'ro_flat',
      lang: LearnLang.ro,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Ev bakmak', UiLang.en: 'Viewing a flat'},
      clipLine: 'Caut un apartament.',
      phrases: [
        Phrase(
          id: 'ro_flat_0',
          target: 'Caut un apartament.',
          gloss: {
            UiLang.tr: 'Daire arıyorum.',
            UiLang.en: 'I am looking for a flat.',
          },
        ),
        Phrase(
          id: 'ro_flat_1',
          target: 'Cât este chiria?',
          gloss: {
            UiLang.tr: 'Kira ne kadar?',
            UiLang.en: 'How much is the rent?',
          },
        ),
        Phrase(
          id: 'ro_flat_2',
          target: 'Mă puteți ajuta?',
          gloss: {
            UiLang.tr: 'Bana yardım edebilir misiniz?',
            UiLang.en: 'Can you help me?',
          },
        ),
      ],
      turns: [
        SpeakTurn(prompt: 'The agent asks.', expected: 'Caut un apartament.'),
        SpeakTurn(prompt: 'They show a listing.', expected: 'Cât este chiria?'),
      ],
    ),
    Scenario(
      id: 'hu_cafe',
      lang: LearnLang.hu,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Kafede sipariş', UiLang.en: 'Ordering at a café'},
      clipLine: 'Egy kávét kérek.',
      phrases: [
        Phrase(
          id: 'hu_cafe_0',
          target: 'Egy kávét kérek.',
          gloss: {
            UiLang.tr: 'Bir kahve, lütfen.',
            UiLang.en: 'A coffee, please.',
          },
        ),
        Phrase(
          id: 'hu_cafe_1',
          target: 'Mennyibe kerül?',
          gloss: {UiLang.tr: 'Ne kadar?', UiLang.en: 'How much is that?'},
        ),
        Phrase(
          id: 'hu_cafe_2',
          target: 'Köszönöm szépen.',
          gloss: {
            UiLang.tr: 'Çok teşekkür ederim.',
            UiLang.en: 'Thank you very much.',
          },
        ),
      ],
      turns: [
        SpeakTurn(prompt: 'What can I get you?', expected: 'Egy kávét kérek.'),
        SpeakTurn(prompt: 'How much?', expected: 'Mennyibe kerül?'),
      ],
    ),
    Scenario(
      id: 'hu_hotel',
      lang: LearnLang.hu,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Otele giriş', UiLang.en: 'Hotel check-in'},
      clipLine: 'Van foglalsom.',
      phrases: [
        Phrase(
          id: 'hu_hotel_0',
          target: 'Van foglalsom.',
          gloss: {
            UiLang.tr: 'Rezervasyonum var.',
            UiLang.en: 'I have a reservation.',
          },
        ),
        Phrase(
          id: 'hu_hotel_1',
          target: 'A reggeli benne van?',
          gloss: {
            UiLang.tr: 'Kahvaltı dahil mi?',
            UiLang.en: 'Is breakfast included?',
          },
        ),
        Phrase(
          id: 'hu_hotel_2',
          target: 'Köszönöm szépen.',
          gloss: {
            UiLang.tr: 'Çok teşekkür ederim.',
            UiLang.en: 'Thank you very much.',
          },
        ),
      ],
      turns: [
        SpeakTurn(prompt: 'Good evening.', expected: 'Van foglalsom.'),
        SpeakTurn(prompt: 'Any questions?', expected: 'A reggeli benne van?'),
      ],
    ),
    Scenario(
      id: 'hu_dir',
      lang: LearnLang.hu,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Yol sormak', UiLang.en: 'Asking the way'},
      clipLine: 'Elnézést, hol van az állomás?',
      phrases: [
        Phrase(
          id: 'hu_dir_0',
          target: 'Elnézést, hol van az állomás?',
          gloss: {
            UiLang.tr: 'Afedersiniz, istasyon nerede?',
            UiLang.en: 'Excuse me, where is the station?',
          },
        ),
        Phrase(
          id: 'hu_dir_1',
          target: 'Köszönöm szépen.',
          gloss: {
            UiLang.tr: 'Çok teşekkür ederim.',
            UiLang.en: 'Thank you very much.',
          },
        ),
        Phrase(
          id: 'hu_dir_2',
          target: 'Nem értem.',
          gloss: {UiLang.tr: 'Anlamıyorum.', UiLang.en: 'I do not understand.'},
        ),
      ],
      turns: [
        SpeakTurn(
          prompt: 'You stop someone.',
          expected: 'Elnézést, hol van az állomás?',
        ),
        SpeakTurn(prompt: 'They point.', expected: 'Köszönöm szépen.'),
      ],
    ),
    Scenario(
      id: 'hu_hi',
      lang: LearnLang.hu,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Tanışmak', UiLang.en: 'Introducing yourself'},
      clipLine: 'Szia, a nevem Deniz.',
      phrases: [
        Phrase(
          id: 'hu_hi_0',
          target: 'Szia, a nevem Deniz.',
          gloss: {
            UiLang.tr: 'Merhaba, adım Deniz.',
            UiLang.en: 'Hi, my name is Deniz.',
          },
        ),
        Phrase(
          id: 'hu_hi_1',
          target: 'Törökországból jöttem.',
          gloss: {UiLang.tr: 'Türkiye\'denim.', UiLang.en: 'I am from Turkey.'},
        ),
        Phrase(
          id: 'hu_hi_2',
          target: 'Köszönöm szépen.',
          gloss: {
            UiLang.tr: 'Çok teşekkür ederim.',
            UiLang.en: 'Thank you very much.',
          },
        ),
      ],
      turns: [
        SpeakTurn(
          prompt: 'Someone says hello.',
          expected: 'Szia, a nevem Deniz.',
        ),
        SpeakTurn(
          prompt: 'Where are you from?',
          expected: 'Törökországból jöttem.',
        ),
      ],
    ),
    Scenario(
      id: 'hu_flat',
      lang: LearnLang.hu,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Ev bakmak', UiLang.en: 'Viewing a flat'},
      clipLine: 'Lakást keresek.',
      phrases: [
        Phrase(
          id: 'hu_flat_0',
          target: 'Lakást keresek.',
          gloss: {
            UiLang.tr: 'Daire arıyorum.',
            UiLang.en: 'I am looking for a flat.',
          },
        ),
        Phrase(
          id: 'hu_flat_1',
          target: 'Mennyi a bérleti díj?',
          gloss: {
            UiLang.tr: 'Kira ne kadar?',
            UiLang.en: 'How much is the rent?',
          },
        ),
        Phrase(
          id: 'hu_flat_2',
          target: 'Tud segíteni?',
          gloss: {
            UiLang.tr: 'Bana yardım edebilir misiniz?',
            UiLang.en: 'Can you help me?',
          },
        ),
      ],
      turns: [
        SpeakTurn(prompt: 'The agent asks.', expected: 'Lakást keresek.'),
        SpeakTurn(
          prompt: 'They show a listing.',
          expected: 'Mennyi a bérleti díj?',
        ),
      ],
    ),
    Scenario(
      id: 'hi_cafe',
      lang: LearnLang.hi,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Kafede sipariş', UiLang.en: 'Ordering at a café'},
      clipLine: 'एक कॉफ़ी दीजिए।',
      phrases: [
        Phrase(
          id: 'hi_cafe_0',
          target: 'एक कॉफ़ी दीजिए।',
          gloss: {
            UiLang.tr: 'Bir kahve, lütfen.',
            UiLang.en: 'A coffee, please.',
          },
        ),
        Phrase(
          id: 'hi_cafe_1',
          target: 'यह कितने का है?',
          gloss: {UiLang.tr: 'Ne kadar?', UiLang.en: 'How much is that?'},
        ),
        Phrase(
          id: 'hi_cafe_2',
          target: 'बहुत-बहुत धन्यवाद।',
          gloss: {
            UiLang.tr: 'Çok teşekkür ederim.',
            UiLang.en: 'Thank you very much.',
          },
        ),
      ],
      turns: [
        SpeakTurn(prompt: 'What can I get you?', expected: 'एक कॉफ़ी दीजिए।'),
        SpeakTurn(prompt: 'How much?', expected: 'यह कितने का है?'),
      ],
    ),
    Scenario(
      id: 'hi_hotel',
      lang: LearnLang.hi,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Otele giriş', UiLang.en: 'Hotel check-in'},
      clipLine: 'मेरा आरक्षण है।',
      phrases: [
        Phrase(
          id: 'hi_hotel_0',
          target: 'मेरा आरक्षण है।',
          gloss: {
            UiLang.tr: 'Rezervasyonum var.',
            UiLang.en: 'I have a reservation.',
          },
        ),
        Phrase(
          id: 'hi_hotel_1',
          target: 'क्या नाश्ता शामिल है?',
          gloss: {
            UiLang.tr: 'Kahvaltı dahil mi?',
            UiLang.en: 'Is breakfast included?',
          },
        ),
        Phrase(
          id: 'hi_hotel_2',
          target: 'बहुत-बहुत धन्यवाद।',
          gloss: {
            UiLang.tr: 'Çok teşekkür ederim.',
            UiLang.en: 'Thank you very much.',
          },
        ),
      ],
      turns: [
        SpeakTurn(prompt: 'Good evening.', expected: 'मेरा आरक्षण है।'),
        SpeakTurn(prompt: 'Any questions?', expected: 'क्या नाश्ता शामिल है?'),
      ],
    ),
    Scenario(
      id: 'hi_dir',
      lang: LearnLang.hi,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Yol sormak', UiLang.en: 'Asking the way'},
      clipLine: 'माफ़ कीजिए, स्टेशन कहाँ है?',
      phrases: [
        Phrase(
          id: 'hi_dir_0',
          target: 'माफ़ कीजिए, स्टेशन कहाँ है?',
          gloss: {
            UiLang.tr: 'Afedersiniz, istasyon nerede?',
            UiLang.en: 'Excuse me, where is the station?',
          },
        ),
        Phrase(
          id: 'hi_dir_1',
          target: 'बहुत-बहुत धन्यवाद।',
          gloss: {
            UiLang.tr: 'Çok teşekkür ederim.',
            UiLang.en: 'Thank you very much.',
          },
        ),
        Phrase(
          id: 'hi_dir_2',
          target: 'मुझे समझ नहीं आया।',
          gloss: {UiLang.tr: 'Anlamıyorum.', UiLang.en: 'I do not understand.'},
        ),
      ],
      turns: [
        SpeakTurn(
          prompt: 'You stop someone.',
          expected: 'माफ़ कीजिए, स्टेशन कहाँ है?',
        ),
        SpeakTurn(prompt: 'They point.', expected: 'बहुत-बहुत धन्यवाद।'),
      ],
    ),
    Scenario(
      id: 'hi_hi',
      lang: LearnLang.hi,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Tanışmak', UiLang.en: 'Introducing yourself'},
      clipLine: 'नमस्ते, मेरा नाम डेनिज़ है।',
      phrases: [
        Phrase(
          id: 'hi_hi_0',
          target: 'नमस्ते, मेरा नाम डेनिज़ है।',
          gloss: {
            UiLang.tr: 'Merhaba, adım Deniz.',
            UiLang.en: 'Hi, my name is Deniz.',
          },
        ),
        Phrase(
          id: 'hi_hi_1',
          target: 'मैं तुर्की से हूँ।',
          gloss: {UiLang.tr: 'Türkiye\'denim.', UiLang.en: 'I am from Turkey.'},
        ),
        Phrase(
          id: 'hi_hi_2',
          target: 'बहुत-बहुत धन्यवाद।',
          gloss: {
            UiLang.tr: 'Çok teşekkür ederim.',
            UiLang.en: 'Thank you very much.',
          },
        ),
      ],
      turns: [
        SpeakTurn(
          prompt: 'Someone says hello.',
          expected: 'नमस्ते, मेरा नाम डेनिज़ है।',
        ),
        SpeakTurn(
          prompt: 'Where are you from?',
          expected: 'मैं तुर्की से हूँ।',
        ),
      ],
    ),
    Scenario(
      id: 'hi_flat',
      lang: LearnLang.hi,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Ev bakmak', UiLang.en: 'Viewing a flat'},
      clipLine: 'मुझे एक फ़्लैट चाहिए।',
      phrases: [
        Phrase(
          id: 'hi_flat_0',
          target: 'मुझे एक फ़्लैट चाहिए।',
          gloss: {
            UiLang.tr: 'Daire arıyorum.',
            UiLang.en: 'I am looking for a flat.',
          },
        ),
        Phrase(
          id: 'hi_flat_1',
          target: 'किराया कितना है?',
          gloss: {
            UiLang.tr: 'Kira ne kadar?',
            UiLang.en: 'How much is the rent?',
          },
        ),
        Phrase(
          id: 'hi_flat_2',
          target: 'क्या आप मेरी मदद कर सकते हैं?',
          gloss: {
            UiLang.tr: 'Bana yardım edebilir misiniz?',
            UiLang.en: 'Can you help me?',
          },
        ),
      ],
      turns: [
        SpeakTurn(prompt: 'The agent asks.', expected: 'मुझे एक फ़्लैट चाहिए।'),
        SpeakTurn(prompt: 'They show a listing.', expected: 'किराया कितना है?'),
      ],
    ),
    Scenario(
      id: 'th_cafe',
      lang: LearnLang.th,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Kafede sipariş', UiLang.en: 'Ordering at a café'},
      clipLine: 'ขอกาแฟหนึ่งแก้ว',
      phrases: [
        Phrase(
          id: 'th_cafe_0',
          target: 'ขอกาแฟหนึ่งแก้ว',
          gloss: {
            UiLang.tr: 'Bir kahve, lütfen.',
            UiLang.en: 'A coffee, please.',
          },
        ),
        Phrase(
          id: 'th_cafe_1',
          target: 'ราคาเท่าไหร่?',
          gloss: {UiLang.tr: 'Ne kadar?', UiLang.en: 'How much is that?'},
        ),
        Phrase(
          id: 'th_cafe_2',
          target: 'ขอบคุณมาก',
          gloss: {
            UiLang.tr: 'Çok teşekkür ederim.',
            UiLang.en: 'Thank you very much.',
          },
        ),
      ],
      turns: [
        SpeakTurn(prompt: 'What can I get you?', expected: 'ขอกาแฟหนึ่งแก้ว'),
        SpeakTurn(prompt: 'How much?', expected: 'ราคาเท่าไหร่?'),
      ],
    ),
    Scenario(
      id: 'th_hotel',
      lang: LearnLang.th,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Otele giriş', UiLang.en: 'Hotel check-in'},
      clipLine: 'ฉันมีการจอง',
      phrases: [
        Phrase(
          id: 'th_hotel_0',
          target: 'ฉันมีการจอง',
          gloss: {
            UiLang.tr: 'Rezervasyonum var.',
            UiLang.en: 'I have a reservation.',
          },
        ),
        Phrase(
          id: 'th_hotel_1',
          target: 'รวมอาหารเช้าไหม?',
          gloss: {
            UiLang.tr: 'Kahvaltı dahil mi?',
            UiLang.en: 'Is breakfast included?',
          },
        ),
        Phrase(
          id: 'th_hotel_2',
          target: 'ขอบคุณมาก',
          gloss: {
            UiLang.tr: 'Çok teşekkür ederim.',
            UiLang.en: 'Thank you very much.',
          },
        ),
      ],
      turns: [
        SpeakTurn(prompt: 'Good evening.', expected: 'ฉันมีการจอง'),
        SpeakTurn(prompt: 'Any questions?', expected: 'รวมอาหารเช้าไหม?'),
      ],
    ),
    Scenario(
      id: 'th_dir',
      lang: LearnLang.th,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Yol sormak', UiLang.en: 'Asking the way'},
      clipLine: 'ขอโทษ สถานีอยู่ที่ไหน?',
      phrases: [
        Phrase(
          id: 'th_dir_0',
          target: 'ขอโทษ สถานีอยู่ที่ไหน?',
          gloss: {
            UiLang.tr: 'Afedersiniz, istasyon nerede?',
            UiLang.en: 'Excuse me, where is the station?',
          },
        ),
        Phrase(
          id: 'th_dir_1',
          target: 'ขอบคุณมาก',
          gloss: {
            UiLang.tr: 'Çok teşekkür ederim.',
            UiLang.en: 'Thank you very much.',
          },
        ),
        Phrase(
          id: 'th_dir_2',
          target: 'ฉันไม่เข้าใจ',
          gloss: {UiLang.tr: 'Anlamıyorum.', UiLang.en: 'I do not understand.'},
        ),
      ],
      turns: [
        SpeakTurn(
          prompt: 'You stop someone.',
          expected: 'ขอโทษ สถานีอยู่ที่ไหน?',
        ),
        SpeakTurn(prompt: 'They point.', expected: 'ขอบคุณมาก'),
      ],
    ),
    Scenario(
      id: 'th_hi',
      lang: LearnLang.th,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Tanışmak', UiLang.en: 'Introducing yourself'},
      clipLine: 'สวัสดี ฉันชื่อเดนิซ',
      phrases: [
        Phrase(
          id: 'th_hi_0',
          target: 'สวัสดี ฉันชื่อเดนิซ',
          gloss: {
            UiLang.tr: 'Merhaba, adım Deniz.',
            UiLang.en: 'Hi, my name is Deniz.',
          },
        ),
        Phrase(
          id: 'th_hi_1',
          target: 'ฉันมาจากตุรกี',
          gloss: {UiLang.tr: 'Türkiye\'denim.', UiLang.en: 'I am from Turkey.'},
        ),
        Phrase(
          id: 'th_hi_2',
          target: 'ขอบคุณมาก',
          gloss: {
            UiLang.tr: 'Çok teşekkür ederim.',
            UiLang.en: 'Thank you very much.',
          },
        ),
      ],
      turns: [
        SpeakTurn(
          prompt: 'Someone says hello.',
          expected: 'สวัสดี ฉันชื่อเดนิซ',
        ),
        SpeakTurn(prompt: 'Where are you from?', expected: 'ฉันมาจากตุรกี'),
      ],
    ),
    Scenario(
      id: 'th_flat',
      lang: LearnLang.th,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Ev bakmak', UiLang.en: 'Viewing a flat'},
      clipLine: 'ฉันกำลังหาอพาร์ตเมนต์',
      phrases: [
        Phrase(
          id: 'th_flat_0',
          target: 'ฉันกำลังหาอพาร์ตเมนต์',
          gloss: {
            UiLang.tr: 'Daire arıyorum.',
            UiLang.en: 'I am looking for a flat.',
          },
        ),
        Phrase(
          id: 'th_flat_1',
          target: 'ค่าเช่าเท่าไหร่?',
          gloss: {
            UiLang.tr: 'Kira ne kadar?',
            UiLang.en: 'How much is the rent?',
          },
        ),
        Phrase(
          id: 'th_flat_2',
          target: 'ช่วยฉันได้ไหม?',
          gloss: {
            UiLang.tr: 'Bana yardım edebilir misiniz?',
            UiLang.en: 'Can you help me?',
          },
        ),
      ],
      turns: [
        SpeakTurn(prompt: 'The agent asks.', expected: 'ฉันกำลังหาอพาร์ตเมนต์'),
        SpeakTurn(prompt: 'They show a listing.', expected: 'ค่าเช่าเท่าไหร่?'),
      ],
    ),
    Scenario(
      id: 'vi_cafe',
      lang: LearnLang.vi,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Kafede sipariş', UiLang.en: 'Ordering at a café'},
      clipLine: 'Cho tôi một cà phê.',
      phrases: [
        Phrase(
          id: 'vi_cafe_0',
          target: 'Cho tôi một cà phê.',
          gloss: {
            UiLang.tr: 'Bir kahve, lütfen.',
            UiLang.en: 'A coffee, please.',
          },
        ),
        Phrase(
          id: 'vi_cafe_1',
          target: 'Bao nhiêu tiền?',
          gloss: {UiLang.tr: 'Ne kadar?', UiLang.en: 'How much is that?'},
        ),
        Phrase(
          id: 'vi_cafe_2',
          target: 'Cảm ơn rất nhiều.',
          gloss: {
            UiLang.tr: 'Çok teşekkür ederim.',
            UiLang.en: 'Thank you very much.',
          },
        ),
      ],
      turns: [
        SpeakTurn(
          prompt: 'What can I get you?',
          expected: 'Cho tôi một cà phê.',
        ),
        SpeakTurn(prompt: 'How much?', expected: 'Bao nhiêu tiền?'),
      ],
    ),
    Scenario(
      id: 'vi_hotel',
      lang: LearnLang.vi,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Otele giriş', UiLang.en: 'Hotel check-in'},
      clipLine: 'Tôi có đặt chỗ.',
      phrases: [
        Phrase(
          id: 'vi_hotel_0',
          target: 'Tôi có đặt chỗ.',
          gloss: {
            UiLang.tr: 'Rezervasyonum var.',
            UiLang.en: 'I have a reservation.',
          },
        ),
        Phrase(
          id: 'vi_hotel_1',
          target: 'Có bao gồm bữa sáng không?',
          gloss: {
            UiLang.tr: 'Kahvaltı dahil mi?',
            UiLang.en: 'Is breakfast included?',
          },
        ),
        Phrase(
          id: 'vi_hotel_2',
          target: 'Cảm ơn rất nhiều.',
          gloss: {
            UiLang.tr: 'Çok teşekkür ederim.',
            UiLang.en: 'Thank you very much.',
          },
        ),
      ],
      turns: [
        SpeakTurn(prompt: 'Good evening.', expected: 'Tôi có đặt chỗ.'),
        SpeakTurn(
          prompt: 'Any questions?',
          expected: 'Có bao gồm bữa sáng không?',
        ),
      ],
    ),
    Scenario(
      id: 'vi_dir',
      lang: LearnLang.vi,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Yol sormak', UiLang.en: 'Asking the way'},
      clipLine: 'Xin lỗi, ga ở đâu?',
      phrases: [
        Phrase(
          id: 'vi_dir_0',
          target: 'Xin lỗi, ga ở đâu?',
          gloss: {
            UiLang.tr: 'Afedersiniz, istasyon nerede?',
            UiLang.en: 'Excuse me, where is the station?',
          },
        ),
        Phrase(
          id: 'vi_dir_1',
          target: 'Cảm ơn rất nhiều.',
          gloss: {
            UiLang.tr: 'Çok teşekkür ederim.',
            UiLang.en: 'Thank you very much.',
          },
        ),
        Phrase(
          id: 'vi_dir_2',
          target: 'Tôi không hiểu.',
          gloss: {UiLang.tr: 'Anlamıyorum.', UiLang.en: 'I do not understand.'},
        ),
      ],
      turns: [
        SpeakTurn(prompt: 'You stop someone.', expected: 'Xin lỗi, ga ở đâu?'),
        SpeakTurn(prompt: 'They point.', expected: 'Cảm ơn rất nhiều.'),
      ],
    ),
    Scenario(
      id: 'vi_hi',
      lang: LearnLang.vi,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Tanışmak', UiLang.en: 'Introducing yourself'},
      clipLine: 'Xin chào, tôi tên là Deniz.',
      phrases: [
        Phrase(
          id: 'vi_hi_0',
          target: 'Xin chào, tôi tên là Deniz.',
          gloss: {
            UiLang.tr: 'Merhaba, adım Deniz.',
            UiLang.en: 'Hi, my name is Deniz.',
          },
        ),
        Phrase(
          id: 'vi_hi_1',
          target: 'Tôi đến từ Thổ Nhĩ Kỳ.',
          gloss: {UiLang.tr: 'Türkiye\'denim.', UiLang.en: 'I am from Turkey.'},
        ),
        Phrase(
          id: 'vi_hi_2',
          target: 'Cảm ơn rất nhiều.',
          gloss: {
            UiLang.tr: 'Çok teşekkür ederim.',
            UiLang.en: 'Thank you very much.',
          },
        ),
      ],
      turns: [
        SpeakTurn(
          prompt: 'Someone says hello.',
          expected: 'Xin chào, tôi tên là Deniz.',
        ),
        SpeakTurn(
          prompt: 'Where are you from?',
          expected: 'Tôi đến từ Thổ Nhĩ Kỳ.',
        ),
      ],
    ),
    Scenario(
      id: 'vi_flat',
      lang: LearnLang.vi,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Ev bakmak', UiLang.en: 'Viewing a flat'},
      clipLine: 'Tôi đang tìm căn hộ.',
      phrases: [
        Phrase(
          id: 'vi_flat_0',
          target: 'Tôi đang tìm căn hộ.',
          gloss: {
            UiLang.tr: 'Daire arıyorum.',
            UiLang.en: 'I am looking for a flat.',
          },
        ),
        Phrase(
          id: 'vi_flat_1',
          target: 'Tiền thuê bao nhiêu?',
          gloss: {
            UiLang.tr: 'Kira ne kadar?',
            UiLang.en: 'How much is the rent?',
          },
        ),
        Phrase(
          id: 'vi_flat_2',
          target: 'Bạn có thể giúp tôi không?',
          gloss: {
            UiLang.tr: 'Bana yardım edebilir misiniz?',
            UiLang.en: 'Can you help me?',
          },
        ),
      ],
      turns: [
        SpeakTurn(prompt: 'The agent asks.', expected: 'Tôi đang tìm căn hộ.'),
        SpeakTurn(
          prompt: 'They show a listing.',
          expected: 'Tiền thuê bao nhiêu?',
        ),
      ],
    ),
    Scenario(
      id: 'id_cafe',
      lang: LearnLang.id,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Kafede sipariş', UiLang.en: 'Ordering at a café'},
      clipLine: 'Kopi satu, tolong.',
      phrases: [
        Phrase(
          id: 'id_cafe_0',
          target: 'Kopi satu, tolong.',
          gloss: {
            UiLang.tr: 'Bir kahve, lütfen.',
            UiLang.en: 'A coffee, please.',
          },
        ),
        Phrase(
          id: 'id_cafe_1',
          target: 'Berapa harganya?',
          gloss: {UiLang.tr: 'Ne kadar?', UiLang.en: 'How much is that?'},
        ),
        Phrase(
          id: 'id_cafe_2',
          target: 'Terima kasih banyak.',
          gloss: {
            UiLang.tr: 'Çok teşekkür ederim.',
            UiLang.en: 'Thank you very much.',
          },
        ),
      ],
      turns: [
        SpeakTurn(
          prompt: 'What can I get you?',
          expected: 'Kopi satu, tolong.',
        ),
        SpeakTurn(prompt: 'How much?', expected: 'Berapa harganya?'),
      ],
    ),
    Scenario(
      id: 'id_hotel',
      lang: LearnLang.id,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Otele giriş', UiLang.en: 'Hotel check-in'},
      clipLine: 'Saya punya reservasi.',
      phrases: [
        Phrase(
          id: 'id_hotel_0',
          target: 'Saya punya reservasi.',
          gloss: {
            UiLang.tr: 'Rezervasyonum var.',
            UiLang.en: 'I have a reservation.',
          },
        ),
        Phrase(
          id: 'id_hotel_1',
          target: 'Apakah sarapan termasuk?',
          gloss: {
            UiLang.tr: 'Kahvaltı dahil mi?',
            UiLang.en: 'Is breakfast included?',
          },
        ),
        Phrase(
          id: 'id_hotel_2',
          target: 'Terima kasih banyak.',
          gloss: {
            UiLang.tr: 'Çok teşekkür ederim.',
            UiLang.en: 'Thank you very much.',
          },
        ),
      ],
      turns: [
        SpeakTurn(prompt: 'Good evening.', expected: 'Saya punya reservasi.'),
        SpeakTurn(
          prompt: 'Any questions?',
          expected: 'Apakah sarapan termasuk?',
        ),
      ],
    ),
    Scenario(
      id: 'id_dir',
      lang: LearnLang.id,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Yol sormak', UiLang.en: 'Asking the way'},
      clipLine: 'Permisi, di mana stasiun?',
      phrases: [
        Phrase(
          id: 'id_dir_0',
          target: 'Permisi, di mana stasiun?',
          gloss: {
            UiLang.tr: 'Afedersiniz, istasyon nerede?',
            UiLang.en: 'Excuse me, where is the station?',
          },
        ),
        Phrase(
          id: 'id_dir_1',
          target: 'Terima kasih banyak.',
          gloss: {
            UiLang.tr: 'Çok teşekkür ederim.',
            UiLang.en: 'Thank you very much.',
          },
        ),
        Phrase(
          id: 'id_dir_2',
          target: 'Saya tidak mengerti.',
          gloss: {UiLang.tr: 'Anlamıyorum.', UiLang.en: 'I do not understand.'},
        ),
      ],
      turns: [
        SpeakTurn(
          prompt: 'You stop someone.',
          expected: 'Permisi, di mana stasiun?',
        ),
        SpeakTurn(prompt: 'They point.', expected: 'Terima kasih banyak.'),
      ],
    ),
    Scenario(
      id: 'id_hi',
      lang: LearnLang.id,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Tanışmak', UiLang.en: 'Introducing yourself'},
      clipLine: 'Halo, nama saya Deniz.',
      phrases: [
        Phrase(
          id: 'id_hi_0',
          target: 'Halo, nama saya Deniz.',
          gloss: {
            UiLang.tr: 'Merhaba, adım Deniz.',
            UiLang.en: 'Hi, my name is Deniz.',
          },
        ),
        Phrase(
          id: 'id_hi_1',
          target: 'Saya dari Turki.',
          gloss: {UiLang.tr: 'Türkiye\'denim.', UiLang.en: 'I am from Turkey.'},
        ),
        Phrase(
          id: 'id_hi_2',
          target: 'Terima kasih banyak.',
          gloss: {
            UiLang.tr: 'Çok teşekkür ederim.',
            UiLang.en: 'Thank you very much.',
          },
        ),
      ],
      turns: [
        SpeakTurn(
          prompt: 'Someone says hello.',
          expected: 'Halo, nama saya Deniz.',
        ),
        SpeakTurn(prompt: 'Where are you from?', expected: 'Saya dari Turki.'),
      ],
    ),
    Scenario(
      id: 'id_flat',
      lang: LearnLang.id,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Ev bakmak', UiLang.en: 'Viewing a flat'},
      clipLine: 'Saya mencari apartemen.',
      phrases: [
        Phrase(
          id: 'id_flat_0',
          target: 'Saya mencari apartemen.',
          gloss: {
            UiLang.tr: 'Daire arıyorum.',
            UiLang.en: 'I am looking for a flat.',
          },
        ),
        Phrase(
          id: 'id_flat_1',
          target: 'Berapa sewanya?',
          gloss: {
            UiLang.tr: 'Kira ne kadar?',
            UiLang.en: 'How much is the rent?',
          },
        ),
        Phrase(
          id: 'id_flat_2',
          target: 'Bisa tolong bantu saya?',
          gloss: {
            UiLang.tr: 'Bana yardım edebilir misiniz?',
            UiLang.en: 'Can you help me?',
          },
        ),
      ],
      turns: [
        SpeakTurn(
          prompt: 'The agent asks.',
          expected: 'Saya mencari apartemen.',
        ),
        SpeakTurn(prompt: 'They show a listing.', expected: 'Berapa sewanya?'),
      ],
    ),
    Scenario(
      id: 'uk_cafe',
      lang: LearnLang.uk,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Kafede sipariş', UiLang.en: 'Ordering at a café'},
      clipLine: 'Каву, будь ласка.',
      phrases: [
        Phrase(
          id: 'uk_cafe_0',
          target: 'Каву, будь ласка.',
          gloss: {
            UiLang.tr: 'Bir kahve, lütfen.',
            UiLang.en: 'A coffee, please.',
          },
        ),
        Phrase(
          id: 'uk_cafe_1',
          target: 'Скільки це коштує?',
          gloss: {UiLang.tr: 'Ne kadar?', UiLang.en: 'How much is that?'},
        ),
        Phrase(
          id: 'uk_cafe_2',
          target: 'Дуже дякую.',
          gloss: {
            UiLang.tr: 'Çok teşekkür ederim.',
            UiLang.en: 'Thank you very much.',
          },
        ),
      ],
      turns: [
        SpeakTurn(prompt: 'What can I get you?', expected: 'Каву, будь ласка.'),
        SpeakTurn(prompt: 'How much?', expected: 'Скільки це коштує?'),
      ],
    ),
    Scenario(
      id: 'uk_hotel',
      lang: LearnLang.uk,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Otele giriş', UiLang.en: 'Hotel check-in'},
      clipLine: 'У мене є бронювання.',
      phrases: [
        Phrase(
          id: 'uk_hotel_0',
          target: 'У мене є бронювання.',
          gloss: {
            UiLang.tr: 'Rezervasyonum var.',
            UiLang.en: 'I have a reservation.',
          },
        ),
        Phrase(
          id: 'uk_hotel_1',
          target: 'Сніданок включено?',
          gloss: {
            UiLang.tr: 'Kahvaltı dahil mi?',
            UiLang.en: 'Is breakfast included?',
          },
        ),
        Phrase(
          id: 'uk_hotel_2',
          target: 'Дуже дякую.',
          gloss: {
            UiLang.tr: 'Çok teşekkür ederim.',
            UiLang.en: 'Thank you very much.',
          },
        ),
      ],
      turns: [
        SpeakTurn(prompt: 'Good evening.', expected: 'У мене є бронювання.'),
        SpeakTurn(prompt: 'Any questions?', expected: 'Сніданок включено?'),
      ],
    ),
    Scenario(
      id: 'uk_dir',
      lang: LearnLang.uk,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Yol sormak', UiLang.en: 'Asking the way'},
      clipLine: 'Вибачте, де станція?',
      phrases: [
        Phrase(
          id: 'uk_dir_0',
          target: 'Вибачте, де станція?',
          gloss: {
            UiLang.tr: 'Afedersiniz, istasyon nerede?',
            UiLang.en: 'Excuse me, where is the station?',
          },
        ),
        Phrase(
          id: 'uk_dir_1',
          target: 'Дуже дякую.',
          gloss: {
            UiLang.tr: 'Çok teşekkür ederim.',
            UiLang.en: 'Thank you very much.',
          },
        ),
        Phrase(
          id: 'uk_dir_2',
          target: 'Я не розумію.',
          gloss: {UiLang.tr: 'Anlamıyorum.', UiLang.en: 'I do not understand.'},
        ),
      ],
      turns: [
        SpeakTurn(
          prompt: 'You stop someone.',
          expected: 'Вибачте, де станція?',
        ),
        SpeakTurn(prompt: 'They point.', expected: 'Дуже дякую.'),
      ],
    ),
    Scenario(
      id: 'uk_hi',
      lang: LearnLang.uk,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Tanışmak', UiLang.en: 'Introducing yourself'},
      clipLine: 'Привіт, мене звати Деніз.',
      phrases: [
        Phrase(
          id: 'uk_hi_0',
          target: 'Привіт, мене звати Деніз.',
          gloss: {
            UiLang.tr: 'Merhaba, adım Deniz.',
            UiLang.en: 'Hi, my name is Deniz.',
          },
        ),
        Phrase(
          id: 'uk_hi_1',
          target: 'Я з Туреччини.',
          gloss: {UiLang.tr: 'Türkiye\'denim.', UiLang.en: 'I am from Turkey.'},
        ),
        Phrase(
          id: 'uk_hi_2',
          target: 'Дуже дякую.',
          gloss: {
            UiLang.tr: 'Çok teşekkür ederim.',
            UiLang.en: 'Thank you very much.',
          },
        ),
      ],
      turns: [
        SpeakTurn(
          prompt: 'Someone says hello.',
          expected: 'Привіт, мене звати Деніз.',
        ),
        SpeakTurn(prompt: 'Where are you from?', expected: 'Я з Туреччини.'),
      ],
    ),
    Scenario(
      id: 'uk_flat',
      lang: LearnLang.uk,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Ev bakmak', UiLang.en: 'Viewing a flat'},
      clipLine: 'Я шукаю квартиру.',
      phrases: [
        Phrase(
          id: 'uk_flat_0',
          target: 'Я шукаю квартиру.',
          gloss: {
            UiLang.tr: 'Daire arıyorum.',
            UiLang.en: 'I am looking for a flat.',
          },
        ),
        Phrase(
          id: 'uk_flat_1',
          target: 'Скільки коштує оренда?',
          gloss: {
            UiLang.tr: 'Kira ne kadar?',
            UiLang.en: 'How much is the rent?',
          },
        ),
        Phrase(
          id: 'uk_flat_2',
          target: 'Чи можете ви мені допомогти?',
          gloss: {
            UiLang.tr: 'Bana yardım edebilir misiniz?',
            UiLang.en: 'Can you help me?',
          },
        ),
      ],
      turns: [
        SpeakTurn(prompt: 'The agent asks.', expected: 'Я шукаю квартиру.'),
        SpeakTurn(
          prompt: 'They show a listing.',
          expected: 'Скільки коштує оренда?',
        ),
      ],
    ),
    Scenario(
      id: 'he_cafe',
      lang: LearnLang.he,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Kafede sipariş', UiLang.en: 'Ordering at a café'},
      clipLine: 'קפה, בבקשה.',
      phrases: [
        Phrase(
          id: 'he_cafe_0',
          target: 'קפה, בבקשה.',
          gloss: {
            UiLang.tr: 'Bir kahve, lütfen.',
            UiLang.en: 'A coffee, please.',
          },
        ),
        Phrase(
          id: 'he_cafe_1',
          target: 'כמה זה עולה?',
          gloss: {UiLang.tr: 'Ne kadar?', UiLang.en: 'How much is that?'},
        ),
        Phrase(
          id: 'he_cafe_2',
          target: 'תודה רבה.',
          gloss: {
            UiLang.tr: 'Çok teşekkür ederim.',
            UiLang.en: 'Thank you very much.',
          },
        ),
      ],
      turns: [
        SpeakTurn(prompt: 'What can I get you?', expected: 'קפה, בבקשה.'),
        SpeakTurn(prompt: 'How much?', expected: 'כמה זה עולה?'),
      ],
    ),
    Scenario(
      id: 'he_hotel',
      lang: LearnLang.he,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Otele giriş', UiLang.en: 'Hotel check-in'},
      clipLine: 'יש לי הזמנה.',
      phrases: [
        Phrase(
          id: 'he_hotel_0',
          target: 'יש לי הזמנה.',
          gloss: {
            UiLang.tr: 'Rezervasyonum var.',
            UiLang.en: 'I have a reservation.',
          },
        ),
        Phrase(
          id: 'he_hotel_1',
          target: 'ארוחת בוקר כלולה?',
          gloss: {
            UiLang.tr: 'Kahvaltı dahil mi?',
            UiLang.en: 'Is breakfast included?',
          },
        ),
        Phrase(
          id: 'he_hotel_2',
          target: 'תודה רבה.',
          gloss: {
            UiLang.tr: 'Çok teşekkür ederim.',
            UiLang.en: 'Thank you very much.',
          },
        ),
      ],
      turns: [
        SpeakTurn(prompt: 'Good evening.', expected: 'יש לי הזמנה.'),
        SpeakTurn(prompt: 'Any questions?', expected: 'ארוחת בוקר כלולה?'),
      ],
    ),
    Scenario(
      id: 'he_dir',
      lang: LearnLang.he,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Yol sormak', UiLang.en: 'Asking the way'},
      clipLine: 'סליחה, איפה התחנה?',
      phrases: [
        Phrase(
          id: 'he_dir_0',
          target: 'סליחה, איפה התחנה?',
          gloss: {
            UiLang.tr: 'Afedersiniz, istasyon nerede?',
            UiLang.en: 'Excuse me, where is the station?',
          },
        ),
        Phrase(
          id: 'he_dir_1',
          target: 'תודה רבה.',
          gloss: {
            UiLang.tr: 'Çok teşekkür ederim.',
            UiLang.en: 'Thank you very much.',
          },
        ),
        Phrase(
          id: 'he_dir_2',
          target: 'אני לא מבין.',
          gloss: {UiLang.tr: 'Anlamıyorum.', UiLang.en: 'I do not understand.'},
        ),
      ],
      turns: [
        SpeakTurn(prompt: 'You stop someone.', expected: 'סליחה, איפה התחנה?'),
        SpeakTurn(prompt: 'They point.', expected: 'תודה רבה.'),
      ],
    ),
    Scenario(
      id: 'he_hi',
      lang: LearnLang.he,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Tanışmak', UiLang.en: 'Introducing yourself'},
      clipLine: 'שלום, שמי דניז.',
      phrases: [
        Phrase(
          id: 'he_hi_0',
          target: 'שלום, שמי דניז.',
          gloss: {
            UiLang.tr: 'Merhaba, adım Deniz.',
            UiLang.en: 'Hi, my name is Deniz.',
          },
        ),
        Phrase(
          id: 'he_hi_1',
          target: 'אני מטורקיה.',
          gloss: {UiLang.tr: 'Türkiye\'denim.', UiLang.en: 'I am from Turkey.'},
        ),
        Phrase(
          id: 'he_hi_2',
          target: 'תודה רבה.',
          gloss: {
            UiLang.tr: 'Çok teşekkür ederim.',
            UiLang.en: 'Thank you very much.',
          },
        ),
      ],
      turns: [
        SpeakTurn(prompt: 'Someone says hello.', expected: 'שלום, שמי דניז.'),
        SpeakTurn(prompt: 'Where are you from?', expected: 'אני מטורקיה.'),
      ],
    ),
    Scenario(
      id: 'he_flat',
      lang: LearnLang.he,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Ev bakmak', UiLang.en: 'Viewing a flat'},
      clipLine: 'אני מחפש דירה.',
      phrases: [
        Phrase(
          id: 'he_flat_0',
          target: 'אני מחפש דירה.',
          gloss: {
            UiLang.tr: 'Daire arıyorum.',
            UiLang.en: 'I am looking for a flat.',
          },
        ),
        Phrase(
          id: 'he_flat_1',
          target: 'כמה שכר הדירה?',
          gloss: {
            UiLang.tr: 'Kira ne kadar?',
            UiLang.en: 'How much is the rent?',
          },
        ),
        Phrase(
          id: 'he_flat_2',
          target: 'אתה יכול לעזור לי?',
          gloss: {
            UiLang.tr: 'Bana yardım edebilir misiniz?',
            UiLang.en: 'Can you help me?',
          },
        ),
      ],
      turns: [
        SpeakTurn(prompt: 'The agent asks.', expected: 'אני מחפש דירה.'),
        SpeakTurn(prompt: 'They show a listing.', expected: 'כמה שכר הדירה?'),
      ],
    ),
    Scenario(
      id: 'fa_cafe',
      lang: LearnLang.fa,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Kafede sipariş', UiLang.en: 'Ordering at a café'},
      clipLine: 'یک قهوه، لطفاً.',
      phrases: [
        Phrase(
          id: 'fa_cafe_0',
          target: 'یک قهوه، لطفاً.',
          gloss: {
            UiLang.tr: 'Bir kahve, lütfen.',
            UiLang.en: 'A coffee, please.',
          },
        ),
        Phrase(
          id: 'fa_cafe_1',
          target: 'چقدر می‌شود؟',
          gloss: {UiLang.tr: 'Ne kadar?', UiLang.en: 'How much is that?'},
        ),
        Phrase(
          id: 'fa_cafe_2',
          target: 'خیلی ممنون.',
          gloss: {
            UiLang.tr: 'Çok teşekkür ederim.',
            UiLang.en: 'Thank you very much.',
          },
        ),
      ],
      turns: [
        SpeakTurn(prompt: 'What can I get you?', expected: 'یک قهوه، لطفاً.'),
        SpeakTurn(prompt: 'How much?', expected: 'چقدر می‌شود؟'),
      ],
    ),
    Scenario(
      id: 'fa_hotel',
      lang: LearnLang.fa,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Otele giriş', UiLang.en: 'Hotel check-in'},
      clipLine: 'من رزرو دارم.',
      phrases: [
        Phrase(
          id: 'fa_hotel_0',
          target: 'من رزرو دارم.',
          gloss: {
            UiLang.tr: 'Rezervasyonum var.',
            UiLang.en: 'I have a reservation.',
          },
        ),
        Phrase(
          id: 'fa_hotel_1',
          target: 'صبحانه شامل می‌شود؟',
          gloss: {
            UiLang.tr: 'Kahvaltı dahil mi?',
            UiLang.en: 'Is breakfast included?',
          },
        ),
        Phrase(
          id: 'fa_hotel_2',
          target: 'خیلی ممنون.',
          gloss: {
            UiLang.tr: 'Çok teşekkür ederim.',
            UiLang.en: 'Thank you very much.',
          },
        ),
      ],
      turns: [
        SpeakTurn(prompt: 'Good evening.', expected: 'من رزرو دارم.'),
        SpeakTurn(prompt: 'Any questions?', expected: 'صبحانه شامل می‌شود؟'),
      ],
    ),
    Scenario(
      id: 'fa_dir',
      lang: LearnLang.fa,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Yol sormak', UiLang.en: 'Asking the way'},
      clipLine: 'ببخشید، ایستگاه کجاست؟',
      phrases: [
        Phrase(
          id: 'fa_dir_0',
          target: 'ببخشید، ایستگاه کجاست؟',
          gloss: {
            UiLang.tr: 'Afedersiniz, istasyon nerede?',
            UiLang.en: 'Excuse me, where is the station?',
          },
        ),
        Phrase(
          id: 'fa_dir_1',
          target: 'خیلی ممنون.',
          gloss: {
            UiLang.tr: 'Çok teşekkür ederim.',
            UiLang.en: 'Thank you very much.',
          },
        ),
        Phrase(
          id: 'fa_dir_2',
          target: 'نمی‌فهمم.',
          gloss: {UiLang.tr: 'Anlamıyorum.', UiLang.en: 'I do not understand.'},
        ),
      ],
      turns: [
        SpeakTurn(
          prompt: 'You stop someone.',
          expected: 'ببخشید، ایستگاه کجاست؟',
        ),
        SpeakTurn(prompt: 'They point.', expected: 'خیلی ممنون.'),
      ],
    ),
    Scenario(
      id: 'fa_hi',
      lang: LearnLang.fa,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Tanışmak', UiLang.en: 'Introducing yourself'},
      clipLine: 'سلام، اسم من دنیز است.',
      phrases: [
        Phrase(
          id: 'fa_hi_0',
          target: 'سلام، اسم من دنیز است.',
          gloss: {
            UiLang.tr: 'Merhaba, adım Deniz.',
            UiLang.en: 'Hi, my name is Deniz.',
          },
        ),
        Phrase(
          id: 'fa_hi_1',
          target: 'من از ترکیه هستم.',
          gloss: {UiLang.tr: 'Türkiye\'denim.', UiLang.en: 'I am from Turkey.'},
        ),
        Phrase(
          id: 'fa_hi_2',
          target: 'خیلی ممنون.',
          gloss: {
            UiLang.tr: 'Çok teşekkür ederim.',
            UiLang.en: 'Thank you very much.',
          },
        ),
      ],
      turns: [
        SpeakTurn(
          prompt: 'Someone says hello.',
          expected: 'سلام، اسم من دنیز است.',
        ),
        SpeakTurn(prompt: 'Where are you from?', expected: 'من از ترکیه هستم.'),
      ],
    ),
    Scenario(
      id: 'fa_flat',
      lang: LearnLang.fa,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Ev bakmak', UiLang.en: 'Viewing a flat'},
      clipLine: 'دنبال آپارتمان می‌گردم.',
      phrases: [
        Phrase(
          id: 'fa_flat_0',
          target: 'دنبال آپارتمان می‌گردم.',
          gloss: {
            UiLang.tr: 'Daire arıyorum.',
            UiLang.en: 'I am looking for a flat.',
          },
        ),
        Phrase(
          id: 'fa_flat_1',
          target: 'اجاره چقدر است؟',
          gloss: {
            UiLang.tr: 'Kira ne kadar?',
            UiLang.en: 'How much is the rent?',
          },
        ),
        Phrase(
          id: 'fa_flat_2',
          target: 'می‌توانید کمکم کنید؟',
          gloss: {
            UiLang.tr: 'Bana yardım edebilir misiniz?',
            UiLang.en: 'Can you help me?',
          },
        ),
      ],
      turns: [
        SpeakTurn(
          prompt: 'The agent asks.',
          expected: 'دنبال آپارتمان می‌گردم.',
        ),
        SpeakTurn(prompt: 'They show a listing.', expected: 'اجاره چقدر است؟'),
      ],
    ),
    Scenario(
      id: 'sw_cafe',
      lang: LearnLang.sw,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Kafede sipariş', UiLang.en: 'Ordering at a café'},
      clipLine: 'Kahawa moja, tafadhali.',
      phrases: [
        Phrase(
          id: 'sw_cafe_0',
          target: 'Kahawa moja, tafadhali.',
          gloss: {
            UiLang.tr: 'Bir kahve, lütfen.',
            UiLang.en: 'A coffee, please.',
          },
        ),
        Phrase(
          id: 'sw_cafe_1',
          target: 'Ni bei gani?',
          gloss: {UiLang.tr: 'Ne kadar?', UiLang.en: 'How much is that?'},
        ),
        Phrase(
          id: 'sw_cafe_2',
          target: 'Asante sana.',
          gloss: {
            UiLang.tr: 'Çok teşekkür ederim.',
            UiLang.en: 'Thank you very much.',
          },
        ),
      ],
      turns: [
        SpeakTurn(
          prompt: 'What can I get you?',
          expected: 'Kahawa moja, tafadhali.',
        ),
        SpeakTurn(prompt: 'How much?', expected: 'Ni bei gani?'),
      ],
    ),
    Scenario(
      id: 'sw_hotel',
      lang: LearnLang.sw,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Otele giriş', UiLang.en: 'Hotel check-in'},
      clipLine: 'Nina uhifadhi.',
      phrases: [
        Phrase(
          id: 'sw_hotel_0',
          target: 'Nina uhifadhi.',
          gloss: {
            UiLang.tr: 'Rezervasyonum var.',
            UiLang.en: 'I have a reservation.',
          },
        ),
        Phrase(
          id: 'sw_hotel_1',
          target: 'Kifungua kinywa kimejumuishwa?',
          gloss: {
            UiLang.tr: 'Kahvaltı dahil mi?',
            UiLang.en: 'Is breakfast included?',
          },
        ),
        Phrase(
          id: 'sw_hotel_2',
          target: 'Asante sana.',
          gloss: {
            UiLang.tr: 'Çok teşekkür ederim.',
            UiLang.en: 'Thank you very much.',
          },
        ),
      ],
      turns: [
        SpeakTurn(prompt: 'Good evening.', expected: 'Nina uhifadhi.'),
        SpeakTurn(
          prompt: 'Any questions?',
          expected: 'Kifungua kinywa kimejumuishwa?',
        ),
      ],
    ),
    Scenario(
      id: 'sw_dir',
      lang: LearnLang.sw,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Yol sormak', UiLang.en: 'Asking the way'},
      clipLine: 'Samahani, kituo kiko wapi?',
      phrases: [
        Phrase(
          id: 'sw_dir_0',
          target: 'Samahani, kituo kiko wapi?',
          gloss: {
            UiLang.tr: 'Afedersiniz, istasyon nerede?',
            UiLang.en: 'Excuse me, where is the station?',
          },
        ),
        Phrase(
          id: 'sw_dir_1',
          target: 'Asante sana.',
          gloss: {
            UiLang.tr: 'Çok teşekkür ederim.',
            UiLang.en: 'Thank you very much.',
          },
        ),
        Phrase(
          id: 'sw_dir_2',
          target: 'Sielewi.',
          gloss: {UiLang.tr: 'Anlamıyorum.', UiLang.en: 'I do not understand.'},
        ),
      ],
      turns: [
        SpeakTurn(
          prompt: 'You stop someone.',
          expected: 'Samahani, kituo kiko wapi?',
        ),
        SpeakTurn(prompt: 'They point.', expected: 'Asante sana.'),
      ],
    ),
    Scenario(
      id: 'sw_hi',
      lang: LearnLang.sw,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Tanışmak', UiLang.en: 'Introducing yourself'},
      clipLine: 'Habari, jina langu ni Deniz.',
      phrases: [
        Phrase(
          id: 'sw_hi_0',
          target: 'Habari, jina langu ni Deniz.',
          gloss: {
            UiLang.tr: 'Merhaba, adım Deniz.',
            UiLang.en: 'Hi, my name is Deniz.',
          },
        ),
        Phrase(
          id: 'sw_hi_1',
          target: 'Ninatoka Uturuki.',
          gloss: {UiLang.tr: 'Türkiye\'denim.', UiLang.en: 'I am from Turkey.'},
        ),
        Phrase(
          id: 'sw_hi_2',
          target: 'Asante sana.',
          gloss: {
            UiLang.tr: 'Çok teşekkür ederim.',
            UiLang.en: 'Thank you very much.',
          },
        ),
      ],
      turns: [
        SpeakTurn(
          prompt: 'Someone says hello.',
          expected: 'Habari, jina langu ni Deniz.',
        ),
        SpeakTurn(prompt: 'Where are you from?', expected: 'Ninatoka Uturuki.'),
      ],
    ),
    Scenario(
      id: 'sw_flat',
      lang: LearnLang.sw,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Ev bakmak', UiLang.en: 'Viewing a flat'},
      clipLine: 'Ninatafuta nyumba.',
      phrases: [
        Phrase(
          id: 'sw_flat_0',
          target: 'Ninatafuta nyumba.',
          gloss: {
            UiLang.tr: 'Daire arıyorum.',
            UiLang.en: 'I am looking for a flat.',
          },
        ),
        Phrase(
          id: 'sw_flat_1',
          target: 'Kodi ni kiasi gani?',
          gloss: {
            UiLang.tr: 'Kira ne kadar?',
            UiLang.en: 'How much is the rent?',
          },
        ),
        Phrase(
          id: 'sw_flat_2',
          target: 'Unaweza kunisaidia?',
          gloss: {
            UiLang.tr: 'Bana yardım edebilir misiniz?',
            UiLang.en: 'Can you help me?',
          },
        ),
      ],
      turns: [
        SpeakTurn(prompt: 'The agent asks.', expected: 'Ninatafuta nyumba.'),
        SpeakTurn(
          prompt: 'They show a listing.',
          expected: 'Kodi ni kiasi gani?',
        ),
      ],
    ),
    // İspanyolca bonus: NIE + kira sözleşmesi
    Scenario(
      id: 'es_nie',
      lang: LearnLang.es,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'NIE / kayıt', UiLang.en: 'NIE / registration'},
      clipLine: 'Quiero solicitar el NIE.',
      phrases: [
        Phrase(
          id: 'es_nie_0',
          target: 'Quiero solicitar el NIE.',
          gloss: {
            UiLang.tr: 'NIE başvurusu yapmak istiyorum.',
            UiLang.en: 'I want to apply for the NIE.',
          },
        ),
        Phrase(
          id: 'es_nie_1',
          target: 'Necesito empadronarme.',
          gloss: {
            UiLang.tr: 'Belediyeye kayıt olmam lazım.',
            UiLang.en: 'I need to register at the town hall.',
          },
        ),
        Phrase(
          id: 'es_nie_2',
          target: '¿Qué documentos necesito?',
          gloss: {
            UiLang.tr: 'Hangi evraklar lazım?',
            UiLang.en: 'What documents do I need?',
          },
        ),
      ],
      turns: [
        SpeakTurn(
          prompt: 'En extranjería te preguntan.',
          expected: 'Quiero solicitar el NIE.',
        ),
        SpeakTurn(
          prompt: 'Te piden papeles.',
          expected: '¿Qué documentos necesito?',
        ),
      ],
    ),
    Scenario(
      id: 'es_contrato',
      lang: LearnLang.es,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Kira sözleşmesi', UiLang.en: 'Rental contract'},
      clipLine: '¿La fianza es de un mes?',
      phrases: [
        Phrase(
          id: 'es_contrato_0',
          target: '¿La fianza es de un mes?',
          gloss: {
            UiLang.tr: 'Depozito bir aylık mı?',
            UiLang.en: 'Is the deposit one month?',
          },
        ),
        Phrase(
          id: 'es_contrato_1',
          target: '¿Incluye agua y luz?',
          gloss: {
            UiLang.tr: 'Su ve elektrik dahil mi?',
            UiLang.en: 'Does it include water and electricity?',
          },
        ),
        Phrase(
          id: 'es_contrato_2',
          target: 'Quiero leer el contrato.',
          gloss: {
            UiLang.tr: 'Sözleşmeyi okumak istiyorum.',
            UiLang.en: 'I want to read the contract.',
          },
        ),
      ],
      turns: [
        SpeakTurn(
          prompt: 'El casero habla de dinero.',
          expected: '¿La fianza es de un mes?',
        ),
        SpeakTurn(
          prompt: 'Te da papeles.',
          expected: 'Quiero leer el contrato.',
        ),
      ],
    ),
    // === EK SAHNELER (shop, bill, airport) — 30 dil ===
    Scenario(
      id: 'en_shop',
      lang: LearnLang.en,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Markette alışveriş', UiLang.en: 'At the market'},
      clipLine: 'How much does this cost?',
      phrases: [
        Phrase(
          id: 'en_shop_0',
          target: 'How much does this cost?',
          gloss: {
            UiLang.tr: 'Bu ne kadar?',
            UiLang.en: 'How much does this cost?',
          },
        ),
        Phrase(
          id: 'en_shop_1',
          target: 'I will take this one.',
          gloss: {
            UiLang.tr: 'Bunu alayım.',
            UiLang.en: 'I will take this one.',
          },
        ),
        Phrase(
          id: 'en_shop_2',
          target: 'Do you take card?',
          gloss: {
            UiLang.tr: 'Kart geçerli mi?',
            UiLang.en: 'Do you take card?',
          },
        ),
      ],
      turns: [
        SpeakTurn(
          prompt: 'You hold an item.',
          expected: 'How much does this cost?',
        ),
        SpeakTurn(prompt: 'You want it.', expected: 'I will take this one.'),
      ],
    ),
    Scenario(
      id: 'en_bill',
      lang: LearnLang.en,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Hesabı istemek', UiLang.en: 'Asking for the bill'},
      clipLine: 'Could I get the check, please?',
      phrases: [
        Phrase(
          id: 'en_bill_0',
          target: 'Could I get the check, please?',
          gloss: {
            UiLang.tr: 'Hesabı alabilir miyim?',
            UiLang.en: 'Could I get the check, please?',
          },
        ),
        Phrase(
          id: 'en_bill_1',
          target: 'We would like to pay together.',
          gloss: {
            UiLang.tr: 'Birlikte ödemek istiyoruz.',
            UiLang.en: 'We would like to pay together.',
          },
        ),
        Phrase(
          id: 'en_bill_2',
          target: 'Keep the change.',
          gloss: {UiLang.tr: 'Üstü kalsın.', UiLang.en: 'Keep the change.'},
        ),
      ],
      turns: [
        SpeakTurn(
          prompt: 'You catch the waiter.',
          expected: 'Could I get the check, please?',
        ),
        SpeakTurn(
          prompt: 'Split or together?',
          expected: 'We would like to pay together.',
        ),
      ],
    ),
    Scenario(
      id: 'en_airport',
      lang: LearnLang.en,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Havaalanı check-in', UiLang.en: 'Airport check-in'},
      clipLine: 'I have a reservation.',
      phrases: [
        Phrase(
          id: 'en_airport_0',
          target: 'I have a reservation.',
          gloss: {
            UiLang.tr: 'Rezervasyonum var.',
            UiLang.en: 'I have a reservation.',
          },
        ),
        Phrase(
          id: 'en_airport_1',
          target: 'A window seat, please.',
          gloss: {
            UiLang.tr: 'Pencere kenarı, lütfen.',
            UiLang.en: 'A window seat, please.',
          },
        ),
        Phrase(
          id: 'en_airport_2',
          target: 'Is this the queue for boarding?',
          gloss: {
            UiLang.tr: 'Biniş kuyruğu bu mu?',
            UiLang.en: 'Is this the queue for boarding?',
          },
        ),
      ],
      turns: [
        SpeakTurn(
          prompt: 'The agent greets you.',
          expected: 'I have a reservation.',
        ),
        SpeakTurn(
          prompt: 'Window or aisle?',
          expected: 'A window seat, please.',
        ),
      ],
    ),
    Scenario(
      id: 'es_shop',
      lang: LearnLang.es,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Markette alışveriş', UiLang.en: 'At the market'},
      clipLine: '¿Cuánto cuesta esto?',
      phrases: [
        Phrase(
          id: 'es_shop_0',
          target: '¿Cuánto cuesta esto?',
          gloss: {
            UiLang.tr: 'Bu ne kadar?',
            UiLang.en: 'How much does this cost?',
          },
        ),
        Phrase(
          id: 'es_shop_1',
          target: 'Me llevo este.',
          gloss: {
            UiLang.tr: 'Bunu alayım.',
            UiLang.en: 'I will take this one.',
          },
        ),
        Phrase(
          id: 'es_shop_2',
          target: '¿Se puede pagar con tarjeta?',
          gloss: {
            UiLang.tr: 'Kart geçerli mi?',
            UiLang.en: 'Do you take card?',
          },
        ),
      ],
      turns: [
        SpeakTurn(
          prompt: 'You hold an item.',
          expected: '¿Cuánto cuesta esto?',
        ),
        SpeakTurn(prompt: 'You want it.', expected: 'Me llevo este.'),
      ],
    ),
    Scenario(
      id: 'es_bill',
      lang: LearnLang.es,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Hesabı istemek', UiLang.en: 'Asking for the bill'},
      clipLine: 'La cuenta, por favor.',
      phrases: [
        Phrase(
          id: 'es_bill_0',
          target: 'La cuenta, por favor.',
          gloss: {
            UiLang.tr: 'Hesabı alabilir miyim?',
            UiLang.en: 'Could I get the check, please?',
          },
        ),
        Phrase(
          id: 'es_bill_1',
          target: 'Queremos pagar juntos.',
          gloss: {
            UiLang.tr: 'Birlikte ödemek istiyoruz.',
            UiLang.en: 'We would like to pay together.',
          },
        ),
        Phrase(
          id: 'es_bill_2',
          target: 'Quédese con el cambio.',
          gloss: {UiLang.tr: 'Üstü kalsın.', UiLang.en: 'Keep the change.'},
        ),
      ],
      turns: [
        SpeakTurn(
          prompt: 'You catch the waiter.',
          expected: 'La cuenta, por favor.',
        ),
        SpeakTurn(
          prompt: 'Split or together?',
          expected: 'Queremos pagar juntos.',
        ),
      ],
    ),
    Scenario(
      id: 'es_airport',
      lang: LearnLang.es,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Havaalanı check-in', UiLang.en: 'Airport check-in'},
      clipLine: 'Tengo una reserva.',
      phrases: [
        Phrase(
          id: 'es_airport_0',
          target: 'Tengo una reserva.',
          gloss: {
            UiLang.tr: 'Rezervasyonum var.',
            UiLang.en: 'I have a reservation.',
          },
        ),
        Phrase(
          id: 'es_airport_1',
          target: 'Ventanilla, por favor.',
          gloss: {
            UiLang.tr: 'Pencere kenarı, lütfen.',
            UiLang.en: 'A window seat, please.',
          },
        ),
        Phrase(
          id: 'es_airport_2',
          target: '¿Esta es la cola para embarcar?',
          gloss: {
            UiLang.tr: 'Biniş kuyruğu bu mu?',
            UiLang.en: 'Is this the queue for boarding?',
          },
        ),
      ],
      turns: [
        SpeakTurn(
          prompt: 'The agent greets you.',
          expected: 'Tengo una reserva.',
        ),
        SpeakTurn(
          prompt: 'Window or aisle?',
          expected: 'Ventanilla, por favor.',
        ),
      ],
    ),
    Scenario(
      id: 'de_shop',
      lang: LearnLang.de,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Markette alışveriş', UiLang.en: 'At the market'},
      clipLine: 'Was kostet das?',
      phrases: [
        Phrase(
          id: 'de_shop_0',
          target: 'Was kostet das?',
          gloss: {
            UiLang.tr: 'Bu ne kadar?',
            UiLang.en: 'How much does this cost?',
          },
        ),
        Phrase(
          id: 'de_shop_1',
          target: 'Ich nehme das hier.',
          gloss: {
            UiLang.tr: 'Bunu alayım.',
            UiLang.en: 'I will take this one.',
          },
        ),
        Phrase(
          id: 'de_shop_2',
          target: 'Kann ich mit Karte zahlen?',
          gloss: {
            UiLang.tr: 'Kart geçerli mi?',
            UiLang.en: 'Do you take card?',
          },
        ),
      ],
      turns: [
        SpeakTurn(prompt: 'You hold an item.', expected: 'Was kostet das?'),
        SpeakTurn(prompt: 'You want it.', expected: 'Ich nehme das hier.'),
      ],
    ),
    Scenario(
      id: 'de_bill',
      lang: LearnLang.de,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Hesabı istemek', UiLang.en: 'Asking for the bill'},
      clipLine: 'Die Rechnung, bitte.',
      phrases: [
        Phrase(
          id: 'de_bill_0',
          target: 'Die Rechnung, bitte.',
          gloss: {
            UiLang.tr: 'Hesabı alabilir miyim?',
            UiLang.en: 'Could I get the check, please?',
          },
        ),
        Phrase(
          id: 'de_bill_1',
          target: 'Wir möchten zusammen zahlen.',
          gloss: {
            UiLang.tr: 'Birlikte ödemek istiyoruz.',
            UiLang.en: 'We would like to pay together.',
          },
        ),
        Phrase(
          id: 'de_bill_2',
          target: 'Stimmt so.',
          gloss: {UiLang.tr: 'Üstü kalsın.', UiLang.en: 'Keep the change.'},
        ),
      ],
      turns: [
        SpeakTurn(
          prompt: 'You catch the waiter.',
          expected: 'Die Rechnung, bitte.',
        ),
        SpeakTurn(
          prompt: 'Split or together?',
          expected: 'Wir möchten zusammen zahlen.',
        ),
      ],
    ),
    Scenario(
      id: 'de_airport',
      lang: LearnLang.de,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Havaalanı check-in', UiLang.en: 'Airport check-in'},
      clipLine: 'Ich habe eine Reservierung.',
      phrases: [
        Phrase(
          id: 'de_airport_0',
          target: 'Ich habe eine Reservierung.',
          gloss: {
            UiLang.tr: 'Rezervasyonum var.',
            UiLang.en: 'I have a reservation.',
          },
        ),
        Phrase(
          id: 'de_airport_1',
          target: 'Ein Fensterplatz, bitte.',
          gloss: {
            UiLang.tr: 'Pencere kenarı, lütfen.',
            UiLang.en: 'A window seat, please.',
          },
        ),
        Phrase(
          id: 'de_airport_2',
          target: 'Ist das die Schlange zum Boarding?',
          gloss: {
            UiLang.tr: 'Biniş kuyruğu bu mu?',
            UiLang.en: 'Is this the queue for boarding?',
          },
        ),
      ],
      turns: [
        SpeakTurn(
          prompt: 'The agent greets you.',
          expected: 'Ich habe eine Reservierung.',
        ),
        SpeakTurn(
          prompt: 'Window or aisle?',
          expected: 'Ein Fensterplatz, bitte.',
        ),
      ],
    ),
    Scenario(
      id: 'fr_shop',
      lang: LearnLang.fr,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Markette alışveriş', UiLang.en: 'At the market'},
      clipLine: 'Ça coûte combien ?',
      phrases: [
        Phrase(
          id: 'fr_shop_0',
          target: 'Ça coûte combien ?',
          gloss: {
            UiLang.tr: 'Bu ne kadar?',
            UiLang.en: 'How much does this cost?',
          },
        ),
        Phrase(
          id: 'fr_shop_1',
          target: 'Je prends celui-ci.',
          gloss: {
            UiLang.tr: 'Bunu alayım.',
            UiLang.en: 'I will take this one.',
          },
        ),
        Phrase(
          id: 'fr_shop_2',
          target: 'Vous prenez la carte ?',
          gloss: {
            UiLang.tr: 'Kart geçerli mi?',
            UiLang.en: 'Do you take card?',
          },
        ),
      ],
      turns: [
        SpeakTurn(prompt: 'You hold an item.', expected: 'Ça coûte combien ?'),
        SpeakTurn(prompt: 'You want it.', expected: 'Je prends celui-ci.'),
      ],
    ),
    Scenario(
      id: 'fr_bill',
      lang: LearnLang.fr,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Hesabı istemek', UiLang.en: 'Asking for the bill'},
      clipLine: 'L\'addition, s\'il vous plaît.',
      phrases: [
        Phrase(
          id: 'fr_bill_0',
          target: 'L\'addition, s\'il vous plaît.',
          gloss: {
            UiLang.tr: 'Hesabı alabilir miyim?',
            UiLang.en: 'Could I get the check, please?',
          },
        ),
        Phrase(
          id: 'fr_bill_1',
          target: 'On voudrait payer ensemble.',
          gloss: {
            UiLang.tr: 'Birlikte ödemek istiyoruz.',
            UiLang.en: 'We would like to pay together.',
          },
        ),
        Phrase(
          id: 'fr_bill_2',
          target: 'Gardez la monnaie.',
          gloss: {UiLang.tr: 'Üstü kalsın.', UiLang.en: 'Keep the change.'},
        ),
      ],
      turns: [
        SpeakTurn(
          prompt: 'You catch the waiter.',
          expected: 'L\'addition, s\'il vous plaît.',
        ),
        SpeakTurn(
          prompt: 'Split or together?',
          expected: 'On voudrait payer ensemble.',
        ),
      ],
    ),
    Scenario(
      id: 'fr_airport',
      lang: LearnLang.fr,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Havaalanı check-in', UiLang.en: 'Airport check-in'},
      clipLine: 'J\'ai une réservation.',
      phrases: [
        Phrase(
          id: 'fr_airport_0',
          target: 'J\'ai une réservation.',
          gloss: {
            UiLang.tr: 'Rezervasyonum var.',
            UiLang.en: 'I have a reservation.',
          },
        ),
        Phrase(
          id: 'fr_airport_1',
          target: 'Côté fenêtre, s\'il vous plaît.',
          gloss: {
            UiLang.tr: 'Pencere kenarı, lütfen.',
            UiLang.en: 'A window seat, please.',
          },
        ),
        Phrase(
          id: 'fr_airport_2',
          target: 'C\'est la file d\'embarquement ?',
          gloss: {
            UiLang.tr: 'Biniş kuyruğu bu mu?',
            UiLang.en: 'Is this the queue for boarding?',
          },
        ),
      ],
      turns: [
        SpeakTurn(
          prompt: 'The agent greets you.',
          expected: 'J\'ai une réservation.',
        ),
        SpeakTurn(
          prompt: 'Window or aisle?',
          expected: 'Côté fenêtre, s\'il vous plaît.',
        ),
      ],
    ),
    Scenario(
      id: 'nl_shop',
      lang: LearnLang.nl,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Markette alışveriş', UiLang.en: 'At the market'},
      clipLine: 'Wat kost dit?',
      phrases: [
        Phrase(
          id: 'nl_shop_0',
          target: 'Wat kost dit?',
          gloss: {
            UiLang.tr: 'Bu ne kadar?',
            UiLang.en: 'How much does this cost?',
          },
        ),
        Phrase(
          id: 'nl_shop_1',
          target: 'Deze neem ik.',
          gloss: {
            UiLang.tr: 'Bunu alayım.',
            UiLang.en: 'I will take this one.',
          },
        ),
        Phrase(
          id: 'nl_shop_2',
          target: 'Kan ik pinnen?',
          gloss: {
            UiLang.tr: 'Kart geçerli mi?',
            UiLang.en: 'Do you take card?',
          },
        ),
      ],
      turns: [
        SpeakTurn(prompt: 'You hold an item.', expected: 'Wat kost dit?'),
        SpeakTurn(prompt: 'You want it.', expected: 'Deze neem ik.'),
      ],
    ),
    Scenario(
      id: 'nl_bill',
      lang: LearnLang.nl,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Hesabı istemek', UiLang.en: 'Asking for the bill'},
      clipLine: 'Mag ik de rekening?',
      phrases: [
        Phrase(
          id: 'nl_bill_0',
          target: 'Mag ik de rekening?',
          gloss: {
            UiLang.tr: 'Hesabı alabilir miyim?',
            UiLang.en: 'Could I get the check, please?',
          },
        ),
        Phrase(
          id: 'nl_bill_1',
          target: 'We willen samen betalen.',
          gloss: {
            UiLang.tr: 'Birlikte ödemek istiyoruz.',
            UiLang.en: 'We would like to pay together.',
          },
        ),
        Phrase(
          id: 'nl_bill_2',
          target: 'Laat maar zitten.',
          gloss: {UiLang.tr: 'Üstü kalsın.', UiLang.en: 'Keep the change.'},
        ),
      ],
      turns: [
        SpeakTurn(
          prompt: 'You catch the waiter.',
          expected: 'Mag ik de rekening?',
        ),
        SpeakTurn(
          prompt: 'Split or together?',
          expected: 'We willen samen betalen.',
        ),
      ],
    ),
    Scenario(
      id: 'nl_airport',
      lang: LearnLang.nl,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Havaalanı check-in', UiLang.en: 'Airport check-in'},
      clipLine: 'Ik heb een reservering.',
      phrases: [
        Phrase(
          id: 'nl_airport_0',
          target: 'Ik heb een reservering.',
          gloss: {
            UiLang.tr: 'Rezervasyonum var.',
            UiLang.en: 'I have a reservation.',
          },
        ),
        Phrase(
          id: 'nl_airport_1',
          target: 'Een raamstoel, alstublieft.',
          gloss: {
            UiLang.tr: 'Pencere kenarı, lütfen.',
            UiLang.en: 'A window seat, please.',
          },
        ),
        Phrase(
          id: 'nl_airport_2',
          target: 'Is dit de rij voor boarding?',
          gloss: {
            UiLang.tr: 'Biniş kuyruğu bu mu?',
            UiLang.en: 'Is this the queue for boarding?',
          },
        ),
      ],
      turns: [
        SpeakTurn(
          prompt: 'The agent greets you.',
          expected: 'Ik heb een reservering.',
        ),
        SpeakTurn(
          prompt: 'Window or aisle?',
          expected: 'Een raamstoel, alstublieft.',
        ),
      ],
    ),
    Scenario(
      id: 'ar_shop',
      lang: LearnLang.ar,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Markette alışveriş', UiLang.en: 'At the market'},
      clipLine: 'كم ثمن هذا؟',
      phrases: [
        Phrase(
          id: 'ar_shop_0',
          target: 'كم ثمن هذا؟',
          gloss: {
            UiLang.tr: 'Bu ne kadar?',
            UiLang.en: 'How much does this cost?',
          },
        ),
        Phrase(
          id: 'ar_shop_1',
          target: 'آخذ هذا.',
          gloss: {
            UiLang.tr: 'Bunu alayım.',
            UiLang.en: 'I will take this one.',
          },
        ),
        Phrase(
          id: 'ar_shop_2',
          target: 'هل تقبلون البطاقة؟',
          gloss: {
            UiLang.tr: 'Kart geçerli mi?',
            UiLang.en: 'Do you take card?',
          },
        ),
      ],
      turns: [
        SpeakTurn(prompt: 'You hold an item.', expected: 'كم ثمن هذا؟'),
        SpeakTurn(prompt: 'You want it.', expected: 'آخذ هذا.'),
      ],
    ),
    Scenario(
      id: 'ar_bill',
      lang: LearnLang.ar,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Hesabı istemek', UiLang.en: 'Asking for the bill'},
      clipLine: 'الحساب، من فضلك.',
      phrases: [
        Phrase(
          id: 'ar_bill_0',
          target: 'الحساب، من فضلك.',
          gloss: {
            UiLang.tr: 'Hesabı alabilir miyim?',
            UiLang.en: 'Could I get the check, please?',
          },
        ),
        Phrase(
          id: 'ar_bill_1',
          target: 'نريد أن ندفع معا.',
          gloss: {
            UiLang.tr: 'Birlikte ödemek istiyoruz.',
            UiLang.en: 'We would like to pay together.',
          },
        ),
        Phrase(
          id: 'ar_bill_2',
          target: 'احتفظ بالباقي.',
          gloss: {UiLang.tr: 'Üstü kalsın.', UiLang.en: 'Keep the change.'},
        ),
      ],
      turns: [
        SpeakTurn(
          prompt: 'You catch the waiter.',
          expected: 'الحساب، من فضلك.',
        ),
        SpeakTurn(prompt: 'Split or together?', expected: 'نريد أن ندفع معا.'),
      ],
    ),
    Scenario(
      id: 'ar_airport',
      lang: LearnLang.ar,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Havaalanı check-in', UiLang.en: 'Airport check-in'},
      clipLine: 'عندي حجز.',
      phrases: [
        Phrase(
          id: 'ar_airport_0',
          target: 'عندي حجز.',
          gloss: {
            UiLang.tr: 'Rezervasyonum var.',
            UiLang.en: 'I have a reservation.',
          },
        ),
        Phrase(
          id: 'ar_airport_1',
          target: 'مقعد بجانب النافذة.',
          gloss: {
            UiLang.tr: 'Pencere kenarı, lütfen.',
            UiLang.en: 'A window seat, please.',
          },
        ),
        Phrase(
          id: 'ar_airport_2',
          target: 'هل هذا الطابور للصعود؟',
          gloss: {
            UiLang.tr: 'Biniş kuyruğu bu mu?',
            UiLang.en: 'Is this the queue for boarding?',
          },
        ),
      ],
      turns: [
        SpeakTurn(prompt: 'The agent greets you.', expected: 'عندي حجز.'),
        SpeakTurn(prompt: 'Window or aisle?', expected: 'مقعد بجانب النافذة.'),
      ],
    ),
    Scenario(
      id: 'pt_shop',
      lang: LearnLang.pt,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Markette alışveriş', UiLang.en: 'At the market'},
      clipLine: 'Quanto custa isto?',
      phrases: [
        Phrase(
          id: 'pt_shop_0',
          target: 'Quanto custa isto?',
          gloss: {
            UiLang.tr: 'Bu ne kadar?',
            UiLang.en: 'How much does this cost?',
          },
        ),
        Phrase(
          id: 'pt_shop_1',
          target: 'Vou levar este.',
          gloss: {
            UiLang.tr: 'Bunu alayım.',
            UiLang.en: 'I will take this one.',
          },
        ),
        Phrase(
          id: 'pt_shop_2',
          target: 'Aceitam cartão?',
          gloss: {
            UiLang.tr: 'Kart geçerli mi?',
            UiLang.en: 'Do you take card?',
          },
        ),
      ],
      turns: [
        SpeakTurn(prompt: 'You hold an item.', expected: 'Quanto custa isto?'),
        SpeakTurn(prompt: 'You want it.', expected: 'Vou levar este.'),
      ],
    ),
    Scenario(
      id: 'pt_bill',
      lang: LearnLang.pt,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Hesabı istemek', UiLang.en: 'Asking for the bill'},
      clipLine: 'A conta, por favor.',
      phrases: [
        Phrase(
          id: 'pt_bill_0',
          target: 'A conta, por favor.',
          gloss: {
            UiLang.tr: 'Hesabı alabilir miyim?',
            UiLang.en: 'Could I get the check, please?',
          },
        ),
        Phrase(
          id: 'pt_bill_1',
          target: 'Queremos pagar juntos.',
          gloss: {
            UiLang.tr: 'Birlikte ödemek istiyoruz.',
            UiLang.en: 'We would like to pay together.',
          },
        ),
        Phrase(
          id: 'pt_bill_2',
          target: 'Fique com o troco.',
          gloss: {UiLang.tr: 'Üstü kalsın.', UiLang.en: 'Keep the change.'},
        ),
      ],
      turns: [
        SpeakTurn(
          prompt: 'You catch the waiter.',
          expected: 'A conta, por favor.',
        ),
        SpeakTurn(
          prompt: 'Split or together?',
          expected: 'Queremos pagar juntos.',
        ),
      ],
    ),
    Scenario(
      id: 'pt_airport',
      lang: LearnLang.pt,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Havaalanı check-in', UiLang.en: 'Airport check-in'},
      clipLine: 'Tenho uma reserva.',
      phrases: [
        Phrase(
          id: 'pt_airport_0',
          target: 'Tenho uma reserva.',
          gloss: {
            UiLang.tr: 'Rezervasyonum var.',
            UiLang.en: 'I have a reservation.',
          },
        ),
        Phrase(
          id: 'pt_airport_1',
          target: 'Lugar à janela, por favor.',
          gloss: {
            UiLang.tr: 'Pencere kenarı, lütfen.',
            UiLang.en: 'A window seat, please.',
          },
        ),
        Phrase(
          id: 'pt_airport_2',
          target: 'Esta é a fila para embarque?',
          gloss: {
            UiLang.tr: 'Biniş kuyruğu bu mu?',
            UiLang.en: 'Is this the queue for boarding?',
          },
        ),
      ],
      turns: [
        SpeakTurn(
          prompt: 'The agent greets you.',
          expected: 'Tenho uma reserva.',
        ),
        SpeakTurn(
          prompt: 'Window or aisle?',
          expected: 'Lugar à janela, por favor.',
        ),
      ],
    ),
    Scenario(
      id: 'it_shop',
      lang: LearnLang.it,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Markette alışveriş', UiLang.en: 'At the market'},
      clipLine: 'Quanto costa questo?',
      phrases: [
        Phrase(
          id: 'it_shop_0',
          target: 'Quanto costa questo?',
          gloss: {
            UiLang.tr: 'Bu ne kadar?',
            UiLang.en: 'How much does this cost?',
          },
        ),
        Phrase(
          id: 'it_shop_1',
          target: 'Prendo questo.',
          gloss: {
            UiLang.tr: 'Bunu alayım.',
            UiLang.en: 'I will take this one.',
          },
        ),
        Phrase(
          id: 'it_shop_2',
          target: 'Accettate la carta?',
          gloss: {
            UiLang.tr: 'Kart geçerli mi?',
            UiLang.en: 'Do you take card?',
          },
        ),
      ],
      turns: [
        SpeakTurn(
          prompt: 'You hold an item.',
          expected: 'Quanto costa questo?',
        ),
        SpeakTurn(prompt: 'You want it.', expected: 'Prendo questo.'),
      ],
    ),
    Scenario(
      id: 'it_bill',
      lang: LearnLang.it,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Hesabı istemek', UiLang.en: 'Asking for the bill'},
      clipLine: 'Il conto, per favore.',
      phrases: [
        Phrase(
          id: 'it_bill_0',
          target: 'Il conto, per favore.',
          gloss: {
            UiLang.tr: 'Hesabı alabilir miyim?',
            UiLang.en: 'Could I get the check, please?',
          },
        ),
        Phrase(
          id: 'it_bill_1',
          target: 'Vorremmo pagare insieme.',
          gloss: {
            UiLang.tr: 'Birlikte ödemek istiyoruz.',
            UiLang.en: 'We would like to pay together.',
          },
        ),
        Phrase(
          id: 'it_bill_2',
          target: 'Tenga il resto.',
          gloss: {UiLang.tr: 'Üstü kalsın.', UiLang.en: 'Keep the change.'},
        ),
      ],
      turns: [
        SpeakTurn(
          prompt: 'You catch the waiter.',
          expected: 'Il conto, per favore.',
        ),
        SpeakTurn(
          prompt: 'Split or together?',
          expected: 'Vorremmo pagare insieme.',
        ),
      ],
    ),
    Scenario(
      id: 'it_airport',
      lang: LearnLang.it,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Havaalanı check-in', UiLang.en: 'Airport check-in'},
      clipLine: 'Ho una prenotazione.',
      phrases: [
        Phrase(
          id: 'it_airport_0',
          target: 'Ho una prenotazione.',
          gloss: {
            UiLang.tr: 'Rezervasyonum var.',
            UiLang.en: 'I have a reservation.',
          },
        ),
        Phrase(
          id: 'it_airport_1',
          target: 'Un posto al finestrino.',
          gloss: {
            UiLang.tr: 'Pencere kenarı, lütfen.',
            UiLang.en: 'A window seat, please.',
          },
        ),
        Phrase(
          id: 'it_airport_2',
          target: 'È questa la fila per l\'imbarco?',
          gloss: {
            UiLang.tr: 'Biniş kuyruğu bu mu?',
            UiLang.en: 'Is this the queue for boarding?',
          },
        ),
      ],
      turns: [
        SpeakTurn(
          prompt: 'The agent greets you.',
          expected: 'Ho una prenotazione.',
        ),
        SpeakTurn(
          prompt: 'Window or aisle?',
          expected: 'Un posto al finestrino.',
        ),
      ],
    ),
    Scenario(
      id: 'ru_shop',
      lang: LearnLang.ru,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Markette alışveriş', UiLang.en: 'At the market'},
      clipLine: 'Сколько это стоит?',
      phrases: [
        Phrase(
          id: 'ru_shop_0',
          target: 'Сколько это стоит?',
          gloss: {
            UiLang.tr: 'Bu ne kadar?',
            UiLang.en: 'How much does this cost?',
          },
        ),
        Phrase(
          id: 'ru_shop_1',
          target: 'Я возьму это.',
          gloss: {
            UiLang.tr: 'Bunu alayım.',
            UiLang.en: 'I will take this one.',
          },
        ),
        Phrase(
          id: 'ru_shop_2',
          target: 'Вы принимаете карту?',
          gloss: {
            UiLang.tr: 'Kart geçerli mi?',
            UiLang.en: 'Do you take card?',
          },
        ),
      ],
      turns: [
        SpeakTurn(prompt: 'You hold an item.', expected: 'Сколько это стоит?'),
        SpeakTurn(prompt: 'You want it.', expected: 'Я возьму это.'),
      ],
    ),
    Scenario(
      id: 'ru_bill',
      lang: LearnLang.ru,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Hesabı istemek', UiLang.en: 'Asking for the bill'},
      clipLine: 'Счёт, пожалуйста.',
      phrases: [
        Phrase(
          id: 'ru_bill_0',
          target: 'Счёт, пожалуйста.',
          gloss: {
            UiLang.tr: 'Hesabı alabilir miyim?',
            UiLang.en: 'Could I get the check, please?',
          },
        ),
        Phrase(
          id: 'ru_bill_1',
          target: 'Мы хотим заплатить вместе.',
          gloss: {
            UiLang.tr: 'Birlikte ödemek istiyoruz.',
            UiLang.en: 'We would like to pay together.',
          },
        ),
        Phrase(
          id: 'ru_bill_2',
          target: 'Сдачи не надо.',
          gloss: {UiLang.tr: 'Üstü kalsın.', UiLang.en: 'Keep the change.'},
        ),
      ],
      turns: [
        SpeakTurn(
          prompt: 'You catch the waiter.',
          expected: 'Счёт, пожалуйста.',
        ),
        SpeakTurn(
          prompt: 'Split or together?',
          expected: 'Мы хотим заплатить вместе.',
        ),
      ],
    ),
    Scenario(
      id: 'ru_airport',
      lang: LearnLang.ru,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Havaalanı check-in', UiLang.en: 'Airport check-in'},
      clipLine: 'У меня есть бронь.',
      phrases: [
        Phrase(
          id: 'ru_airport_0',
          target: 'У меня есть бронь.',
          gloss: {
            UiLang.tr: 'Rezervasyonum var.',
            UiLang.en: 'I have a reservation.',
          },
        ),
        Phrase(
          id: 'ru_airport_1',
          target: 'Место у окна, пожалуйста.',
          gloss: {
            UiLang.tr: 'Pencere kenarı, lütfen.',
            UiLang.en: 'A window seat, please.',
          },
        ),
        Phrase(
          id: 'ru_airport_2',
          target: 'Это очередь на посадку?',
          gloss: {
            UiLang.tr: 'Biniş kuyruğu bu mu?',
            UiLang.en: 'Is this the queue for boarding?',
          },
        ),
      ],
      turns: [
        SpeakTurn(
          prompt: 'The agent greets you.',
          expected: 'У меня есть бронь.',
        ),
        SpeakTurn(
          prompt: 'Window or aisle?',
          expected: 'Место у окна, пожалуйста.',
        ),
      ],
    ),
    Scenario(
      id: 'zh_shop',
      lang: LearnLang.zh,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Markette alışveriş', UiLang.en: 'At the market'},
      clipLine: '这个多少钱？',
      phrases: [
        Phrase(
          id: 'zh_shop_0',
          target: '这个多少钱？',
          gloss: {
            UiLang.tr: 'Bu ne kadar?',
            UiLang.en: 'How much does this cost?',
          },
        ),
        Phrase(
          id: 'zh_shop_1',
          target: '我要这个。',
          gloss: {
            UiLang.tr: 'Bunu alayım.',
            UiLang.en: 'I will take this one.',
          },
        ),
        Phrase(
          id: 'zh_shop_2',
          target: '可以刷卡吗？',
          gloss: {
            UiLang.tr: 'Kart geçerli mi?',
            UiLang.en: 'Do you take card?',
          },
        ),
      ],
      turns: [
        SpeakTurn(prompt: 'You hold an item.', expected: '这个多少钱？'),
        SpeakTurn(prompt: 'You want it.', expected: '我要这个。'),
      ],
    ),
    Scenario(
      id: 'zh_bill',
      lang: LearnLang.zh,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Hesabı istemek', UiLang.en: 'Asking for the bill'},
      clipLine: '请结账。',
      phrases: [
        Phrase(
          id: 'zh_bill_0',
          target: '请结账。',
          gloss: {
            UiLang.tr: 'Hesabı alabilir miyim?',
            UiLang.en: 'Could I get the check, please?',
          },
        ),
        Phrase(
          id: 'zh_bill_1',
          target: '我们想一起付。',
          gloss: {
            UiLang.tr: 'Birlikte ödemek istiyoruz.',
            UiLang.en: 'We would like to pay together.',
          },
        ),
        Phrase(
          id: 'zh_bill_2',
          target: '不用找了。',
          gloss: {UiLang.tr: 'Üstü kalsın.', UiLang.en: 'Keep the change.'},
        ),
      ],
      turns: [
        SpeakTurn(prompt: 'You catch the waiter.', expected: '请结账。'),
        SpeakTurn(prompt: 'Split or together?', expected: '我们想一起付。'),
      ],
    ),
    Scenario(
      id: 'zh_airport',
      lang: LearnLang.zh,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Havaalanı check-in', UiLang.en: 'Airport check-in'},
      clipLine: '我有预订。',
      phrases: [
        Phrase(
          id: 'zh_airport_0',
          target: '我有预订。',
          gloss: {
            UiLang.tr: 'Rezervasyonum var.',
            UiLang.en: 'I have a reservation.',
          },
        ),
        Phrase(
          id: 'zh_airport_1',
          target: '靠窗的座位。',
          gloss: {
            UiLang.tr: 'Pencere kenarı, lütfen.',
            UiLang.en: 'A window seat, please.',
          },
        ),
        Phrase(
          id: 'zh_airport_2',
          target: '这是登机队列吗？',
          gloss: {
            UiLang.tr: 'Biniş kuyruğu bu mu?',
            UiLang.en: 'Is this the queue for boarding?',
          },
        ),
      ],
      turns: [
        SpeakTurn(prompt: 'The agent greets you.', expected: '我有预订。'),
        SpeakTurn(prompt: 'Window or aisle?', expected: '靠窗的座位。'),
      ],
    ),
    Scenario(
      id: 'ja_shop',
      lang: LearnLang.ja,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Markette alışveriş', UiLang.en: 'At the market'},
      clipLine: 'これはいくらですか？',
      phrases: [
        Phrase(
          id: 'ja_shop_0',
          target: 'これはいくらですか？',
          gloss: {
            UiLang.tr: 'Bu ne kadar?',
            UiLang.en: 'How much does this cost?',
          },
        ),
        Phrase(
          id: 'ja_shop_1',
          target: 'これをください。',
          gloss: {
            UiLang.tr: 'Bunu alayım.',
            UiLang.en: 'I will take this one.',
          },
        ),
        Phrase(
          id: 'ja_shop_2',
          target: 'カードは使えますか？',
          gloss: {
            UiLang.tr: 'Kart geçerli mi?',
            UiLang.en: 'Do you take card?',
          },
        ),
      ],
      turns: [
        SpeakTurn(prompt: 'You hold an item.', expected: 'これはいくらですか？'),
        SpeakTurn(prompt: 'You want it.', expected: 'これをください。'),
      ],
    ),
    Scenario(
      id: 'ja_bill',
      lang: LearnLang.ja,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Hesabı istemek', UiLang.en: 'Asking for the bill'},
      clipLine: 'お会計をお願いします。',
      phrases: [
        Phrase(
          id: 'ja_bill_0',
          target: 'お会計をお願いします。',
          gloss: {
            UiLang.tr: 'Hesabı alabilir miyim?',
            UiLang.en: 'Could I get the check, please?',
          },
        ),
        Phrase(
          id: 'ja_bill_1',
          target: '一緒に支払いたいです。',
          gloss: {
            UiLang.tr: 'Birlikte ödemek istiyoruz.',
            UiLang.en: 'We would like to pay together.',
          },
        ),
        Phrase(
          id: 'ja_bill_2',
          target: 'おつりは結構です。',
          gloss: {UiLang.tr: 'Üstü kalsın.', UiLang.en: 'Keep the change.'},
        ),
      ],
      turns: [
        SpeakTurn(prompt: 'You catch the waiter.', expected: 'お会計をお願いします。'),
        SpeakTurn(prompt: 'Split or together?', expected: '一緒に支払いたいです。'),
      ],
    ),
    Scenario(
      id: 'ja_airport',
      lang: LearnLang.ja,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Havaalanı check-in', UiLang.en: 'Airport check-in'},
      clipLine: '予約があります。',
      phrases: [
        Phrase(
          id: 'ja_airport_0',
          target: '予約があります。',
          gloss: {
            UiLang.tr: 'Rezervasyonum var.',
            UiLang.en: 'I have a reservation.',
          },
        ),
        Phrase(
          id: 'ja_airport_1',
          target: '窓側の席をお願いします。',
          gloss: {
            UiLang.tr: 'Pencere kenarı, lütfen.',
            UiLang.en: 'A window seat, please.',
          },
        ),
        Phrase(
          id: 'ja_airport_2',
          target: 'これは搭乗の列ですか？',
          gloss: {
            UiLang.tr: 'Biniş kuyruğu bu mu?',
            UiLang.en: 'Is this the queue for boarding?',
          },
        ),
      ],
      turns: [
        SpeakTurn(prompt: 'The agent greets you.', expected: '予約があります。'),
        SpeakTurn(prompt: 'Window or aisle?', expected: '窓側の席をお願いします。'),
      ],
    ),
    Scenario(
      id: 'ko_shop',
      lang: LearnLang.ko,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Markette alışveriş', UiLang.en: 'At the market'},
      clipLine: '이거 얼마예요?',
      phrases: [
        Phrase(
          id: 'ko_shop_0',
          target: '이거 얼마예요?',
          gloss: {
            UiLang.tr: 'Bu ne kadar?',
            UiLang.en: 'How much does this cost?',
          },
        ),
        Phrase(
          id: 'ko_shop_1',
          target: '이거 살게요.',
          gloss: {
            UiLang.tr: 'Bunu alayım.',
            UiLang.en: 'I will take this one.',
          },
        ),
        Phrase(
          id: 'ko_shop_2',
          target: '카드 되나요?',
          gloss: {
            UiLang.tr: 'Kart geçerli mi?',
            UiLang.en: 'Do you take card?',
          },
        ),
      ],
      turns: [
        SpeakTurn(prompt: 'You hold an item.', expected: '이거 얼마예요?'),
        SpeakTurn(prompt: 'You want it.', expected: '이거 살게요.'),
      ],
    ),
    Scenario(
      id: 'ko_bill',
      lang: LearnLang.ko,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Hesabı istemek', UiLang.en: 'Asking for the bill'},
      clipLine: '계산서 주세요.',
      phrases: [
        Phrase(
          id: 'ko_bill_0',
          target: '계산서 주세요.',
          gloss: {
            UiLang.tr: 'Hesabı alabilir miyim?',
            UiLang.en: 'Could I get the check, please?',
          },
        ),
        Phrase(
          id: 'ko_bill_1',
          target: '같이 계산하고 싶어요.',
          gloss: {
            UiLang.tr: 'Birlikte ödemek istiyoruz.',
            UiLang.en: 'We would like to pay together.',
          },
        ),
        Phrase(
          id: 'ko_bill_2',
          target: '거스름돈은 괜찮아요.',
          gloss: {UiLang.tr: 'Üstü kalsın.', UiLang.en: 'Keep the change.'},
        ),
      ],
      turns: [
        SpeakTurn(prompt: 'You catch the waiter.', expected: '계산서 주세요.'),
        SpeakTurn(prompt: 'Split or together?', expected: '같이 계산하고 싶어요.'),
      ],
    ),
    Scenario(
      id: 'ko_airport',
      lang: LearnLang.ko,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Havaalanı check-in', UiLang.en: 'Airport check-in'},
      clipLine: '예약이 있습니다.',
      phrases: [
        Phrase(
          id: 'ko_airport_0',
          target: '예약이 있습니다.',
          gloss: {
            UiLang.tr: 'Rezervasyonum var.',
            UiLang.en: 'I have a reservation.',
          },
        ),
        Phrase(
          id: 'ko_airport_1',
          target: '창가 좌석 주세요.',
          gloss: {
            UiLang.tr: 'Pencere kenarı, lütfen.',
            UiLang.en: 'A window seat, please.',
          },
        ),
        Phrase(
          id: 'ko_airport_2',
          target: '탑승 줄인가요?',
          gloss: {
            UiLang.tr: 'Biniş kuyruğu bu mu?',
            UiLang.en: 'Is this the queue for boarding?',
          },
        ),
      ],
      turns: [
        SpeakTurn(prompt: 'The agent greets you.', expected: '예약이 있습니다.'),
        SpeakTurn(prompt: 'Window or aisle?', expected: '창가 좌석 주세요.'),
      ],
    ),
    Scenario(
      id: 'tr_shop',
      lang: LearnLang.tr,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Markette alışveriş', UiLang.en: 'At the market'},
      clipLine: 'Bu ne kadar?',
      phrases: [
        Phrase(
          id: 'tr_shop_0',
          target: 'Bu ne kadar?',
          gloss: {
            UiLang.tr: 'Bu ne kadar?',
            UiLang.en: 'How much does this cost?',
          },
        ),
        Phrase(
          id: 'tr_shop_1',
          target: 'Bunu alayım.',
          gloss: {
            UiLang.tr: 'Bunu alayım.',
            UiLang.en: 'I will take this one.',
          },
        ),
        Phrase(
          id: 'tr_shop_2',
          target: 'Kart geçerli mi?',
          gloss: {
            UiLang.tr: 'Kart geçerli mi?',
            UiLang.en: 'Do you take card?',
          },
        ),
      ],
      turns: [
        SpeakTurn(prompt: 'You hold an item.', expected: 'Bu ne kadar?'),
        SpeakTurn(prompt: 'You want it.', expected: 'Bunu alayım.'),
      ],
    ),
    Scenario(
      id: 'tr_bill',
      lang: LearnLang.tr,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Hesabı istemek', UiLang.en: 'Asking for the bill'},
      clipLine: 'Hesabı alabilir miyim?',
      phrases: [
        Phrase(
          id: 'tr_bill_0',
          target: 'Hesabı alabilir miyim?',
          gloss: {
            UiLang.tr: 'Hesabı alabilir miyim?',
            UiLang.en: 'Could I get the check, please?',
          },
        ),
        Phrase(
          id: 'tr_bill_1',
          target: 'Birlikte ödemek istiyoruz.',
          gloss: {
            UiLang.tr: 'Birlikte ödemek istiyoruz.',
            UiLang.en: 'We would like to pay together.',
          },
        ),
        Phrase(
          id: 'tr_bill_2',
          target: 'Üstü kalsın.',
          gloss: {UiLang.tr: 'Üstü kalsın.', UiLang.en: 'Keep the change.'},
        ),
      ],
      turns: [
        SpeakTurn(
          prompt: 'You catch the waiter.',
          expected: 'Hesabı alabilir miyim?',
        ),
        SpeakTurn(
          prompt: 'Split or together?',
          expected: 'Birlikte ödemek istiyoruz.',
        ),
      ],
    ),
    Scenario(
      id: 'tr_airport',
      lang: LearnLang.tr,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Havaalanı check-in', UiLang.en: 'Airport check-in'},
      clipLine: 'Rezervasyonum var.',
      phrases: [
        Phrase(
          id: 'tr_airport_0',
          target: 'Rezervasyonum var.',
          gloss: {
            UiLang.tr: 'Rezervasyonum var.',
            UiLang.en: 'I have a reservation.',
          },
        ),
        Phrase(
          id: 'tr_airport_1',
          target: 'Pencere kenarı, lütfen.',
          gloss: {
            UiLang.tr: 'Pencere kenarı, lütfen.',
            UiLang.en: 'A window seat, please.',
          },
        ),
        Phrase(
          id: 'tr_airport_2',
          target: 'Biniş kuyruğu bu mu?',
          gloss: {
            UiLang.tr: 'Biniş kuyruğu bu mu?',
            UiLang.en: 'Is this the queue for boarding?',
          },
        ),
      ],
      turns: [
        SpeakTurn(
          prompt: 'The agent greets you.',
          expected: 'Rezervasyonum var.',
        ),
        SpeakTurn(
          prompt: 'Window or aisle?',
          expected: 'Pencere kenarı, lütfen.',
        ),
      ],
    ),
    Scenario(
      id: 'pl_shop',
      lang: LearnLang.pl,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Markette alışveriş', UiLang.en: 'At the market'},
      clipLine: 'Ile to kosztuje?',
      phrases: [
        Phrase(
          id: 'pl_shop_0',
          target: 'Ile to kosztuje?',
          gloss: {
            UiLang.tr: 'Bu ne kadar?',
            UiLang.en: 'How much does this cost?',
          },
        ),
        Phrase(
          id: 'pl_shop_1',
          target: 'Wezmę to.',
          gloss: {
            UiLang.tr: 'Bunu alayım.',
            UiLang.en: 'I will take this one.',
          },
        ),
        Phrase(
          id: 'pl_shop_2',
          target: 'Czy mogę zapłacić kartą?',
          gloss: {
            UiLang.tr: 'Kart geçerli mi?',
            UiLang.en: 'Do you take card?',
          },
        ),
      ],
      turns: [
        SpeakTurn(prompt: 'You hold an item.', expected: 'Ile to kosztuje?'),
        SpeakTurn(prompt: 'You want it.', expected: 'Wezmę to.'),
      ],
    ),
    Scenario(
      id: 'pl_bill',
      lang: LearnLang.pl,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Hesabı istemek', UiLang.en: 'Asking for the bill'},
      clipLine: 'Poproszę rachunek.',
      phrases: [
        Phrase(
          id: 'pl_bill_0',
          target: 'Poproszę rachunek.',
          gloss: {
            UiLang.tr: 'Hesabı alabilir miyim?',
            UiLang.en: 'Could I get the check, please?',
          },
        ),
        Phrase(
          id: 'pl_bill_1',
          target: 'Chcielibyśmy zapłacić razem.',
          gloss: {
            UiLang.tr: 'Birlikte ödemek istiyoruz.',
            UiLang.en: 'We would like to pay together.',
          },
        ),
        Phrase(
          id: 'pl_bill_2',
          target: 'Reszty nie trzeba.',
          gloss: {UiLang.tr: 'Üstü kalsın.', UiLang.en: 'Keep the change.'},
        ),
      ],
      turns: [
        SpeakTurn(
          prompt: 'You catch the waiter.',
          expected: 'Poproszę rachunek.',
        ),
        SpeakTurn(
          prompt: 'Split or together?',
          expected: 'Chcielibyśmy zapłacić razem.',
        ),
      ],
    ),
    Scenario(
      id: 'pl_airport',
      lang: LearnLang.pl,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Havaalanı check-in', UiLang.en: 'Airport check-in'},
      clipLine: 'Mam rezerwację.',
      phrases: [
        Phrase(
          id: 'pl_airport_0',
          target: 'Mam rezerwację.',
          gloss: {
            UiLang.tr: 'Rezervasyonum var.',
            UiLang.en: 'I have a reservation.',
          },
        ),
        Phrase(
          id: 'pl_airport_1',
          target: 'Miejsce przy oknie.',
          gloss: {
            UiLang.tr: 'Pencere kenarı, lütfen.',
            UiLang.en: 'A window seat, please.',
          },
        ),
        Phrase(
          id: 'pl_airport_2',
          target: 'Czy to kolejka do wejścia?',
          gloss: {
            UiLang.tr: 'Biniş kuyruğu bu mu?',
            UiLang.en: 'Is this the queue for boarding?',
          },
        ),
      ],
      turns: [
        SpeakTurn(prompt: 'The agent greets you.', expected: 'Mam rezerwację.'),
        SpeakTurn(prompt: 'Window or aisle?', expected: 'Miejsce przy oknie.'),
      ],
    ),
    Scenario(
      id: 'sv_shop',
      lang: LearnLang.sv,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Markette alışveriş', UiLang.en: 'At the market'},
      clipLine: 'Hur mycket kostar det?',
      phrases: [
        Phrase(
          id: 'sv_shop_0',
          target: 'Hur mycket kostar det?',
          gloss: {
            UiLang.tr: 'Bu ne kadar?',
            UiLang.en: 'How much does this cost?',
          },
        ),
        Phrase(
          id: 'sv_shop_1',
          target: 'Jag tar den här.',
          gloss: {
            UiLang.tr: 'Bunu alayım.',
            UiLang.en: 'I will take this one.',
          },
        ),
        Phrase(
          id: 'sv_shop_2',
          target: 'Tar ni kort?',
          gloss: {
            UiLang.tr: 'Kart geçerli mi?',
            UiLang.en: 'Do you take card?',
          },
        ),
      ],
      turns: [
        SpeakTurn(
          prompt: 'You hold an item.',
          expected: 'Hur mycket kostar det?',
        ),
        SpeakTurn(prompt: 'You want it.', expected: 'Jag tar den här.'),
      ],
    ),
    Scenario(
      id: 'sv_bill',
      lang: LearnLang.sv,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Hesabı istemek', UiLang.en: 'Asking for the bill'},
      clipLine: 'Kan jag få notan?',
      phrases: [
        Phrase(
          id: 'sv_bill_0',
          target: 'Kan jag få notan?',
          gloss: {
            UiLang.tr: 'Hesabı alabilir miyim?',
            UiLang.en: 'Could I get the check, please?',
          },
        ),
        Phrase(
          id: 'sv_bill_1',
          target: 'Vi vill betala tillsammans.',
          gloss: {
            UiLang.tr: 'Birlikte ödemek istiyoruz.',
            UiLang.en: 'We would like to pay together.',
          },
        ),
        Phrase(
          id: 'sv_bill_2',
          target: 'Behåll växeln.',
          gloss: {UiLang.tr: 'Üstü kalsın.', UiLang.en: 'Keep the change.'},
        ),
      ],
      turns: [
        SpeakTurn(
          prompt: 'You catch the waiter.',
          expected: 'Kan jag få notan?',
        ),
        SpeakTurn(
          prompt: 'Split or together?',
          expected: 'Vi vill betala tillsammans.',
        ),
      ],
    ),
    Scenario(
      id: 'sv_airport',
      lang: LearnLang.sv,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Havaalanı check-in', UiLang.en: 'Airport check-in'},
      clipLine: 'Jag har en reservation.',
      phrases: [
        Phrase(
          id: 'sv_airport_0',
          target: 'Jag har en reservation.',
          gloss: {
            UiLang.tr: 'Rezervasyonum var.',
            UiLang.en: 'I have a reservation.',
          },
        ),
        Phrase(
          id: 'sv_airport_1',
          target: 'En fönsterplats, tack.',
          gloss: {
            UiLang.tr: 'Pencere kenarı, lütfen.',
            UiLang.en: 'A window seat, please.',
          },
        ),
        Phrase(
          id: 'sv_airport_2',
          target: 'Är detta kön för boarding?',
          gloss: {
            UiLang.tr: 'Biniş kuyruğu bu mu?',
            UiLang.en: 'Is this the queue for boarding?',
          },
        ),
      ],
      turns: [
        SpeakTurn(
          prompt: 'The agent greets you.',
          expected: 'Jag har en reservation.',
        ),
        SpeakTurn(
          prompt: 'Window or aisle?',
          expected: 'En fönsterplats, tack.',
        ),
      ],
    ),
    Scenario(
      id: 'da_shop',
      lang: LearnLang.da,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Markette alışveriş', UiLang.en: 'At the market'},
      clipLine: 'Hvor meget koster det?',
      phrases: [
        Phrase(
          id: 'da_shop_0',
          target: 'Hvor meget koster det?',
          gloss: {
            UiLang.tr: 'Bu ne kadar?',
            UiLang.en: 'How much does this cost?',
          },
        ),
        Phrase(
          id: 'da_shop_1',
          target: 'Jeg tager den her.',
          gloss: {
            UiLang.tr: 'Bunu alayım.',
            UiLang.en: 'I will take this one.',
          },
        ),
        Phrase(
          id: 'da_shop_2',
          target: 'Tager I kort?',
          gloss: {
            UiLang.tr: 'Kart geçerli mi?',
            UiLang.en: 'Do you take card?',
          },
        ),
      ],
      turns: [
        SpeakTurn(
          prompt: 'You hold an item.',
          expected: 'Hvor meget koster det?',
        ),
        SpeakTurn(prompt: 'You want it.', expected: 'Jeg tager den her.'),
      ],
    ),
    Scenario(
      id: 'da_bill',
      lang: LearnLang.da,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Hesabı istemek', UiLang.en: 'Asking for the bill'},
      clipLine: 'Må jeg bede om regningen?',
      phrases: [
        Phrase(
          id: 'da_bill_0',
          target: 'Må jeg bede om regningen?',
          gloss: {
            UiLang.tr: 'Hesabı alabilir miyim?',
            UiLang.en: 'Could I get the check, please?',
          },
        ),
        Phrase(
          id: 'da_bill_1',
          target: 'Vi vil gerne betale sammen.',
          gloss: {
            UiLang.tr: 'Birlikte ödemek istiyoruz.',
            UiLang.en: 'We would like to pay together.',
          },
        ),
        Phrase(
          id: 'da_bill_2',
          target: 'Behold byttepengene.',
          gloss: {UiLang.tr: 'Üstü kalsın.', UiLang.en: 'Keep the change.'},
        ),
      ],
      turns: [
        SpeakTurn(
          prompt: 'You catch the waiter.',
          expected: 'Må jeg bede om regningen?',
        ),
        SpeakTurn(
          prompt: 'Split or together?',
          expected: 'Vi vil gerne betale sammen.',
        ),
      ],
    ),
    Scenario(
      id: 'da_airport',
      lang: LearnLang.da,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Havaalanı check-in', UiLang.en: 'Airport check-in'},
      clipLine: 'Jeg har en reservation.',
      phrases: [
        Phrase(
          id: 'da_airport_0',
          target: 'Jeg har en reservation.',
          gloss: {
            UiLang.tr: 'Rezervasyonum var.',
            UiLang.en: 'I have a reservation.',
          },
        ),
        Phrase(
          id: 'da_airport_1',
          target: 'En vinduesplads, tak.',
          gloss: {
            UiLang.tr: 'Pencere kenarı, lütfen.',
            UiLang.en: 'A window seat, please.',
          },
        ),
        Phrase(
          id: 'da_airport_2',
          target: 'Er dette køen til boarding?',
          gloss: {
            UiLang.tr: 'Biniş kuyruğu bu mu?',
            UiLang.en: 'Is this the queue for boarding?',
          },
        ),
      ],
      turns: [
        SpeakTurn(
          prompt: 'The agent greets you.',
          expected: 'Jeg har en reservation.',
        ),
        SpeakTurn(
          prompt: 'Window or aisle?',
          expected: 'En vinduesplads, tak.',
        ),
      ],
    ),
    Scenario(
      id: 'no_shop',
      lang: LearnLang.no,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Markette alışveriş', UiLang.en: 'At the market'},
      clipLine: 'Hvor mye koster det?',
      phrases: [
        Phrase(
          id: 'no_shop_0',
          target: 'Hvor mye koster det?',
          gloss: {
            UiLang.tr: 'Bu ne kadar?',
            UiLang.en: 'How much does this cost?',
          },
        ),
        Phrase(
          id: 'no_shop_1',
          target: 'Jeg tar denne.',
          gloss: {
            UiLang.tr: 'Bunu alayım.',
            UiLang.en: 'I will take this one.',
          },
        ),
        Phrase(
          id: 'no_shop_2',
          target: 'Tar dere kort?',
          gloss: {
            UiLang.tr: 'Kart geçerli mi?',
            UiLang.en: 'Do you take card?',
          },
        ),
      ],
      turns: [
        SpeakTurn(
          prompt: 'You hold an item.',
          expected: 'Hvor mye koster det?',
        ),
        SpeakTurn(prompt: 'You want it.', expected: 'Jeg tar denne.'),
      ],
    ),
    Scenario(
      id: 'no_bill',
      lang: LearnLang.no,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Hesabı istemek', UiLang.en: 'Asking for the bill'},
      clipLine: 'Kan jeg få regningen?',
      phrases: [
        Phrase(
          id: 'no_bill_0',
          target: 'Kan jeg få regningen?',
          gloss: {
            UiLang.tr: 'Hesabı alabilir miyim?',
            UiLang.en: 'Could I get the check, please?',
          },
        ),
        Phrase(
          id: 'no_bill_1',
          target: 'Vi vil gjerne betale sammen.',
          gloss: {
            UiLang.tr: 'Birlikte ödemek istiyoruz.',
            UiLang.en: 'We would like to pay together.',
          },
        ),
        Phrase(
          id: 'no_bill_2',
          target: 'Behold vekslepengene.',
          gloss: {UiLang.tr: 'Üstü kalsın.', UiLang.en: 'Keep the change.'},
        ),
      ],
      turns: [
        SpeakTurn(
          prompt: 'You catch the waiter.',
          expected: 'Kan jeg få regningen?',
        ),
        SpeakTurn(
          prompt: 'Split or together?',
          expected: 'Vi vil gjerne betale sammen.',
        ),
      ],
    ),
    Scenario(
      id: 'no_airport',
      lang: LearnLang.no,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Havaalanı check-in', UiLang.en: 'Airport check-in'},
      clipLine: 'Jeg har en reservasjon.',
      phrases: [
        Phrase(
          id: 'no_airport_0',
          target: 'Jeg har en reservasjon.',
          gloss: {
            UiLang.tr: 'Rezervasyonum var.',
            UiLang.en: 'I have a reservation.',
          },
        ),
        Phrase(
          id: 'no_airport_1',
          target: 'Et vindussete, takk.',
          gloss: {
            UiLang.tr: 'Pencere kenarı, lütfen.',
            UiLang.en: 'A window seat, please.',
          },
        ),
        Phrase(
          id: 'no_airport_2',
          target: 'Er dette køen for ombordstigning?',
          gloss: {
            UiLang.tr: 'Biniş kuyruğu bu mu?',
            UiLang.en: 'Is this the queue for boarding?',
          },
        ),
      ],
      turns: [
        SpeakTurn(
          prompt: 'The agent greets you.',
          expected: 'Jeg har en reservasjon.',
        ),
        SpeakTurn(prompt: 'Window or aisle?', expected: 'Et vindussete, takk.'),
      ],
    ),
    Scenario(
      id: 'fi_shop',
      lang: LearnLang.fi,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Markette alışveriş', UiLang.en: 'At the market'},
      clipLine: 'Paljonko tämä maksaa?',
      phrases: [
        Phrase(
          id: 'fi_shop_0',
          target: 'Paljonko tämä maksaa?',
          gloss: {
            UiLang.tr: 'Bu ne kadar?',
            UiLang.en: 'How much does this cost?',
          },
        ),
        Phrase(
          id: 'fi_shop_1',
          target: 'Otan tämän.',
          gloss: {
            UiLang.tr: 'Bunu alayım.',
            UiLang.en: 'I will take this one.',
          },
        ),
        Phrase(
          id: 'fi_shop_2',
          target: 'Voiko maksaa kortilla?',
          gloss: {
            UiLang.tr: 'Kart geçerli mi?',
            UiLang.en: 'Do you take card?',
          },
        ),
      ],
      turns: [
        SpeakTurn(
          prompt: 'You hold an item.',
          expected: 'Paljonko tämä maksaa?',
        ),
        SpeakTurn(prompt: 'You want it.', expected: 'Otan tämän.'),
      ],
    ),
    Scenario(
      id: 'fi_bill',
      lang: LearnLang.fi,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Hesabı istemek', UiLang.en: 'Asking for the bill'},
      clipLine: 'Saisinko laskun?',
      phrases: [
        Phrase(
          id: 'fi_bill_0',
          target: 'Saisinko laskun?',
          gloss: {
            UiLang.tr: 'Hesabı alabilir miyim?',
            UiLang.en: 'Could I get the check, please?',
          },
        ),
        Phrase(
          id: 'fi_bill_1',
          target: 'Haluamme maksaa yhdessä.',
          gloss: {
            UiLang.tr: 'Birlikte ödemek istiyoruz.',
            UiLang.en: 'We would like to pay together.',
          },
        ),
        Phrase(
          id: 'fi_bill_2',
          target: 'Pidä vaihtorahat.',
          gloss: {UiLang.tr: 'Üstü kalsın.', UiLang.en: 'Keep the change.'},
        ),
      ],
      turns: [
        SpeakTurn(
          prompt: 'You catch the waiter.',
          expected: 'Saisinko laskun?',
        ),
        SpeakTurn(
          prompt: 'Split or together?',
          expected: 'Haluamme maksaa yhdessä.',
        ),
      ],
    ),
    Scenario(
      id: 'fi_airport',
      lang: LearnLang.fi,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Havaalanı check-in', UiLang.en: 'Airport check-in'},
      clipLine: 'Minulla on varaus.',
      phrases: [
        Phrase(
          id: 'fi_airport_0',
          target: 'Minulla on varaus.',
          gloss: {
            UiLang.tr: 'Rezervasyonum var.',
            UiLang.en: 'I have a reservation.',
          },
        ),
        Phrase(
          id: 'fi_airport_1',
          target: 'Ikkunapaikka, kiitos.',
          gloss: {
            UiLang.tr: 'Pencere kenarı, lütfen.',
            UiLang.en: 'A window seat, please.',
          },
        ),
        Phrase(
          id: 'fi_airport_2',
          target: 'Onko tämä jono lentokoneeseen?',
          gloss: {
            UiLang.tr: 'Biniş kuyruğu bu mu?',
            UiLang.en: 'Is this the queue for boarding?',
          },
        ),
      ],
      turns: [
        SpeakTurn(
          prompt: 'The agent greets you.',
          expected: 'Minulla on varaus.',
        ),
        SpeakTurn(
          prompt: 'Window or aisle?',
          expected: 'Ikkunapaikka, kiitos.',
        ),
      ],
    ),
    Scenario(
      id: 'el_shop',
      lang: LearnLang.el,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Markette alışveriş', UiLang.en: 'At the market'},
      clipLine: 'Πόσο κοστίζει αυτό;',
      phrases: [
        Phrase(
          id: 'el_shop_0',
          target: 'Πόσο κοστίζει αυτό;',
          gloss: {
            UiLang.tr: 'Bu ne kadar?',
            UiLang.en: 'How much does this cost?',
          },
        ),
        Phrase(
          id: 'el_shop_1',
          target: 'Θα πάρω αυτό.',
          gloss: {
            UiLang.tr: 'Bunu alayım.',
            UiLang.en: 'I will take this one.',
          },
        ),
        Phrase(
          id: 'el_shop_2',
          target: 'Δέχεστε κάρτα;',
          gloss: {
            UiLang.tr: 'Kart geçerli mi?',
            UiLang.en: 'Do you take card?',
          },
        ),
      ],
      turns: [
        SpeakTurn(prompt: 'You hold an item.', expected: 'Πόσο κοστίζει αυτό;'),
        SpeakTurn(prompt: 'You want it.', expected: 'Θα πάρω αυτό.'),
      ],
    ),
    Scenario(
      id: 'el_bill',
      lang: LearnLang.el,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Hesabı istemek', UiLang.en: 'Asking for the bill'},
      clipLine: 'Τον λογαριασμό, παρακαλώ.',
      phrases: [
        Phrase(
          id: 'el_bill_0',
          target: 'Τον λογαριασμό, παρακαλώ.',
          gloss: {
            UiLang.tr: 'Hesabı alabilir miyim?',
            UiLang.en: 'Could I get the check, please?',
          },
        ),
        Phrase(
          id: 'el_bill_1',
          target: 'Θέλουμε να πληρώσουμε μαζί.',
          gloss: {
            UiLang.tr: 'Birlikte ödemek istiyoruz.',
            UiLang.en: 'We would like to pay together.',
          },
        ),
        Phrase(
          id: 'el_bill_2',
          target: 'Κρατήστε τα ρέστα.',
          gloss: {UiLang.tr: 'Üstü kalsın.', UiLang.en: 'Keep the change.'},
        ),
      ],
      turns: [
        SpeakTurn(
          prompt: 'You catch the waiter.',
          expected: 'Τον λογαριασμό, παρακαλώ.',
        ),
        SpeakTurn(
          prompt: 'Split or together?',
          expected: 'Θέλουμε να πληρώσουμε μαζί.',
        ),
      ],
    ),
    Scenario(
      id: 'el_airport',
      lang: LearnLang.el,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Havaalanı check-in', UiLang.en: 'Airport check-in'},
      clipLine: 'Έχω κράτηση.',
      phrases: [
        Phrase(
          id: 'el_airport_0',
          target: 'Έχω κράτηση.',
          gloss: {
            UiLang.tr: 'Rezervasyonum var.',
            UiLang.en: 'I have a reservation.',
          },
        ),
        Phrase(
          id: 'el_airport_1',
          target: 'Θέση στο παράθυρο.',
          gloss: {
            UiLang.tr: 'Pencere kenarı, lütfen.',
            UiLang.en: 'A window seat, please.',
          },
        ),
        Phrase(
          id: 'el_airport_2',
          target: 'Είναι αυτή η ουρά για επιβίβαση;',
          gloss: {
            UiLang.tr: 'Biniş kuyruğu bu mu?',
            UiLang.en: 'Is this the queue for boarding?',
          },
        ),
      ],
      turns: [
        SpeakTurn(prompt: 'The agent greets you.', expected: 'Έχω κράτηση.'),
        SpeakTurn(prompt: 'Window or aisle?', expected: 'Θέση στο παράθυρο.'),
      ],
    ),
    Scenario(
      id: 'cs_shop',
      lang: LearnLang.cs,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Markette alışveriş', UiLang.en: 'At the market'},
      clipLine: 'Kolik to stojí?',
      phrases: [
        Phrase(
          id: 'cs_shop_0',
          target: 'Kolik to stojí?',
          gloss: {
            UiLang.tr: 'Bu ne kadar?',
            UiLang.en: 'How much does this cost?',
          },
        ),
        Phrase(
          id: 'cs_shop_1',
          target: 'Vezmu si to.',
          gloss: {
            UiLang.tr: 'Bunu alayım.',
            UiLang.en: 'I will take this one.',
          },
        ),
        Phrase(
          id: 'cs_shop_2',
          target: 'Mohu platit kartou?',
          gloss: {
            UiLang.tr: 'Kart geçerli mi?',
            UiLang.en: 'Do you take card?',
          },
        ),
      ],
      turns: [
        SpeakTurn(prompt: 'You hold an item.', expected: 'Kolik to stojí?'),
        SpeakTurn(prompt: 'You want it.', expected: 'Vezmu si to.'),
      ],
    ),
    Scenario(
      id: 'cs_bill',
      lang: LearnLang.cs,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Hesabı istemek', UiLang.en: 'Asking for the bill'},
      clipLine: 'Účet, prosím.',
      phrases: [
        Phrase(
          id: 'cs_bill_0',
          target: 'Účet, prosím.',
          gloss: {
            UiLang.tr: 'Hesabı alabilir miyim?',
            UiLang.en: 'Could I get the check, please?',
          },
        ),
        Phrase(
          id: 'cs_bill_1',
          target: 'Chtěli bychom platit dohromady.',
          gloss: {
            UiLang.tr: 'Birlikte ödemek istiyoruz.',
            UiLang.en: 'We would like to pay together.',
          },
        ),
        Phrase(
          id: 'cs_bill_2',
          target: 'Nechte si drobné.',
          gloss: {UiLang.tr: 'Üstü kalsın.', UiLang.en: 'Keep the change.'},
        ),
      ],
      turns: [
        SpeakTurn(prompt: 'You catch the waiter.', expected: 'Účet, prosím.'),
        SpeakTurn(
          prompt: 'Split or together?',
          expected: 'Chtěli bychom platit dohromady.',
        ),
      ],
    ),
    Scenario(
      id: 'cs_airport',
      lang: LearnLang.cs,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Havaalanı check-in', UiLang.en: 'Airport check-in'},
      clipLine: 'Mám rezervaci.',
      phrases: [
        Phrase(
          id: 'cs_airport_0',
          target: 'Mám rezervaci.',
          gloss: {
            UiLang.tr: 'Rezervasyonum var.',
            UiLang.en: 'I have a reservation.',
          },
        ),
        Phrase(
          id: 'cs_airport_1',
          target: 'Místo u okna, prosím.',
          gloss: {
            UiLang.tr: 'Pencere kenarı, lütfen.',
            UiLang.en: 'A window seat, please.',
          },
        ),
        Phrase(
          id: 'cs_airport_2',
          target: 'Je to fronta na nástup?',
          gloss: {
            UiLang.tr: 'Biniş kuyruğu bu mu?',
            UiLang.en: 'Is this the queue for boarding?',
          },
        ),
      ],
      turns: [
        SpeakTurn(prompt: 'The agent greets you.', expected: 'Mám rezervaci.'),
        SpeakTurn(
          prompt: 'Window or aisle?',
          expected: 'Místo u okna, prosím.',
        ),
      ],
    ),
    Scenario(
      id: 'ro_shop',
      lang: LearnLang.ro,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Markette alışveriş', UiLang.en: 'At the market'},
      clipLine: 'Cât costă asta?',
      phrases: [
        Phrase(
          id: 'ro_shop_0',
          target: 'Cât costă asta?',
          gloss: {
            UiLang.tr: 'Bu ne kadar?',
            UiLang.en: 'How much does this cost?',
          },
        ),
        Phrase(
          id: 'ro_shop_1',
          target: 'Iau asta.',
          gloss: {
            UiLang.tr: 'Bunu alayım.',
            UiLang.en: 'I will take this one.',
          },
        ),
        Phrase(
          id: 'ro_shop_2',
          target: 'Acceptați cardul?',
          gloss: {
            UiLang.tr: 'Kart geçerli mi?',
            UiLang.en: 'Do you take card?',
          },
        ),
      ],
      turns: [
        SpeakTurn(prompt: 'You hold an item.', expected: 'Cât costă asta?'),
        SpeakTurn(prompt: 'You want it.', expected: 'Iau asta.'),
      ],
    ),
    Scenario(
      id: 'ro_bill',
      lang: LearnLang.ro,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Hesabı istemek', UiLang.en: 'Asking for the bill'},
      clipLine: 'Nota de plată, vă rog.',
      phrases: [
        Phrase(
          id: 'ro_bill_0',
          target: 'Nota de plată, vă rog.',
          gloss: {
            UiLang.tr: 'Hesabı alabilir miyim?',
            UiLang.en: 'Could I get the check, please?',
          },
        ),
        Phrase(
          id: 'ro_bill_1',
          target: 'Vrem să plătim împreună.',
          gloss: {
            UiLang.tr: 'Birlikte ödemek istiyoruz.',
            UiLang.en: 'We would like to pay together.',
          },
        ),
        Phrase(
          id: 'ro_bill_2',
          target: 'Păstrați restul.',
          gloss: {UiLang.tr: 'Üstü kalsın.', UiLang.en: 'Keep the change.'},
        ),
      ],
      turns: [
        SpeakTurn(
          prompt: 'You catch the waiter.',
          expected: 'Nota de plată, vă rog.',
        ),
        SpeakTurn(
          prompt: 'Split or together?',
          expected: 'Vrem să plătim împreună.',
        ),
      ],
    ),
    Scenario(
      id: 'ro_airport',
      lang: LearnLang.ro,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Havaalanı check-in', UiLang.en: 'Airport check-in'},
      clipLine: 'Am o rezervare.',
      phrases: [
        Phrase(
          id: 'ro_airport_0',
          target: 'Am o rezervare.',
          gloss: {
            UiLang.tr: 'Rezervasyonum var.',
            UiLang.en: 'I have a reservation.',
          },
        ),
        Phrase(
          id: 'ro_airport_1',
          target: 'Un loc la fereastră.',
          gloss: {
            UiLang.tr: 'Pencere kenarı, lütfen.',
            UiLang.en: 'A window seat, please.',
          },
        ),
        Phrase(
          id: 'ro_airport_2',
          target: 'Aceasta este coada pentru îmbarcare?',
          gloss: {
            UiLang.tr: 'Biniş kuyruğu bu mu?',
            UiLang.en: 'Is this the queue for boarding?',
          },
        ),
      ],
      turns: [
        SpeakTurn(prompt: 'The agent greets you.', expected: 'Am o rezervare.'),
        SpeakTurn(prompt: 'Window or aisle?', expected: 'Un loc la fereastră.'),
      ],
    ),
    Scenario(
      id: 'hu_shop',
      lang: LearnLang.hu,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Markette alışveriş', UiLang.en: 'At the market'},
      clipLine: 'Mennyibe kerül ez?',
      phrases: [
        Phrase(
          id: 'hu_shop_0',
          target: 'Mennyibe kerül ez?',
          gloss: {
            UiLang.tr: 'Bu ne kadar?',
            UiLang.en: 'How much does this cost?',
          },
        ),
        Phrase(
          id: 'hu_shop_1',
          target: 'Ezt elviszem.',
          gloss: {
            UiLang.tr: 'Bunu alayım.',
            UiLang.en: 'I will take this one.',
          },
        ),
        Phrase(
          id: 'hu_shop_2',
          target: 'Kártyával fizethetek?',
          gloss: {
            UiLang.tr: 'Kart geçerli mi?',
            UiLang.en: 'Do you take card?',
          },
        ),
      ],
      turns: [
        SpeakTurn(prompt: 'You hold an item.', expected: 'Mennyibe kerül ez?'),
        SpeakTurn(prompt: 'You want it.', expected: 'Ezt elviszem.'),
      ],
    ),
    Scenario(
      id: 'hu_bill',
      lang: LearnLang.hu,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Hesabı istemek', UiLang.en: 'Asking for the bill'},
      clipLine: 'Kérem a számlát.',
      phrases: [
        Phrase(
          id: 'hu_bill_0',
          target: 'Kérem a számlát.',
          gloss: {
            UiLang.tr: 'Hesabı alabilir miyim?',
            UiLang.en: 'Could I get the check, please?',
          },
        ),
        Phrase(
          id: 'hu_bill_1',
          target: 'Együtt szeretnénk fizetni.',
          gloss: {
            UiLang.tr: 'Birlikte ödemek istiyoruz.',
            UiLang.en: 'We would like to pay together.',
          },
        ),
        Phrase(
          id: 'hu_bill_2',
          target: 'A többit tartsa meg.',
          gloss: {UiLang.tr: 'Üstü kalsın.', UiLang.en: 'Keep the change.'},
        ),
      ],
      turns: [
        SpeakTurn(
          prompt: 'You catch the waiter.',
          expected: 'Kérem a számlát.',
        ),
        SpeakTurn(
          prompt: 'Split or together?',
          expected: 'Együtt szeretnénk fizetni.',
        ),
      ],
    ),
    Scenario(
      id: 'hu_airport',
      lang: LearnLang.hu,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Havaalanı check-in', UiLang.en: 'Airport check-in'},
      clipLine: 'Van foglalsom.',
      phrases: [
        Phrase(
          id: 'hu_airport_0',
          target: 'Van foglalsom.',
          gloss: {
            UiLang.tr: 'Rezervasyonum var.',
            UiLang.en: 'I have a reservation.',
          },
        ),
        Phrase(
          id: 'hu_airport_1',
          target: 'Ablak melletti helyet kérek.',
          gloss: {
            UiLang.tr: 'Pencere kenarı, lütfen.',
            UiLang.en: 'A window seat, please.',
          },
        ),
        Phrase(
          id: 'hu_airport_2',
          target: 'Ez a sor a beszálláshoz?',
          gloss: {
            UiLang.tr: 'Biniş kuyruğu bu mu?',
            UiLang.en: 'Is this the queue for boarding?',
          },
        ),
      ],
      turns: [
        SpeakTurn(prompt: 'The agent greets you.', expected: 'Van foglalsom.'),
        SpeakTurn(
          prompt: 'Window or aisle?',
          expected: 'Ablak melletti helyet kérek.',
        ),
      ],
    ),
    Scenario(
      id: 'hi_shop',
      lang: LearnLang.hi,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Markette alışveriş', UiLang.en: 'At the market'},
      clipLine: 'यह कितने का है?',
      phrases: [
        Phrase(
          id: 'hi_shop_0',
          target: 'यह कितने का है?',
          gloss: {
            UiLang.tr: 'Bu ne kadar?',
            UiLang.en: 'How much does this cost?',
          },
        ),
        Phrase(
          id: 'hi_shop_1',
          target: 'मैं यह लूँगा।',
          gloss: {
            UiLang.tr: 'Bunu alayım.',
            UiLang.en: 'I will take this one.',
          },
        ),
        Phrase(
          id: 'hi_shop_2',
          target: 'क्या कार्ड चलेगा?',
          gloss: {
            UiLang.tr: 'Kart geçerli mi?',
            UiLang.en: 'Do you take card?',
          },
        ),
      ],
      turns: [
        SpeakTurn(prompt: 'You hold an item.', expected: 'यह कितने का है?'),
        SpeakTurn(prompt: 'You want it.', expected: 'मैं यह लूँगा।'),
      ],
    ),
    Scenario(
      id: 'hi_bill',
      lang: LearnLang.hi,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Hesabı istemek', UiLang.en: 'Asking for the bill'},
      clipLine: 'बिल दीजिए।',
      phrases: [
        Phrase(
          id: 'hi_bill_0',
          target: 'बिल दीजिए।',
          gloss: {
            UiLang.tr: 'Hesabı alabilir miyim?',
            UiLang.en: 'Could I get the check, please?',
          },
        ),
        Phrase(
          id: 'hi_bill_1',
          target: 'हम साथ में भुगतान करना चाहते हैं।',
          gloss: {
            UiLang.tr: 'Birlikte ödemek istiyoruz.',
            UiLang.en: 'We would like to pay together.',
          },
        ),
        Phrase(
          id: 'hi_bill_2',
          target: 'बाकी रहने दीजिए।',
          gloss: {UiLang.tr: 'Üstü kalsın.', UiLang.en: 'Keep the change.'},
        ),
      ],
      turns: [
        SpeakTurn(prompt: 'You catch the waiter.', expected: 'बिल दीजिए।'),
        SpeakTurn(
          prompt: 'Split or together?',
          expected: 'हम साथ में भुगतान करना चाहते हैं।',
        ),
      ],
    ),
    Scenario(
      id: 'hi_airport',
      lang: LearnLang.hi,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Havaalanı check-in', UiLang.en: 'Airport check-in'},
      clipLine: 'मेरा आरक्षण है।',
      phrases: [
        Phrase(
          id: 'hi_airport_0',
          target: 'मेरा आरक्षण है।',
          gloss: {
            UiLang.tr: 'Rezervasyonum var.',
            UiLang.en: 'I have a reservation.',
          },
        ),
        Phrase(
          id: 'hi_airport_1',
          target: 'खिड़की वाली सीट दीजिए।',
          gloss: {
            UiLang.tr: 'Pencere kenarı, lütfen.',
            UiLang.en: 'A window seat, please.',
          },
        ),
        Phrase(
          id: 'hi_airport_2',
          target: 'क्या यह बोर्डिंग की लाइन है?',
          gloss: {
            UiLang.tr: 'Biniş kuyruğu bu mu?',
            UiLang.en: 'Is this the queue for boarding?',
          },
        ),
      ],
      turns: [
        SpeakTurn(prompt: 'The agent greets you.', expected: 'मेरा आरक्षण है।'),
        SpeakTurn(
          prompt: 'Window or aisle?',
          expected: 'खिड़की वाली सीट दीजिए।',
        ),
      ],
    ),
    Scenario(
      id: 'th_shop',
      lang: LearnLang.th,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Markette alışveriş', UiLang.en: 'At the market'},
      clipLine: 'อันนี้ราคาเท่าไหร่?',
      phrases: [
        Phrase(
          id: 'th_shop_0',
          target: 'อันนี้ราคาเท่าไหร่?',
          gloss: {
            UiLang.tr: 'Bu ne kadar?',
            UiLang.en: 'How much does this cost?',
          },
        ),
        Phrase(
          id: 'th_shop_1',
          target: 'เอาอันนี้',
          gloss: {
            UiLang.tr: 'Bunu alayım.',
            UiLang.en: 'I will take this one.',
          },
        ),
        Phrase(
          id: 'th_shop_2',
          target: 'รับบัตรไหม?',
          gloss: {
            UiLang.tr: 'Kart geçerli mi?',
            UiLang.en: 'Do you take card?',
          },
        ),
      ],
      turns: [
        SpeakTurn(prompt: 'You hold an item.', expected: 'อันนี้ราคาเท่าไหร่?'),
        SpeakTurn(prompt: 'You want it.', expected: 'เอาอันนี้'),
      ],
    ),
    Scenario(
      id: 'th_bill',
      lang: LearnLang.th,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Hesabı istemek', UiLang.en: 'Asking for the bill'},
      clipLine: 'ขอบิลด้วย',
      phrases: [
        Phrase(
          id: 'th_bill_0',
          target: 'ขอบิลด้วย',
          gloss: {
            UiLang.tr: 'Hesabı alabilir miyim?',
            UiLang.en: 'Could I get the check, please?',
          },
        ),
        Phrase(
          id: 'th_bill_1',
          target: 'เราจะจ่ายรวมกัน',
          gloss: {
            UiLang.tr: 'Birlikte ödemek istiyoruz.',
            UiLang.en: 'We would like to pay together.',
          },
        ),
        Phrase(
          id: 'th_bill_2',
          target: 'ไม่ต้องทอน',
          gloss: {UiLang.tr: 'Üstü kalsın.', UiLang.en: 'Keep the change.'},
        ),
      ],
      turns: [
        SpeakTurn(prompt: 'You catch the waiter.', expected: 'ขอบิลด้วย'),
        SpeakTurn(prompt: 'Split or together?', expected: 'เราจะจ่ายรวมกัน'),
      ],
    ),
    Scenario(
      id: 'th_airport',
      lang: LearnLang.th,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Havaalanı check-in', UiLang.en: 'Airport check-in'},
      clipLine: 'ฉันมีการจอง',
      phrases: [
        Phrase(
          id: 'th_airport_0',
          target: 'ฉันมีการจอง',
          gloss: {
            UiLang.tr: 'Rezervasyonum var.',
            UiLang.en: 'I have a reservation.',
          },
        ),
        Phrase(
          id: 'th_airport_1',
          target: 'ขอที่นั่งริมหน้าต่าง',
          gloss: {
            UiLang.tr: 'Pencere kenarı, lütfen.',
            UiLang.en: 'A window seat, please.',
          },
        ),
        Phrase(
          id: 'th_airport_2',
          target: 'นี่คิวขึ้นเครื่องใช่ไหม?',
          gloss: {
            UiLang.tr: 'Biniş kuyruğu bu mu?',
            UiLang.en: 'Is this the queue for boarding?',
          },
        ),
      ],
      turns: [
        SpeakTurn(prompt: 'The agent greets you.', expected: 'ฉันมีการจอง'),
        SpeakTurn(prompt: 'Window or aisle?', expected: 'ขอที่นั่งริมหน้าต่าง'),
      ],
    ),
    Scenario(
      id: 'vi_shop',
      lang: LearnLang.vi,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Markette alışveriş', UiLang.en: 'At the market'},
      clipLine: 'Cái này bao nhiêu tiền?',
      phrases: [
        Phrase(
          id: 'vi_shop_0',
          target: 'Cái này bao nhiêu tiền?',
          gloss: {
            UiLang.tr: 'Bu ne kadar?',
            UiLang.en: 'How much does this cost?',
          },
        ),
        Phrase(
          id: 'vi_shop_1',
          target: 'Tôi lấy cái này.',
          gloss: {
            UiLang.tr: 'Bunu alayım.',
            UiLang.en: 'I will take this one.',
          },
        ),
        Phrase(
          id: 'vi_shop_2',
          target: 'Có nhận thẻ không?',
          gloss: {
            UiLang.tr: 'Kart geçerli mi?',
            UiLang.en: 'Do you take card?',
          },
        ),
      ],
      turns: [
        SpeakTurn(
          prompt: 'You hold an item.',
          expected: 'Cái này bao nhiêu tiền?',
        ),
        SpeakTurn(prompt: 'You want it.', expected: 'Tôi lấy cái này.'),
      ],
    ),
    Scenario(
      id: 'vi_bill',
      lang: LearnLang.vi,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Hesabı istemek', UiLang.en: 'Asking for the bill'},
      clipLine: 'Cho tôi hóa đơn.',
      phrases: [
        Phrase(
          id: 'vi_bill_0',
          target: 'Cho tôi hóa đơn.',
          gloss: {
            UiLang.tr: 'Hesabı alabilir miyim?',
            UiLang.en: 'Could I get the check, please?',
          },
        ),
        Phrase(
          id: 'vi_bill_1',
          target: 'Chúng tôi muốn trả chung.',
          gloss: {
            UiLang.tr: 'Birlikte ödemek istiyoruz.',
            UiLang.en: 'We would like to pay together.',
          },
        ),
        Phrase(
          id: 'vi_bill_2',
          target: 'Không cần trả lại.',
          gloss: {UiLang.tr: 'Üstü kalsın.', UiLang.en: 'Keep the change.'},
        ),
      ],
      turns: [
        SpeakTurn(
          prompt: 'You catch the waiter.',
          expected: 'Cho tôi hóa đơn.',
        ),
        SpeakTurn(
          prompt: 'Split or together?',
          expected: 'Chúng tôi muốn trả chung.',
        ),
      ],
    ),
    Scenario(
      id: 'vi_airport',
      lang: LearnLang.vi,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Havaalanı check-in', UiLang.en: 'Airport check-in'},
      clipLine: 'Tôi có đặt chỗ.',
      phrases: [
        Phrase(
          id: 'vi_airport_0',
          target: 'Tôi có đặt chỗ.',
          gloss: {
            UiLang.tr: 'Rezervasyonum var.',
            UiLang.en: 'I have a reservation.',
          },
        ),
        Phrase(
          id: 'vi_airport_1',
          target: 'Cho tôi ghế cạnh cửa sổ.',
          gloss: {
            UiLang.tr: 'Pencere kenarı, lütfen.',
            UiLang.en: 'A window seat, please.',
          },
        ),
        Phrase(
          id: 'vi_airport_2',
          target: 'Đây có phải hàng lên máy bay không?',
          gloss: {
            UiLang.tr: 'Biniş kuyruğu bu mu?',
            UiLang.en: 'Is this the queue for boarding?',
          },
        ),
      ],
      turns: [
        SpeakTurn(prompt: 'The agent greets you.', expected: 'Tôi có đặt chỗ.'),
        SpeakTurn(
          prompt: 'Window or aisle?',
          expected: 'Cho tôi ghế cạnh cửa sổ.',
        ),
      ],
    ),
    Scenario(
      id: 'id_shop',
      lang: LearnLang.id,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Markette alışveriş', UiLang.en: 'At the market'},
      clipLine: 'Berapa harganya?',
      phrases: [
        Phrase(
          id: 'id_shop_0',
          target: 'Berapa harganya?',
          gloss: {
            UiLang.tr: 'Bu ne kadar?',
            UiLang.en: 'How much does this cost?',
          },
        ),
        Phrase(
          id: 'id_shop_1',
          target: 'Saya ambil yang ini.',
          gloss: {
            UiLang.tr: 'Bunu alayım.',
            UiLang.en: 'I will take this one.',
          },
        ),
        Phrase(
          id: 'id_shop_2',
          target: 'Bisa bayar pakai kartu?',
          gloss: {
            UiLang.tr: 'Kart geçerli mi?',
            UiLang.en: 'Do you take card?',
          },
        ),
      ],
      turns: [
        SpeakTurn(prompt: 'You hold an item.', expected: 'Berapa harganya?'),
        SpeakTurn(prompt: 'You want it.', expected: 'Saya ambil yang ini.'),
      ],
    ),
    Scenario(
      id: 'id_bill',
      lang: LearnLang.id,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Hesabı istemek', UiLang.en: 'Asking for the bill'},
      clipLine: 'Minta bon, tolong.',
      phrases: [
        Phrase(
          id: 'id_bill_0',
          target: 'Minta bon, tolong.',
          gloss: {
            UiLang.tr: 'Hesabı alabilir miyim?',
            UiLang.en: 'Could I get the check, please?',
          },
        ),
        Phrase(
          id: 'id_bill_1',
          target: 'Kami mau bayar bareng.',
          gloss: {
            UiLang.tr: 'Birlikte ödemek istiyoruz.',
            UiLang.en: 'We would like to pay together.',
          },
        ),
        Phrase(
          id: 'id_bill_2',
          target: 'Simpan kembaliannya.',
          gloss: {UiLang.tr: 'Üstü kalsın.', UiLang.en: 'Keep the change.'},
        ),
      ],
      turns: [
        SpeakTurn(
          prompt: 'You catch the waiter.',
          expected: 'Minta bon, tolong.',
        ),
        SpeakTurn(
          prompt: 'Split or together?',
          expected: 'Kami mau bayar bareng.',
        ),
      ],
    ),
    Scenario(
      id: 'id_airport',
      lang: LearnLang.id,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Havaalanı check-in', UiLang.en: 'Airport check-in'},
      clipLine: 'Saya punya reservasi.',
      phrases: [
        Phrase(
          id: 'id_airport_0',
          target: 'Saya punya reservasi.',
          gloss: {
            UiLang.tr: 'Rezervasyonum var.',
            UiLang.en: 'I have a reservation.',
          },
        ),
        Phrase(
          id: 'id_airport_1',
          target: 'Kursi dekat jendela, tolong.',
          gloss: {
            UiLang.tr: 'Pencere kenarı, lütfen.',
            UiLang.en: 'A window seat, please.',
          },
        ),
        Phrase(
          id: 'id_airport_2',
          target: 'Ini antrean boarding?',
          gloss: {
            UiLang.tr: 'Biniş kuyruğu bu mu?',
            UiLang.en: 'Is this the queue for boarding?',
          },
        ),
      ],
      turns: [
        SpeakTurn(
          prompt: 'The agent greets you.',
          expected: 'Saya punya reservasi.',
        ),
        SpeakTurn(
          prompt: 'Window or aisle?',
          expected: 'Kursi dekat jendela, tolong.',
        ),
      ],
    ),
    Scenario(
      id: 'uk_shop',
      lang: LearnLang.uk,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Markette alışveriş', UiLang.en: 'At the market'},
      clipLine: 'Скільки це коштує?',
      phrases: [
        Phrase(
          id: 'uk_shop_0',
          target: 'Скільки це коштує?',
          gloss: {
            UiLang.tr: 'Bu ne kadar?',
            UiLang.en: 'How much does this cost?',
          },
        ),
        Phrase(
          id: 'uk_shop_1',
          target: 'Я візьму це.',
          gloss: {
            UiLang.tr: 'Bunu alayım.',
            UiLang.en: 'I will take this one.',
          },
        ),
        Phrase(
          id: 'uk_shop_2',
          target: 'Ви приймаєте картку?',
          gloss: {
            UiLang.tr: 'Kart geçerli mi?',
            UiLang.en: 'Do you take card?',
          },
        ),
      ],
      turns: [
        SpeakTurn(prompt: 'You hold an item.', expected: 'Скільки це коштує?'),
        SpeakTurn(prompt: 'You want it.', expected: 'Я візьму це.'),
      ],
    ),
    Scenario(
      id: 'uk_bill',
      lang: LearnLang.uk,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Hesabı istemek', UiLang.en: 'Asking for the bill'},
      clipLine: 'Рахунок, будь ласка.',
      phrases: [
        Phrase(
          id: 'uk_bill_0',
          target: 'Рахунок, будь ласка.',
          gloss: {
            UiLang.tr: 'Hesabı alabilir miyim?',
            UiLang.en: 'Could I get the check, please?',
          },
        ),
        Phrase(
          id: 'uk_bill_1',
          target: 'Ми хочемо заплатити разом.',
          gloss: {
            UiLang.tr: 'Birlikte ödemek istiyoruz.',
            UiLang.en: 'We would like to pay together.',
          },
        ),
        Phrase(
          id: 'uk_bill_2',
          target: 'Решту залиште собі.',
          gloss: {UiLang.tr: 'Üstü kalsın.', UiLang.en: 'Keep the change.'},
        ),
      ],
      turns: [
        SpeakTurn(
          prompt: 'You catch the waiter.',
          expected: 'Рахунок, будь ласка.',
        ),
        SpeakTurn(
          prompt: 'Split or together?',
          expected: 'Ми хочемо заплатити разом.',
        ),
      ],
    ),
    Scenario(
      id: 'uk_airport',
      lang: LearnLang.uk,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Havaalanı check-in', UiLang.en: 'Airport check-in'},
      clipLine: 'У мене є бронювання.',
      phrases: [
        Phrase(
          id: 'uk_airport_0',
          target: 'У мене є бронювання.',
          gloss: {
            UiLang.tr: 'Rezervasyonum var.',
            UiLang.en: 'I have a reservation.',
          },
        ),
        Phrase(
          id: 'uk_airport_1',
          target: 'Місце біля вікна.',
          gloss: {
            UiLang.tr: 'Pencere kenarı, lütfen.',
            UiLang.en: 'A window seat, please.',
          },
        ),
        Phrase(
          id: 'uk_airport_2',
          target: 'Це черга на посадку?',
          gloss: {
            UiLang.tr: 'Biniş kuyruğu bu mu?',
            UiLang.en: 'Is this the queue for boarding?',
          },
        ),
      ],
      turns: [
        SpeakTurn(
          prompt: 'The agent greets you.',
          expected: 'У мене є бронювання.',
        ),
        SpeakTurn(prompt: 'Window or aisle?', expected: 'Місце біля вікна.'),
      ],
    ),
    Scenario(
      id: 'he_shop',
      lang: LearnLang.he,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Markette alışveriş', UiLang.en: 'At the market'},
      clipLine: 'כמה זה עולה?',
      phrases: [
        Phrase(
          id: 'he_shop_0',
          target: 'כמה זה עולה?',
          gloss: {
            UiLang.tr: 'Bu ne kadar?',
            UiLang.en: 'How much does this cost?',
          },
        ),
        Phrase(
          id: 'he_shop_1',
          target: 'אני אקח את זה.',
          gloss: {
            UiLang.tr: 'Bunu alayım.',
            UiLang.en: 'I will take this one.',
          },
        ),
        Phrase(
          id: 'he_shop_2',
          target: 'אתם מקבלים כרטיס?',
          gloss: {
            UiLang.tr: 'Kart geçerli mi?',
            UiLang.en: 'Do you take card?',
          },
        ),
      ],
      turns: [
        SpeakTurn(prompt: 'You hold an item.', expected: 'כמה זה עולה?'),
        SpeakTurn(prompt: 'You want it.', expected: 'אני אקח את זה.'),
      ],
    ),
    Scenario(
      id: 'he_bill',
      lang: LearnLang.he,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Hesabı istemek', UiLang.en: 'Asking for the bill'},
      clipLine: 'חשבון, בבקשה.',
      phrases: [
        Phrase(
          id: 'he_bill_0',
          target: 'חשבון, בבקשה.',
          gloss: {
            UiLang.tr: 'Hesabı alabilir miyim?',
            UiLang.en: 'Could I get the check, please?',
          },
        ),
        Phrase(
          id: 'he_bill_1',
          target: 'אנחנו רוצים לשלם ביחד.',
          gloss: {
            UiLang.tr: 'Birlikte ödemek istiyoruz.',
            UiLang.en: 'We would like to pay together.',
          },
        ),
        Phrase(
          id: 'he_bill_2',
          target: 'תשמור את העודף.',
          gloss: {UiLang.tr: 'Üstü kalsın.', UiLang.en: 'Keep the change.'},
        ),
      ],
      turns: [
        SpeakTurn(prompt: 'You catch the waiter.', expected: 'חשבון, בבקשה.'),
        SpeakTurn(
          prompt: 'Split or together?',
          expected: 'אנחנו רוצים לשלם ביחד.',
        ),
      ],
    ),
    Scenario(
      id: 'he_airport',
      lang: LearnLang.he,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Havaalanı check-in', UiLang.en: 'Airport check-in'},
      clipLine: 'יש לי הזמנה.',
      phrases: [
        Phrase(
          id: 'he_airport_0',
          target: 'יש לי הזמנה.',
          gloss: {
            UiLang.tr: 'Rezervasyonum var.',
            UiLang.en: 'I have a reservation.',
          },
        ),
        Phrase(
          id: 'he_airport_1',
          target: 'מושב ליד החלון.',
          gloss: {
            UiLang.tr: 'Pencere kenarı, lütfen.',
            UiLang.en: 'A window seat, please.',
          },
        ),
        Phrase(
          id: 'he_airport_2',
          target: 'זו התור לעלייה?',
          gloss: {
            UiLang.tr: 'Biniş kuyruğu bu mu?',
            UiLang.en: 'Is this the queue for boarding?',
          },
        ),
      ],
      turns: [
        SpeakTurn(prompt: 'The agent greets you.', expected: 'יש לי הזמנה.'),
        SpeakTurn(prompt: 'Window or aisle?', expected: 'מושב ליד החלון.'),
      ],
    ),
    Scenario(
      id: 'fa_shop',
      lang: LearnLang.fa,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Markette alışveriş', UiLang.en: 'At the market'},
      clipLine: 'این چقدر است؟',
      phrases: [
        Phrase(
          id: 'fa_shop_0',
          target: 'این چقدر است؟',
          gloss: {
            UiLang.tr: 'Bu ne kadar?',
            UiLang.en: 'How much does this cost?',
          },
        ),
        Phrase(
          id: 'fa_shop_1',
          target: 'این را می‌برم.',
          gloss: {
            UiLang.tr: 'Bunu alayım.',
            UiLang.en: 'I will take this one.',
          },
        ),
        Phrase(
          id: 'fa_shop_2',
          target: 'کارت قبول می‌کنید؟',
          gloss: {
            UiLang.tr: 'Kart geçerli mi?',
            UiLang.en: 'Do you take card?',
          },
        ),
      ],
      turns: [
        SpeakTurn(prompt: 'You hold an item.', expected: 'این چقدر است؟'),
        SpeakTurn(prompt: 'You want it.', expected: 'این را می‌برم.'),
      ],
    ),
    Scenario(
      id: 'fa_bill',
      lang: LearnLang.fa,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Hesabı istemek', UiLang.en: 'Asking for the bill'},
      clipLine: 'صورتحساب، لطفاً.',
      phrases: [
        Phrase(
          id: 'fa_bill_0',
          target: 'صورتحساب، لطفاً.',
          gloss: {
            UiLang.tr: 'Hesabı alabilir miyim?',
            UiLang.en: 'Could I get the check, please?',
          },
        ),
        Phrase(
          id: 'fa_bill_1',
          target: 'می‌خواهیم با هم حساب کنیم.',
          gloss: {
            UiLang.tr: 'Birlikte ödemek istiyoruz.',
            UiLang.en: 'We would like to pay together.',
          },
        ),
        Phrase(
          id: 'fa_bill_2',
          target: 'بقیه‌اش مال شما.',
          gloss: {UiLang.tr: 'Üstü kalsın.', UiLang.en: 'Keep the change.'},
        ),
      ],
      turns: [
        SpeakTurn(
          prompt: 'You catch the waiter.',
          expected: 'صورتحساب، لطفاً.',
        ),
        SpeakTurn(
          prompt: 'Split or together?',
          expected: 'می‌خواهیم با هم حساب کنیم.',
        ),
      ],
    ),
    Scenario(
      id: 'fa_airport',
      lang: LearnLang.fa,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Havaalanı check-in', UiLang.en: 'Airport check-in'},
      clipLine: 'من رزرو دارم.',
      phrases: [
        Phrase(
          id: 'fa_airport_0',
          target: 'من رزرو دارم.',
          gloss: {
            UiLang.tr: 'Rezervasyonum var.',
            UiLang.en: 'I have a reservation.',
          },
        ),
        Phrase(
          id: 'fa_airport_1',
          target: 'صندلی کنار پنجره.',
          gloss: {
            UiLang.tr: 'Pencere kenarı, lütfen.',
            UiLang.en: 'A window seat, please.',
          },
        ),
        Phrase(
          id: 'fa_airport_2',
          target: 'این صف سوار شدن است؟',
          gloss: {
            UiLang.tr: 'Biniş kuyruğu bu mu?',
            UiLang.en: 'Is this the queue for boarding?',
          },
        ),
      ],
      turns: [
        SpeakTurn(prompt: 'The agent greets you.', expected: 'من رزرو دارم.'),
        SpeakTurn(prompt: 'Window or aisle?', expected: 'صندلی کنار پنجره.'),
      ],
    ),
    Scenario(
      id: 'sw_shop',
      lang: LearnLang.sw,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Markette alışveriş', UiLang.en: 'At the market'},
      clipLine: 'Hii ni bei gani?',
      phrases: [
        Phrase(
          id: 'sw_shop_0',
          target: 'Hii ni bei gani?',
          gloss: {
            UiLang.tr: 'Bu ne kadar?',
            UiLang.en: 'How much does this cost?',
          },
        ),
        Phrase(
          id: 'sw_shop_1',
          target: 'Nitachukua hii.',
          gloss: {
            UiLang.tr: 'Bunu alayım.',
            UiLang.en: 'I will take this one.',
          },
        ),
        Phrase(
          id: 'sw_shop_2',
          target: 'Mnakubali kadi?',
          gloss: {
            UiLang.tr: 'Kart geçerli mi?',
            UiLang.en: 'Do you take card?',
          },
        ),
      ],
      turns: [
        SpeakTurn(prompt: 'You hold an item.', expected: 'Hii ni bei gani?'),
        SpeakTurn(prompt: 'You want it.', expected: 'Nitachukua hii.'),
      ],
    ),
    Scenario(
      id: 'sw_bill',
      lang: LearnLang.sw,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Hesabı istemek', UiLang.en: 'Asking for the bill'},
      clipLine: 'Bili, tafadhali.',
      phrases: [
        Phrase(
          id: 'sw_bill_0',
          target: 'Bili, tafadhali.',
          gloss: {
            UiLang.tr: 'Hesabı alabilir miyim?',
            UiLang.en: 'Could I get the check, please?',
          },
        ),
        Phrase(
          id: 'sw_bill_1',
          target: 'Tunataka kulipa pamoja.',
          gloss: {
            UiLang.tr: 'Birlikte ödemek istiyoruz.',
            UiLang.en: 'We would like to pay together.',
          },
        ),
        Phrase(
          id: 'sw_bill_2',
          target: 'Weka chenji.',
          gloss: {UiLang.tr: 'Üstü kalsın.', UiLang.en: 'Keep the change.'},
        ),
      ],
      turns: [
        SpeakTurn(
          prompt: 'You catch the waiter.',
          expected: 'Bili, tafadhali.',
        ),
        SpeakTurn(
          prompt: 'Split or together?',
          expected: 'Tunataka kulipa pamoja.',
        ),
      ],
    ),
    Scenario(
      id: 'sw_airport',
      lang: LearnLang.sw,
      cefr: Cefr.a1,
      minutes: 6,
      titles: {UiLang.tr: 'Havaalanı check-in', UiLang.en: 'Airport check-in'},
      clipLine: 'Nina uhifadhi.',
      phrases: [
        Phrase(
          id: 'sw_airport_0',
          target: 'Nina uhifadhi.',
          gloss: {
            UiLang.tr: 'Rezervasyonum var.',
            UiLang.en: 'I have a reservation.',
          },
        ),
        Phrase(
          id: 'sw_airport_1',
          target: 'Kiti karibu na dirisha.',
          gloss: {
            UiLang.tr: 'Pencere kenarı, lütfen.',
            UiLang.en: 'A window seat, please.',
          },
        ),
        Phrase(
          id: 'sw_airport_2',
          target: 'Hii ni foleni ya kupanda?',
          gloss: {
            UiLang.tr: 'Biniş kuyruğu bu mu?',
            UiLang.en: 'Is this the queue for boarding?',
          },
        ),
      ],
      turns: [
        SpeakTurn(prompt: 'The agent greets you.', expected: 'Nina uhifadhi.'),
        SpeakTurn(
          prompt: 'Window or aisle?',
          expected: 'Kiti karibu na dirisha.',
        ),
      ],
    ),
    ...catalogExtraBatchA,
    ...catalogExtraBatchB,
    ...catalogExtraBatchC,
    ...catalogExtraBatchD,
    ...catalogExtraBatchE,
    ...catalogExtraBatchF,
    ...catalogExtraBatchG,
    ...catalogExtraBatchH,
    ...catalogExtraBatchJ,
    ...catalogExtraBatchK,
  ];
}
