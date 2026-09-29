// GENERATED — batch H: Hindi / Thai / Vietnamese, missing A1 topics
// (Tanışma, Alışveriş, Sayılar & saat, Aile, Hava durumu, Ulaşım,
// Acil durum, Günlük rutin, Basit geçmiş zaman ile bir olay anlatma).
//
// Hindi/Thai/Vietnamese are lower-resource languages for the model that
// produced this file — every `target` sentence below is flagged with
// `// TODO: native review` and must be checked by a native speaker before
// shipping. Do NOT remove those markers as part of a cleanup pass.
// ignore_for_file: lines_longer_than_80_chars

import '../../models/models.dart';

final List<Scenario> catalogExtraBatchH = [
  // ===================== HINDI (hi) =====================
  Scenario(
    id: 'hi_intro',
    lang: LearnLang.hi,
    cefr: Cefr.a1,
    minutes: 7,
    titles: {UiLang.tr: 'Tanışma', UiLang.en: 'Getting to know someone'},
    clipLine: 'नमस्ते, आपसे मिलकर अच्छा लगा।',
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr:
            'Hintçede "sahip olmak" fiili yoktur — "birinde bir şey var" '
            'demek için "X के पास ... है" (X\'in yanında ... var) kalıbı '
            'kullanılır.',
        UiLang.en:
            'Hindi has no verb "to have" — possession is expressed with '
            '"X के पास ... है" (near X there is ...), not with "मैं" as a '
            'direct subject.',
      },
      goodExample: 'मेरे पास एक किताब है।',
      badExample: 'मैं एक किताब है।',
    ),
    phrases: [
      Phrase(
        id: 'hi_intro_0',
        target: 'नमस्ते, आपसे मिलकर अच्छा लगा।', // TODO: native review
        gloss: {
          UiLang.tr: 'Merhaba, tanıştığımıza memnun oldum.',
          UiLang.en: 'Hello, nice to meet you.',
        },
      ),
      Phrase(
        id: 'hi_intro_1',
        target: 'मेरा नाम आयशे है, आपका नाम क्या है?', // TODO: native review
        gloss: {
          UiLang.tr: 'Benim adım Ayşe, sizin adınız ne?',
          UiLang.en: 'My name is Ayşe, what is your name?',
        },
      ),
      Phrase(
        id: 'hi_intro_2',
        target:
            'मैं एक शिक्षक हूँ। आप क्या काम करते हैं?', // TODO: native review
        gloss: {
          UiLang.tr: 'Ben öğretmenim. Siz ne iş yapıyorsunuz?',
          UiLang.en: 'I am a teacher. What do you do?',
        },
      ),
      Phrase(
        id: 'hi_intro_3',
        target: 'आपकी उम्र क्या है?', // TODO: native review
        gloss: {UiLang.tr: 'Kaç yaşındasınız?', UiLang.en: 'How old are you?'},
        hint: 'Yakın tanıdıklar arasında kullanılır, çok resmi değildir.',
      ),
      Phrase(
        id: 'hi_intro_4',
        target: 'मैं तीस साल का हूँ।', // TODO: native review
        gloss: {
          UiLang.tr: 'Otuz yaşındayım.',
          UiLang.en: 'I am thirty years old.',
        },
        hint: 'Erkek konuşmacı için "का", kadın konuşmacı için "की".',
      ),
      Phrase(
        id: 'hi_intro_5',
        target: 'क्या आपके पास फ़ोन नंबर है?', // TODO: native review
        gloss: {
          UiLang.tr: 'Telefon numaranız var mı?',
          UiLang.en: 'Do you have a phone number?',
        },
      ),
      Phrase(
        id: 'hi_intro_6',
        target: 'यह रहा मेरा नंबर, फिर मिलेंगे!', // TODO: native review
        gloss: {
          UiLang.tr: 'İşte numaram, sonra görüşürüz!',
          UiLang.en: 'Here is my number, see you later!',
        },
      ),
    ],
    turns: [
      SpeakTurn(
        prompt: 'Someone greets you.',
        expected: 'नमस्ते, आपसे मिलकर अच्छा लगा।',
      ),
      SpeakTurn(
        prompt: 'They ask your name.',
        expected: 'मेरा नाम आयशे है, आपका नाम क्या है?',
      ),
      SpeakTurn(
        prompt: 'They ask what you do.',
        expected: 'मैं एक शिक्षक हूँ। आप क्या काम करते हैं?',
      ),
      SpeakTurn(prompt: 'They ask your age.', expected: 'आपकी उम्र क्या है?'),
      SpeakTurn(prompt: 'You answer.', expected: 'मैं तीस साल का हूँ।'),
      SpeakTurn(
        prompt: 'They ask for your number.',
        expected: 'क्या आपके पास फ़ोन नंबर है?',
      ),
      SpeakTurn(
        prompt: 'You hand it over and say goodbye.',
        expected: 'यह रहा मेरा नंबर, फिर मिलेंगे!',
      ),
    ],
  ),
  Scenario(
    id: 'hi_shopping',
    lang: LearnLang.hi,
    cefr: Cefr.a1,
    minutes: 7,
    titles: {UiLang.tr: 'Alışveriş', UiLang.en: 'Shopping for clothes'},
    clipLine: 'माफ़ कीजिए, यह शर्ट कितने की है?',
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr:
            'Bir şey isterken özne "मैं" değil, "मुझे" (bana) datif hâlidir '
            '— "मुझे ... चाहिए / मिल सकता है" kalıbı kullanılır.',
        UiLang.en:
            'When asking to receive or need something, the experiencer '
            'subject is "मुझे" (to me), not the plain nominative "मैं".',
      },
      goodExample: 'क्या मुझे एक थैला मिल सकता है?',
      badExample: 'क्या मैं एक थैला मिल सकता है?',
    ),
    phrases: [
      Phrase(
        id: 'hi_shopping_0',
        target: 'माफ़ कीजिए, यह शर्ट कितने की है?', // TODO: native review
        gloss: {
          UiLang.tr: 'Affedersiniz, bu gömlek ne kadar?',
          UiLang.en: 'Excuse me, how much is this shirt?',
        },
      ),
      Phrase(
        id: 'hi_shopping_1',
        target: 'क्या आपके पास छोटा साइज़ है?', // TODO: native review
        gloss: {
          UiLang.tr: 'Daha küçük beden var mı?',
          UiLang.en: 'Do you have a smaller size?',
        },
      ),
      Phrase(
        id: 'hi_shopping_2',
        target: 'क्या मैं इसे पहन कर देख सकता हूँ?', // TODO: native review
        gloss: {
          UiLang.tr: 'Bunu deneyebilir miyim?',
          UiLang.en: 'Can I try it on?',
        },
      ),
      Phrase(
        id: 'hi_shopping_3',
        target: 'चेंजिंग रूम कहाँ है?', // TODO: native review
        gloss: {
          UiLang.tr: 'Deneme kabini nerede?',
          UiLang.en: 'Where is the fitting room?',
        },
      ),
      Phrase(
        id: 'hi_shopping_4',
        target: 'मैं यह ले लूँगा।', // TODO: native review
        gloss: {UiLang.tr: 'Bunu alacağım.', UiLang.en: "I'll take this one."},
      ),
      Phrase(
        id: 'hi_shopping_5',
        target: 'क्या आप क्रेडिट कार्ड लेते हैं?', // TODO: native review
        gloss: {
          UiLang.tr: 'Kredi kartı geçiyor mu?',
          UiLang.en: 'Do you accept credit cards?',
        },
      ),
      Phrase(
        id: 'hi_shopping_6',
        target: 'क्या मुझे एक थैला मिल सकता है?', // TODO: native review
        gloss: {
          UiLang.tr: 'Bir poşet alabilir miyim?',
          UiLang.en: 'Can I get a bag, please?',
        },
      ),
    ],
    turns: [
      SpeakTurn(
        prompt: 'You see a shirt you like.',
        expected: 'माफ़ कीजिए, यह शर्ट कितने की है?',
      ),
      SpeakTurn(
        prompt: "It's too big.",
        expected: 'क्या आपके पास छोटा साइज़ है?',
      ),
      SpeakTurn(
        prompt: 'You want to try it.',
        expected: 'क्या मैं इसे पहन कर देख सकता हूँ?',
      ),
      SpeakTurn(
        prompt: 'You look for a place to change.',
        expected: 'चेंजिंग रूम कहाँ है?',
      ),
      SpeakTurn(prompt: 'You decide to buy it.', expected: 'मैं यह ले लूँगा।'),
      SpeakTurn(
        prompt: "You're ready to pay.",
        expected: 'क्या आप क्रेडिट कार्ड लेते हैं?',
      ),
      SpeakTurn(
        prompt: 'You need to carry it home.',
        expected: 'क्या मुझे एक थैला मिल सकता है?',
      ),
    ],
  ),
  Scenario(
    id: 'hi_numbers_time',
    lang: LearnLang.hi,
    cefr: Cefr.a1,
    minutes: 7,
    titles: {
      UiLang.tr: 'Sayılar ve saat',
      UiLang.en: 'Numbers and telling time',
    },
    clipLine: 'अभी क्या समय है?',
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr: 'Saat söylerken "बजे" her zaman sayının SONRASINA gelir.',
        UiLang.en:
            '"बजे" (o\'clock) always comes AFTER the number, never before.',
      },
      goodExample: 'तीन बजे',
      badExample: 'बजे तीन',
    ),
    phrases: [
      Phrase(
        id: 'hi_numbers_time_0',
        target: 'अभी क्या समय है?', // TODO: native review
        gloss: {
          UiLang.tr: 'Şu an saat kaç?',
          UiLang.en: 'What time is it now?',
        },
      ),
      Phrase(
        id: 'hi_numbers_time_1',
        target: 'तीन बज रहे हैं।', // TODO: native review
        gloss: {UiLang.tr: 'Saat üç.', UiLang.en: "It's three o'clock."},
      ),
      Phrase(
        id: 'hi_numbers_time_2',
        target: 'ट्रेन कितने बजे जाती है?', // TODO: native review
        gloss: {
          UiLang.tr: 'Tren saat kaçta kalkıyor?',
          UiLang.en: 'What time does the train leave?',
        },
      ),
      Phrase(
        id: 'hi_numbers_time_3',
        target: 'यह साढ़े चार बजे जाती है।', // TODO: native review
        gloss: {
          UiLang.tr: 'Dört buçukta kalkıyor.',
          UiLang.en: 'It leaves at half past four.',
        },
      ),
      Phrase(
        id: 'hi_numbers_time_4',
        target: 'मेरी सुबह दस बजे मीटिंग है।', // TODO: native review
        gloss: {
          UiLang.tr: 'Sabah saat onda toplantım var.',
          UiLang.en: 'I have a meeting at ten in the morning.',
        },
      ),
      Phrase(
        id: 'hi_numbers_time_5',
        target: 'शाम को सात बजे मिलते हैं।', // TODO: native review
        gloss: {
          UiLang.tr: 'Akşam yedide görüşürüz.',
          UiLang.en: 'See you at seven in the evening.',
        },
      ),
      Phrase(
        id: 'hi_numbers_time_6',
        target:
            'क्या आप मुझे आज की तारीख़ बता सकते हैं?', // TODO: native review
        gloss: {
          UiLang.tr: 'Bugünün tarihini söyleyebilir misiniz?',
          UiLang.en: 'Can you tell me the date today?',
        },
      ),
    ],
    turns: [
      SpeakTurn(
        prompt: 'You want to know the time.',
        expected: 'अभी क्या समय है?',
      ),
      SpeakTurn(prompt: 'Someone answers.', expected: 'तीन बज रहे हैं।'),
      SpeakTurn(
        prompt: "You're at the station.",
        expected: 'ट्रेन कितने बजे जाती है?',
      ),
      SpeakTurn(
        prompt: 'The clerk answers.',
        expected: 'यह साढ़े चार बजे जाती है।',
      ),
      SpeakTurn(
        prompt: 'You mention your schedule.',
        expected: 'मेरी सुबह दस बजे मीटिंग है।',
      ),
      SpeakTurn(
        prompt: 'You arrange to meet.',
        expected: 'शाम को सात बजे मिलते हैं।',
      ),
      SpeakTurn(
        prompt: "You want today's date.",
        expected: 'क्या आप मुझे आज की तारीख़ बता सकते हैं?',
      ),
    ],
  ),
  Scenario(
    id: 'hi_family',
    lang: LearnLang.hi,
    cefr: Cefr.a1,
    minutes: 7,
    titles: {UiLang.tr: 'Aile', UiLang.en: 'Talking about family'},
    clipLine: 'यह मेरी माँ है।',
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr:
            'İyelik sıfatı "मेरा/मेरी/मेरे" sahibine değil, sahip olunan '
            'ismin cinsiyetine göre çekimlenir.',
        UiLang.en:
            'The possessive "मेरा/मेरी/मेरे" agrees with the gender of the '
            'possessed noun, not with the possessor.',
      },
      goodExample: 'मेरी बहन',
      badExample: 'मेरा बहन',
    ),
    phrases: [
      Phrase(
        id: 'hi_family_0',
        target: 'यह मेरी माँ है।', // TODO: native review
        gloss: {UiLang.tr: 'Bu benim annem.', UiLang.en: 'This is my mother.'},
      ),
      Phrase(
        id: 'hi_family_1',
        target: 'यह मेरे पिता जी हैं।', // TODO: native review
        gloss: {UiLang.tr: 'Bu benim babam.', UiLang.en: 'This is my father.'},
      ),
      Phrase(
        id: 'hi_family_2',
        target: 'मेरे दो भाई-बहन हैं।', // TODO: native review
        gloss: {
          UiLang.tr: 'İki kardeşim var.',
          UiLang.en: 'I have two siblings.',
        },
      ),
      Phrase(
        id: 'hi_family_3',
        target: 'यह मेरा छोटा भाई है।', // TODO: native review
        gloss: {
          UiLang.tr: 'Bu benim küçük kardeşim.',
          UiLang.en: 'This is my younger brother.',
        },
      ),
      Phrase(
        id: 'hi_family_4',
        target: 'यह मेरी बड़ी बहन है।', // TODO: native review
        gloss: {
          UiLang.tr: 'Bu benim büyük ablam.',
          UiLang.en: 'This is my older sister.',
        },
      ),
      Phrase(
        id: 'hi_family_5',
        target: 'क्या वह आपकी पत्नी हैं?', // TODO: native review
        gloss: {
          UiLang.tr: 'O sizin eşiniz mi?',
          UiLang.en: 'Is she your wife?',
        },
      ),
      Phrase(
        id: 'hi_family_6',
        target: 'मेरा बेटा पाँच साल का है।', // TODO: native review
        gloss: {
          UiLang.tr: 'Oğlum beş yaşında.',
          UiLang.en: 'My son is five years old.',
        },
      ),
    ],
    turns: [
      SpeakTurn(prompt: 'You show a photo.', expected: 'यह मेरी माँ है।'),
      SpeakTurn(
        prompt: 'You point to another person.',
        expected: 'यह मेरे पिता जी हैं।',
      ),
      SpeakTurn(
        prompt: 'Someone asks about siblings.',
        expected: 'मेरे दो भाई-बहन हैं।',
      ),
      SpeakTurn(prompt: 'You introduce him.', expected: 'यह मेरा छोटा भाई है।'),
      SpeakTurn(prompt: 'You introduce her.', expected: 'यह मेरी बड़ी बहन है।'),
      SpeakTurn(
        prompt: 'Someone asks about her.',
        expected: 'क्या वह आपकी पत्नी हैं?',
      ),
      SpeakTurn(
        prompt: 'Someone asks about your son.',
        expected: 'मेरा बेटा पाँच साल का है।',
      ),
    ],
  ),
  Scenario(
    id: 'hi_weather',
    lang: LearnLang.hi,
    cefr: Cefr.a1,
    minutes: 7,
    titles: {UiLang.tr: 'Hava durumu', UiLang.en: 'Talking about the weather'},
    clipLine: 'आज मौसम कैसा है?',
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr:
            'Hava durumu, bir sıfat değil bir isim + "है" ile anlatılır — '
            '"गर्मी है" (sıcaklık var) demek, "यह गर्म है" gibi doğrudan '
            'İngilizce kalıbın çevirisinden daha doğaldır.',
        UiLang.en:
            'Weather is described with a NOUN + है ("heat is [present]"), '
            'not by translating the English adjective pattern directly.',
      },
      goodExample: 'आज गर्मी है।',
      badExample: 'आज यह गर्म है।',
    ),
    phrases: [
      Phrase(
        id: 'hi_weather_0',
        target: 'आज मौसम कैसा है?', // TODO: native review
        gloss: {
          UiLang.tr: 'Bugün hava nasıl?',
          UiLang.en: "What's the weather like today?",
        },
      ),
      Phrase(
        id: 'hi_weather_1',
        target: 'आज बहुत गर्मी है।', // TODO: native review
        gloss: {
          UiLang.tr: 'Bugün çok sıcak.',
          UiLang.en: "It's very hot today.",
        },
      ),
      Phrase(
        id: 'hi_weather_2',
        target: 'बाहर बारिश हो रही है।', // TODO: native review
        gloss: {
          UiLang.tr: 'Dışarıda yağmur yağıyor.',
          UiLang.en: "It's raining outside.",
        },
      ),
      Phrase(
        id: 'hi_weather_3',
        target: 'ठंड है, जैकेट ले लो।', // TODO: native review
        gloss: {
          UiLang.tr: 'Hava soğuk, ceket al.',
          UiLang.en: "It's cold, take a jacket.",
        },
      ),
      Phrase(
        id: 'hi_weather_4',
        target: 'कल धूप निकलेगी।', // TODO: native review
        gloss: {
          UiLang.tr: 'Yarın güneşli olacak.',
          UiLang.en: 'Tomorrow it will be sunny.',
        },
      ),
      Phrase(
        id: 'hi_weather_5',
        target: 'बहुत हवा चल रही है।', // TODO: native review
        gloss: {UiLang.tr: 'Çok rüzgar var.', UiLang.en: "It's very windy."},
      ),
      Phrase(
        id: 'hi_weather_6',
        target: 'मुझे गर्मी से ज़्यादा सर्दी पसंद है।', // TODO: native review
        gloss: {
          UiLang.tr: 'Yazdan çok kışı severim.',
          UiLang.en: 'I like winter more than summer.',
        },
      ),
    ],
    turns: [
      SpeakTurn(prompt: 'You start small talk.', expected: 'आज मौसम कैसा है?'),
      SpeakTurn(
        prompt: 'You comment on the heat.',
        expected: 'आज बहुत गर्मी है।',
      ),
      SpeakTurn(prompt: 'You look outside.', expected: 'बाहर बारिश हो रही है।'),
      SpeakTurn(prompt: 'You warn a friend.', expected: 'ठंड है, जैकेट ले लो।'),
      SpeakTurn(prompt: 'You check the forecast.', expected: 'कल धूप निकलेगी।'),
      SpeakTurn(prompt: 'You feel the wind.', expected: 'बहुत हवा चल रही है।'),
      SpeakTurn(
        prompt: 'You share your preference.',
        expected: 'मुझे गर्मी से ज़्यादा सर्दी पसंद है।',
      ),
    ],
  ),
  Scenario(
    id: 'hi_transport',
    lang: LearnLang.hi,
    cefr: Cefr.a1,
    minutes: 7,
    titles: {UiLang.tr: 'Ulaşım', UiLang.en: 'Getting around'},
    clipLine: 'शहर के केंद्र के लिए कौन सी बस जाती है?',
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr:
            'Ulaşım aracı "से" (ile) edatıyla, isimden SONRA belirtilir.',
        UiLang.en:
            'The mode of transport is marked with the postposition "से" '
            '("by"), placed AFTER the noun.',
      },
      goodExample: 'मैं टैक्सी से जाऊँगा।',
      badExample: 'मैं से टैक्सी जाऊँगा।',
    ),
    phrases: [
      Phrase(
        id: 'hi_transport_0',
        target:
            'शहर के केंद्र के लिए कौन सी बस जाती है?', // TODO: native review
        gloss: {
          UiLang.tr: 'Şehir merkezine hangi otobüs gidiyor?',
          UiLang.en: 'Which bus goes to the city center?',
        },
      ),
      Phrase(
        id: 'hi_transport_1',
        target: 'मैं एयरपोर्ट कैसे पहुँच सकता हूँ?', // TODO: native review
        gloss: {
          UiLang.tr: 'Havaalanına nasıl gidebilirim?',
          UiLang.en: 'How do I get to the airport?',
        },
      ),
      Phrase(
        id: 'hi_transport_2',
        target: 'मैं टैक्सी से जाऊँगा।', // TODO: native review
        gloss: {
          UiLang.tr: 'Taksiyle gideceğim.',
          UiLang.en: 'I will go by taxi.',
        },
      ),
      Phrase(
        id: 'hi_transport_3',
        target: 'क्या यह सीट खाली है?', // TODO: native review
        gloss: {
          UiLang.tr: 'Bu koltuk boş mu?',
          UiLang.en: 'Is this seat taken?',
        },
      ),
      Phrase(
        id: 'hi_transport_4',
        target: 'टिकट कहाँ मिलेगा?', // TODO: native review
        gloss: {
          UiLang.tr: 'Bilet nereden alınır?',
          UiLang.en: 'Where do I buy a ticket?',
        },
      ),
      Phrase(
        id: 'hi_transport_5',
        target: 'अगली ट्रेन कितने बजे जाएगी?', // TODO: native review
        gloss: {
          UiLang.tr: 'Bir sonraki tren saat kaçta kalkıyor?',
          UiLang.en: 'What time does the next train leave?',
        },
      ),
      Phrase(
        id: 'hi_transport_6',
        target: 'कृपया यहाँ रोकिए।', // TODO: native review
        gloss: {
          UiLang.tr: 'Lütfen burada durun.',
          UiLang.en: 'Please stop here.',
        },
      ),
    ],
    turns: [
      SpeakTurn(
        prompt: "You're lost downtown.",
        expected: 'शहर के केंद्र के लिए कौन सी बस जाती है?',
      ),
      SpeakTurn(
        prompt: 'You ask a stranger.',
        expected: 'मैं एयरपोर्ट कैसे पहुँच सकता हूँ?',
      ),
      SpeakTurn(
        prompt: 'You decide how to travel.',
        expected: 'मैं टैक्सी से जाऊँगा।',
      ),
      SpeakTurn(
        prompt: 'You check an empty seat.',
        expected: 'क्या यह सीट खाली है?',
      ),
      SpeakTurn(prompt: 'You need a ticket.', expected: 'टिकट कहाँ मिलेगा?'),
      SpeakTurn(
        prompt: "You're waiting at the platform.",
        expected: 'अगली ट्रेन कितने बजे जाएगी?',
      ),
      SpeakTurn(prompt: "You're in the taxi.", expected: 'कृपया यहाँ रोकिए।'),
    ],
  ),
  Scenario(
    id: 'hi_emergency',
    lang: LearnLang.hi,
    cefr: Cefr.a1,
    minutes: 7,
    titles: {UiLang.tr: 'Acil durum', UiLang.en: 'Emergency situations'},
    clipLine: 'बचाओ!',
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr:
            'Yabancılardan yardım isterken kibar emir eki "-इए" '
            '(कीजिए/बुलाइए) kullanılır — sade fiil kökü kaba kaçar.',
        UiLang.en:
            'When asking strangers for urgent help, use the polite '
            'imperative suffix "-इए" (कीजिए/बुलाइए) — the bare verb stem '
            'sounds rude.',
      },
      goodExample: 'एम्बुलेंस बुलाइए!',
      badExample: 'एम्बुलेंस बुला!',
    ),
    phrases: [
      Phrase(
        id: 'hi_emergency_0',
        target: 'बचाओ!', // TODO: native review
        gloss: {UiLang.tr: 'İmdat!', UiLang.en: 'Help!'},
      ),
      Phrase(
        id: 'hi_emergency_1',
        target: 'कृपया एम्बुलेंस बुलाइए!', // TODO: native review
        gloss: {
          UiLang.tr: 'Lütfen ambulans çağırın!',
          UiLang.en: 'Please call an ambulance!',
        },
      ),
      Phrase(
        id: 'hi_emergency_2',
        target: 'मेरा पासपोर्ट खो गया है।', // TODO: native review
        gloss: {
          UiLang.tr: 'Pasaportumu kaybettim.',
          UiLang.en: 'I lost my passport.',
        },
      ),
      Phrase(
        id: 'hi_emergency_3',
        target: 'कृपया पुलिस को बुलाइए!', // TODO: native review
        gloss: {
          UiLang.tr: 'Lütfen polisi arayın!',
          UiLang.en: 'Call the police, please!',
        },
      ),
      Phrase(
        id: 'hi_emergency_4',
        target: 'सबसे नज़दीकी अस्पताल कहाँ है?', // TODO: native review
        gloss: {
          UiLang.tr: 'En yakın hastane nerede?',
          UiLang.en: 'Where is the nearest hospital?',
        },
      ),
      Phrase(
        id: 'hi_emergency_5',
        target: 'मुझे बहुत तबीयत ख़राब लग रही है।', // TODO: native review
        gloss: {
          UiLang.tr: 'Kendimi çok kötü hissediyorum.',
          UiLang.en: 'I feel very sick.',
        },
      ),
      Phrase(
        id: 'hi_emergency_6',
        target: 'कृपया, मुझे अभी मदद चाहिए।', // TODO: native review
        gloss: {
          UiLang.tr: 'Lütfen, şimdi yardıma ihtiyacım var.',
          UiLang.en: 'Please, I need help now.',
        },
      ),
    ],
    turns: [
      SpeakTurn(prompt: 'Something just happened.', expected: 'बचाओ!'),
      SpeakTurn(
        prompt: 'Someone is badly hurt.',
        expected: 'कृपया एम्बुलेंस बुलाइए!',
      ),
      SpeakTurn(
        prompt: 'You check your bag.',
        expected: 'मेरा पासपोर्ट खो गया है।',
      ),
      SpeakTurn(
        prompt: 'You witness a crime.',
        expected: 'कृपया पुलिस को बुलाइए!',
      ),
      SpeakTurn(
        prompt: 'You need medical help.',
        expected: 'सबसे नज़दीकी अस्पताल कहाँ है?',
      ),
      SpeakTurn(
        prompt: 'Someone asks how you feel.',
        expected: 'मुझे बहुत तबीयत ख़राब लग रही है।',
      ),
      SpeakTurn(
        prompt: 'You plead for help.',
        expected: 'कृपया, मुझे अभी मदद चाहिए।',
      ),
    ],
  ),
  Scenario(
    id: 'hi_routine',
    lang: LearnLang.hi,
    cefr: Cefr.a1,
    minutes: 7,
    titles: {UiLang.tr: 'Günlük rutin', UiLang.en: 'Daily routine'},
    clipLine: 'मैं आम तौर पर छह बजे उठता हूँ।',
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr:
            'İki parçalı edat "के बाद" (sonra), ismi ARASINA alır — isim '
            'önce, "के बाद" sonra gelir.',
        UiLang.en:
            'The compound postposition "के बाद" ("after") sandwiches the '
            'noun — the noun comes first, "के बाद" comes after it.',
      },
      goodExample: 'खाने के बाद',
      badExample: 'के बाद खाने',
    ),
    phrases: [
      Phrase(
        id: 'hi_routine_0',
        target: 'मैं आम तौर पर छह बजे उठता हूँ।', // TODO: native review
        gloss: {
          UiLang.tr: 'Genelde altıda kalkarım.',
          UiLang.en: 'I usually wake up at six.',
        },
      ),
      Phrase(
        id: 'hi_routine_1',
        target: 'मैं पहले अपने दाँत साफ़ करता हूँ।', // TODO: native review
        gloss: {
          UiLang.tr: 'Önce dişlerimi fırçalarım.',
          UiLang.en: 'I brush my teeth first.',
        },
      ),
      Phrase(
        id: 'hi_routine_2',
        target: 'मैं सात बजे नाश्ता करता हूँ।', // TODO: native review
        gloss: {
          UiLang.tr: 'Yedide kahvaltı yaparım.',
          UiLang.en: 'I have breakfast at seven.',
        },
      ),
      Phrase(
        id: 'hi_routine_3',
        target: 'मैं बस से काम पर जाता हूँ।', // TODO: native review
        gloss: {
          UiLang.tr: 'İşe otobüsle giderim.',
          UiLang.en: 'I go to work by bus.',
        },
      ),
      Phrase(
        id: 'hi_routine_4',
        target: 'मैं आम तौर पर दोपहर को खाना खाता हूँ।', // TODO: native review
        gloss: {
          UiLang.tr: 'Genelde öğlen yemek yerim.',
          UiLang.en: 'I usually eat lunch at noon.',
        },
      ),
      Phrase(
        id: 'hi_routine_5',
        target: 'रात के खाने के बाद मैं टीवी देखता हूँ।', // TODO: native review
        gloss: {
          UiLang.tr: 'Akşam yemeğinden sonra televizyon izlerim.',
          UiLang.en: 'After dinner I watch TV.',
        },
      ),
      Phrase(
        id: 'hi_routine_6',
        target: 'मैं ग्यारह बजे सो जाता हूँ।', // TODO: native review
        gloss: {
          UiLang.tr: 'On birde yatarım.',
          UiLang.en: 'I go to bed at eleven.',
        },
      ),
    ],
    turns: [
      SpeakTurn(
        prompt: 'Someone asks about your morning.',
        expected: 'मैं आम तौर पर छह बजे उठता हूँ।',
      ),
      SpeakTurn(
        prompt: 'You describe your habit.',
        expected: 'मैं पहले अपने दाँत साफ़ करता हूँ।',
      ),
      SpeakTurn(
        prompt: 'You continue the routine.',
        expected: 'मैं सात बजे नाश्ता करता हूँ।',
      ),
      SpeakTurn(
        prompt: 'They ask how you commute.',
        expected: 'मैं बस से काम पर जाता हूँ।',
      ),
      SpeakTurn(
        prompt: 'They ask about lunch.',
        expected: 'मैं आम तौर पर दोपहर को खाना खाता हूँ।',
      ),
      SpeakTurn(
        prompt: 'They ask about the evening.',
        expected: 'रात के खाने के बाद मैं टीवी देखता हूँ।',
      ),
      SpeakTurn(
        prompt: 'They ask when you sleep.',
        expected: 'मैं ग्यारह बजे सो जाता हूँ।',
      ),
    ],
  ),
  Scenario(
    id: 'hi_past_story',
    lang: LearnLang.hi,
    cefr: Cefr.a1,
    minutes: 7,
    titles: {
      UiLang.tr: 'Geçmişte bir gün',
      UiLang.en: 'Telling a story in the past',
    },
    clipLine: 'कल मैं बाज़ार गया।',
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr:
            'Geçmiş zamanda fiil, "did/etti" gibi ayrı bir yardımcı fiil '
            'almaz — fiil sonu özneye göre cinsiyet uyumlu olarak değişir '
            '(erkek: -आ, kadın: -ई).',
        UiLang.en:
            'Simple past needs no separate "did" auxiliary — the verb '
            'ending itself changes to agree with the subject\'s gender '
            '(male: -आ, female: -ई).',
      },
      goodExample: 'मैं बाज़ार गया।',
      badExample: 'मैं बाज़ार जाता हूँ।',
    ),
    phrases: [
      Phrase(
        id: 'hi_past_story_0',
        target: 'कल मैं बाज़ार गया।', // TODO: native review
        gloss: {
          UiLang.tr: 'Dün pazara gittim.',
          UiLang.en: 'Yesterday I went to the market.',
        },
        hint: 'Erkek konuşmacı formu; kadın konuşmacı "गई" der.',
      ),
      Phrase(
        id: 'hi_past_story_1',
        target: 'मैंने कुछ सब्ज़ियाँ खरीदीं।', // TODO: native review
        gloss: {
          UiLang.tr: 'Biraz sebze aldım.',
          UiLang.en: 'I bought some vegetables.',
        },
      ),
      Phrase(
        id: 'hi_past_story_2',
        target: 'फिर मैं अपने दोस्त से मिला।', // TODO: native review
        gloss: {
          UiLang.tr: 'Sonra arkadaşımla buluştum.',
          UiLang.en: 'Then I met my friend.',
        },
      ),
      Phrase(
        id: 'hi_past_story_3',
        target: 'हमने साथ में कॉफ़ी पी।', // TODO: native review
        gloss: {
          UiLang.tr: 'Birlikte kahve içtik.',
          UiLang.en: 'We drank coffee together.',
        },
      ),
      Phrase(
        id: 'hi_past_story_4',
        target: 'उसके बाद मैं घर गया।', // TODO: native review
        gloss: {
          UiLang.tr: 'Ondan sonra eve gittim.',
          UiLang.en: 'After that I went home.',
        },
      ),
      Phrase(
        id: 'hi_past_story_5',
        target: 'मैंने रात का खाना बनाया।', // TODO: native review
        gloss: {
          UiLang.tr: 'Akşam yemeği pişirdim.',
          UiLang.en: 'I cooked dinner.',
        },
      ),
      Phrase(
        id: 'hi_past_story_6',
        target: 'यह एक अच्छा दिन था।', // TODO: native review
        gloss: {UiLang.tr: 'Güzel bir gündü.', UiLang.en: 'It was a good day.'},
      ),
    ],
    turns: [
      SpeakTurn(
        prompt: 'You start telling a story.',
        expected: 'कल मैं बाज़ार गया।',
      ),
      SpeakTurn(
        prompt: 'You continue.',
        expected: 'मैंने कुछ सब्ज़ियाँ खरीदीं।',
      ),
      SpeakTurn(
        prompt: 'You continue.',
        expected: 'फिर मैं अपने दोस्त से मिला।',
      ),
      SpeakTurn(prompt: 'You continue.', expected: 'हमने साथ में कॉफ़ी पी।'),
      SpeakTurn(prompt: 'You continue.', expected: 'उसके बाद मैं घर गया।'),
      SpeakTurn(prompt: 'You continue.', expected: 'मैंने रात का खाना बनाया।'),
      SpeakTurn(
        prompt: 'You finish the story.',
        expected: 'यह एक अच्छा दिन था।',
      ),
    ],
  ),

  // ===================== THAI (th) =====================
  Scenario(
    id: 'th_intro',
    lang: LearnLang.th,
    cefr: Cefr.a1,
    minutes: 7,
    titles: {UiLang.tr: 'Tanışma', UiLang.en: 'Getting to know someone'},
    clipLine: 'สวัสดีค่ะ ยินดีที่ได้รู้จัก',
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr:
            'Cümle sonu kibarlık parçacığı konuşanın cinsiyetine göre '
            'değişir: erkek "ครับ" der, kadın "ค่ะ" der. Bu derste kadın sesi '
            'kullanıldığı için cümleler "ค่ะ" ile biter.',
        UiLang.en:
            'The sentence-final politeness particle changes with the '
            "speaker's gender: men say ครับ, women say ค่ะ.",
      },
      goodExample: 'สวัสดีค่ะ (kadın konuşmacı)',
      badExample: 'สวัสดีครับ (kadın konuşmacı için yanlış)',
    ),
    phrases: [
      Phrase(
        id: 'th_intro_0',
        target: 'สวัสดีค่ะ ยินดีที่ได้รู้จัก', // TODO: native review
        ipa: 'sà-wàt-dii khráp yin-dii thîi dâai rúu-jàk',
        gloss: {
          UiLang.tr: 'Merhaba, tanıştığımıza memnun oldum.',
          UiLang.en: 'Hello, nice to meet you.',
        },
        hint: 'Erkek konuşmacı formu (ค่ะ); kadın konuşmacı ค่ะ kullanır.',
      ),
      Phrase(
        id: 'th_intro_1',
        target: 'ฉันชื่อไอเช่ค่ะ คุณชื่ออะไร?', // TODO: native review
        gloss: {
          UiLang.tr: 'Benim adım Ayşe, senin adın ne?',
          UiLang.en: "My name is Ayşe, what's your name?",
        },
      ),
      Phrase(
        id: 'th_intro_2',
        target: 'ฉันเป็นครูค่ะ คุณทำงานอะไร?', // TODO: native review
        gloss: {
          UiLang.tr: 'Ben öğretmenim. Sen ne iş yapıyorsun?',
          UiLang.en: 'I am a teacher. What do you do?',
        },
      ),
      Phrase(
        id: 'th_intro_3',
        target: 'คุณอายุเท่าไหร่?', // TODO: native review
        gloss: {UiLang.tr: 'Kaç yaşındasın?', UiLang.en: 'How old are you?'},
      ),
      Phrase(
        id: 'th_intro_4',
        target: 'ฉันอายุสามสิบปีค่ะ', // TODO: native review
        gloss: {
          UiLang.tr: 'Otuz yaşındayım.',
          UiLang.en: 'I am thirty years old.',
        },
      ),
      Phrase(
        id: 'th_intro_5',
        target: 'คุณมีเบอร์โทรศัพท์ไหม?', // TODO: native review
        gloss: {
          UiLang.tr: 'Telefon numaran var mı?',
          UiLang.en: 'Do you have a phone number?',
        },
      ),
      Phrase(
        id: 'th_intro_6',
        target: 'นี่เบอร์ฉันค่ะ แล้วเจอกันนะ!', // TODO: native review
        gloss: {
          UiLang.tr: 'İşte numaram, sonra görüşürüz!',
          UiLang.en: 'Here is my number, see you later!',
        },
      ),
    ],
    turns: [
      SpeakTurn(
        prompt: 'Someone greets you.',
        expected: 'สวัสดีค่ะ ยินดีที่ได้รู้จัก',
      ),
      SpeakTurn(
        prompt: 'They ask your name.',
        expected: 'ฉันชื่อไอเช่ค่ะ คุณชื่ออะไร?',
      ),
      SpeakTurn(
        prompt: 'They ask what you do.',
        expected: 'ฉันเป็นครูค่ะ คุณทำงานอะไร?',
      ),
      SpeakTurn(prompt: 'They ask your age.', expected: 'คุณอายุเท่าไหร่?'),
      SpeakTurn(prompt: 'You answer.', expected: 'ฉันอายุสามสิบปีค่ะ'),
      SpeakTurn(
        prompt: 'They ask for your number.',
        expected: 'คุณมีเบอร์โทรศัพท์ไหม?',
      ),
      SpeakTurn(
        prompt: 'You hand it over and say goodbye.',
        expected: 'นี่เบอร์ฉันค่ะ แล้วเจอกันนะ!',
      ),
    ],
  ),
  Scenario(
    id: 'th_shopping',
    lang: LearnLang.th,
    cefr: Cefr.a1,
    minutes: 7,
    titles: {UiLang.tr: 'Alışveriş', UiLang.en: 'Shopping for clothes'},
    clipLine: 'ขอโทษค่ะ เสื้อตัวนี้ราคาเท่าไหร่?',
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr:
            'Sayarken sıralama İSİM + SAYI + SINIFLAYICI şeklindedir — '
            'giysiler için sınıflayıcı "ตัว"dır.',
        UiLang.en:
            'Counting order is NOUN + NUMBER + CLASSIFIER — the classifier '
            'for clothing items is "ตัว".',
      },
      goodExample: 'เสื้อสองตัว',
      badExample: 'สองเสื้อตัว',
    ),
    phrases: [
      Phrase(
        id: 'th_shopping_0',
        target: 'ขอโทษค่ะ เสื้อตัวนี้ราคาเท่าไหร่?', // TODO: native review
        ipa: 'khɔ̌ɔ-thôot khráp',
        gloss: {
          UiLang.tr: 'Affedersiniz, bu gömlek ne kadar?',
          UiLang.en: 'Excuse me, how much is this shirt?',
        },
      ),
      Phrase(
        id: 'th_shopping_1',
        target: 'มีไซส์เล็กกว่านี้ไหม?', // TODO: native review
        gloss: {
          UiLang.tr: 'Daha küçük beden var mı?',
          UiLang.en: 'Do you have a smaller size?',
        },
      ),
      Phrase(
        id: 'th_shopping_2',
        target: 'ฉันลองใส่ได้ไหมคะ?', // TODO: native review
        gloss: {UiLang.tr: 'Deneyebilir miyim?', UiLang.en: 'Can I try it on?'},
      ),
      Phrase(
        id: 'th_shopping_3',
        target: 'ห้องลองเสื้ออยู่ที่ไหน?', // TODO: native review
        gloss: {
          UiLang.tr: 'Deneme kabini nerede?',
          UiLang.en: 'Where is the fitting room?',
        },
      ),
      Phrase(
        id: 'th_shopping_4',
        target: 'ฉันเอาตัวนี้ค่ะ', // TODO: native review
        gloss: {UiLang.tr: 'Bunu alacağım.', UiLang.en: "I'll take this one."},
      ),
      Phrase(
        id: 'th_shopping_5',
        target: 'รับบัตรเครดิตไหม?', // TODO: native review
        gloss: {
          UiLang.tr: 'Kredi kartı geçiyor mu?',
          UiLang.en: 'Do you accept credit cards?',
        },
      ),
      Phrase(
        id: 'th_shopping_6',
        target: 'ขอถุงด้วยค่ะ', // TODO: native review
        gloss: {
          UiLang.tr: 'Bir poşet alabilir miyim?',
          UiLang.en: 'Can I get a bag, please?',
        },
      ),
    ],
    turns: [
      SpeakTurn(
        prompt: 'You see a shirt you like.',
        expected: 'ขอโทษค่ะ เสื้อตัวนี้ราคาเท่าไหร่?',
      ),
      SpeakTurn(prompt: "It's too big.", expected: 'มีไซส์เล็กกว่านี้ไหม?'),
      SpeakTurn(prompt: 'You want to try it.', expected: 'ฉันลองใส่ได้ไหมคะ?'),
      SpeakTurn(
        prompt: 'You look for a place to change.',
        expected: 'ห้องลองเสื้ออยู่ที่ไหน?',
      ),
      SpeakTurn(prompt: 'You decide to buy it.', expected: 'ฉันเอาตัวนี้ค่ะ'),
      SpeakTurn(prompt: "You're ready to pay.", expected: 'รับบัตรเครดิตไหม?'),
      SpeakTurn(prompt: 'You need to carry it home.', expected: 'ขอถุงด้วยค่ะ'),
    ],
  ),
  Scenario(
    id: 'th_numbers_time',
    lang: LearnLang.th,
    cefr: Cefr.a1,
    minutes: 7,
    titles: {
      UiLang.tr: 'Sayılar ve saat',
      UiLang.en: 'Numbers and telling time',
    },
    clipLine: 'ตอนนี้กี่โมงแล้ว?',
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr:
            '"โมง" (saatin kaç olduğu) ile "ชั่วโมง" (süre olarak saat) '
            'birbirine karıştırılmamalı.',
        UiLang.en:
            'Don\'t confuse "โมง" (o\'clock, time of day) with "ชั่วโมง" '
            '(hour, a duration).',
      },
      goodExample: 'บ่ายสามโมง',
      badExample: 'บ่ายสามชั่วโมง',
    ),
    phrases: [
      Phrase(
        id: 'th_numbers_time_0',
        target: 'ตอนนี้กี่โมงแล้ว?', // TODO: native review
        gloss: {
          UiLang.tr: 'Şu an saat kaç?',
          UiLang.en: 'What time is it now?',
        },
      ),
      Phrase(
        id: 'th_numbers_time_1',
        target: 'บ่ายสามโมงแล้ว', // TODO: native review
        gloss: {
          UiLang.tr: 'Saat üç (öğleden sonra).',
          UiLang.en: "It's three o'clock (afternoon).",
        },
      ),
      Phrase(
        id: 'th_numbers_time_2',
        target: 'รถไฟออกกี่โมง?', // TODO: native review
        gloss: {
          UiLang.tr: 'Tren saat kaçta kalkıyor?',
          UiLang.en: 'What time does the train leave?',
        },
      ),
      Phrase(
        id: 'th_numbers_time_3',
        target: 'ออกตอนบ่ายสี่โมงครึ่ง', // TODO: native review
        gloss: {
          UiLang.tr: 'Dört buçukta kalkıyor.',
          UiLang.en: 'It leaves at half past four.',
        },
      ),
      Phrase(
        id: 'th_numbers_time_4',
        target: 'ฉันมีประชุมตอนสิบโมงเช้า', // TODO: native review
        gloss: {
          UiLang.tr: 'Sabah saat onda toplantım var.',
          UiLang.en: 'I have a meeting at ten in the morning.',
        },
      ),
      Phrase(
        id: 'th_numbers_time_5',
        target: 'เจอกันหนึ่งทุ่มนะ', // TODO: native review
        gloss: {
          UiLang.tr: 'Akşam yedide görüşürüz.',
          UiLang.en: 'See you at seven in the evening.',
        },
        hint: '19:00 Thai saat sisteminde "หนึ่งทุ่ม" (akşamın 1. saati).',
      ),
      Phrase(
        id: 'th_numbers_time_6',
        target: 'วันนี้วันที่เท่าไหร่?', // TODO: native review
        gloss: {
          UiLang.tr: 'Bugünün tarihi kaç?',
          UiLang.en: "What is today's date?",
        },
      ),
    ],
    turns: [
      SpeakTurn(
        prompt: 'You want to know the time.',
        expected: 'ตอนนี้กี่โมงแล้ว?',
      ),
      SpeakTurn(prompt: 'Someone answers.', expected: 'บ่ายสามโมงแล้ว'),
      SpeakTurn(prompt: "You're at the station.", expected: 'รถไฟออกกี่โมง?'),
      SpeakTurn(
        prompt: 'The clerk answers.',
        expected: 'ออกตอนบ่ายสี่โมงครึ่ง',
      ),
      SpeakTurn(
        prompt: 'You mention your schedule.',
        expected: 'ฉันมีประชุมตอนสิบโมงเช้า',
      ),
      SpeakTurn(prompt: 'You arrange to meet.', expected: 'เจอกันหนึ่งทุ่มนะ'),
      SpeakTurn(
        prompt: "You want today's date.",
        expected: 'วันนี้วันที่เท่าไหร่?',
      ),
    ],
  ),
  Scenario(
    id: 'th_family',
    lang: LearnLang.th,
    cefr: Cefr.a1,
    minutes: 7,
    titles: {UiLang.tr: 'Aile', UiLang.en: 'Talking about family'},
    clipLine: 'นี่คือแม่ของฉัน',
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr: 'İnsanları sayarken sınıflayıcı olarak "คน" kullanılır.',
        UiLang.en: 'The classifier "คน" is used when counting people.',
      },
      goodExample: 'มีพี่น้องสองคน',
      badExample: 'มีพี่น้องสองตัว',
    ),
    phrases: [
      Phrase(
        id: 'th_family_0',
        target: 'นี่คือแม่ของฉัน', // TODO: native review
        gloss: {UiLang.tr: 'Bu benim annem.', UiLang.en: 'This is my mother.'},
      ),
      Phrase(
        id: 'th_family_1',
        target: 'นี่คือพ่อของฉัน', // TODO: native review
        gloss: {UiLang.tr: 'Bu benim babam.', UiLang.en: 'This is my father.'},
      ),
      Phrase(
        id: 'th_family_2',
        target: 'ฉันมีพี่น้องสองคน', // TODO: native review
        gloss: {
          UiLang.tr: 'İki kardeşim var.',
          UiLang.en: 'I have two siblings.',
        },
      ),
      Phrase(
        id: 'th_family_3',
        target: 'นี่คือน้องชายของฉัน', // TODO: native review
        gloss: {
          UiLang.tr: 'Bu benim küçük erkek kardeşim.',
          UiLang.en: 'This is my younger brother.',
        },
      ),
      Phrase(
        id: 'th_family_4',
        target: 'นี่คือพี่สาวของฉัน', // TODO: native review
        gloss: {
          UiLang.tr: 'Bu benim büyük ablam.',
          UiLang.en: 'This is my older sister.',
        },
      ),
      Phrase(
        id: 'th_family_5',
        target: 'เธอเป็นภรรยาคุณใช่ไหม?', // TODO: native review
        gloss: {UiLang.tr: 'O senin eşin mi?', UiLang.en: 'Is she your wife?'},
      ),
      Phrase(
        id: 'th_family_6',
        target: 'ลูกชายฉันอายุห้าขวบ', // TODO: native review
        gloss: {
          UiLang.tr: 'Oğlum beş yaşında.',
          UiLang.en: 'My son is five years old.',
        },
        hint: '"ขวบ" çocuklar için özel yaş sınıflayıcısıdır.',
      ),
    ],
    turns: [
      SpeakTurn(prompt: 'You show a photo.', expected: 'นี่คือแม่ของฉัน'),
      SpeakTurn(
        prompt: 'You point to another person.',
        expected: 'นี่คือพ่อของฉัน',
      ),
      SpeakTurn(
        prompt: 'Someone asks about siblings.',
        expected: 'ฉันมีพี่น้องสองคน',
      ),
      SpeakTurn(prompt: 'You introduce him.', expected: 'นี่คือน้องชายของฉัน'),
      SpeakTurn(prompt: 'You introduce her.', expected: 'นี่คือพี่สาวของฉัน'),
      SpeakTurn(
        prompt: 'Someone asks about her.',
        expected: 'เธอเป็นภรรยาคุณใช่ไหม?',
      ),
      SpeakTurn(
        prompt: 'Someone asks about your son.',
        expected: 'ลูกชายฉันอายุห้าขวบ',
      ),
    ],
  ),
  Scenario(
    id: 'th_weather',
    lang: LearnLang.th,
    cefr: Cefr.a1,
    minutes: 7,
    titles: {UiLang.tr: 'Hava durumu', UiLang.en: 'Talking about the weather'},
    clipLine: 'วันนี้อากาศเป็นยังไง?',
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr:
            'Tay dilinde sıfatlar doğrudan fiil gibi davranır — sıfattan '
            'önce "เป็น" ("olmak") koymaya gerek yoktur.',
        UiLang.en:
            'Thai adjectives function as stative verbs — no "to be" '
            '(เป็น) is needed before them.',
      },
      goodExample: 'วันนี้ร้อนมาก',
      badExample: 'วันนี้เป็นร้อนมาก',
    ),
    phrases: [
      Phrase(
        id: 'th_weather_0',
        target: 'วันนี้อากาศเป็นยังไง?', // TODO: native review
        gloss: {
          UiLang.tr: 'Bugün hava nasıl?',
          UiLang.en: "What's the weather like today?",
        },
      ),
      Phrase(
        id: 'th_weather_1',
        target: 'วันนี้ร้อนมาก', // TODO: native review
        ipa: 'wan-níi rɔ́ɔn mâak',
        gloss: {
          UiLang.tr: 'Bugün çok sıcak.',
          UiLang.en: "It's very hot today.",
        },
      ),
      Phrase(
        id: 'th_weather_2',
        target: 'ข้างนอกฝนตก', // TODO: native review
        gloss: {
          UiLang.tr: 'Dışarıda yağmur yağıyor.',
          UiLang.en: "It's raining outside.",
        },
      ),
      Phrase(
        id: 'th_weather_3',
        target: 'อากาศหนาว เอาเสื้อกันหนาวไปด้วยนะ', // TODO: native review
        gloss: {
          UiLang.tr: 'Hava soğuk, ceket al.',
          UiLang.en: "It's cold, take a jacket.",
        },
      ),
      Phrase(
        id: 'th_weather_4',
        target: 'พรุ่งนี้แดดจะออก', // TODO: native review
        gloss: {
          UiLang.tr: 'Yarın güneşli olacak.',
          UiLang.en: 'Tomorrow it will be sunny.',
        },
      ),
      Phrase(
        id: 'th_weather_5',
        target: 'ลมแรงมาก', // TODO: native review
        gloss: {UiLang.tr: 'Çok rüzgar var.', UiLang.en: "It's very windy."},
      ),
      Phrase(
        id: 'th_weather_6',
        target: 'ฉันชอบหน้าหนาวมากกว่าหน้าร้อน', // TODO: native review
        gloss: {
          UiLang.tr: 'Yazdan çok kışı severim.',
          UiLang.en: 'I like winter more than summer.',
        },
      ),
    ],
    turns: [
      SpeakTurn(
        prompt: 'You start small talk.',
        expected: 'วันนี้อากาศเป็นยังไง?',
      ),
      SpeakTurn(prompt: 'You comment on the heat.', expected: 'วันนี้ร้อนมาก'),
      SpeakTurn(prompt: 'You look outside.', expected: 'ข้างนอกฝนตก'),
      SpeakTurn(
        prompt: 'You warn a friend.',
        expected: 'อากาศหนาว เอาเสื้อกันหนาวไปด้วยนะ',
      ),
      SpeakTurn(
        prompt: 'You check the forecast.',
        expected: 'พรุ่งนี้แดดจะออก',
      ),
      SpeakTurn(prompt: 'You feel the wind.', expected: 'ลมแรงมาก'),
      SpeakTurn(
        prompt: 'You share your preference.',
        expected: 'ฉันชอบหน้าหนาวมากกว่าหน้าร้อน',
      ),
    ],
  ),
  Scenario(
    id: 'th_transport',
    lang: LearnLang.th,
    cefr: Cefr.a1,
    minutes: 7,
    titles: {UiLang.tr: 'Ulaşım', UiLang.en: 'Getting around'},
    clipLine: 'รถเมล์สายไหนไปใจกลางเมือง?',
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr:
            'Gelecek zaman/niyet belirten "จะ", doğrudan fiilin ÖNÜNE gelir.',
        UiLang.en:
            'The future/intention marker "จะ" goes directly BEFORE the '
            'verb.',
      },
      goodExample: 'ฉันจะนั่งแท็กซี่',
      badExample: 'ฉันนั่งจะแท็กซี่',
    ),
    phrases: [
      Phrase(
        id: 'th_transport_0',
        target: 'รถเมล์สายไหนไปใจกลางเมือง?', // TODO: native review
        gloss: {
          UiLang.tr: 'Şehir merkezine hangi otobüs gidiyor?',
          UiLang.en: 'Which bus goes to the city center?',
        },
      ),
      Phrase(
        id: 'th_transport_1',
        target: 'ไปสนามบินยังไง?', // TODO: native review
        gloss: {
          UiLang.tr: 'Havaalanına nasıl gidebilirim?',
          UiLang.en: 'How do I get to the airport?',
        },
      ),
      Phrase(
        id: 'th_transport_2',
        target: 'ฉันจะนั่งแท็กซี่', // TODO: native review
        gloss: {
          UiLang.tr: 'Taksiye bineceğim.',
          UiLang.en: 'I will take a taxi.',
        },
      ),
      Phrase(
        id: 'th_transport_3',
        target: 'ที่นั่งนี้มีคนนั่งไหม?', // TODO: native review
        gloss: {
          UiLang.tr: 'Bu koltuk dolu mu?',
          UiLang.en: 'Is this seat taken?',
        },
      ),
      Phrase(
        id: 'th_transport_4',
        target: 'ซื้อตั๋วได้ที่ไหน?', // TODO: native review
        gloss: {
          UiLang.tr: 'Bilet nereden alınır?',
          UiLang.en: 'Where do I buy a ticket?',
        },
      ),
      Phrase(
        id: 'th_transport_5',
        target: 'รถไฟเที่ยวต่อไปออกกี่โมง?', // TODO: native review
        gloss: {
          UiLang.tr: 'Bir sonraki tren saat kaçta kalkıyor?',
          UiLang.en: 'What time does the next train leave?',
        },
      ),
      Phrase(
        id: 'th_transport_6',
        target: 'จอดตรงนี้ด้วยค่ะ', // TODO: native review
        gloss: {
          UiLang.tr: 'Lütfen burada durun.',
          UiLang.en: 'Please stop here.',
        },
      ),
    ],
    turns: [
      SpeakTurn(
        prompt: "You're lost downtown.",
        expected: 'รถเมล์สายไหนไปใจกลางเมือง?',
      ),
      SpeakTurn(prompt: 'You ask a stranger.', expected: 'ไปสนามบินยังไง?'),
      SpeakTurn(
        prompt: 'You decide how to travel.',
        expected: 'ฉันจะนั่งแท็กซี่',
      ),
      SpeakTurn(
        prompt: 'You check an empty seat.',
        expected: 'ที่นั่งนี้มีคนนั่งไหม?',
      ),
      SpeakTurn(prompt: 'You need a ticket.', expected: 'ซื้อตั๋วได้ที่ไหน?'),
      SpeakTurn(
        prompt: "You're waiting at the platform.",
        expected: 'รถไฟเที่ยวต่อไปออกกี่โมง?',
      ),
      SpeakTurn(prompt: "You're in the taxi.", expected: 'จอดตรงนี้ด้วยค่ะ'),
    ],
  ),
  Scenario(
    id: 'th_emergency',
    lang: LearnLang.th,
    cefr: Cefr.a1,
    minutes: 7,
    titles: {UiLang.tr: 'Acil durum', UiLang.en: 'Emergency situations'},
    clipLine: 'ช่วยด้วย!',
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr:
            'Acil bir istek "ช่วย ... ด้วย" kalıbıyla sarılır — cümle '
            '"ช่วย" ile başlar, "ด้วย" ile biter.',
        UiLang.en:
            'An urgent request is wrapped in "ช่วย ... ด้วย" — it must '
            'start with ช่วย and end with ด้วย.',
      },
      goodExample: 'ช่วยเรียกตำรวจด้วย!',
      badExample: 'เรียกช่วยตำรวจด้วย!',
    ),
    phrases: [
      Phrase(
        id: 'th_emergency_0',
        target: 'ช่วยด้วย!', // TODO: native review
        ipa: 'chûai dûai',
        gloss: {UiLang.tr: 'İmdat!', UiLang.en: 'Help!'},
      ),
      Phrase(
        id: 'th_emergency_1',
        target: 'ช่วยเรียกรถพยาบาลด้วย!', // TODO: native review
        gloss: {
          UiLang.tr: 'Lütfen ambulans çağırın!',
          UiLang.en: 'Please call an ambulance!',
        },
      ),
      Phrase(
        id: 'th_emergency_2',
        target: 'ฉันทำพาสปอร์ตหาย', // TODO: native review
        gloss: {
          UiLang.tr: 'Pasaportumu kaybettim.',
          UiLang.en: 'I lost my passport.',
        },
      ),
      Phrase(
        id: 'th_emergency_3',
        target: 'ช่วยเรียกตำรวจด้วย!', // TODO: native review
        gloss: {
          UiLang.tr: 'Lütfen polisi arayın!',
          UiLang.en: 'Call the police, please!',
        },
      ),
      Phrase(
        id: 'th_emergency_4',
        target: 'โรงพยาบาลที่ใกล้ที่สุดอยู่ที่ไหน?', // TODO: native review
        gloss: {
          UiLang.tr: 'En yakın hastane nerede?',
          UiLang.en: 'Where is the nearest hospital?',
        },
      ),
      Phrase(
        id: 'th_emergency_5',
        target: 'ฉันรู้สึกไม่สบายมาก', // TODO: native review
        gloss: {
          UiLang.tr: 'Kendimi çok kötü hissediyorum.',
          UiLang.en: 'I feel very sick.',
        },
      ),
      Phrase(
        id: 'th_emergency_6',
        target: 'ได้โปรด ฉันต้องการความช่วยเหลือตอนนี้', // TODO: native review
        gloss: {
          UiLang.tr: 'Lütfen, şimdi yardıma ihtiyacım var.',
          UiLang.en: 'Please, I need help now.',
        },
      ),
    ],
    turns: [
      SpeakTurn(prompt: 'Something just happened.', expected: 'ช่วยด้วย!'),
      SpeakTurn(
        prompt: 'Someone is badly hurt.',
        expected: 'ช่วยเรียกรถพยาบาลด้วย!',
      ),
      SpeakTurn(prompt: 'You check your bag.', expected: 'ฉันทำพาสปอร์ตหาย'),
      SpeakTurn(
        prompt: 'You witness a crime.',
        expected: 'ช่วยเรียกตำรวจด้วย!',
      ),
      SpeakTurn(
        prompt: 'You need medical help.',
        expected: 'โรงพยาบาลที่ใกล้ที่สุดอยู่ที่ไหน?',
      ),
      SpeakTurn(
        prompt: 'Someone asks how you feel.',
        expected: 'ฉันรู้สึกไม่สบายมาก',
      ),
      SpeakTurn(
        prompt: 'You plead for help.',
        expected: 'ได้โปรด ฉันต้องการความช่วยเหลือตอนนี้',
      ),
    ],
  ),
  Scenario(
    id: 'th_routine',
    lang: LearnLang.th,
    cefr: Cefr.a1,
    minutes: 7,
    titles: {UiLang.tr: 'Günlük rutin', UiLang.en: 'Daily routine'},
    clipLine: 'ฉันมักจะตื่นนอนตอนหกโมง',
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr:
            'Tamamlanma bildiren "แล้ว", fiil ÖBEĞİNDEN SONRA gelir — '
            'fiilden önce konulmaz.',
        UiLang.en:
            'The completion marker "แล้ว" comes AFTER the verb phrase — '
            'never before it.',
      },
      goodExample: 'ฉันกินข้าวแล้ว',
      badExample: 'ฉันแล้วกินข้าว',
    ),
    phrases: [
      Phrase(
        id: 'th_routine_0',
        target: 'ฉันมักจะตื่นนอนตอนหกโมง', // TODO: native review
        gloss: {
          UiLang.tr: 'Genelde altıda kalkarım.',
          UiLang.en: 'I usually wake up at six.',
        },
      ),
      Phrase(
        id: 'th_routine_1',
        target: 'ฉันแปรงฟันก่อน', // TODO: native review
        gloss: {
          UiLang.tr: 'Önce dişlerimi fırçalarım.',
          UiLang.en: 'I brush my teeth first.',
        },
      ),
      Phrase(
        id: 'th_routine_2',
        target: 'ฉันกินข้าวเช้าตอนเจ็ดโมง', // TODO: native review
        gloss: {
          UiLang.tr: 'Yedide kahvaltı yaparım.',
          UiLang.en: 'I have breakfast at seven.',
        },
      ),
      Phrase(
        id: 'th_routine_3',
        target: 'ฉันไปทำงานโดยรถเมล์', // TODO: native review
        gloss: {
          UiLang.tr: 'İşe otobüsle giderim.',
          UiLang.en: 'I go to work by bus.',
        },
      ),
      Phrase(
        id: 'th_routine_4',
        target: 'ฉันมักจะกินข้าวเที่ยงตอนเที่ยง', // TODO: native review
        gloss: {
          UiLang.tr: 'Genelde öğlen yemek yerim.',
          UiLang.en: 'I usually eat lunch at noon.',
        },
      ),
      Phrase(
        id: 'th_routine_5',
        target: 'หลังอาหารเย็นฉันดูทีวี', // TODO: native review
        gloss: {
          UiLang.tr: 'Akşam yemeğinden sonra televizyon izlerim.',
          UiLang.en: 'After dinner I watch TV.',
        },
      ),
      Phrase(
        id: 'th_routine_6',
        target: 'ฉันเข้านอนตอนห้าทุ่ม', // TODO: native review
        gloss: {
          UiLang.tr: 'On birde yatarım.',
          UiLang.en: 'I go to bed at eleven.',
        },
        hint: '23:00 Thai saat sisteminde "ห้าทุ่ม" (akşamın 5. saati).',
      ),
    ],
    turns: [
      SpeakTurn(
        prompt: 'Someone asks about your morning.',
        expected: 'ฉันมักจะตื่นนอนตอนหกโมง',
      ),
      SpeakTurn(prompt: 'You describe your habit.', expected: 'ฉันแปรงฟันก่อน'),
      SpeakTurn(
        prompt: 'You continue the routine.',
        expected: 'ฉันกินข้าวเช้าตอนเจ็ดโมง',
      ),
      SpeakTurn(
        prompt: 'They ask how you commute.',
        expected: 'ฉันไปทำงานโดยรถเมล์',
      ),
      SpeakTurn(
        prompt: 'They ask about lunch.',
        expected: 'ฉันมักจะกินข้าวเที่ยงตอนเที่ยง',
      ),
      SpeakTurn(
        prompt: 'They ask about the evening.',
        expected: 'หลังอาหารเย็นฉันดูทีวี',
      ),
      SpeakTurn(
        prompt: 'They ask when you sleep.',
        expected: 'ฉันเข้านอนตอนห้าทุ่ม',
      ),
    ],
  ),
  Scenario(
    id: 'th_past_story',
    lang: LearnLang.th,
    cefr: Cefr.a1,
    minutes: 7,
    titles: {
      UiLang.tr: 'Geçmişte bir gün',
      UiLang.en: 'Telling a story in the past',
    },
    clipLine: 'เมื่อวานฉันไปตลาด',
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr:
            'Tay fiilleri zamana göre çekimlenmez — "เมื่อวาน" (dün) gibi '
            'zaman sözcükleri geçmiş anlamını taşır.',
        UiLang.en:
            'Thai verbs never conjugate for tense — time words like '
            '"เมื่อวาน" (yesterday) carry the past meaning instead.',
      },
      goodExample: 'เมื่อวานฉันไปตลาด',
      badExample: 'เมื่อวานฉันจะไปตลาด',
    ),
    phrases: [
      Phrase(
        id: 'th_past_story_0',
        target: 'เมื่อวานฉันไปตลาด', // TODO: native review
        gloss: {
          UiLang.tr: 'Dün pazara gittim.',
          UiLang.en: 'Yesterday I went to the market.',
        },
      ),
      Phrase(
        id: 'th_past_story_1',
        target: 'ฉันซื้อผัก', // TODO: native review
        gloss: {
          UiLang.tr: 'Biraz sebze aldım.',
          UiLang.en: 'I bought some vegetables.',
        },
      ),
      Phrase(
        id: 'th_past_story_2',
        target: 'แล้วฉันก็เจอเพื่อน', // TODO: native review
        gloss: {
          UiLang.tr: 'Sonra arkadaşımla buluştum.',
          UiLang.en: 'Then I met my friend.',
        },
      ),
      Phrase(
        id: 'th_past_story_3',
        target: 'เราดื่มกาแฟด้วยกัน', // TODO: native review
        gloss: {
          UiLang.tr: 'Birlikte kahve içtik.',
          UiLang.en: 'We drank coffee together.',
        },
      ),
      Phrase(
        id: 'th_past_story_4',
        target: 'หลังจากนั้นฉันก็กลับบ้าน', // TODO: native review
        gloss: {
          UiLang.tr: 'Ondan sonra eve gittim.',
          UiLang.en: 'After that I went home.',
        },
      ),
      Phrase(
        id: 'th_past_story_5',
        target: 'ฉันทำอาหารเย็น', // TODO: native review
        gloss: {
          UiLang.tr: 'Akşam yemeği pişirdim.',
          UiLang.en: 'I cooked dinner.',
        },
      ),
      Phrase(
        id: 'th_past_story_6',
        target: 'เป็นวันที่ดีมาก', // TODO: native review
        gloss: {UiLang.tr: 'Güzel bir gündü.', UiLang.en: 'It was a good day.'},
      ),
    ],
    turns: [
      SpeakTurn(
        prompt: 'You start telling a story.',
        expected: 'เมื่อวานฉันไปตลาด',
      ),
      SpeakTurn(prompt: 'You continue.', expected: 'ฉันซื้อผัก'),
      SpeakTurn(prompt: 'You continue.', expected: 'แล้วฉันก็เจอเพื่อน'),
      SpeakTurn(prompt: 'You continue.', expected: 'เราดื่มกาแฟด้วยกัน'),
      SpeakTurn(prompt: 'You continue.', expected: 'หลังจากนั้นฉันก็กลับบ้าน'),
      SpeakTurn(prompt: 'You continue.', expected: 'ฉันทำอาหารเย็น'),
      SpeakTurn(prompt: 'You finish the story.', expected: 'เป็นวันที่ดีมาก'),
    ],
  ),

  // ===================== VIETNAMESE (vi) =====================
  Scenario(
    id: 'vi_intro',
    lang: LearnLang.vi,
    cefr: Cefr.a1,
    minutes: 7,
    titles: {UiLang.tr: 'Tanışma', UiLang.en: 'Getting to know someone'},
    clipLine: 'Xin chào, rất vui được gặp bạn.',
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr:
            'Vietnamcada "sen/siz" için tek bir zamir yoktur — yaşça/ilişki '
            'olarak belirsiz durumlarda yabancılarla "tôi" (ben) / "bạn" '
            '(sen) çifti güvenli ve nötr seçimdir.',
        UiLang.en:
            'Vietnamese has no single word for "you" — for strangers or '
            'unclear age/relationship, "tôi" (I) / "bạn" (you) is the safe, '
            'neutral pair.',
      },
      goodExample: 'Tôi tên là Lan. Bạn tên là gì?',
      badExample: 'Tôi tên là Lan. Mày tên là gì?',
    ),
    phrases: [
      Phrase(
        id: 'vi_intro_0',
        target: 'Xin chào, rất vui được gặp bạn.', // TODO: native review
        ipa: 'sin càːw',
        gloss: {
          UiLang.tr: 'Merhaba, tanıştığımıza memnun oldum.',
          UiLang.en: 'Hello, nice to meet you.',
        },
      ),
      Phrase(
        id: 'vi_intro_1',
        target: 'Tôi tên là Ayşe, bạn tên là gì?', // TODO: native review
        gloss: {
          UiLang.tr: 'Benim adım Ayşe, senin adın ne?',
          UiLang.en: "My name is Ayşe, what's your name?",
        },
      ),
      Phrase(
        id: 'vi_intro_2',
        target: 'Tôi là giáo viên. Bạn làm nghề gì?', // TODO: native review
        gloss: {
          UiLang.tr: 'Ben öğretmenim. Sen ne iş yapıyorsun?',
          UiLang.en: 'I am a teacher. What do you do?',
        },
      ),
      Phrase(
        id: 'vi_intro_3',
        target: 'Bạn bao nhiêu tuổi?', // TODO: native review
        gloss: {UiLang.tr: 'Kaç yaşındasın?', UiLang.en: 'How old are you?'},
      ),
      Phrase(
        id: 'vi_intro_4',
        target: 'Tôi ba mươi tuổi.', // TODO: native review
        gloss: {
          UiLang.tr: 'Otuz yaşındayım.',
          UiLang.en: 'I am thirty years old.',
        },
      ),
      Phrase(
        id: 'vi_intro_5',
        target: 'Bạn có số điện thoại không?', // TODO: native review
        gloss: {
          UiLang.tr: 'Telefon numaran var mı?',
          UiLang.en: 'Do you have a phone number?',
        },
      ),
      Phrase(
        id: 'vi_intro_6',
        target: 'Đây là số của tôi, hẹn gặp lại nhé!', // TODO: native review
        gloss: {
          UiLang.tr: 'İşte numaram, sonra görüşürüz!',
          UiLang.en: 'Here is my number, see you later!',
        },
      ),
    ],
    turns: [
      SpeakTurn(
        prompt: 'Someone greets you.',
        expected: 'Xin chào, rất vui được gặp bạn.',
      ),
      SpeakTurn(
        prompt: 'They ask your name.',
        expected: 'Tôi tên là Ayşe, bạn tên là gì?',
      ),
      SpeakTurn(
        prompt: 'They ask what you do.',
        expected: 'Tôi là giáo viên. Bạn làm nghề gì?',
      ),
      SpeakTurn(prompt: 'They ask your age.', expected: 'Bạn bao nhiêu tuổi?'),
      SpeakTurn(prompt: 'You answer.', expected: 'Tôi ba mươi tuổi.'),
      SpeakTurn(
        prompt: 'They ask for your number.',
        expected: 'Bạn có số điện thoại không?',
      ),
      SpeakTurn(
        prompt: 'You hand it over and say goodbye.',
        expected: 'Đây là số của tôi, hẹn gặp lại nhé!',
      ),
    ],
  ),
  Scenario(
    id: 'vi_shopping',
    lang: LearnLang.vi,
    cefr: Cefr.a1,
    minutes: 7,
    titles: {UiLang.tr: 'Alışveriş', UiLang.en: 'Shopping for clothes'},
    clipLine: 'Xin lỗi, cái áo này bao nhiêu tiền?',
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr:
            'Nesne sayılırken sınıflayıcı "cái", sayı ile isim ARASINA girer.',
        UiLang.en:
            'The classifier "cái" goes between the number and the noun for '
            'inanimate objects.',
      },
      goodExample: 'hai cái áo',
      badExample: 'hai áo',
    ),
    phrases: [
      Phrase(
        id: 'vi_shopping_0',
        target: 'Xin lỗi, cái áo này bao nhiêu tiền?', // TODO: native review
        gloss: {
          UiLang.tr: 'Affedersiniz, bu gömlek ne kadar?',
          UiLang.en: 'Excuse me, how much is this shirt?',
        },
      ),
      Phrase(
        id: 'vi_shopping_1',
        target: 'Có size nhỏ hơn không?', // TODO: native review
        gloss: {
          UiLang.tr: 'Daha küçük beden var mı?',
          UiLang.en: 'Do you have a smaller size?',
        },
      ),
      Phrase(
        id: 'vi_shopping_2',
        target: 'Tôi mặc thử được không?', // TODO: native review
        gloss: {UiLang.tr: 'Deneyebilir miyim?', UiLang.en: 'Can I try it on?'},
      ),
      Phrase(
        id: 'vi_shopping_3',
        target: 'Phòng thử đồ ở đâu?', // TODO: native review
        gloss: {
          UiLang.tr: 'Deneme kabini nerede?',
          UiLang.en: 'Where is the fitting room?',
        },
      ),
      Phrase(
        id: 'vi_shopping_4',
        target: 'Tôi lấy cái này.', // TODO: native review
        gloss: {UiLang.tr: 'Bunu alacağım.', UiLang.en: "I'll take this one."},
      ),
      Phrase(
        id: 'vi_shopping_5',
        target: 'Ở đây có nhận thẻ tín dụng không?', // TODO: native review
        gloss: {
          UiLang.tr: 'Kredi kartı geçiyor mu?',
          UiLang.en: 'Do you accept credit cards?',
        },
      ),
      Phrase(
        id: 'vi_shopping_6',
        target: 'Cho tôi xin một cái túi.', // TODO: native review
        gloss: {
          UiLang.tr: 'Bir poşet alabilir miyim?',
          UiLang.en: 'Can I get a bag, please?',
        },
      ),
    ],
    turns: [
      SpeakTurn(
        prompt: 'You see a shirt you like.',
        expected: 'Xin lỗi, cái áo này bao nhiêu tiền?',
      ),
      SpeakTurn(prompt: "It's too big.", expected: 'Có size nhỏ hơn không?'),
      SpeakTurn(
        prompt: 'You want to try it.',
        expected: 'Tôi mặc thử được không?',
      ),
      SpeakTurn(
        prompt: 'You look for a place to change.',
        expected: 'Phòng thử đồ ở đâu?',
      ),
      SpeakTurn(prompt: 'You decide to buy it.', expected: 'Tôi lấy cái này.'),
      SpeakTurn(
        prompt: "You're ready to pay.",
        expected: 'Ở đây có nhận thẻ tín dụng không?',
      ),
      SpeakTurn(
        prompt: 'You need to carry it home.',
        expected: 'Cho tôi xin một cái túi.',
      ),
    ],
  ),
  Scenario(
    id: 'vi_numbers_time',
    lang: LearnLang.vi,
    cefr: Cefr.a1,
    minutes: 7,
    titles: {
      UiLang.tr: 'Sayılar ve saat',
      UiLang.en: 'Numbers and telling time',
    },
    clipLine: 'Bây giờ là mấy giờ?',
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr:
            '"Buçuk/yarım" anlamındaki "rưỡi", "giờ" kelimesinden SONRA '
            'gelir — İngilizce "half past" kalıbının tersi.',
        UiLang.en:
            '"rưỡi" (half) comes AFTER "giờ" (o\'clock) — the reverse of '
            'the English "half past" order.',
      },
      goodExample: 'Bây giờ là ba giờ rưỡi.',
      badExample: 'Bây giờ là rưỡi ba giờ.',
    ),
    phrases: [
      Phrase(
        id: 'vi_numbers_time_0',
        target: 'Bây giờ là mấy giờ?', // TODO: native review
        gloss: {
          UiLang.tr: 'Şu an saat kaç?',
          UiLang.en: 'What time is it now?',
        },
      ),
      Phrase(
        id: 'vi_numbers_time_1',
        target: 'Bây giờ là ba giờ.', // TODO: native review
        gloss: {UiLang.tr: 'Saat üç.', UiLang.en: "It's three o'clock."},
      ),
      Phrase(
        id: 'vi_numbers_time_2',
        target: 'Tàu chạy lúc mấy giờ?', // TODO: native review
        gloss: {
          UiLang.tr: 'Tren saat kaçta kalkıyor?',
          UiLang.en: 'What time does the train leave?',
        },
      ),
      Phrase(
        id: 'vi_numbers_time_3',
        target: 'Tàu chạy lúc bốn giờ rưỡi.', // TODO: native review
        gloss: {
          UiLang.tr: 'Dört buçukta kalkıyor.',
          UiLang.en: 'It leaves at half past four.',
        },
      ),
      Phrase(
        id: 'vi_numbers_time_4',
        target: 'Tôi có cuộc họp lúc mười giờ sáng.', // TODO: native review
        gloss: {
          UiLang.tr: 'Sabah saat onda toplantım var.',
          UiLang.en: 'I have a meeting at ten in the morning.',
        },
      ),
      Phrase(
        id: 'vi_numbers_time_5',
        target: 'Hẹn gặp lúc bảy giờ tối nhé.', // TODO: native review
        gloss: {
          UiLang.tr: 'Akşam yedide görüşürüz.',
          UiLang.en: 'See you at seven in the evening.',
        },
      ),
      Phrase(
        id: 'vi_numbers_time_6',
        target: 'Hôm nay là ngày mấy?', // TODO: native review
        gloss: {
          UiLang.tr: 'Bugünün tarihi kaç?',
          UiLang.en: "What is today's date?",
        },
      ),
    ],
    turns: [
      SpeakTurn(
        prompt: 'You want to know the time.',
        expected: 'Bây giờ là mấy giờ?',
      ),
      SpeakTurn(prompt: 'Someone answers.', expected: 'Bây giờ là ba giờ.'),
      SpeakTurn(
        prompt: "You're at the station.",
        expected: 'Tàu chạy lúc mấy giờ?',
      ),
      SpeakTurn(
        prompt: 'The clerk answers.',
        expected: 'Tàu chạy lúc bốn giờ rưỡi.',
      ),
      SpeakTurn(
        prompt: 'You mention your schedule.',
        expected: 'Tôi có cuộc họp lúc mười giờ sáng.',
      ),
      SpeakTurn(
        prompt: 'You arrange to meet.',
        expected: 'Hẹn gặp lúc bảy giờ tối nhé.',
      ),
      SpeakTurn(
        prompt: "You want today's date.",
        expected: 'Hôm nay là ngày mấy?',
      ),
    ],
  ),
  Scenario(
    id: 'vi_family',
    lang: LearnLang.vi,
    cefr: Cefr.a1,
    minutes: 7,
    titles: {UiLang.tr: 'Aile', UiLang.en: 'Talking about family'},
    clipLine: 'Đây là mẹ của tôi.',
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr:
            'İyelik "của" ile isimden SONRA belirtilir — İngilizce "my" '
            'gibi isimden önce gelmez.',
        UiLang.en:
            'Possession is marked with "của" placed AFTER the noun — not '
            'before it like English "my".',
      },
      goodExample: 'em trai của tôi',
      badExample: 'của tôi em trai',
    ),
    phrases: [
      Phrase(
        id: 'vi_family_0',
        target: 'Đây là mẹ của tôi.', // TODO: native review
        gloss: {UiLang.tr: 'Bu benim annem.', UiLang.en: 'This is my mother.'},
      ),
      Phrase(
        id: 'vi_family_1',
        target: 'Đây là bố của tôi.', // TODO: native review
        gloss: {UiLang.tr: 'Bu benim babam.', UiLang.en: 'This is my father.'},
      ),
      Phrase(
        id: 'vi_family_2',
        target: 'Tôi có hai anh chị em.', // TODO: native review
        gloss: {
          UiLang.tr: 'İki kardeşim var.',
          UiLang.en: 'I have two siblings.',
        },
      ),
      Phrase(
        id: 'vi_family_3',
        target: 'Đây là em trai của tôi.', // TODO: native review
        gloss: {
          UiLang.tr: 'Bu benim küçük erkek kardeşim.',
          UiLang.en: 'This is my younger brother.',
        },
      ),
      Phrase(
        id: 'vi_family_4',
        target: 'Đây là chị gái của tôi.', // TODO: native review
        gloss: {
          UiLang.tr: 'Bu benim büyük ablam.',
          UiLang.en: 'This is my older sister.',
        },
      ),
      Phrase(
        id: 'vi_family_5',
        target: 'Cô ấy là vợ của bạn phải không?', // TODO: native review
        gloss: {UiLang.tr: 'O senin eşin mi?', UiLang.en: 'Is she your wife?'},
      ),
      Phrase(
        id: 'vi_family_6',
        target: 'Con trai tôi năm tuổi.', // TODO: native review
        gloss: {
          UiLang.tr: 'Oğlum beş yaşında.',
          UiLang.en: 'My son is five years old.',
        },
      ),
    ],
    turns: [
      SpeakTurn(prompt: 'You show a photo.', expected: 'Đây là mẹ của tôi.'),
      SpeakTurn(
        prompt: 'You point to another person.',
        expected: 'Đây là bố của tôi.',
      ),
      SpeakTurn(
        prompt: 'Someone asks about siblings.',
        expected: 'Tôi có hai anh chị em.',
      ),
      SpeakTurn(
        prompt: 'You introduce him.',
        expected: 'Đây là em trai của tôi.',
      ),
      SpeakTurn(
        prompt: 'You introduce her.',
        expected: 'Đây là chị gái của tôi.',
      ),
      SpeakTurn(
        prompt: 'Someone asks about her.',
        expected: 'Cô ấy là vợ của bạn phải không?',
      ),
      SpeakTurn(
        prompt: 'Someone asks about your son.',
        expected: 'Con trai tôi năm tuổi.',
      ),
    ],
  ),
  Scenario(
    id: 'vi_weather',
    lang: LearnLang.vi,
    cefr: Cefr.a1,
    minutes: 7,
    titles: {UiLang.tr: 'Hava durumu', UiLang.en: 'Talking about the weather'},
    clipLine: 'Hôm nay thời tiết thế nào?',
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr:
            '"Trời" (gökyüzü/hava) öznesinden sonra sıfat doğrudan gelir — '
            'sıfattan önce "là" ("olmak") konmaz.',
        UiLang.en:
            'After the dummy subject "trời" (sky/weather), the adjective '
            'follows directly — never insert "là" ("to be") before it.',
      },
      goodExample: 'Hôm nay trời nóng.',
      badExample: 'Hôm nay trời là nóng.',
    ),
    phrases: [
      Phrase(
        id: 'vi_weather_0',
        target: 'Hôm nay thời tiết thế nào?', // TODO: native review
        gloss: {
          UiLang.tr: 'Bugün hava nasıl?',
          UiLang.en: "What's the weather like today?",
        },
      ),
      Phrase(
        id: 'vi_weather_1',
        target: 'Hôm nay trời nóng lắm.', // TODO: native review
        gloss: {
          UiLang.tr: 'Bugün çok sıcak.',
          UiLang.en: "It's very hot today.",
        },
      ),
      Phrase(
        id: 'vi_weather_2',
        target: 'Bên ngoài trời đang mưa.', // TODO: native review
        gloss: {
          UiLang.tr: 'Dışarıda yağmur yağıyor.',
          UiLang.en: "It's raining outside.",
        },
      ),
      Phrase(
        id: 'vi_weather_3',
        target: 'Trời lạnh, mang áo khoác theo nhé.', // TODO: native review
        gloss: {
          UiLang.tr: 'Hava soğuk, ceket al.',
          UiLang.en: "It's cold, take a jacket.",
        },
      ),
      Phrase(
        id: 'vi_weather_4',
        target: 'Ngày mai trời sẽ nắng.', // TODO: native review
        gloss: {
          UiLang.tr: 'Yarın güneşli olacak.',
          UiLang.en: 'Tomorrow it will be sunny.',
        },
      ),
      Phrase(
        id: 'vi_weather_5',
        target: 'Gió thổi mạnh lắm.', // TODO: native review
        gloss: {UiLang.tr: 'Çok rüzgar var.', UiLang.en: "It's very windy."},
      ),
      Phrase(
        id: 'vi_weather_6',
        target: 'Tôi thích mùa đông hơn mùa hè.', // TODO: native review
        gloss: {
          UiLang.tr: 'Yazdan çok kışı severim.',
          UiLang.en: 'I like winter more than summer.',
        },
      ),
    ],
    turns: [
      SpeakTurn(
        prompt: 'You start small talk.',
        expected: 'Hôm nay thời tiết thế nào?',
      ),
      SpeakTurn(
        prompt: 'You comment on the heat.',
        expected: 'Hôm nay trời nóng lắm.',
      ),
      SpeakTurn(
        prompt: 'You look outside.',
        expected: 'Bên ngoài trời đang mưa.',
      ),
      SpeakTurn(
        prompt: 'You warn a friend.',
        expected: 'Trời lạnh, mang áo khoác theo nhé.',
      ),
      SpeakTurn(
        prompt: 'You check the forecast.',
        expected: 'Ngày mai trời sẽ nắng.',
      ),
      SpeakTurn(prompt: 'You feel the wind.', expected: 'Gió thổi mạnh lắm.'),
      SpeakTurn(
        prompt: 'You share your preference.',
        expected: 'Tôi thích mùa đông hơn mùa hè.',
      ),
    ],
  ),
  Scenario(
    id: 'vi_transport',
    lang: LearnLang.vi,
    cefr: Cefr.a1,
    minutes: 7,
    titles: {UiLang.tr: 'Ulaşım', UiLang.en: 'Getting around'},
    clipLine: 'Xe buýt nào đi trung tâm thành phố?',
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr:
            'Gelecek zaman belirteci "sẽ", doğrudan ana fiilin ÖNÜNE gelir.',
        UiLang.en: 'The future marker "sẽ" goes directly BEFORE the main verb.',
      },
      goodExample: 'Tôi sẽ đi bằng taxi.',
      badExample: 'Tôi đi sẽ bằng taxi.',
    ),
    phrases: [
      Phrase(
        id: 'vi_transport_0',
        target: 'Xe buýt nào đi trung tâm thành phố?', // TODO: native review
        gloss: {
          UiLang.tr: 'Şehir merkezine hangi otobüs gidiyor?',
          UiLang.en: 'Which bus goes to the city center?',
        },
      ),
      Phrase(
        id: 'vi_transport_1',
        target: 'Làm sao để đến sân bay?', // TODO: native review
        gloss: {
          UiLang.tr: 'Havaalanına nasıl gidebilirim?',
          UiLang.en: 'How do I get to the airport?',
        },
      ),
      Phrase(
        id: 'vi_transport_2',
        target: 'Tôi sẽ đi bằng taxi.', // TODO: native review
        gloss: {
          UiLang.tr: 'Taksiyle gideceğim.',
          UiLang.en: 'I will go by taxi.',
        },
      ),
      Phrase(
        id: 'vi_transport_3',
        target: 'Chỗ này có ai ngồi chưa?', // TODO: native review
        gloss: {
          UiLang.tr: 'Bu koltuk dolu mu?',
          UiLang.en: 'Is this seat taken?',
        },
      ),
      Phrase(
        id: 'vi_transport_4',
        target: 'Mua vé ở đâu?', // TODO: native review
        gloss: {
          UiLang.tr: 'Bilet nereden alınır?',
          UiLang.en: 'Where do I buy a ticket?',
        },
      ),
      Phrase(
        id: 'vi_transport_5',
        target: 'Chuyến tàu tiếp theo chạy lúc mấy giờ?', // TODO: native review
        gloss: {
          UiLang.tr: 'Bir sonraki tren saat kaçta kalkıyor?',
          UiLang.en: 'What time does the next train leave?',
        },
      ),
      Phrase(
        id: 'vi_transport_6',
        target: 'Làm ơn dừng ở đây.', // TODO: native review
        gloss: {
          UiLang.tr: 'Lütfen burada durun.',
          UiLang.en: 'Please stop here.',
        },
      ),
    ],
    turns: [
      SpeakTurn(
        prompt: "You're lost downtown.",
        expected: 'Xe buýt nào đi trung tâm thành phố?',
      ),
      SpeakTurn(
        prompt: 'You ask a stranger.',
        expected: 'Làm sao để đến sân bay?',
      ),
      SpeakTurn(
        prompt: 'You decide how to travel.',
        expected: 'Tôi sẽ đi bằng taxi.',
      ),
      SpeakTurn(
        prompt: 'You check an empty seat.',
        expected: 'Chỗ này có ai ngồi chưa?',
      ),
      SpeakTurn(prompt: 'You need a ticket.', expected: 'Mua vé ở đâu?'),
      SpeakTurn(
        prompt: "You're waiting at the platform.",
        expected: 'Chuyến tàu tiếp theo chạy lúc mấy giờ?',
      ),
      SpeakTurn(prompt: "You're in the taxi.", expected: 'Làm ơn dừng ở đây.'),
    ],
  ),
  Scenario(
    id: 'vi_emergency',
    lang: LearnLang.vi,
    cefr: Cefr.a1,
    minutes: 7,
    titles: {UiLang.tr: 'Acil durum', UiLang.en: 'Emergency situations'},
    clipLine: 'Cứu tôi với!',
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr:
            'Kibarlık işareti "làm ơn" (lütfen), istek fiilinin ÖNÜNE gelir.',
        UiLang.en:
            'The politeness marker "làm ơn" (please) comes BEFORE the '
            'request verb.',
      },
      goodExample: 'Làm ơn gọi xe cấp cứu!',
      badExample: 'Gọi làm ơn xe cấp cứu!',
    ),
    phrases: [
      Phrase(
        id: 'vi_emergency_0',
        target: 'Cứu tôi với!', // TODO: native review
        ipa: 'kɨ́u toj vəːj',
        gloss: {UiLang.tr: 'İmdat!', UiLang.en: 'Help!'},
      ),
      Phrase(
        id: 'vi_emergency_1',
        target: 'Làm ơn gọi xe cấp cứu!', // TODO: native review
        gloss: {
          UiLang.tr: 'Lütfen ambulans çağırın!',
          UiLang.en: 'Please call an ambulance!',
        },
      ),
      Phrase(
        id: 'vi_emergency_2',
        target: 'Tôi bị mất hộ chiếu.', // TODO: native review
        gloss: {
          UiLang.tr: 'Pasaportumu kaybettim.',
          UiLang.en: 'I lost my passport.',
        },
      ),
      Phrase(
        id: 'vi_emergency_3',
        target: 'Làm ơn gọi cảnh sát!', // TODO: native review
        gloss: {
          UiLang.tr: 'Lütfen polisi arayın!',
          UiLang.en: 'Call the police, please!',
        },
      ),
      Phrase(
        id: 'vi_emergency_4',
        target: 'Bệnh viện gần nhất ở đâu?', // TODO: native review
        gloss: {
          UiLang.tr: 'En yakın hastane nerede?',
          UiLang.en: 'Where is the nearest hospital?',
        },
      ),
      Phrase(
        id: 'vi_emergency_5',
        target: 'Tôi cảm thấy rất khó chịu trong người.', // TODO: native review
        gloss: {
          UiLang.tr: 'Kendimi çok kötü hissediyorum.',
          UiLang.en: 'I feel very sick.',
        },
      ),
      Phrase(
        id: 'vi_emergency_6',
        target: 'Làm ơn, tôi cần giúp đỡ ngay bây giờ.', // TODO: native review
        gloss: {
          UiLang.tr: 'Lütfen, şimdi yardıma ihtiyacım var.',
          UiLang.en: 'Please, I need help now.',
        },
      ),
    ],
    turns: [
      SpeakTurn(prompt: 'Something just happened.', expected: 'Cứu tôi với!'),
      SpeakTurn(
        prompt: 'Someone is badly hurt.',
        expected: 'Làm ơn gọi xe cấp cứu!',
      ),
      SpeakTurn(
        prompt: 'You check your bag.',
        expected: 'Tôi bị mất hộ chiếu.',
      ),
      SpeakTurn(
        prompt: 'You witness a crime.',
        expected: 'Làm ơn gọi cảnh sát!',
      ),
      SpeakTurn(
        prompt: 'You need medical help.',
        expected: 'Bệnh viện gần nhất ở đâu?',
      ),
      SpeakTurn(
        prompt: 'Someone asks how you feel.',
        expected: 'Tôi cảm thấy rất khó chịu trong người.',
      ),
      SpeakTurn(
        prompt: 'You plead for help.',
        expected: 'Làm ơn, tôi cần giúp đỡ ngay bây giờ.',
      ),
    ],
  ),
  Scenario(
    id: 'vi_routine',
    lang: LearnLang.vi,
    cefr: Cefr.a1,
    minutes: 7,
    titles: {UiLang.tr: 'Günlük rutin', UiLang.en: 'Daily routine'},
    clipLine: 'Tôi thường dậy lúc sáu giờ.',
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr: 'Alışkanlık zarfı "thường" (genelde), fiilin ÖNÜNE gelir.',
        UiLang.en:
            'The habitual adverb "thường" (usually) is placed BEFORE the '
            'verb.',
      },
      goodExample: 'Tôi thường dậy lúc sáu giờ.',
      badExample: 'Tôi dậy thường lúc sáu giờ.',
    ),
    phrases: [
      Phrase(
        id: 'vi_routine_0',
        target: 'Tôi thường dậy lúc sáu giờ.', // TODO: native review
        gloss: {
          UiLang.tr: 'Genelde altıda kalkarım.',
          UiLang.en: 'I usually wake up at six.',
        },
      ),
      Phrase(
        id: 'vi_routine_1',
        target: 'Tôi đánh răng trước.', // TODO: native review
        gloss: {
          UiLang.tr: 'Önce dişlerimi fırçalarım.',
          UiLang.en: 'I brush my teeth first.',
        },
      ),
      Phrase(
        id: 'vi_routine_2',
        target: 'Tôi ăn sáng lúc bảy giờ.', // TODO: native review
        gloss: {
          UiLang.tr: 'Yedide kahvaltı yaparım.',
          UiLang.en: 'I have breakfast at seven.',
        },
      ),
      Phrase(
        id: 'vi_routine_3',
        target: 'Tôi đi làm bằng xe buýt.', // TODO: native review
        gloss: {
          UiLang.tr: 'İşe otobüsle giderim.',
          UiLang.en: 'I go to work by bus.',
        },
      ),
      Phrase(
        id: 'vi_routine_4',
        target: 'Tôi thường ăn trưa lúc giữa trưa.', // TODO: native review
        gloss: {
          UiLang.tr: 'Genelde öğlen yemek yerim.',
          UiLang.en: 'I usually eat lunch at noon.',
        },
      ),
      Phrase(
        id: 'vi_routine_5',
        target: 'Sau bữa tối tôi xem TV.', // TODO: native review
        gloss: {
          UiLang.tr: 'Akşam yemeğinden sonra televizyon izlerim.',
          UiLang.en: 'After dinner I watch TV.',
        },
      ),
      Phrase(
        id: 'vi_routine_6',
        target: 'Tôi đi ngủ lúc mười một giờ.', // TODO: native review
        gloss: {
          UiLang.tr: 'On birde yatarım.',
          UiLang.en: 'I go to bed at eleven.',
        },
      ),
    ],
    turns: [
      SpeakTurn(
        prompt: 'Someone asks about your morning.',
        expected: 'Tôi thường dậy lúc sáu giờ.',
      ),
      SpeakTurn(
        prompt: 'You describe your habit.',
        expected: 'Tôi đánh răng trước.',
      ),
      SpeakTurn(
        prompt: 'You continue the routine.',
        expected: 'Tôi ăn sáng lúc bảy giờ.',
      ),
      SpeakTurn(
        prompt: 'They ask how you commute.',
        expected: 'Tôi đi làm bằng xe buýt.',
      ),
      SpeakTurn(
        prompt: 'They ask about lunch.',
        expected: 'Tôi thường ăn trưa lúc giữa trưa.',
      ),
      SpeakTurn(
        prompt: 'They ask about the evening.',
        expected: 'Sau bữa tối tôi xem TV.',
      ),
      SpeakTurn(
        prompt: 'They ask when you sleep.',
        expected: 'Tôi đi ngủ lúc mười một giờ.',
      ),
    ],
  ),
  Scenario(
    id: 'vi_past_story',
    lang: LearnLang.vi,
    cefr: Cefr.a1,
    minutes: 7,
    titles: {
      UiLang.tr: 'Geçmişte bir gün',
      UiLang.en: 'Telling a story in the past',
    },
    clipLine: 'Hôm qua tôi đã đi chợ.',
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr:
            'Tamamlanmış geçmişi belirten "đã", doğrudan fiilin ÖNÜNE gelir.',
        UiLang.en:
            'The past marker "đã" goes directly BEFORE the verb to mark a '
            'completed action.',
      },
      goodExample: 'Hôm qua tôi đã đi chợ.',
      badExample: 'Hôm qua tôi đi đã chợ.',
    ),
    phrases: [
      Phrase(
        id: 'vi_past_story_0',
        target: 'Hôm qua tôi đã đi chợ.', // TODO: native review
        gloss: {
          UiLang.tr: 'Dün pazara gittim.',
          UiLang.en: 'Yesterday I went to the market.',
        },
      ),
      Phrase(
        id: 'vi_past_story_1',
        target: 'Tôi đã mua ít rau.', // TODO: native review
        gloss: {
          UiLang.tr: 'Biraz sebze aldım.',
          UiLang.en: 'I bought some vegetables.',
        },
      ),
      Phrase(
        id: 'vi_past_story_2',
        target: 'Sau đó tôi đã gặp bạn tôi.', // TODO: native review
        gloss: {
          UiLang.tr: 'Sonra arkadaşımla buluştum.',
          UiLang.en: 'Then I met my friend.',
        },
      ),
      Phrase(
        id: 'vi_past_story_3',
        target: 'Chúng tôi đã uống cà phê cùng nhau.', // TODO: native review
        gloss: {
          UiLang.tr: 'Birlikte kahve içtik.',
          UiLang.en: 'We drank coffee together.',
        },
      ),
      Phrase(
        id: 'vi_past_story_4',
        target: 'Sau đó tôi đã về nhà.', // TODO: native review
        gloss: {
          UiLang.tr: 'Ondan sonra eve gittim.',
          UiLang.en: 'After that I went home.',
        },
      ),
      Phrase(
        id: 'vi_past_story_5',
        target: 'Tôi đã nấu bữa tối.', // TODO: native review
        gloss: {
          UiLang.tr: 'Akşam yemeği pişirdim.',
          UiLang.en: 'I cooked dinner.',
        },
      ),
      Phrase(
        id: 'vi_past_story_6',
        target: 'Đó là một ngày tốt lành.', // TODO: native review
        gloss: {UiLang.tr: 'Güzel bir gündü.', UiLang.en: 'It was a good day.'},
      ),
    ],
    turns: [
      SpeakTurn(
        prompt: 'You start telling a story.',
        expected: 'Hôm qua tôi đã đi chợ.',
      ),
      SpeakTurn(prompt: 'You continue.', expected: 'Tôi đã mua ít rau.'),
      SpeakTurn(
        prompt: 'You continue.',
        expected: 'Sau đó tôi đã gặp bạn tôi.',
      ),
      SpeakTurn(
        prompt: 'You continue.',
        expected: 'Chúng tôi đã uống cà phê cùng nhau.',
      ),
      SpeakTurn(prompt: 'You continue.', expected: 'Sau đó tôi đã về nhà.'),
      SpeakTurn(prompt: 'You continue.', expected: 'Tôi đã nấu bữa tối.'),
      SpeakTurn(
        prompt: 'You finish the story.',
        expected: 'Đó là một ngày tốt lành.',
      ),
    ],
  ),
];
