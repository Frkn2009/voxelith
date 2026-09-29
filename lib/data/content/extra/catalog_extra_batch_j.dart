// GENERATED — content batch J: FI / DA / NO, 9 missing A1 topics each.
// See docs/ICERIK_URETIM_BRIEFI.md for schema/tone rules. Not wired into
// Catalog yet — integration (import + _all list) happens centrally once all
// batches are delivered.
// Finnish case forms are flagged with `// TODO: native review` per the
// brief's low-resource-language quality bar.
// ignore_for_file: lines_longer_than_80_chars

import '../../models/models.dart';

final List<Scenario> catalogExtraBatchJ = [
  // ===================== FINNISH (fi) =====================
  Scenario(
    id: 'fi_intro',
    lang: LearnLang.fi,
    cefr: Cefr.a1,
    minutes: 7,
    titles: {UiLang.tr: 'Tanışma', UiLang.en: 'Getting to know someone'},
    clipLine: 'Hauska tutustua.',
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr:
            'Fince\'de fiil kişiye göre çekimlenir: "ben" = olen, "o" = on. Bu yüzden "minä on" yanlıştır. Çekim kişiyi zaten gösterdiği için "minä" genelde söylenmez: "Olen opettaja."',
        UiLang.en:
            'Finnish verbs change their ending for each person: "I am" = olen, "he/she is" = on, so "minä on" is wrong. Because "olen" already means "I am", "minä" is usually dropped.',
      },
      goodExample: 'Olen opettaja.',
      badExample: 'Minä on opettaja.',
    ),
    phrases: [
      Phrase(
        id: 'fi_intro_0',
        target: 'Hauska tutustua.',
        gloss: {
          UiLang.tr: 'Tanıştığımıza memnun oldum.',
          UiLang.en: 'Nice to meet you.',
        },
      ),
      Phrase(
        id: 'fi_intro_1',
        target: 'Mikä sinun nimesi on?',
        gloss: {UiLang.tr: 'Adın ne?', UiLang.en: 'What is your name?'},
      ),
      Phrase(
        id: 'fi_intro_2',
        // TODO: native review — "-vuotias" suffix form is more idiomatic
        // than this literal construction for stating age.
        target: 'Olen kolmekymmentä vuotta vanha.',
        gloss: {
          UiLang.tr: 'Otuz yaşındayım.',
          UiLang.en: 'I am thirty years old.',
        },
      ),
      Phrase(
        id: 'fi_intro_3',
        target: 'Mitä teet työksesi?',
        gloss: {
          UiLang.tr: 'Ne iş yapıyorsun?',
          UiLang.en: 'What do you do for work?',
        },
      ),
      Phrase(
        id: 'fi_intro_4',
        target: 'Olen opettaja.',
        gloss: {UiLang.tr: 'Öğretmenim.', UiLang.en: 'I am a teacher.'},
      ),
      Phrase(
        id: 'fi_intro_5',
        target: 'Puhutko englantia?',
        gloss: {
          UiLang.tr: 'İngilizce konuşuyor musun?',
          UiLang.en: 'Do you speak English?',
        },
      ),
      Phrase(
        id: 'fi_intro_6',
        target: 'Nähdään pian!',
        gloss: {UiLang.tr: 'Yakında görüşürüz!', UiLang.en: 'See you soon!'},
      ),
    ],
    turns: [
      SpeakTurn(prompt: 'You meet someone new.', expected: 'Hauska tutustua.'),
      SpeakTurn(
        prompt: 'You want to know their name.',
        expected: 'Mikä sinun nimesi on?',
      ),
      SpeakTurn(
        prompt: 'They ask your age.',
        expected: 'Olen kolmekymmentä vuotta vanha.',
      ),
      SpeakTurn(
        prompt: 'You want to know their job.',
        expected: 'Mitä teet työksesi?',
      ),
      SpeakTurn(prompt: 'They ask what you do.', expected: 'Olen opettaja.'),
      SpeakTurn(
        prompt: 'You want to make sure you understand each other.',
        expected: 'Puhutko englantia?',
      ),
      SpeakTurn(prompt: 'It is time to leave.', expected: 'Nähdään pian!'),
    ],
  ),
  Scenario(
    id: 'fi_shopping',
    lang: LearnLang.fi,
    cefr: Cefr.a1,
    minutes: 7,
    titles: {UiLang.tr: 'Kıyafet alışverişi', UiLang.en: 'Clothes shopping'},
    clipLine: 'Saanko sovittaa tätä?',
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr:
            'Fince\'de "daha büyük" gibi karşılaştırma sıfatın sonuna -mpi eki eklenerek yapılır: iso (büyük) -> isompi (daha büyük).',
        UiLang.en:
            'To say "bigger", Finnish adds -mpi to the adjective instead of using a separate word: iso (big) becomes isompi (bigger).',
      },
      goodExample: 'Onko teillä tätä isommassa koossa?',
      badExample: 'Onko teillä tätä iso koossa?',
    ),
    phrases: [
      Phrase(
        id: 'fi_shopping_0',
        target: 'Saanko sovittaa tätä?',
        gloss: {
          UiLang.tr: 'Bunu deneyebilir miyim?',
          UiLang.en: 'Can I try this on?',
        },
      ),
      Phrase(
        id: 'fi_shopping_1',
        // TODO: native review — case choice on "koossa" (bigger size).
        target: 'Onko teillä tätä isommassa koossa?',
        gloss: {
          UiLang.tr: 'Bunun daha büyük bedeni var mı?',
          UiLang.en: 'Do you have this in a bigger size?',
        },
      ),
      Phrase(
        id: 'fi_shopping_2',
        target: 'Onko tätä toisessa värissä?',
        gloss: {
          UiLang.tr: 'Bunun başka rengi var mı?',
          UiLang.en: 'Is this available in another color?',
        },
      ),
      Phrase(
        id: 'fi_shopping_3',
        target: 'Tämä on liian kallis.',
        gloss: {
          UiLang.tr: 'Bu çok pahalı.',
          UiLang.en: 'This is too expensive.',
        },
      ),
      Phrase(
        id: 'fi_shopping_4',
        target: 'Onko tämä alennuksessa?',
        gloss: {
          UiLang.tr: 'Bu indirimde mi?',
          UiLang.en: 'Is this on discount?',
        },
      ),
      Phrase(
        id: 'fi_shopping_5',
        target: 'Otan tämän värin.',
        gloss: {
          UiLang.tr: 'Bu rengi alıyorum.',
          UiLang.en: "I'll take this color.",
        },
      ),
      Phrase(
        id: 'fi_shopping_6',
        target: 'Voinko maksaa kortilla?',
        gloss: {
          UiLang.tr: 'Kartla ödeyebilir miyim?',
          UiLang.en: 'Can I pay by card?',
        },
      ),
    ],
    turns: [
      SpeakTurn(
        prompt: 'You pick up a piece of clothing.',
        expected: 'Saanko sovittaa tätä?',
      ),
      SpeakTurn(
        prompt: 'It is too small.',
        expected: 'Onko teillä tätä isommassa koossa?',
      ),
      SpeakTurn(
        prompt: 'You do not like the color.',
        expected: 'Onko tätä toisessa värissä?',
      ),
      SpeakTurn(
        prompt: 'You check the price tag.',
        expected: 'Tämä on liian kallis.',
      ),
      SpeakTurn(
        prompt: 'You look for a better price.',
        expected: 'Onko tämä alennuksessa?',
      ),
      SpeakTurn(prompt: 'You decide to buy it.', expected: 'Otan tämän värin.'),
      SpeakTurn(
        prompt: 'You go to the register.',
        expected: 'Voinko maksaa kortilla?',
      ),
    ],
  ),
  Scenario(
    id: 'fi_numbers_time',
    lang: LearnLang.fi,
    cefr: Cefr.a1,
    minutes: 7,
    titles: {UiLang.tr: 'Sayılar ve saat', UiLang.en: 'Numbers & time'},
    clipLine: 'Paljonko kello on?',
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr:
            'Birden büyük sayılardan sonra isim çoğul olmaz, özel bir ek alır: "kaksi lasta" (iki çocuk) derken "lapset" değil "lasta" kullanılır.',
        UiLang.en:
            'After a number greater than one, the noun changes its ending instead of becoming plural: "kaksi lasta" (two children) uses "lasta", not "lapset".',
      },
      goodExample: 'Minulla on kaksi lasta.',
      badExample: 'Minulla on kaksi lapset.',
    ),
    phrases: [
      Phrase(
        id: 'fi_numbers_time_0',
        target: 'Yksi, kaksi, kolme, neljä, viisi.',
        gloss: {
          UiLang.tr: 'Bir, iki, üç, dört, beş.',
          UiLang.en: 'One, two, three, four, five.',
        },
      ),
      Phrase(
        id: 'fi_numbers_time_1',
        target: 'Paljonko kello on?',
        gloss: {UiLang.tr: 'Saat kaç?', UiLang.en: 'What time is it?'},
      ),
      Phrase(
        id: 'fi_numbers_time_2',
        target: 'Kello on kaksi.',
        gloss: {UiLang.tr: 'Saat iki.', UiLang.en: 'It is two o\'clock.'},
      ),
      Phrase(
        id: 'fi_numbers_time_3',
        target: 'Tapaamme kello kolme.',
        gloss: {
          UiLang.tr: 'Saat üçte buluşuyoruz.',
          UiLang.en: 'We\'ll meet at three o\'clock.',
        },
      ),
      Phrase(
        id: 'fi_numbers_time_4',
        target: 'Se maksaa kymmenen euroa.',
        gloss: {
          UiLang.tr: 'On avro tutuyor.',
          UiLang.en: 'It costs ten euros.',
        },
      ),
      Phrase(
        id: 'fi_numbers_time_5',
        target: 'Minulla on kaksi lasta.',
        gloss: {
          UiLang.tr: 'İki çocuğum var.',
          UiLang.en: 'I have two children.',
        },
      ),
      Phrase(
        id: 'fi_numbers_time_6',
        target: 'Näen kolme koiraa.',
        gloss: {
          UiLang.tr: 'Üç köpek görüyorum.',
          UiLang.en: 'I see three dogs.',
        },
      ),
    ],
    turns: [
      SpeakTurn(
        prompt: 'You practice counting.',
        expected: 'Yksi, kaksi, kolme, neljä, viisi.',
      ),
      SpeakTurn(
        prompt: 'You want to know the time.',
        expected: 'Paljonko kello on?',
      ),
      SpeakTurn(
        prompt: 'Someone asks you the time.',
        expected: 'Kello on kaksi.',
      ),
      SpeakTurn(
        prompt: 'You arrange when to meet.',
        expected: 'Tapaamme kello kolme.',
      ),
      SpeakTurn(
        prompt: 'You tell a friend the price.',
        expected: 'Se maksaa kymmenen euroa.',
      ),
      SpeakTurn(
        prompt: 'Someone asks how many children you have.',
        expected: 'Minulla on kaksi lasta.',
      ),
      SpeakTurn(
        prompt: 'You count the animals you see.',
        expected: 'Näen kolme koiraa.',
      ),
    ],
  ),
  Scenario(
    id: 'fi_family',
    lang: LearnLang.fi,
    cefr: Cefr.a1,
    minutes: 7,
    titles: {UiLang.tr: 'Aile', UiLang.en: 'Family'},
    clipLine: 'Tässä on äitini.',
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr:
            'İyelik ("benim") ayrı bir kelimeyle değil, ismin sonuna eklenen -ni ekiyle gösterilir: äiti (anne) -> äitini (annem).',
        UiLang.en:
            'Possession is shown by adding -ni to the end of the noun instead of a separate word for "my": äiti (mother) becomes äitini (my mother).',
      },
      goodExample: 'Tässä on äitini.',
      badExample: 'Tässä on minun äiti.',
    ),
    phrases: [
      Phrase(
        id: 'fi_family_0',
        target: 'Tässä on äitini.',
        gloss: {UiLang.tr: 'Bu benim annem.', UiLang.en: 'This is my mother.'},
      ),
      Phrase(
        id: 'fi_family_1',
        target: 'Isäni on lääkäri.',
        gloss: {
          UiLang.tr: 'Babam doktor.',
          UiLang.en: 'My father is a doctor.',
        },
      ),
      Phrase(
        id: 'fi_family_2',
        target: 'Minulla on kaksi sisarusta.',
        gloss: {
          UiLang.tr: 'İki kardeşim var.',
          UiLang.en: 'I have two siblings.',
        },
      ),
      Phrase(
        id: 'fi_family_3',
        // TODO: native review — consonant gradation on "veljeni" (veli -> veljeni).
        target: 'Veljeni asuu Helsingissä.',
        gloss: {
          UiLang.tr: 'Erkek kardeşim Helsinki\'de yaşıyor.',
          UiLang.en: 'My brother lives in Helsinki.',
        },
      ),
      Phrase(
        id: 'fi_family_4',
        target: 'Siskoni on nuorempi kuin minä.',
        gloss: {
          UiLang.tr: 'Kız kardeşim benden daha küçük.',
          UiLang.en: 'My sister is younger than me.',
        },
      ),
      Phrase(
        id: 'fi_family_5',
        // TODO: native review — "vanhempani" (my parents) plural possessive form.
        target: 'Vanhempani asuvat maalla.',
        gloss: {
          UiLang.tr: 'Ailem kırsalda yaşıyor.',
          UiLang.en: 'My parents live in the countryside.',
        },
      ),
      Phrase(
        id: 'fi_family_6',
        target: 'Onko sinulla lapsia?',
        gloss: {
          UiLang.tr: 'Çocuğun var mı?',
          UiLang.en: 'Do you have children?',
        },
      ),
    ],
    turns: [
      SpeakTurn(prompt: 'You show a photo.', expected: 'Tässä on äitini.'),
      SpeakTurn(
        prompt: 'They ask about your father.',
        expected: 'Isäni on lääkäri.',
      ),
      SpeakTurn(
        prompt: 'They ask if you have siblings.',
        expected: 'Minulla on kaksi sisarusta.',
      ),
      SpeakTurn(
        prompt: 'They ask where your brother lives.',
        expected: 'Veljeni asuu Helsingissä.',
      ),
      SpeakTurn(
        prompt: 'They ask about your sister.',
        expected: 'Siskoni on nuorempi kuin minä.',
      ),
      SpeakTurn(
        prompt: 'They ask about your parents.',
        expected: 'Vanhempani asuvat maalla.',
      ),
      SpeakTurn(
        prompt: 'You ask them the same question.',
        expected: 'Onko sinulla lapsia?',
      ),
    ],
  ),
  Scenario(
    id: 'fi_weather',
    lang: LearnLang.fi,
    cefr: Cefr.a1,
    minutes: 7,
    titles: {UiLang.tr: 'Hava durumu', UiLang.en: 'Weather'},
    clipLine: 'Millainen sää tänään on?',
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr:
            'Hava durumu cümlelerinde İngilizce\'deki "it" gibi bir özne kullanılmaz, sadece "on" fiili ve sıfat yeterlidir.',
        UiLang.en:
            'Weather sentences use only "on" plus an adjective, with no subject word like English "it".',
      },
      goodExample: 'Ulkona on kylmä.',
      badExample: 'Se on kylmä ulkona.',
    ),
    phrases: [
      Phrase(
        id: 'fi_weather_0',
        target: 'Millainen sää tänään on?',
        gloss: {
          UiLang.tr: 'Bugün hava nasıl?',
          UiLang.en: 'What\'s the weather like today?',
        },
      ),
      Phrase(
        id: 'fi_weather_1',
        target: 'Ulkona on kylmä.',
        gloss: {UiLang.tr: 'Dışarısı soğuk.', UiLang.en: 'It\'s cold outside.'},
      ),
      Phrase(
        id: 'fi_weather_2',
        target: 'Aurinko paistaa.',
        gloss: {UiLang.tr: 'Güneş parlıyor.', UiLang.en: 'The sun is shining.'},
      ),
      Phrase(
        id: 'fi_weather_3',
        target: 'Ulkona sataa.',
        gloss: {
          UiLang.tr: 'Dışarıda yağmur yağıyor.',
          UiLang.en: 'It\'s raining outside.',
        },
      ),
      Phrase(
        id: 'fi_weather_4',
        target: 'Huomenna on lämmintä.',
        gloss: {
          UiLang.tr: 'Yarın hava sıcak olacak.',
          UiLang.en: 'Tomorrow it will be warm.',
        },
      ),
      Phrase(
        id: 'fi_weather_5',
        target: 'Onko tänään tuulista?',
        gloss: {
          UiLang.tr: 'Bugün rüzgarlı mı?',
          UiLang.en: 'Is it windy today?',
        },
      ),
      Phrase(
        id: 'fi_weather_6',
        target: 'Ota sateenvarjo mukaan.',
        gloss: {
          UiLang.tr: 'Yanına şemsiye al.',
          UiLang.en: 'Take an umbrella with you.',
        },
      ),
    ],
    turns: [
      SpeakTurn(
        prompt: 'You start small talk.',
        expected: 'Millainen sää tänään on?',
      ),
      SpeakTurn(prompt: 'You step outside.', expected: 'Ulkona on kylmä.'),
      SpeakTurn(
        prompt: 'You look up at the sky.',
        expected: 'Aurinko paistaa.',
      ),
      SpeakTurn(prompt: 'You look out the window.', expected: 'Ulkona sataa.'),
      SpeakTurn(
        prompt: 'You check tomorrow\'s forecast.',
        expected: 'Huomenna on lämmintä.',
      ),
      SpeakTurn(
        prompt: 'You plan to go outside.',
        expected: 'Onko tänään tuulista?',
      ),
      SpeakTurn(
        prompt: 'You warn a friend before they leave.',
        expected: 'Ota sateenvarjo mukaan.',
      ),
    ],
  ),
  Scenario(
    id: 'fi_transport',
    lang: LearnLang.fi,
    cefr: Cefr.a1,
    minutes: 7,
    titles: {UiLang.tr: 'Ulaşım', UiLang.en: 'Getting around'},
    clipLine: 'Miten pääsen asemalle?',
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr:
            'Bir yere gitmek/varmak anlamı isim sonuna -lle eki eklenerek verilir: asema (istasyon) -> asemalle (istasyona).',
        UiLang.en:
            'To say you are going "to" a place, add -lle to the end of the noun: asema (station) becomes asemalle (to the station).',
      },
      goodExample: 'Haluan mennä lentokentälle.',
      badExample: 'Haluan mennä lentokenttä.',
    ),
    phrases: [
      Phrase(
        id: 'fi_transport_0',
        target: 'Miten pääsen asemalle?',
        gloss: {
          UiLang.tr: 'İstasyona nasıl giderim?',
          UiLang.en: 'How do I get to the station?',
        },
      ),
      Phrase(
        id: 'fi_transport_1',
        target: 'Menen bussilla töihin.',
        gloss: {
          UiLang.tr: 'İşe otobüsle gidiyorum.',
          UiLang.en: 'I go to work by bus.',
        },
      ),
      Phrase(
        id: 'fi_transport_2',
        target: 'Mistä ostan lipun?',
        gloss: {
          UiLang.tr: 'Bileti nereden alırım?',
          UiLang.en: 'Where do I buy a ticket?',
        },
      ),
      Phrase(
        id: 'fi_transport_3',
        target: 'Seuraava juna lähtee kello yhdeksän.',
        gloss: {
          UiLang.tr: 'Sonraki tren saat dokuzda kalkıyor.',
          UiLang.en: 'The next train leaves at nine o\'clock.',
        },
      ),
      Phrase(
        id: 'fi_transport_4',
        target: 'Onko tämä oikea laituri?',
        gloss: {
          UiLang.tr: 'Bu doğru peron mu?',
          UiLang.en: 'Is this the right platform?',
        },
      ),
      Phrase(
        id: 'fi_transport_5',
        target: 'Haluan mennä lentokentälle.',
        gloss: {
          UiLang.tr: 'Havalimanına gitmek istiyorum.',
          UiLang.en: 'I want to go to the airport.',
        },
      ),
      Phrase(
        id: 'fi_transport_6',
        target: 'Missä on lähin pysäkki?',
        gloss: {
          UiLang.tr: 'En yakın durak nerede?',
          UiLang.en: 'Where is the nearest stop?',
        },
      ),
    ],
    turns: [
      SpeakTurn(
        prompt: 'You are lost near a train station.',
        expected: 'Miten pääsen asemalle?',
      ),
      SpeakTurn(
        prompt: 'They ask how you get to work.',
        expected: 'Menen bussilla töihin.',
      ),
      SpeakTurn(prompt: 'You need a ticket.', expected: 'Mistä ostan lipun?'),
      SpeakTurn(
        prompt: 'You check the departure board.',
        expected: 'Seuraava juna lähtee kello yhdeksän.',
      ),
      SpeakTurn(
        prompt: 'You are not sure you are in the right place.',
        expected: 'Onko tämä oikea laituri?',
      ),
      SpeakTurn(
        prompt: 'You are heading to catch a flight.',
        expected: 'Haluan mennä lentokentälle.',
      ),
      SpeakTurn(
        prompt: 'You look for the bus.',
        expected: 'Missä on lähin pysäkki?',
      ),
    ],
  ),
  Scenario(
    id: 'fi_emergency',
    lang: LearnLang.fi,
    cefr: Cefr.a1,
    minutes: 7,
    titles: {UiLang.tr: 'Acil durum', UiLang.en: 'Emergency'},
    clipLine: 'Apua!',
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr:
            'Emir kipi, fiilin sözlük halinden -a/-ä harfinin atılmasıyla yapılır: soittaa (aramak) -> soita (ara!).',
        UiLang.en:
            'The command form drops the final -a/-ä from the dictionary form of the verb: soittaa (to call) becomes soita (call!).',
      },
      goodExample: 'Soita ambulanssi!',
      badExample: 'Soittaa ambulanssi!',
    ),
    phrases: [
      Phrase(
        id: 'fi_emergency_0',
        target: 'Apua!',
        gloss: {UiLang.tr: 'İmdat!', UiLang.en: 'Help!'},
      ),
      Phrase(
        id: 'fi_emergency_1',
        target: 'Soita ambulanssi!',
        gloss: {UiLang.tr: 'Ambulans çağır!', UiLang.en: 'Call an ambulance!'},
      ),
      Phrase(
        id: 'fi_emergency_2',
        target: 'Minä tarvitsen lääkäriä.',
        gloss: {
          UiLang.tr: 'Doktora ihtiyacım var.',
          UiLang.en: 'I need a doctor.',
        },
      ),
      Phrase(
        id: 'fi_emergency_3',
        target: 'Missä on lähin sairaala?',
        gloss: {
          UiLang.tr: 'En yakın hastane nerede?',
          UiLang.en: 'Where is the nearest hospital?',
        },
      ),
      Phrase(
        id: 'fi_emergency_4',
        target: 'Soita poliisi!',
        gloss: {UiLang.tr: 'Polisi ara!', UiLang.en: 'Call the police!'},
      ),
      Phrase(
        id: 'fi_emergency_5',
        target: 'Olen eksynyt.',
        gloss: {UiLang.tr: 'Kayboldum.', UiLang.en: 'I am lost.'},
      ),
      Phrase(
        id: 'fi_emergency_6',
        target: 'Onko täällä joku, joka puhuu englantia?',
        gloss: {
          UiLang.tr: 'Burada İngilizce konuşan biri var mı?',
          UiLang.en: 'Is there anyone here who speaks English?',
        },
      ),
    ],
    turns: [
      SpeakTurn(prompt: 'Something just happened.', expected: 'Apua!'),
      SpeakTurn(
        prompt: 'Someone is badly hurt.',
        expected: 'Soita ambulanssi!',
      ),
      SpeakTurn(
        prompt: 'You are not feeling well.',
        expected: 'Minä tarvitsen lääkäriä.',
      ),
      SpeakTurn(
        prompt: 'You need medical help fast.',
        expected: 'Missä on lähin sairaala?',
      ),
      SpeakTurn(
        prompt: 'You see a crime happening.',
        expected: 'Soita poliisi!',
      ),
      SpeakTurn(prompt: 'You cannot find your way.', expected: 'Olen eksynyt.'),
      SpeakTurn(
        prompt: 'You need someone who can translate.',
        expected: 'Onko täällä joku, joka puhuu englantia?',
      ),
    ],
  ),
  Scenario(
    id: 'fi_routine',
    lang: LearnLang.fi,
    cefr: Cefr.a1,
    minutes: 7,
    titles: {UiLang.tr: 'Günlük rutin', UiLang.en: 'Daily routine'},
    clipLine: 'Herään kello seitsemän.',
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr: '"Ben" özneli fiiller -n ekiyle biter: herää + n = herään.',
        UiLang.en:
            'Verbs used with "I" end in -n: herää + n = herään (I wake up).',
      },
      goodExample: 'Herään kello seitsemän.',
      badExample: 'Herää kello seitsemän.',
    ),
    phrases: [
      Phrase(
        id: 'fi_routine_0',
        target: 'Herään kello seitsemän.',
        gloss: {
          UiLang.tr: 'Saat yedide uyanıyorum.',
          UiLang.en: 'I wake up at seven o\'clock.',
        },
      ),
      Phrase(
        id: 'fi_routine_1',
        target: 'Syön aamiaista kotona.',
        gloss: {
          UiLang.tr: 'Evde kahvaltı yapıyorum.',
          UiLang.en: 'I eat breakfast at home.',
        },
      ),
      Phrase(
        id: 'fi_routine_2',
        target: 'Lähden kotoa kello kahdeksan.',
        gloss: {
          UiLang.tr: 'Evden saat sekizde çıkıyorum.',
          UiLang.en: 'I leave home at eight o\'clock.',
        },
      ),
      Phrase(
        id: 'fi_routine_3',
        target: 'Käyn suihkussa joka aamu.',
        gloss: {
          UiLang.tr: 'Her sabah duş alıyorum.',
          UiLang.en: 'I take a shower every morning.',
        },
      ),
      Phrase(
        id: 'fi_routine_4',
        target: 'Luen kirjaa ennen nukkumaanmenoa.',
        gloss: {
          UiLang.tr: 'Yatmadan önce kitap okuyorum.',
          UiLang.en: 'I read a book before going to bed.',
        },
      ),
      Phrase(
        id: 'fi_routine_5',
        target: 'Menen nukkumaan kello yksitoista.',
        gloss: {
          UiLang.tr: 'Saat on birde yatıyorum.',
          UiLang.en: 'I go to sleep at eleven o\'clock.',
        },
      ),
      Phrase(
        id: 'fi_routine_6',
        target: 'Teen samat asiat joka päivä.',
        gloss: {
          UiLang.tr: 'Her gün aynı şeyleri yapıyorum.',
          UiLang.en: 'I do the same things every day.',
        },
      ),
    ],
    turns: [
      SpeakTurn(
        prompt: 'Someone asks about your mornings.',
        expected: 'Herään kello seitsemän.',
      ),
      SpeakTurn(
        prompt: 'They ask what you eat.',
        expected: 'Syön aamiaista kotona.',
      ),
      SpeakTurn(
        prompt: 'They ask when you leave the house.',
        expected: 'Lähden kotoa kello kahdeksan.',
      ),
      SpeakTurn(
        prompt: 'They ask about your morning habits.',
        expected: 'Käyn suihkussa joka aamu.',
      ),
      SpeakTurn(
        prompt: 'They ask what you do before bed.',
        expected: 'Luen kirjaa ennen nukkumaanmenoa.',
      ),
      SpeakTurn(
        prompt: 'They ask when you sleep.',
        expected: 'Menen nukkumaan kello yksitoista.',
      ),
      SpeakTurn(
        prompt: 'They ask if your days are different.',
        expected: 'Teen samat asiat joka päivä.',
      ),
    ],
  ),
  Scenario(
    id: 'fi_past_story',
    lang: LearnLang.fi,
    cefr: Cefr.a1,
    minutes: 7,
    titles: {
      UiLang.tr: 'Bir günü anlatmak',
      UiLang.en: 'Telling a story about your day',
    },
    clipLine: 'Eilen menin kaupunkiin.',
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr:
            'Geçmiş zaman, fiil gövdesine -i- eklenerek yapılır: mennä (gitmek) -> menin (gittim).',
        UiLang.en:
            'The past tense is made by adding -i- inside the verb: mennä (to go) becomes menin (I went).',
      },
      goodExample: 'Eilen menin kaupunkiin.',
      badExample: 'Menen kaupunkiin eilen.',
    ),
    phrases: [
      Phrase(
        id: 'fi_past_story_0',
        target: 'Eilen menin kaupunkiin.',
        gloss: {
          UiLang.tr: 'Dün şehre gittim.',
          UiLang.en: 'Yesterday I went to the city.',
        },
      ),
      Phrase(
        id: 'fi_past_story_1',
        target: 'Tapasin ystäväni kahvilassa.',
        gloss: {
          UiLang.tr: 'Arkadaşımla kafede buluştum.',
          UiLang.en: 'I met my friend at a café.',
        },
      ),
      Phrase(
        id: 'fi_past_story_2',
        target: 'Söimme lounasta yhdessä.',
        gloss: {
          UiLang.tr: 'Birlikte öğle yemeği yedik.',
          UiLang.en: 'We ate lunch together.',
        },
      ),
      Phrase(
        id: 'fi_past_story_3',
        target: 'Sitten kävelimme puistossa.',
        gloss: {
          UiLang.tr: 'Sonra parkta yürüdük.',
          UiLang.en: 'Then we walked in the park.',
        },
      ),
      Phrase(
        id: 'fi_past_story_4',
        target: 'Sää oli aurinkoinen.',
        gloss: {
          UiLang.tr: 'Hava güneşliydi.',
          UiLang.en: 'The weather was sunny.',
        },
      ),
      Phrase(
        id: 'fi_past_story_5',
        target: 'Palasin kotiin illalla.',
        gloss: {
          UiLang.tr: 'Akşam eve döndüm.',
          UiLang.en: 'I returned home in the evening.',
        },
      ),
      Phrase(
        id: 'fi_past_story_6',
        target: 'Se oli hyvä päivä.',
        gloss: {UiLang.tr: 'Güzel bir gündü.', UiLang.en: 'It was a good day.'},
      ),
    ],
    turns: [
      SpeakTurn(
        prompt: 'Someone asks what you did yesterday.',
        expected: 'Eilen menin kaupunkiin.',
      ),
      SpeakTurn(
        prompt: 'They ask if you saw anyone.',
        expected: 'Tapasin ystäväni kahvilassa.',
      ),
      SpeakTurn(
        prompt: 'They ask what you did together.',
        expected: 'Söimme lounasta yhdessä.',
      ),
      SpeakTurn(
        prompt: 'They ask what happened next.',
        expected: 'Sitten kävelimme puistossa.',
      ),
      SpeakTurn(
        prompt: 'They ask about the weather that day.',
        expected: 'Sää oli aurinkoinen.',
      ),
      SpeakTurn(
        prompt: 'They ask when you got home.',
        expected: 'Palasin kotiin illalla.',
      ),
      SpeakTurn(
        prompt: 'They ask how the day was.',
        expected: 'Se oli hyvä päivä.',
      ),
    ],
  ),

  // ===================== DANISH (da) =====================
  Scenario(
    id: 'da_intro',
    lang: LearnLang.da,
    cefr: Cefr.a1,
    minutes: 7,
    titles: {UiLang.tr: 'Tanışma', UiLang.en: 'Getting to know someone'},
    clipLine: 'Rart at møde dig.',
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr:
            'Danca\'da çekimli fiil her zaman cümlenin ikinci öğesidir; cümle bir zaman zarfıyla başlasa bile fiil ikinci sırada kalır ve özne ondan sonra gelir.',
        UiLang.en:
            'The conjugated verb always comes second in a Danish sentence — even when the sentence starts with a time word, the verb stays second and the subject moves after it.',
      },
      goodExample: 'I dag møder jeg en ny ven.',
      badExample: 'I dag jeg møder en ny ven.',
    ),
    phrases: [
      Phrase(
        id: 'da_intro_0',
        target: 'Rart at møde dig.',
        gloss: {
          UiLang.tr: 'Tanıştığımıza memnun oldum.',
          UiLang.en: 'Nice to meet you.',
        },
      ),
      Phrase(
        id: 'da_intro_1',
        target: 'Hvad hedder du?',
        gloss: {UiLang.tr: 'Adın ne?', UiLang.en: 'What is your name?'},
      ),
      Phrase(
        id: 'da_intro_2',
        target: 'Jeg er tredive år gammel.',
        gloss: {
          UiLang.tr: 'Otuz yaşındayım.',
          UiLang.en: 'I am thirty years old.',
        },
      ),
      Phrase(
        id: 'da_intro_3',
        target: 'Hvad arbejder du med?',
        gloss: {
          UiLang.tr: 'Ne iş yapıyorsun?',
          UiLang.en: 'What do you do for work?',
        },
      ),
      Phrase(
        id: 'da_intro_4',
        target: 'Jeg er lærer.',
        gloss: {UiLang.tr: 'Öğretmenim.', UiLang.en: 'I am a teacher.'},
      ),
      Phrase(
        id: 'da_intro_5',
        target: 'Taler du engelsk?',
        gloss: {
          UiLang.tr: 'İngilizce konuşuyor musun?',
          UiLang.en: 'Do you speak English?',
        },
      ),
      Phrase(
        id: 'da_intro_6',
        target: 'Vi ses snart!',
        gloss: {UiLang.tr: 'Yakında görüşürüz!', UiLang.en: 'See you soon!'},
      ),
    ],
    turns: [
      SpeakTurn(prompt: 'You meet someone new.', expected: 'Rart at møde dig.'),
      SpeakTurn(
        prompt: 'You want to know their name.',
        expected: 'Hvad hedder du?',
      ),
      SpeakTurn(
        prompt: 'They ask your age.',
        expected: 'Jeg er tredive år gammel.',
      ),
      SpeakTurn(
        prompt: 'You want to know their job.',
        expected: 'Hvad arbejder du med?',
      ),
      SpeakTurn(prompt: 'They ask what you do.', expected: 'Jeg er lærer.'),
      SpeakTurn(
        prompt: 'You want to make sure you understand each other.',
        expected: 'Taler du engelsk?',
      ),
      SpeakTurn(prompt: 'It is time to leave.', expected: 'Vi ses snart!'),
    ],
  ),
  Scenario(
    id: 'da_shopping',
    lang: LearnLang.da,
    cefr: Cefr.a1,
    minutes: 7,
    titles: {UiLang.tr: 'Kıyafet alışverişi', UiLang.en: 'Clothes shopping'},
    clipLine: 'Må jeg prøve den her?',
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr:
            'Danca "the" anlamını ayrı bir kelimeyle değil, ismin sonuna eklenen bir ekle gösterir: trøje (kazak) -> trøjen (o kazak).',
        UiLang.en:
            'Danish shows "the" by adding a suffix to the noun instead of a separate word: trøje (sweater) becomes trøjen (the sweater).',
      },
      goodExample: 'Jeg tager trøjen.',
      badExample: 'Jeg tager den trøje.',
    ),
    phrases: [
      Phrase(
        id: 'da_shopping_0',
        target: 'Må jeg prøve den her?',
        gloss: {
          UiLang.tr: 'Bunu deneyebilir miyim?',
          UiLang.en: 'Can I try this on?',
        },
      ),
      Phrase(
        id: 'da_shopping_1',
        target: 'Har I den i en større størrelse?',
        gloss: {
          UiLang.tr: 'Bunun daha büyük bedeni var mı?',
          UiLang.en: 'Do you have it in a bigger size?',
        },
      ),
      Phrase(
        id: 'da_shopping_2',
        target: 'Har I den i en anden farve?',
        gloss: {
          UiLang.tr: 'Bunun başka rengi var mı?',
          UiLang.en: 'Do you have it in another color?',
        },
      ),
      Phrase(
        id: 'da_shopping_3',
        target: 'Den er for dyr.',
        gloss: {UiLang.tr: 'Bu çok pahalı.', UiLang.en: "It's too expensive."},
      ),
      Phrase(
        id: 'da_shopping_4',
        target: 'Er der rabat på den her?',
        gloss: {
          UiLang.tr: 'Bunda indirim var mı?',
          UiLang.en: 'Is there a discount on this?',
        },
      ),
      Phrase(
        id: 'da_shopping_5',
        target: 'Jeg tager trøjen.',
        gloss: {
          UiLang.tr: 'Kazağı alıyorum.',
          UiLang.en: "I'll take the sweater.",
        },
      ),
      Phrase(
        id: 'da_shopping_6',
        target: 'Kan jeg betale med kort?',
        gloss: {
          UiLang.tr: 'Kartla ödeyebilir miyim?',
          UiLang.en: 'Can I pay by card?',
        },
      ),
    ],
    turns: [
      SpeakTurn(
        prompt: 'You pick up a piece of clothing.',
        expected: 'Må jeg prøve den her?',
      ),
      SpeakTurn(
        prompt: 'It is too small.',
        expected: 'Har I den i en større størrelse?',
      ),
      SpeakTurn(
        prompt: 'You do not like the color.',
        expected: 'Har I den i en anden farve?',
      ),
      SpeakTurn(
        prompt: 'You check the price tag.',
        expected: 'Den er for dyr.',
      ),
      SpeakTurn(
        prompt: 'You look for a better price.',
        expected: 'Er der rabat på den her?',
      ),
      SpeakTurn(prompt: 'You decide to buy it.', expected: 'Jeg tager trøjen.'),
      SpeakTurn(
        prompt: 'You go to the register.',
        expected: 'Kan jeg betale med kort?',
      ),
    ],
  ),
  Scenario(
    id: 'da_numbers_time',
    lang: LearnLang.da,
    cefr: Cefr.a1,
    minutes: 7,
    titles: {UiLang.tr: 'Sayılar ve saat', UiLang.en: 'Numbers & time'},
    clipLine: 'Hvad er klokken?',
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr:
            'Saat söylerken "det er" değil "klokken er" (saat...) ifadesi kullanılır.',
        UiLang.en:
            'When telling time, Danish says "klokken er" (the clock is), not "det er" (it is).',
      },
      goodExample: 'Klokken er to.',
      badExample: 'Det er to.',
    ),
    phrases: [
      Phrase(
        id: 'da_numbers_time_0',
        target: 'En, to, tre, fire, fem.',
        gloss: {
          UiLang.tr: 'Bir, iki, üç, dört, beş.',
          UiLang.en: 'One, two, three, four, five.',
        },
      ),
      Phrase(
        id: 'da_numbers_time_1',
        target: 'Hvad er klokken?',
        gloss: {UiLang.tr: 'Saat kaç?', UiLang.en: 'What time is it?'},
      ),
      Phrase(
        id: 'da_numbers_time_2',
        target: 'Klokken er to.',
        gloss: {UiLang.tr: 'Saat iki.', UiLang.en: "It is two o'clock."},
      ),
      Phrase(
        id: 'da_numbers_time_3',
        target: 'Klokken er halv ti.',
        gloss: {
          UiLang.tr: 'Saat dokuz buçuk.',
          UiLang.en: 'It is half past nine.',
        },
      ),
      Phrase(
        id: 'da_numbers_time_4',
        target: 'Det koster ti kroner.',
        gloss: {
          UiLang.tr: 'On kron tutuyor.',
          UiLang.en: 'It costs ten kroner.',
        },
      ),
      Phrase(
        id: 'da_numbers_time_5',
        target: 'Jeg har to børn.',
        gloss: {
          UiLang.tr: 'İki çocuğum var.',
          UiLang.en: 'I have two children.',
        },
      ),
      Phrase(
        id: 'da_numbers_time_6',
        target: 'Vi mødes klokken tre.',
        gloss: {
          UiLang.tr: 'Saat üçte buluşuyoruz.',
          UiLang.en: "We'll meet at three o'clock.",
        },
      ),
    ],
    turns: [
      SpeakTurn(
        prompt: 'You practice counting.',
        expected: 'En, to, tre, fire, fem.',
      ),
      SpeakTurn(
        prompt: 'You want to know the time.',
        expected: 'Hvad er klokken?',
      ),
      SpeakTurn(
        prompt: 'Someone asks you the time.',
        expected: 'Klokken er to.',
      ),
      SpeakTurn(
        prompt: 'They tell you it is not quite ten yet.',
        expected: 'Klokken er halv ti.',
      ),
      SpeakTurn(
        prompt: 'You tell a friend the price.',
        expected: 'Det koster ti kroner.',
      ),
      SpeakTurn(
        prompt: 'Someone asks how many children you have.',
        expected: 'Jeg har to børn.',
      ),
      SpeakTurn(
        prompt: 'You arrange when to meet.',
        expected: 'Vi mødes klokken tre.',
      ),
    ],
  ),
  Scenario(
    id: 'da_family',
    lang: LearnLang.da,
    cefr: Cefr.a1,
    minutes: 7,
    titles: {UiLang.tr: 'Aile', UiLang.en: 'Family'},
    clipLine: 'Det her er min mor.',
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr:
            'İyelik zamiri ismin cinsine ve sayısına göre değişir: tekil "en"-kelime için "min", tekil "et"-kelime için "mit", çoğul için "mine" kullanılır.',
        UiLang.en:
            'The possessive pronoun changes form depending on the noun: min for en-words, mit for et-words, mine for plurals.',
      },
      goodExample: 'Mine forældre bor på landet.',
      badExample: 'Min forældre bor på landet.',
    ),
    phrases: [
      Phrase(
        id: 'da_family_0',
        target: 'Det her er min mor.',
        gloss: {UiLang.tr: 'Bu benim annem.', UiLang.en: 'This is my mother.'},
      ),
      Phrase(
        id: 'da_family_1',
        target: 'Min far er læge.',
        gloss: {
          UiLang.tr: 'Babam doktor.',
          UiLang.en: 'My father is a doctor.',
        },
      ),
      Phrase(
        id: 'da_family_2',
        target: 'Jeg har to søskende.',
        gloss: {
          UiLang.tr: 'İki kardeşim var.',
          UiLang.en: 'I have two siblings.',
        },
      ),
      Phrase(
        id: 'da_family_3',
        target: 'Min bror bor i København.',
        gloss: {
          UiLang.tr: 'Erkek kardeşim Kopenhag\'da yaşıyor.',
          UiLang.en: 'My brother lives in Copenhagen.',
        },
      ),
      Phrase(
        id: 'da_family_4',
        target: 'Min søster er yngre end mig.',
        gloss: {
          UiLang.tr: 'Kız kardeşim benden daha küçük.',
          UiLang.en: 'My sister is younger than me.',
        },
      ),
      Phrase(
        id: 'da_family_5',
        target: 'Mine forældre bor på landet.',
        gloss: {
          UiLang.tr: 'Ailem kırsalda yaşıyor.',
          UiLang.en: 'My parents live in the countryside.',
        },
      ),
      Phrase(
        id: 'da_family_6',
        target: 'Har du børn?',
        gloss: {
          UiLang.tr: 'Çocuğun var mı?',
          UiLang.en: 'Do you have children?',
        },
      ),
    ],
    turns: [
      SpeakTurn(prompt: 'You show a photo.', expected: 'Det her er min mor.'),
      SpeakTurn(
        prompt: 'They ask about your father.',
        expected: 'Min far er læge.',
      ),
      SpeakTurn(
        prompt: 'They ask if you have siblings.',
        expected: 'Jeg har to søskende.',
      ),
      SpeakTurn(
        prompt: 'They ask where your brother lives.',
        expected: 'Min bror bor i København.',
      ),
      SpeakTurn(
        prompt: 'They ask about your sister.',
        expected: 'Min søster er yngre end mig.',
      ),
      SpeakTurn(
        prompt: 'They ask about your parents.',
        expected: 'Mine forældre bor på landet.',
      ),
      SpeakTurn(
        prompt: 'You ask them the same question.',
        expected: 'Har du børn?',
      ),
    ],
  ),
  Scenario(
    id: 'da_weather',
    lang: LearnLang.da,
    cefr: Cefr.a1,
    minutes: 7,
    titles: {UiLang.tr: 'Hava durumu', UiLang.en: 'Weather'},
    clipLine: 'Hvordan er vejret i dag?',
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr:
            'Hava durumu cümlelerinde bile bir özne olmalıdır; gerçek bir şeye işaret etmese de "det" kullanılır.',
        UiLang.en:
            'Weather sentences need the dummy subject "det", even though it doesn\'t refer to anything real.',
      },
      goodExample: 'Det regner.',
      badExample: 'Regner.',
    ),
    phrases: [
      Phrase(
        id: 'da_weather_0',
        target: 'Hvordan er vejret i dag?',
        gloss: {
          UiLang.tr: 'Bugün hava nasıl?',
          UiLang.en: "What's the weather like today?",
        },
      ),
      Phrase(
        id: 'da_weather_1',
        target: 'Det er koldt udenfor.',
        gloss: {UiLang.tr: 'Dışarısı soğuk.', UiLang.en: "It's cold outside."},
      ),
      Phrase(
        id: 'da_weather_2',
        target: 'Solen skinner.',
        gloss: {UiLang.tr: 'Güneş parlıyor.', UiLang.en: 'The sun is shining.'},
      ),
      Phrase(
        id: 'da_weather_3',
        target: 'Det regner.',
        gloss: {UiLang.tr: 'Yağmur yağıyor.', UiLang.en: "It's raining."},
      ),
      Phrase(
        id: 'da_weather_4',
        target: 'I morgen bliver det varmt.',
        gloss: {
          UiLang.tr: 'Yarın hava sıcak olacak.',
          UiLang.en: 'Tomorrow it will be warm.',
        },
      ),
      Phrase(
        id: 'da_weather_5',
        target: 'Blæser det meget i dag?',
        gloss: {
          UiLang.tr: 'Bugün çok mu rüzgarlı?',
          UiLang.en: 'Is it very windy today?',
        },
      ),
      Phrase(
        id: 'da_weather_6',
        target: 'Tag en paraply med.',
        gloss: {
          UiLang.tr: 'Yanına şemsiye al.',
          UiLang.en: 'Take an umbrella with you.',
        },
      ),
    ],
    turns: [
      SpeakTurn(
        prompt: 'You start small talk.',
        expected: 'Hvordan er vejret i dag?',
      ),
      SpeakTurn(prompt: 'You step outside.', expected: 'Det er koldt udenfor.'),
      SpeakTurn(prompt: 'You look up at the sky.', expected: 'Solen skinner.'),
      SpeakTurn(prompt: 'You look out the window.', expected: 'Det regner.'),
      SpeakTurn(
        prompt: "You check tomorrow's forecast.",
        expected: 'I morgen bliver det varmt.',
      ),
      SpeakTurn(
        prompt: 'You plan to go outside.',
        expected: 'Blæser det meget i dag?',
      ),
      SpeakTurn(
        prompt: 'You warn a friend before they leave.',
        expected: 'Tag en paraply med.',
      ),
    ],
  ),
  Scenario(
    id: 'da_transport',
    lang: LearnLang.da,
    cefr: Cefr.a1,
    minutes: 7,
    titles: {UiLang.tr: 'Ulaşım', UiLang.en: 'Getting around'},
    clipLine: 'Hvordan kommer jeg til stationen?',
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr:
            'Hangi ulaşım aracının kullanıldığı "med" + ismin "the" ekli hali ile söylenir: "med bussen" (otobüsle).',
        UiLang.en:
            'Say which transport you take with "med" plus the noun with its "the" suffix: "med bussen" (by the bus).',
      },
      goodExample: 'Jeg tager med bussen.',
      badExample: 'Jeg tager med bus.',
    ),
    phrases: [
      Phrase(
        id: 'da_transport_0',
        target: 'Hvordan kommer jeg til stationen?',
        gloss: {
          UiLang.tr: 'İstasyona nasıl giderim?',
          UiLang.en: 'How do I get to the station?',
        },
      ),
      Phrase(
        id: 'da_transport_1',
        target: 'Jeg tager med bussen på arbejde.',
        gloss: {
          UiLang.tr: 'İşe otobüsle gidiyorum.',
          UiLang.en: 'I take the bus to work.',
        },
      ),
      Phrase(
        id: 'da_transport_2',
        target: 'Hvor køber jeg en billet?',
        gloss: {
          UiLang.tr: 'Bileti nereden alırım?',
          UiLang.en: 'Where do I buy a ticket?',
        },
      ),
      Phrase(
        id: 'da_transport_3',
        target: 'Næste tog kører klokken ni.',
        gloss: {
          UiLang.tr: 'Sonraki tren saat dokuzda kalkıyor.',
          UiLang.en: 'The next train leaves at nine o\'clock.',
        },
      ),
      Phrase(
        id: 'da_transport_4',
        target: 'Er det her det rigtige spor?',
        gloss: {
          UiLang.tr: 'Bu doğru peron mu?',
          UiLang.en: 'Is this the right platform?',
        },
      ),
      Phrase(
        id: 'da_transport_5',
        target: 'Jeg vil gerne til lufthavnen.',
        gloss: {
          UiLang.tr: 'Havalimanına gitmek istiyorum.',
          UiLang.en: 'I would like to go to the airport.',
        },
      ),
      Phrase(
        id: 'da_transport_6',
        target: 'Hvor er nærmeste stoppested?',
        gloss: {
          UiLang.tr: 'En yakın durak nerede?',
          UiLang.en: 'Where is the nearest stop?',
        },
      ),
    ],
    turns: [
      SpeakTurn(
        prompt: 'You are lost near a train station.',
        expected: 'Hvordan kommer jeg til stationen?',
      ),
      SpeakTurn(
        prompt: 'They ask how you get to work.',
        expected: 'Jeg tager med bussen på arbejde.',
      ),
      SpeakTurn(
        prompt: 'You need a ticket.',
        expected: 'Hvor køber jeg en billet?',
      ),
      SpeakTurn(
        prompt: 'You check the departure board.',
        expected: 'Næste tog kører klokken ni.',
      ),
      SpeakTurn(
        prompt: 'You are not sure you are in the right place.',
        expected: 'Er det her det rigtige spor?',
      ),
      SpeakTurn(
        prompt: 'You are heading to catch a flight.',
        expected: 'Jeg vil gerne til lufthavnen.',
      ),
      SpeakTurn(
        prompt: 'You look for the bus.',
        expected: 'Hvor er nærmeste stoppested?',
      ),
    ],
  ),
  Scenario(
    id: 'da_emergency',
    lang: LearnLang.da,
    cefr: Cefr.a1,
    minutes: 7,
    titles: {UiLang.tr: 'Acil durum', UiLang.en: 'Emergency'},
    clipLine: 'Hjælp!',
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr:
            'Emir kipi, fiilin şimdiki zamandaki -r ekini atarak sadece fiil kökü ile yapılır: ringer (arıyor) -> ring (ara!).',
        UiLang.en:
            'The command form is just the bare verb stem, without the present-tense -r: ringer (calls) becomes ring (call!).',
      },
      goodExample: 'Ring til politiet!',
      badExample: 'Ringer til politiet!',
    ),
    phrases: [
      Phrase(
        id: 'da_emergency_0',
        target: 'Hjælp!',
        gloss: {UiLang.tr: 'İmdat!', UiLang.en: 'Help!'},
      ),
      Phrase(
        id: 'da_emergency_1',
        target: 'Ring efter en ambulance!',
        gloss: {UiLang.tr: 'Ambulans çağır!', UiLang.en: 'Call an ambulance!'},
      ),
      Phrase(
        id: 'da_emergency_2',
        target: 'Jeg har brug for en læge.',
        gloss: {
          UiLang.tr: 'Doktora ihtiyacım var.',
          UiLang.en: 'I need a doctor.',
        },
      ),
      Phrase(
        id: 'da_emergency_3',
        target: 'Hvor er det nærmeste hospital?',
        gloss: {
          UiLang.tr: 'En yakın hastane nerede?',
          UiLang.en: 'Where is the nearest hospital?',
        },
      ),
      Phrase(
        id: 'da_emergency_4',
        target: 'Ring til politiet!',
        gloss: {UiLang.tr: 'Polisi ara!', UiLang.en: 'Call the police!'},
      ),
      Phrase(
        id: 'da_emergency_5',
        target: 'Jeg er faret vild.',
        gloss: {UiLang.tr: 'Kayboldum.', UiLang.en: 'I am lost.'},
      ),
      Phrase(
        id: 'da_emergency_6',
        target: 'Er der nogen her, der taler engelsk?',
        gloss: {
          UiLang.tr: 'Burada İngilizce konuşan biri var mı?',
          UiLang.en: 'Is there anyone here who speaks English?',
        },
      ),
    ],
    turns: [
      SpeakTurn(prompt: 'Something just happened.', expected: 'Hjælp!'),
      SpeakTurn(
        prompt: 'Someone is badly hurt.',
        expected: 'Ring efter en ambulance!',
      ),
      SpeakTurn(
        prompt: 'You are not feeling well.',
        expected: 'Jeg har brug for en læge.',
      ),
      SpeakTurn(
        prompt: 'You need medical help fast.',
        expected: 'Hvor er det nærmeste hospital?',
      ),
      SpeakTurn(
        prompt: 'You see a crime happening.',
        expected: 'Ring til politiet!',
      ),
      SpeakTurn(
        prompt: 'You cannot find your way.',
        expected: 'Jeg er faret vild.',
      ),
      SpeakTurn(
        prompt: 'You need someone who can translate.',
        expected: 'Er der nogen her, der taler engelsk?',
      ),
    ],
  ),
  Scenario(
    id: 'da_routine',
    lang: LearnLang.da,
    cefr: Cefr.a1,
    minutes: 7,
    titles: {UiLang.tr: 'Günlük rutin', UiLang.en: 'Daily routine'},
    clipLine: 'Jeg står altid tidligt op.',
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr:
            '"altid" (her zaman) gibi bir zarf, çekimli fiilden hemen sonra gelir, önce değil.',
        UiLang.en:
            'An adverb like "altid" (always) goes right after the conjugated verb, not before it.',
      },
      goodExample: 'Jeg står altid tidligt op.',
      badExample: 'Jeg altid står tidligt op.',
    ),
    phrases: [
      Phrase(
        id: 'da_routine_0',
        target: 'Jeg står altid tidligt op.',
        gloss: {
          UiLang.tr: 'Her zaman erken kalkarım.',
          UiLang.en: 'I always get up early.',
        },
      ),
      Phrase(
        id: 'da_routine_1',
        target: 'Jeg spiser morgenmad derhjemme.',
        gloss: {
          UiLang.tr: 'Evde kahvaltı yaparım.',
          UiLang.en: 'I eat breakfast at home.',
        },
      ),
      Phrase(
        id: 'da_routine_2',
        target: 'Jeg forlader huset klokken otte.',
        gloss: {
          UiLang.tr: 'Evden saat sekizde çıkarım.',
          UiLang.en: 'I leave the house at eight o\'clock.',
        },
      ),
      Phrase(
        id: 'da_routine_3',
        target: 'Jeg tager i bad hver morgen.',
        gloss: {
          UiLang.tr: 'Her sabah duş alırım.',
          UiLang.en: 'I take a shower every morning.',
        },
      ),
      Phrase(
        id: 'da_routine_4',
        target: 'Jeg læser en bog før jeg sover.',
        gloss: {
          UiLang.tr: 'Uyumadan önce kitap okurum.',
          UiLang.en: 'I read a book before I sleep.',
        },
      ),
      Phrase(
        id: 'da_routine_5',
        target: 'Jeg går i seng klokken elleve.',
        gloss: {
          UiLang.tr: 'Saat on birde yatarım.',
          UiLang.en: 'I go to bed at eleven o\'clock.',
        },
      ),
      Phrase(
        id: 'da_routine_6',
        target: 'Jeg gør det samme hver dag.',
        gloss: {
          UiLang.tr: 'Her gün aynı şeyi yaparım.',
          UiLang.en: 'I do the same thing every day.',
        },
      ),
    ],
    turns: [
      SpeakTurn(
        prompt: 'Someone asks about your mornings.',
        expected: 'Jeg står altid tidligt op.',
      ),
      SpeakTurn(
        prompt: 'They ask what you eat.',
        expected: 'Jeg spiser morgenmad derhjemme.',
      ),
      SpeakTurn(
        prompt: 'They ask when you leave the house.',
        expected: 'Jeg forlader huset klokken otte.',
      ),
      SpeakTurn(
        prompt: 'They ask about your morning habits.',
        expected: 'Jeg tager i bad hver morgen.',
      ),
      SpeakTurn(
        prompt: 'They ask what you do before bed.',
        expected: 'Jeg læser en bog før jeg sover.',
      ),
      SpeakTurn(
        prompt: 'They ask when you sleep.',
        expected: 'Jeg går i seng klokken elleve.',
      ),
      SpeakTurn(
        prompt: 'They ask if your days are different.',
        expected: 'Jeg gør det samme hver dag.',
      ),
    ],
  ),
  Scenario(
    id: 'da_past_story',
    lang: LearnLang.da,
    cefr: Cefr.a1,
    minutes: 7,
    titles: {
      UiLang.tr: 'Bir günü anlatmak',
      UiLang.en: 'Telling a story about your day',
    },
    clipLine: 'I går tog jeg til byen.',
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr:
            'Düzenli fiillerin geçmiş zamanı -ede veya -te eki ile yapılır: møde (buluşmak) -> mødte (buluştum).',
        UiLang.en:
            'Regular verbs form the past tense by adding -ede or -te: møde (to meet) becomes mødte (met).',
      },
      goodExample: 'Jeg mødte min ven.',
      badExample: 'Jeg møder min ven i går.',
    ),
    phrases: [
      Phrase(
        id: 'da_past_story_0',
        target: 'I går tog jeg til byen.',
        gloss: {
          UiLang.tr: 'Dün şehre gittim.',
          UiLang.en: 'Yesterday I went to the city.',
        },
      ),
      Phrase(
        id: 'da_past_story_1',
        target: 'Jeg mødte min ven på en café.',
        gloss: {
          UiLang.tr: 'Arkadaşımla kafede buluştum.',
          UiLang.en: 'I met my friend at a café.',
        },
      ),
      Phrase(
        id: 'da_past_story_2',
        target: 'Vi spiste frokost sammen.',
        gloss: {
          UiLang.tr: 'Birlikte öğle yemeği yedik.',
          UiLang.en: 'We ate lunch together.',
        },
      ),
      Phrase(
        id: 'da_past_story_3',
        target: 'Bagefter gik vi en tur i parken.',
        gloss: {
          UiLang.tr: 'Sonra parkta yürüyüş yaptık.',
          UiLang.en: 'Afterwards we took a walk in the park.',
        },
      ),
      Phrase(
        id: 'da_past_story_4',
        target: 'Vejret var solrigt.',
        gloss: {
          UiLang.tr: 'Hava güneşliydi.',
          UiLang.en: 'The weather was sunny.',
        },
      ),
      Phrase(
        id: 'da_past_story_5',
        target: 'Jeg kom hjem om aftenen.',
        gloss: {
          UiLang.tr: 'Akşam eve geldim.',
          UiLang.en: 'I came home in the evening.',
        },
      ),
      Phrase(
        id: 'da_past_story_6',
        target: 'Det var en god dag.',
        gloss: {UiLang.tr: 'Güzel bir gündü.', UiLang.en: 'It was a good day.'},
      ),
    ],
    turns: [
      SpeakTurn(
        prompt: 'Someone asks what you did yesterday.',
        expected: 'I går tog jeg til byen.',
      ),
      SpeakTurn(
        prompt: 'They ask if you saw anyone.',
        expected: 'Jeg mødte min ven på en café.',
      ),
      SpeakTurn(
        prompt: 'They ask what you did together.',
        expected: 'Vi spiste frokost sammen.',
      ),
      SpeakTurn(
        prompt: 'They ask what happened next.',
        expected: 'Bagefter gik vi en tur i parken.',
      ),
      SpeakTurn(
        prompt: 'They ask about the weather that day.',
        expected: 'Vejret var solrigt.',
      ),
      SpeakTurn(
        prompt: 'They ask when you got home.',
        expected: 'Jeg kom hjem om aftenen.',
      ),
      SpeakTurn(
        prompt: 'They ask how the day was.',
        expected: 'Det var en god dag.',
      ),
    ],
  ),

  // ===================== NORWEGIAN (no) =====================
  Scenario(
    id: 'no_intro',
    lang: LearnLang.no,
    cefr: Cefr.a1,
    minutes: 7,
    titles: {UiLang.tr: 'Tanışma', UiLang.en: 'Getting to know someone'},
    clipLine: 'Hyggelig å møte deg.',
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr:
            'Sorularda fiil özneden önce gelir: "Hva heter du?", "Hva du heter?" değil.',
        UiLang.en:
            'In questions, the verb comes before the subject: "Hva heter du?", not "Hva du heter?".',
      },
      goodExample: 'Hva heter du?',
      badExample: 'Hva du heter?',
    ),
    phrases: [
      Phrase(
        id: 'no_intro_0',
        target: 'Hyggelig å møte deg.',
        gloss: {
          UiLang.tr: 'Tanıştığımıza memnun oldum.',
          UiLang.en: 'Nice to meet you.',
        },
      ),
      Phrase(
        id: 'no_intro_1',
        target: 'Hva heter du?',
        gloss: {UiLang.tr: 'Adın ne?', UiLang.en: 'What is your name?'},
      ),
      Phrase(
        id: 'no_intro_2',
        target: 'Jeg er tretti år gammel.',
        gloss: {
          UiLang.tr: 'Otuz yaşındayım.',
          UiLang.en: 'I am thirty years old.',
        },
      ),
      Phrase(
        id: 'no_intro_3',
        target: 'Hva jobber du med?',
        gloss: {
          UiLang.tr: 'Ne iş yapıyorsun?',
          UiLang.en: 'What do you do for work?',
        },
      ),
      Phrase(
        id: 'no_intro_4',
        target: 'Jeg er lærer.',
        gloss: {UiLang.tr: 'Öğretmenim.', UiLang.en: 'I am a teacher.'},
      ),
      Phrase(
        id: 'no_intro_5',
        target: 'Snakker du engelsk?',
        gloss: {
          UiLang.tr: 'İngilizce konuşuyor musun?',
          UiLang.en: 'Do you speak English?',
        },
      ),
      Phrase(
        id: 'no_intro_6',
        target: 'Vi sees snart!',
        gloss: {UiLang.tr: 'Yakında görüşürüz!', UiLang.en: 'See you soon!'},
      ),
    ],
    turns: [
      SpeakTurn(
        prompt: 'You meet someone new.',
        expected: 'Hyggelig å møte deg.',
      ),
      SpeakTurn(
        prompt: 'You want to know their name.',
        expected: 'Hva heter du?',
      ),
      SpeakTurn(
        prompt: 'They ask your age.',
        expected: 'Jeg er tretti år gammel.',
      ),
      SpeakTurn(
        prompt: 'You want to know their job.',
        expected: 'Hva jobber du med?',
      ),
      SpeakTurn(prompt: 'They ask what you do.', expected: 'Jeg er lærer.'),
      SpeakTurn(
        prompt: 'You want to make sure you understand each other.',
        expected: 'Snakker du engelsk?',
      ),
      SpeakTurn(prompt: 'It is time to leave.', expected: 'Vi sees snart!'),
    ],
  ),
  Scenario(
    id: 'no_shopping',
    lang: LearnLang.no,
    cefr: Cefr.a1,
    minutes: 7,
    titles: {UiLang.tr: 'Kıyafet alışverişi', UiLang.en: 'Clothes shopping'},
    clipLine: 'Kan jeg prøve denne?',
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr:
            'Norveççe "the" anlamını ayrı bir kelimeyle değil, ismin sonuna eklenen bir ekle gösterir: genser (kazak) -> genseren (o kazak).',
        UiLang.en:
            'Norwegian shows "the" by adding a suffix to the noun instead of a separate word: genser (sweater) becomes genseren (the sweater).',
      },
      goodExample: 'Jeg tar genseren.',
      badExample: 'Jeg tar den genser.',
    ),
    phrases: [
      Phrase(
        id: 'no_shopping_0',
        target: 'Kan jeg prøve denne?',
        gloss: {
          UiLang.tr: 'Bunu deneyebilir miyim?',
          UiLang.en: 'Can I try this on?',
        },
      ),
      Phrase(
        id: 'no_shopping_1',
        target: 'Har dere denne i en større størrelse?',
        gloss: {
          UiLang.tr: 'Bunun daha büyük bedeni var mı?',
          UiLang.en: 'Do you have this in a bigger size?',
        },
      ),
      Phrase(
        id: 'no_shopping_2',
        target: 'Har dere denne i en annen farge?',
        gloss: {
          UiLang.tr: 'Bunun başka rengi var mı?',
          UiLang.en: 'Do you have this in another color?',
        },
      ),
      Phrase(
        id: 'no_shopping_3',
        target: 'Denne er for dyr.',
        gloss: {
          UiLang.tr: 'Bu çok pahalı.',
          UiLang.en: 'This is too expensive.',
        },
      ),
      Phrase(
        id: 'no_shopping_4',
        target: 'Er det rabatt på denne?',
        gloss: {
          UiLang.tr: 'Bunda indirim var mı?',
          UiLang.en: 'Is there a discount on this?',
        },
      ),
      Phrase(
        id: 'no_shopping_5',
        target: 'Jeg tar genseren.',
        gloss: {
          UiLang.tr: 'Kazağı alıyorum.',
          UiLang.en: "I'll take the sweater.",
        },
      ),
      Phrase(
        id: 'no_shopping_6',
        target: 'Kan jeg betale med kort?',
        gloss: {
          UiLang.tr: 'Kartla ödeyebilir miyim?',
          UiLang.en: 'Can I pay by card?',
        },
      ),
    ],
    turns: [
      SpeakTurn(
        prompt: 'You pick up a piece of clothing.',
        expected: 'Kan jeg prøve denne?',
      ),
      SpeakTurn(
        prompt: 'It is too small.',
        expected: 'Har dere denne i en større størrelse?',
      ),
      SpeakTurn(
        prompt: 'You do not like the color.',
        expected: 'Har dere denne i en annen farge?',
      ),
      SpeakTurn(
        prompt: 'You check the price tag.',
        expected: 'Denne er for dyr.',
      ),
      SpeakTurn(
        prompt: 'You look for a better price.',
        expected: 'Er det rabatt på denne?',
      ),
      SpeakTurn(prompt: 'You decide to buy it.', expected: 'Jeg tar genseren.'),
      SpeakTurn(
        prompt: 'You go to the register.',
        expected: 'Kan jeg betale med kort?',
      ),
    ],
  ),
  Scenario(
    id: 'no_numbers_time',
    lang: LearnLang.no,
    cefr: Cefr.a1,
    minutes: 7,
    titles: {UiLang.tr: 'Sayılar ve saat', UiLang.en: 'Numbers & time'},
    clipLine: 'Hva er klokken?',
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr:
            'Saat söylerken "det er" değil "klokken er" ifadesi kullanılır.',
        UiLang.en:
            'When telling time, Norwegian says "klokken er" (the clock is), not "det er" (it is).',
      },
      goodExample: 'Klokken er to.',
      badExample: 'Det er to.',
    ),
    phrases: [
      Phrase(
        id: 'no_numbers_time_0',
        target: 'En, to, tre, fire, fem.',
        gloss: {
          UiLang.tr: 'Bir, iki, üç, dört, beş.',
          UiLang.en: 'One, two, three, four, five.',
        },
      ),
      Phrase(
        id: 'no_numbers_time_1',
        target: 'Hva er klokken?',
        gloss: {UiLang.tr: 'Saat kaç?', UiLang.en: 'What time is it?'},
      ),
      Phrase(
        id: 'no_numbers_time_2',
        target: 'Klokken er to.',
        gloss: {UiLang.tr: 'Saat iki.', UiLang.en: "It is two o'clock."},
      ),
      Phrase(
        id: 'no_numbers_time_3',
        target: 'Klokken er halv ti.',
        gloss: {
          UiLang.tr: 'Saat dokuz buçuk.',
          UiLang.en: 'It is half past nine.',
        },
      ),
      Phrase(
        id: 'no_numbers_time_4',
        target: 'Det koster ti kroner.',
        gloss: {
          UiLang.tr: 'On kron tutuyor.',
          UiLang.en: 'It costs ten kroner.',
        },
      ),
      Phrase(
        id: 'no_numbers_time_5',
        target: 'Jeg har to barn.',
        gloss: {
          UiLang.tr: 'İki çocuğum var.',
          UiLang.en: 'I have two children.',
        },
      ),
      Phrase(
        id: 'no_numbers_time_6',
        target: 'Vi møtes klokken tre.',
        gloss: {
          UiLang.tr: 'Saat üçte buluşuyoruz.',
          UiLang.en: "We'll meet at three o'clock.",
        },
      ),
    ],
    turns: [
      SpeakTurn(
        prompt: 'You practice counting.',
        expected: 'En, to, tre, fire, fem.',
      ),
      SpeakTurn(
        prompt: 'You want to know the time.',
        expected: 'Hva er klokken?',
      ),
      SpeakTurn(
        prompt: 'Someone asks you the time.',
        expected: 'Klokken er to.',
      ),
      SpeakTurn(
        prompt: 'They tell you it is not quite ten yet.',
        expected: 'Klokken er halv ti.',
      ),
      SpeakTurn(
        prompt: 'You tell a friend the price.',
        expected: 'Det koster ti kroner.',
      ),
      SpeakTurn(
        prompt: 'Someone asks how many children you have.',
        expected: 'Jeg har to barn.',
      ),
      SpeakTurn(
        prompt: 'You arrange when to meet.',
        expected: 'Vi møtes klokken tre.',
      ),
    ],
  ),
  Scenario(
    id: 'no_family',
    lang: LearnLang.no,
    cefr: Cefr.a1,
    minutes: 7,
    titles: {UiLang.tr: 'Aile', UiLang.en: 'Family'},
    clipLine: 'Dette er moren min.',
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr:
            'İyelik zamiri ismin cinsine ve sayısına göre değişir: tekil eril/dişil isimler için "min", nötr isimler için "mitt", çoğul için "mine" kullanılır.',
        UiLang.en:
            'The possessive pronoun changes form depending on the noun: min for singular masculine/feminine words, mitt for neuter, mine for plurals.',
      },
      goodExample: 'Foreldrene mine bor på landet.',
      badExample: 'Foreldrene min bor på landet.',
    ),
    phrases: [
      Phrase(
        id: 'no_family_0',
        target: 'Dette er moren min.',
        gloss: {UiLang.tr: 'Bu benim annem.', UiLang.en: 'This is my mother.'},
      ),
      Phrase(
        id: 'no_family_1',
        target: 'Faren min er lege.',
        gloss: {
          UiLang.tr: 'Babam doktor.',
          UiLang.en: 'My father is a doctor.',
        },
      ),
      Phrase(
        id: 'no_family_2',
        target: 'Jeg har to søsken.',
        gloss: {
          UiLang.tr: 'İki kardeşim var.',
          UiLang.en: 'I have two siblings.',
        },
      ),
      Phrase(
        id: 'no_family_3',
        target: 'Broren min bor i Oslo.',
        gloss: {
          UiLang.tr: 'Erkek kardeşim Oslo\'da yaşıyor.',
          UiLang.en: 'My brother lives in Oslo.',
        },
      ),
      Phrase(
        id: 'no_family_4',
        target: 'Søsteren min er yngre enn meg.',
        gloss: {
          UiLang.tr: 'Kız kardeşim benden daha küçük.',
          UiLang.en: 'My sister is younger than me.',
        },
      ),
      Phrase(
        id: 'no_family_5',
        target: 'Foreldrene mine bor på landet.',
        gloss: {
          UiLang.tr: 'Ailem kırsalda yaşıyor.',
          UiLang.en: 'My parents live in the countryside.',
        },
      ),
      Phrase(
        id: 'no_family_6',
        target: 'Har du barn?',
        gloss: {
          UiLang.tr: 'Çocuğun var mı?',
          UiLang.en: 'Do you have children?',
        },
      ),
    ],
    turns: [
      SpeakTurn(prompt: 'You show a photo.', expected: 'Dette er moren min.'),
      SpeakTurn(
        prompt: 'They ask about your father.',
        expected: 'Faren min er lege.',
      ),
      SpeakTurn(
        prompt: 'They ask if you have siblings.',
        expected: 'Jeg har to søsken.',
      ),
      SpeakTurn(
        prompt: 'They ask where your brother lives.',
        expected: 'Broren min bor i Oslo.',
      ),
      SpeakTurn(
        prompt: 'They ask about your sister.',
        expected: 'Søsteren min er yngre enn meg.',
      ),
      SpeakTurn(
        prompt: 'They ask about your parents.',
        expected: 'Foreldrene mine bor på landet.',
      ),
      SpeakTurn(
        prompt: 'You ask them the same question.',
        expected: 'Har du barn?',
      ),
    ],
  ),
  Scenario(
    id: 'no_weather',
    lang: LearnLang.no,
    cefr: Cefr.a1,
    minutes: 7,
    titles: {UiLang.tr: 'Hava durumu', UiLang.en: 'Weather'},
    clipLine: 'Hvordan er været i dag?',
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr:
            'Hava durumu cümlelerinde bile bir özne olmalıdır; gerçek bir şeye işaret etmese de "det" kullanılır.',
        UiLang.en:
            'Weather sentences need the dummy subject "det", even though it doesn\'t refer to anything real.',
      },
      goodExample: 'Det regner.',
      badExample: 'Regner.',
    ),
    phrases: [
      Phrase(
        id: 'no_weather_0',
        target: 'Hvordan er været i dag?',
        gloss: {
          UiLang.tr: 'Bugün hava nasıl?',
          UiLang.en: "What's the weather like today?",
        },
      ),
      Phrase(
        id: 'no_weather_1',
        target: 'Det er kaldt ute.',
        gloss: {UiLang.tr: 'Dışarısı soğuk.', UiLang.en: "It's cold outside."},
      ),
      Phrase(
        id: 'no_weather_2',
        target: 'Sola skinner.',
        gloss: {UiLang.tr: 'Güneş parlıyor.', UiLang.en: 'The sun is shining.'},
      ),
      Phrase(
        id: 'no_weather_3',
        target: 'Det regner.',
        gloss: {UiLang.tr: 'Yağmur yağıyor.', UiLang.en: "It's raining."},
      ),
      Phrase(
        id: 'no_weather_4',
        target: 'I morgen blir det varmt.',
        gloss: {
          UiLang.tr: 'Yarın hava sıcak olacak.',
          UiLang.en: 'Tomorrow it will be warm.',
        },
      ),
      Phrase(
        id: 'no_weather_5',
        target: 'Blåser det mye i dag?',
        gloss: {
          UiLang.tr: 'Bugün çok mu rüzgarlı?',
          UiLang.en: 'Is it very windy today?',
        },
      ),
      Phrase(
        id: 'no_weather_6',
        target: 'Ta med en paraply.',
        gloss: {
          UiLang.tr: 'Yanına şemsiye al.',
          UiLang.en: 'Take an umbrella with you.',
        },
      ),
    ],
    turns: [
      SpeakTurn(
        prompt: 'You start small talk.',
        expected: 'Hvordan er været i dag?',
      ),
      SpeakTurn(prompt: 'You step outside.', expected: 'Det er kaldt ute.'),
      SpeakTurn(prompt: 'You look up at the sky.', expected: 'Sola skinner.'),
      SpeakTurn(prompt: 'You look out the window.', expected: 'Det regner.'),
      SpeakTurn(
        prompt: "You check tomorrow's forecast.",
        expected: 'I morgen blir det varmt.',
      ),
      SpeakTurn(
        prompt: 'You plan to go outside.',
        expected: 'Blåser det mye i dag?',
      ),
      SpeakTurn(
        prompt: 'You warn a friend before they leave.',
        expected: 'Ta med en paraply.',
      ),
    ],
  ),
  Scenario(
    id: 'no_transport',
    lang: LearnLang.no,
    cefr: Cefr.a1,
    minutes: 7,
    titles: {UiLang.tr: 'Ulaşım', UiLang.en: 'Getting around'},
    clipLine: 'Hvordan kommer jeg til stasjonen?',
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr:
            '"ta" (almak/binmek) fiili doğrudan "the" ekli isimle kullanılır — Danca\'daki gibi ayrıca "med" edatına gerek yoktur.',
        UiLang.en:
            'The verb "ta" (take) is used directly with the noun and its "the" suffix — no preposition like "med" is needed.',
      },
      goodExample: 'Jeg tar bussen til jobb.',
      badExample: 'Jeg tar med bussen til jobb.',
    ),
    phrases: [
      Phrase(
        id: 'no_transport_0',
        target: 'Hvordan kommer jeg til stasjonen?',
        gloss: {
          UiLang.tr: 'İstasyona nasıl giderim?',
          UiLang.en: 'How do I get to the station?',
        },
      ),
      Phrase(
        id: 'no_transport_1',
        target: 'Jeg tar bussen til jobb.',
        gloss: {
          UiLang.tr: 'İşe otobüsle gidiyorum.',
          UiLang.en: 'I take the bus to work.',
        },
      ),
      Phrase(
        id: 'no_transport_2',
        target: 'Hvor kjøper jeg en billett?',
        gloss: {
          UiLang.tr: 'Bileti nereden alırım?',
          UiLang.en: 'Where do I buy a ticket?',
        },
      ),
      Phrase(
        id: 'no_transport_3',
        target: 'Neste tog går klokken ni.',
        gloss: {
          UiLang.tr: 'Sonraki tren saat dokuzda kalkıyor.',
          UiLang.en: 'The next train leaves at nine o\'clock.',
        },
      ),
      Phrase(
        id: 'no_transport_4',
        target: 'Er dette riktig perrong?',
        gloss: {
          UiLang.tr: 'Bu doğru peron mu?',
          UiLang.en: 'Is this the right platform?',
        },
      ),
      Phrase(
        id: 'no_transport_5',
        target: 'Jeg vil gjerne til flyplassen.',
        gloss: {
          UiLang.tr: 'Havalimanına gitmek istiyorum.',
          UiLang.en: 'I would like to go to the airport.',
        },
      ),
      Phrase(
        id: 'no_transport_6',
        target: 'Hvor er nærmeste holdeplass?',
        gloss: {
          UiLang.tr: 'En yakın durak nerede?',
          UiLang.en: 'Where is the nearest stop?',
        },
      ),
    ],
    turns: [
      SpeakTurn(
        prompt: 'You are lost near a train station.',
        expected: 'Hvordan kommer jeg til stasjonen?',
      ),
      SpeakTurn(
        prompt: 'They ask how you get to work.',
        expected: 'Jeg tar bussen til jobb.',
      ),
      SpeakTurn(
        prompt: 'You need a ticket.',
        expected: 'Hvor kjøper jeg en billett?',
      ),
      SpeakTurn(
        prompt: 'You check the departure board.',
        expected: 'Neste tog går klokken ni.',
      ),
      SpeakTurn(
        prompt: 'You are not sure you are in the right place.',
        expected: 'Er dette riktig perrong?',
      ),
      SpeakTurn(
        prompt: 'You are heading to catch a flight.',
        expected: 'Jeg vil gjerne til flyplassen.',
      ),
      SpeakTurn(
        prompt: 'You look for the bus.',
        expected: 'Hvor er nærmeste holdeplass?',
      ),
    ],
  ),
  Scenario(
    id: 'no_emergency',
    lang: LearnLang.no,
    cefr: Cefr.a1,
    minutes: 7,
    titles: {UiLang.tr: 'Acil durum', UiLang.en: 'Emergency'},
    clipLine: 'Hjelp!',
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr:
            'Emir kipi, mastar halindeki fiilin sonundaki -e harfinin atılmasıyla yapılır: ringe (aramak) -> ring (ara!).',
        UiLang.en:
            'The command form is the bare verb stem, dropping the final -e of the infinitive: ringe (to call) becomes ring (call!).',
      },
      goodExample: 'Ring politiet!',
      badExample: 'Ringer politiet!',
    ),
    phrases: [
      Phrase(
        id: 'no_emergency_0',
        target: 'Hjelp!',
        gloss: {UiLang.tr: 'İmdat!', UiLang.en: 'Help!'},
      ),
      Phrase(
        id: 'no_emergency_1',
        target: 'Ring etter en ambulanse!',
        gloss: {UiLang.tr: 'Ambulans çağır!', UiLang.en: 'Call an ambulance!'},
      ),
      Phrase(
        id: 'no_emergency_2',
        target: 'Jeg trenger en lege.',
        gloss: {
          UiLang.tr: 'Doktora ihtiyacım var.',
          UiLang.en: 'I need a doctor.',
        },
      ),
      Phrase(
        id: 'no_emergency_3',
        target: 'Hvor er nærmeste sykehus?',
        gloss: {
          UiLang.tr: 'En yakın hastane nerede?',
          UiLang.en: 'Where is the nearest hospital?',
        },
      ),
      Phrase(
        id: 'no_emergency_4',
        target: 'Ring politiet!',
        gloss: {UiLang.tr: 'Polisi ara!', UiLang.en: 'Call the police!'},
      ),
      Phrase(
        id: 'no_emergency_5',
        target: 'Jeg har gått meg vill.',
        gloss: {UiLang.tr: 'Kayboldum.', UiLang.en: 'I am lost.'},
      ),
      Phrase(
        id: 'no_emergency_6',
        target: 'Er det noen her som snakker engelsk?',
        gloss: {
          UiLang.tr: 'Burada İngilizce konuşan biri var mı?',
          UiLang.en: 'Is there anyone here who speaks English?',
        },
      ),
    ],
    turns: [
      SpeakTurn(prompt: 'Something just happened.', expected: 'Hjelp!'),
      SpeakTurn(
        prompt: 'Someone is badly hurt.',
        expected: 'Ring etter en ambulanse!',
      ),
      SpeakTurn(
        prompt: 'You are not feeling well.',
        expected: 'Jeg trenger en lege.',
      ),
      SpeakTurn(
        prompt: 'You need medical help fast.',
        expected: 'Hvor er nærmeste sykehus?',
      ),
      SpeakTurn(
        prompt: 'You see a crime happening.',
        expected: 'Ring politiet!',
      ),
      SpeakTurn(
        prompt: 'You cannot find your way.',
        expected: 'Jeg har gått meg vill.',
      ),
      SpeakTurn(
        prompt: 'You need someone who can translate.',
        expected: 'Er det noen her som snakker engelsk?',
      ),
    ],
  ),
  Scenario(
    id: 'no_routine',
    lang: LearnLang.no,
    cefr: Cefr.a1,
    minutes: 7,
    titles: {UiLang.tr: 'Günlük rutin', UiLang.en: 'Daily routine'},
    clipLine: 'Jeg står alltid opp tidlig.',
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr:
            '"alltid" (her zaman) gibi bir zarf, çekimli fiilden hemen sonra gelir, önce değil.',
        UiLang.en:
            'An adverb like "alltid" (always) goes right after the conjugated verb, not before it.',
      },
      goodExample: 'Jeg står alltid opp tidlig.',
      badExample: 'Jeg alltid står opp tidlig.',
    ),
    phrases: [
      Phrase(
        id: 'no_routine_0',
        target: 'Jeg står alltid opp tidlig.',
        gloss: {
          UiLang.tr: 'Her zaman erken kalkarım.',
          UiLang.en: 'I always get up early.',
        },
      ),
      Phrase(
        id: 'no_routine_1',
        target: 'Jeg spiser frokost hjemme.',
        gloss: {
          UiLang.tr: 'Evde kahvaltı yaparım.',
          UiLang.en: 'I eat breakfast at home.',
        },
      ),
      Phrase(
        id: 'no_routine_2',
        target: 'Jeg forlater huset klokken åtte.',
        gloss: {
          UiLang.tr: 'Evden saat sekizde çıkarım.',
          UiLang.en: 'I leave the house at eight o\'clock.',
        },
      ),
      Phrase(
        id: 'no_routine_3',
        target: 'Jeg dusjer hver morgen.',
        gloss: {
          UiLang.tr: 'Her sabah duş alırım.',
          UiLang.en: 'I shower every morning.',
        },
      ),
      Phrase(
        id: 'no_routine_4',
        target: 'Jeg leser en bok før jeg sover.',
        gloss: {
          UiLang.tr: 'Uyumadan önce kitap okurum.',
          UiLang.en: 'I read a book before I sleep.',
        },
      ),
      Phrase(
        id: 'no_routine_5',
        target: 'Jeg legger meg klokken elleve.',
        gloss: {
          UiLang.tr: 'Saat on birde yatarım.',
          UiLang.en: 'I go to bed at eleven o\'clock.',
        },
      ),
      Phrase(
        id: 'no_routine_6',
        target: 'Jeg gjør det samme hver dag.',
        gloss: {
          UiLang.tr: 'Her gün aynı şeyi yaparım.',
          UiLang.en: 'I do the same thing every day.',
        },
      ),
    ],
    turns: [
      SpeakTurn(
        prompt: 'Someone asks about your mornings.',
        expected: 'Jeg står alltid opp tidlig.',
      ),
      SpeakTurn(
        prompt: 'They ask what you eat.',
        expected: 'Jeg spiser frokost hjemme.',
      ),
      SpeakTurn(
        prompt: 'They ask when you leave the house.',
        expected: 'Jeg forlater huset klokken åtte.',
      ),
      SpeakTurn(
        prompt: 'They ask about your morning habits.',
        expected: 'Jeg dusjer hver morgen.',
      ),
      SpeakTurn(
        prompt: 'They ask what you do before bed.',
        expected: 'Jeg leser en bok før jeg sover.',
      ),
      SpeakTurn(
        prompt: 'They ask when you sleep.',
        expected: 'Jeg legger meg klokken elleve.',
      ),
      SpeakTurn(
        prompt: 'They ask if your days are different.',
        expected: 'Jeg gjør det samme hver dag.',
      ),
    ],
  ),
  Scenario(
    id: 'no_past_story',
    lang: LearnLang.no,
    cefr: Cefr.a1,
    minutes: 7,
    titles: {
      UiLang.tr: 'Bir günü anlatmak',
      UiLang.en: 'Telling a story about your day',
    },
    clipLine: 'I går dro jeg til byen.',
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr:
            'Düzenli (zayıf) fiillerin geçmiş zamanı -et veya -te eki ile yapılır: møte (buluşmak) -> møtte (buluştum).',
        UiLang.en:
            'Regular (weak) verbs form the past tense with -et or -te: møte (to meet) becomes møtte (met).',
      },
      goodExample: 'Jeg møtte vennen min.',
      badExample: 'Jeg møter vennen min i går.',
    ),
    phrases: [
      Phrase(
        id: 'no_past_story_0',
        target: 'I går dro jeg til byen.',
        gloss: {
          UiLang.tr: 'Dün şehre gittim.',
          UiLang.en: 'Yesterday I went to the city.',
        },
      ),
      Phrase(
        id: 'no_past_story_1',
        target: 'Jeg møtte vennen min på en kafé.',
        gloss: {
          UiLang.tr: 'Arkadaşımla kafede buluştum.',
          UiLang.en: 'I met my friend at a café.',
        },
      ),
      Phrase(
        id: 'no_past_story_2',
        target: 'Vi spiste lunsj sammen.',
        gloss: {
          UiLang.tr: 'Birlikte öğle yemeği yedik.',
          UiLang.en: 'We ate lunch together.',
        },
      ),
      Phrase(
        id: 'no_past_story_3',
        target: 'Etterpå gikk vi en tur i parken.',
        gloss: {
          UiLang.tr: 'Sonra parkta yürüyüş yaptık.',
          UiLang.en: 'Afterwards we took a walk in the park.',
        },
      ),
      Phrase(
        id: 'no_past_story_4',
        target: 'Været var solrikt.',
        gloss: {
          UiLang.tr: 'Hava güneşliydi.',
          UiLang.en: 'The weather was sunny.',
        },
      ),
      Phrase(
        id: 'no_past_story_5',
        target: 'Jeg kom hjem om kvelden.',
        gloss: {
          UiLang.tr: 'Akşam eve geldim.',
          UiLang.en: 'I came home in the evening.',
        },
      ),
      Phrase(
        id: 'no_past_story_6',
        target: 'Det var en fin dag.',
        gloss: {UiLang.tr: 'Güzel bir gündü.', UiLang.en: 'It was a nice day.'},
      ),
    ],
    turns: [
      SpeakTurn(
        prompt: 'Someone asks what you did yesterday.',
        expected: 'I går dro jeg til byen.',
      ),
      SpeakTurn(
        prompt: 'They ask if you saw anyone.',
        expected: 'Jeg møtte vennen min på en kafé.',
      ),
      SpeakTurn(
        prompt: 'They ask what you did together.',
        expected: 'Vi spiste lunsj sammen.',
      ),
      SpeakTurn(
        prompt: 'They ask what happened next.',
        expected: 'Etterpå gikk vi en tur i parken.',
      ),
      SpeakTurn(
        prompt: 'They ask about the weather that day.',
        expected: 'Været var solrikt.',
      ),
      SpeakTurn(
        prompt: 'They ask when you got home.',
        expected: 'Jeg kom hjem om kvelden.',
      ),
      SpeakTurn(
        prompt: 'They ask how the day was.',
        expected: 'Det var en fin dag.',
      ),
    ],
  ),
];
