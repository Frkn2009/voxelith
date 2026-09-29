// GENERATED — content batch K: ID / SW / HU, 9 missing A1 topics each.
// See docs/ICERIK_URETIM_BRIEFI.md for schema/tone rules. Not wired into
// Catalog yet — integration (import + _all list) happens centrally once all
// batches are delivered.
// ignore_for_file: lines_longer_than_80_chars

import '../../models/models.dart';

final List<Scenario> catalogExtraBatchK = [
  // ===================== INDONESIAN =====================
  Scenario(
    id: 'id_intro',
    lang: LearnLang.id,
    cefr: Cefr.a1,
    minutes: 7,
    titles: {UiLang.tr: 'Tanışma', UiLang.en: 'Meeting someone'},
    clipLine: 'Kenalin, nama saya Budi.',
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr:
            '"Boleh" nazik bir istekte fiilden önce, cümlenin en başına gelir.',
        UiLang.en:
            '"Boleh" (may/can) goes at the very start of a polite request, before the verb.',
      },
      goodExample: 'Boleh minta nomor WhatsApp-mu?',
      badExample: 'Minta boleh nomor WhatsApp-mu?',
    ),
    phrases: [
      Phrase(
        id: 'id_intro_0',
        target: 'Halo, kenalin, nama saya Budi.',
        gloss: {
          UiLang.tr: 'Merhaba, tanışalım, adım Budi.',
          UiLang.en: "Hi, let me introduce myself, I'm Budi.",
        },
      ),
      Phrase(
        id: 'id_intro_1',
        target: 'Siapa nama kamu?',
        gloss: {UiLang.tr: 'Senin adın ne?', UiLang.en: "What's your name?"},
      ),
      Phrase(
        id: 'id_intro_2',
        target: 'Nama saya Sari, kalau kamu?',
        gloss: {
          UiLang.tr: 'Benim adım Sari, ya senin?',
          UiLang.en: "I'm Sari, and you?",
        },
      ),
      Phrase(
        id: 'id_intro_3',
        target: 'Kerjaannya apa?',
        gloss: {UiLang.tr: 'İşin ne?', UiLang.en: 'What do you do for work?'},
      ),
      Phrase(
        id: 'id_intro_4',
        target: 'Saya kerja sebagai guru.',
        gloss: {
          UiLang.tr: 'Öğretmen olarak çalışıyorum.',
          UiLang.en: 'I work as a teacher.',
        },
      ),
      Phrase(
        id: 'id_intro_5',
        target: 'Boleh minta nomor WhatsApp-mu?',
        gloss: {
          UiLang.tr: 'WhatsApp numaranı alabilir miyim?',
          UiLang.en: 'Can I get your WhatsApp number?',
        },
      ),
      Phrase(
        id: 'id_intro_6',
        target: 'Sampai ketemu lagi, ya!',
        gloss: {
          UiLang.tr: 'Tekrar görüşmek üzere!',
          UiLang.en: 'See you again!',
        },
      ),
    ],
    turns: [
      SpeakTurn(
        prompt: "You're meeting someone new and want to break the ice.",
        expected: 'Halo, kenalin, nama saya Budi.',
      ),
      SpeakTurn(
        prompt: 'You want to know their name.',
        expected: 'Siapa nama kamu?',
      ),
      SpeakTurn(
        prompt: 'They ask for your name back.',
        expected: 'Nama saya Sari, kalau kamu?',
      ),
      SpeakTurn(
        prompt: "You're curious about their job.",
        expected: 'Kerjaannya apa?',
      ),
      SpeakTurn(
        prompt: 'They ask what you do.',
        expected: 'Saya kerja sebagai guru.',
      ),
      SpeakTurn(
        prompt: 'You want to stay in touch.',
        expected: 'Boleh minta nomor WhatsApp-mu?',
      ),
      SpeakTurn(
        prompt: "You're saying goodbye.",
        expected: 'Sampai ketemu lagi, ya!',
      ),
    ],
  ),
  Scenario(
    id: 'id_shopping',
    lang: LearnLang.id,
    cefr: Cefr.a1,
    minutes: 7,
    titles: {UiLang.tr: 'Alışveriş', UiLang.en: 'Shopping'},
    clipLine: 'Boleh kurang, Bu?',
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr:
            'Satıcıya hitap ederken "kamu" yerine "Bu" (hanımefendi) veya "Pak" (beyefendi) kullanılır — saygı ifade eder.',
        UiLang.en:
            'Address a shopkeeper with "Bu" (ma\'am) or "Pak" (sir) instead of "kamu" (you) — it shows respect.',
      },
      goodExample: 'Ini berapa, Bu?',
      badExample: 'Ini berapa, kamu?',
    ),
    phrases: [
      Phrase(
        id: 'id_shopping_0',
        target: 'Lihat-lihat dulu, ya.',
        gloss: {
          UiLang.tr: 'Sadece bakıyorum.',
          UiLang.en: "I'm just looking, thanks.",
        },
      ),
      Phrase(
        id: 'id_shopping_1',
        target: 'Ini berapa, Bu?',
        gloss: {
          UiLang.tr: 'Bu ne kadar, hanımefendi?',
          UiLang.en: "How much is this, ma'am?",
        },
      ),
      Phrase(
        id: 'id_shopping_2',
        target: 'Boleh coba dulu?',
        gloss: {UiLang.tr: 'Deneyebilir miyim?', UiLang.en: 'Can I try it on?'},
      ),
      Phrase(
        id: 'id_shopping_3',
        target: 'Ada ukuran yang lebih kecil?',
        gloss: {
          UiLang.tr: 'Daha küçük bedeni var mı?',
          UiLang.en: 'Do you have a smaller size?',
        },
      ),
      Phrase(
        id: 'id_shopping_4',
        target: 'Boleh kurang, Bu?',
        gloss: {
          UiLang.tr: "İndirim olur mu, hanımefendi?",
          UiLang.en: "Can you lower the price, ma'am?",
        },
      ),
      Phrase(
        id: 'id_shopping_5',
        target: 'Bayarnya bisa pakai kartu?',
        gloss: {
          UiLang.tr: 'Kartla ödeme yapılabilir mi?',
          UiLang.en: 'Can I pay by card?',
        },
      ),
      Phrase(
        id: 'id_shopping_6',
        target: 'Kemahalan, Pak.',
        gloss: {
          UiLang.tr: 'Çok pahalı, beyefendi.',
          UiLang.en: "That's too expensive, sir.",
        },
      ),
      Phrase(
        id: 'id_shopping_7',
        target: 'Ya udah, saya ambil ini.',
        gloss: {
          UiLang.tr: 'Tamam, bunu alıyorum.',
          UiLang.en: "Okay, I'll take this.",
        },
      ),
    ],
    turns: [
      SpeakTurn(
        prompt: 'A clerk asks if you need help.',
        expected: 'Lihat-lihat dulu, ya.',
      ),
      SpeakTurn(
        prompt: "You're pointing at an item's price.",
        expected: 'Ini berapa, Bu?',
      ),
      SpeakTurn(
        prompt: 'You want to test the fit.',
        expected: 'Boleh coba dulu?',
      ),
      SpeakTurn(
        prompt: "It doesn't fit.",
        expected: 'Ada ukuran yang lebih kecil?',
      ),
      SpeakTurn(
        prompt: "You're trying to bargain a little.",
        expected: 'Boleh kurang, Bu?',
      ),
      SpeakTurn(
        prompt: "You're ready to pay.",
        expected: 'Bayarnya bisa pakai kartu?',
      ),
      SpeakTurn(
        prompt: 'You think the price is high.',
        expected: 'Kemahalan, Pak.',
      ),
      SpeakTurn(
        prompt: "You've decided to buy it after all.",
        expected: 'Ya udah, saya ambil ini.',
      ),
    ],
  ),
  Scenario(
    id: 'id_numbers_time',
    lang: LearnLang.id,
    cefr: Cefr.a1,
    minutes: 7,
    titles: {UiLang.tr: 'Sayılar ve saat', UiLang.en: 'Numbers and time'},
    clipLine: 'Sekarang jam setengah empat.',
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr:
            '"Setengah" (yarım) ile saat söylenirken bir sonraki saat kullanılır: "setengah empat" saat 3:30 demektir, 4:30 değil.',
        UiLang.en:
            'With "setengah" (half), Indonesian names the NEXT hour: "setengah empat" (half four) means 3:30, not 4:30.',
      },
      goodExample: 'Sekarang jam setengah empat.',
      badExample: 'Sekarang jam empat setengah.',
    ),
    phrases: [
      Phrase(
        id: 'id_numbers_time_0',
        target: 'Sekarang jam berapa?',
        gloss: {
          UiLang.tr: 'Şimdi saat kaç?',
          UiLang.en: 'What time is it now?',
        },
      ),
      Phrase(
        id: 'id_numbers_time_1',
        target: 'Sekarang jam setengah empat.',
        gloss: {
          UiLang.tr: 'Şimdi saat üç buçuk.',
          UiLang.en: "It's half past three.",
        },
      ),
      Phrase(
        id: 'id_numbers_time_2',
        target: 'Keretanya berangkat jam sembilan.',
        gloss: {
          UiLang.tr: 'Tren dokuzda kalkıyor.',
          UiLang.en: 'The train leaves at nine.',
        },
      ),
      Phrase(
        id: 'id_numbers_time_3',
        target: 'Saya punya dua tiket.',
        gloss: {
          UiLang.tr: 'İki biletim var.',
          UiLang.en: 'I have two tickets.',
        },
      ),
      Phrase(
        id: 'id_numbers_time_4',
        target: 'Semuanya dua belas ribu rupiah.',
        gloss: {
          UiLang.tr: 'Toplam on iki bin rupi.',
          UiLang.en: "That'll be twelve thousand rupiah.",
        },
      ),
      Phrase(
        id: 'id_numbers_time_5',
        target: 'Kita ketemu jam lima, ya?',
        gloss: {
          UiLang.tr: 'Saat beşte buluşalım mı?',
          UiLang.en: 'Shall we meet at five?',
        },
      ),
      Phrase(
        id: 'id_numbers_time_6',
        target: 'Saya sampai sepuluh menit lagi.',
        gloss: {
          UiLang.tr: 'On dakikaya varırım.',
          UiLang.en: "I'll get there in ten minutes.",
        },
      ),
    ],
    turns: [
      SpeakTurn(
        prompt: "You don't know the time.",
        expected: 'Sekarang jam berapa?',
      ),
      SpeakTurn(
        prompt: 'Someone asks you the time.',
        expected: 'Sekarang jam setengah empat.',
      ),
      SpeakTurn(
        prompt: "You're checking the schedule.",
        expected: 'Keretanya berangkat jam sembilan.',
      ),
      SpeakTurn(
        prompt: 'At the ticket counter.',
        expected: 'Saya punya dua tiket.',
      ),
      SpeakTurn(
        prompt: 'The clerk tells you the price.',
        expected: 'Semuanya dua belas ribu rupiah.',
      ),
      SpeakTurn(
        prompt: "You're planning to meet a friend.",
        expected: 'Kita ketemu jam lima, ya?',
      ),
      SpeakTurn(
        prompt: "You're running a bit late.",
        expected: 'Saya sampai sepuluh menit lagi.',
      ),
    ],
  ),
  Scenario(
    id: 'id_family',
    lang: LearnLang.id,
    cefr: Cefr.a1,
    minutes: 7,
    titles: {UiLang.tr: 'Aile', UiLang.en: 'Family'},
    clipLine: 'Ini keluarga saya.',
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr:
            'İyelik genelde ayrı bir kelime değil, isme eklenen "-ku/-mu/-nya" (benim/senin/onun) ekiyle gösterilir.',
        UiLang.en:
            'Possession is usually shown by attaching "-ku/-mu/-nya" (my/your/his-her) to the noun, not a separate word.',
      },
      goodExample: 'Ibuku dokter.',
      badExample: 'Ibu punya saya dokter.',
    ),
    phrases: [
      Phrase(
        id: 'id_family_0',
        target: 'Ini keluarga saya.',
        gloss: {UiLang.tr: 'Bu benim ailem.', UiLang.en: 'This is my family.'},
      ),
      Phrase(
        id: 'id_family_1',
        target: 'Saya punya dua adik laki-laki dan satu kakak perempuan.',
        gloss: {
          UiLang.tr: 'İki küçük erkek kardeşim ve bir büyük kız kardeşim var.',
          UiLang.en: 'I have two younger brothers and one older sister.',
        },
      ),
      Phrase(
        id: 'id_family_2',
        target: 'Ibuku dokter.',
        gloss: {UiLang.tr: 'Annem doktor.', UiLang.en: "My mom's a doctor."},
      ),
      Phrase(
        id: 'id_family_3',
        target: 'Dia sayang banget sama adiknya.',
        gloss: {
          UiLang.tr: 'Kardeşini çok seviyor.',
          UiLang.en: 'She really loves her little sibling.',
        },
      ),
      Phrase(
        id: 'id_family_4',
        target: 'Anakmu umur berapa?',
        gloss: {
          UiLang.tr: 'Çocuğun kaç yaşında?',
          UiLang.en: "How old is your kid?",
        },
      ),
      Phrase(
        id: 'id_family_5',
        target: 'Orang tua saya tinggal di Bandung.',
        gloss: {
          UiLang.tr: "Ailem Bandung'da yaşıyor.",
          UiLang.en: 'My parents live in Bandung.',
        },
      ),
      Phrase(
        id: 'id_family_6',
        target: 'Kamu udah punya anak?',
        gloss: {
          UiLang.tr: 'Çocuğun var mı?',
          UiLang.en: 'Do you have kids yet?',
        },
      ),
    ],
    turns: [
      SpeakTurn(
        prompt: "You're showing a photo.",
        expected: 'Ini keluarga saya.',
      ),
      SpeakTurn(
        prompt: 'Someone asks about your siblings.',
        expected: 'Saya punya dua adik laki-laki dan satu kakak perempuan.',
      ),
      SpeakTurn(
        prompt: 'They ask what your mother does.',
        expected: 'Ibuku dokter.',
      ),
      SpeakTurn(
        prompt: "You're talking about your sister.",
        expected: 'Dia sayang banget sama adiknya.',
      ),
      SpeakTurn(
        prompt: "You want to know a friend's kid's age.",
        expected: 'Anakmu umur berapa?',
      ),
      SpeakTurn(
        prompt: 'They ask where your parents live.',
        expected: 'Orang tua saya tinggal di Bandung.',
      ),
      SpeakTurn(
        prompt: "You're asking a new friend.",
        expected: 'Kamu udah punya anak?',
      ),
    ],
  ),
  Scenario(
    id: 'id_weather',
    lang: LearnLang.id,
    cefr: Cefr.a1,
    minutes: 7,
    titles: {UiLang.tr: 'Hava durumu', UiLang.en: 'Weather'},
    clipLine: 'Lagi hujan nih, bawa payung.',
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr:
            'Hava durumu cümlelerinde İngilizce\'deki "it" gibi bir özne yoktur; "lagi" sürmekte olan bir durumu gösterir.',
        UiLang.en:
            'Weather sentences have no dummy subject like English "it"; "lagi" marks something happening right now.',
      },
      goodExample: 'Lagi hujan nih.',
      badExample: 'Itu lagi hujan nih.',
    ),
    phrases: [
      Phrase(
        id: 'id_weather_0',
        target: 'Cuaca hari ini gimana?',
        gloss: {
          UiLang.tr: 'Bugün hava nasıl?',
          UiLang.en: "What's the weather like today?",
        },
      ),
      Phrase(
        id: 'id_weather_1',
        target: 'Lagi hujan nih.',
        gloss: {
          UiLang.tr: 'Şu an yağmur yağıyor.',
          UiLang.en: "It's raining right now.",
        },
      ),
      Phrase(
        id: 'id_weather_2',
        target: 'Panas banget di luar.',
        gloss: {
          UiLang.tr: 'Dışarısı çok sıcak.',
          UiLang.en: "It's really hot outside.",
        },
      ),
      Phrase(
        id: 'id_weather_3',
        target: 'Bawa payung, kayaknya mau hujan.',
        gloss: {
          UiLang.tr: 'Şemsiye al, yağmur yağacak gibi.',
          UiLang.en: 'Bring an umbrella, looks like it might rain.',
        },
      ),
      Phrase(
        id: 'id_weather_4',
        target: 'Dingin banget pagi ini.',
        gloss: {
          UiLang.tr: 'Bu sabah çok soğuk.',
          UiLang.en: "It's really cold this morning.",
        },
      ),
      Phrase(
        id: 'id_weather_5',
        target: 'Saya suka hari yang cerah.',
        gloss: {
          UiLang.tr: 'Güneşli günleri severim.',
          UiLang.en: 'I love sunny days.',
        },
      ),
      Phrase(
        id: 'id_weather_6',
        target: 'Anginnya kencang, ya, hari ini?',
        gloss: {
          UiLang.tr: 'Bugün rüzgar çok mu sert?',
          UiLang.en: 'Is the wind really strong today?',
        },
      ),
    ],
    turns: [
      SpeakTurn(
        prompt: "You're about to go outside.",
        expected: 'Cuaca hari ini gimana?',
      ),
      SpeakTurn(
        prompt: 'Someone asks about the weather.',
        expected: 'Lagi hujan nih.',
      ),
      SpeakTurn(prompt: 'You step outside.', expected: 'Panas banget di luar.'),
      SpeakTurn(
        prompt: 'Your friend is leaving the house.',
        expected: 'Bawa payung, kayaknya mau hujan.',
      ),
      SpeakTurn(
        prompt: 'You wake up and check the window.',
        expected: 'Dingin banget pagi ini.',
      ),
      SpeakTurn(
        prompt: "You're talking about your favorite weather.",
        expected: 'Saya suka hari yang cerah.',
      ),
      SpeakTurn(
        prompt: "You're deciding what to wear.",
        expected: 'Anginnya kencang, ya, hari ini?',
      ),
    ],
  ),
  Scenario(
    id: 'id_transport',
    lang: LearnLang.id,
    cefr: Cefr.a1,
    minutes: 7,
    titles: {UiLang.tr: 'Ulaşım', UiLang.en: 'Getting around'},
    clipLine: 'Saya pesan ojek online aja.',
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr:
            'Bir ulaşım aracına binmek için doğrudan "naik" + araç kullanılır, İngilizce\'deki "by" gibi bir edat gerekmez.',
        UiLang.en:
            '"naik" + vehicle means "take/ride [vehicle]" — no preposition needed, unlike English "by bus".',
      },
      goodExample: 'Saya naik ojek ke kantor.',
      badExample: 'Saya naik dengan ojek ke kantor.',
    ),
    phrases: [
      Phrase(
        id: 'id_transport_0',
        target: 'Halte bus terdekat di mana, ya?',
        gloss: {
          UiLang.tr: 'En yakın otobüs durağı nerede?',
          UiLang.en: "Where's the nearest bus stop?",
        },
      ),
      Phrase(
        id: 'id_transport_1',
        target: 'Saya naik ojek ke kantor.',
        gloss: {
          UiLang.tr: 'Ofise motosiklet taksiyle gidiyorum.',
          UiLang.en: 'I take a motorbike taxi to the office.',
        },
      ),
      Phrase(
        id: 'id_transport_2',
        target: 'Saya pesan ojek online aja.',
        gloss: {
          UiLang.tr: 'Ben online motosiklet taksi çağırayım.',
          UiLang.en: "I'll just book a ride-hailing motorbike.",
        },
      ),
      Phrase(
        id: 'id_transport_3',
        target: 'Turun di mana, ya, biar deket stasiun?',
        gloss: {
          UiLang.tr: 'Nerede insem istasyona yakın olur?',
          UiLang.en: 'Where should I get off to be close to the station?',
        },
      ),
      Phrase(
        id: 'id_transport_4',
        target: 'Ini kereta berhenti di bandara, nggak?',
        gloss: {
          UiLang.tr: 'Bu tren havalimanında duruyor mu?',
          UiLang.en: 'Does this train stop at the airport?',
        },
      ),
      Phrase(
        id: 'id_transport_5',
        target: 'Saya butuh taksi.',
        gloss: {
          UiLang.tr: 'Taksiye ihtiyacım var.',
          UiLang.en: 'I need a taxi.',
        },
      ),
      Phrase(
        id: 'id_transport_6',
        target: 'Berapa lama perjalanannya?',
        gloss: {
          UiLang.tr: 'Yolculuk ne kadar sürüyor?',
          UiLang.en: 'How long does the trip take?',
        },
      ),
      Phrase(
        id: 'id_transport_7',
        target: 'Saya lebih suka jalan kaki aja.',
        gloss: {
          UiLang.tr: 'Yürümeyi tercih ederim.',
          UiLang.en: "I'd rather just walk.",
        },
      ),
    ],
    turns: [
      SpeakTurn(
        prompt: 'You need to find a bus.',
        expected: 'Halte bus terdekat di mana, ya?',
      ),
      SpeakTurn(
        prompt: 'Someone asks how you commute.',
        expected: 'Saya naik ojek ke kantor.',
      ),
      SpeakTurn(
        prompt: "You're running late and need a ride now.",
        expected: 'Saya pesan ojek online aja.',
      ),
      SpeakTurn(
        prompt: "You're on the bus, unsure where to get off.",
        expected: 'Turun di mana, ya, biar deket stasiun?',
      ),
      SpeakTurn(
        prompt: "You're not sure of the route.",
        expected: 'Ini kereta berhenti di bandara, nggak?',
      ),
      SpeakTurn(
        prompt: 'You missed the last bus.',
        expected: 'Saya butuh taksi.',
      ),
      SpeakTurn(
        prompt: "You're asking about travel time.",
        expected: 'Berapa lama perjalanannya?',
      ),
      SpeakTurn(
        prompt: "It's a short distance.",
        expected: 'Saya lebih suka jalan kaki aja.',
      ),
    ],
  ),
  Scenario(
    id: 'id_emergency',
    lang: LearnLang.id,
    cefr: Cefr.a1,
    minutes: 7,
    titles: {UiLang.tr: 'Acil durum', UiLang.en: 'Emergency'},
    clipLine: 'Tolong! Panggil ambulans!',
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr:
            'Acil yardım isterken cümle "Tolong" ile başlar ve fiil özne olmadan buyurma kipinde kullanılır.',
        UiLang.en:
            'Urgent requests start with "Tolong" (please/help), followed by the bare verb with no subject.',
      },
      goodExample: 'Tolong panggil ambulans!',
      badExample: 'Kamu tolong panggil ambulans!',
    ),
    phrases: [
      Phrase(
        id: 'id_emergency_0',
        target: 'Tolong! Panggil ambulans!',
        gloss: {
          UiLang.tr: 'İmdat! Ambulans çağırın!',
          UiLang.en: 'Help! Call an ambulance!',
        },
      ),
      Phrase(
        id: 'id_emergency_1',
        target: 'Ada kecelakaan di sini.',
        gloss: {
          UiLang.tr: 'Burada bir kaza oldu.',
          UiLang.en: "There's been an accident here.",
        },
      ),
      Phrase(
        id: 'id_emergency_2',
        target: 'Saya butuh dokter sekarang.',
        gloss: {
          UiLang.tr: 'Şimdi bir doktora ihtiyacım var.',
          UiLang.en: 'I need a doctor now.',
        },
      ),
      Phrase(
        id: 'id_emergency_3',
        target: 'Rumah sakit terdekat di mana?',
        gloss: {
          UiLang.tr: 'En yakın hastane nerede?',
          UiLang.en: "Where's the nearest hospital?",
        },
      ),
      Phrase(
        id: 'id_emergency_4',
        target: 'Tas saya dicopet!',
        gloss: {UiLang.tr: 'Çantam çalındı!', UiLang.en: 'My bag got stolen!'},
      ),
      Phrase(
        id: 'id_emergency_5',
        target: 'Saya alergi obat penisilin.',
        gloss: {
          UiLang.tr: 'Penisiline alerjim var.',
          UiLang.en: "I'm allergic to penicillin.",
        },
      ),
      Phrase(
        id: 'id_emergency_6',
        target: 'Tolong hubungi polisi.',
        gloss: {
          UiLang.tr: 'Lütfen polisi arayın.',
          UiLang.en: 'Please call the police.',
        },
      ),
      Phrase(
        id: 'id_emergency_7',
        target: 'Saya kesasar, bisa bantu saya?',
        gloss: {
          UiLang.tr: 'Kayboldum, bana yardım edebilir misiniz?',
          UiLang.en: "I'm lost, can you help me?",
        },
      ),
    ],
    turns: [
      SpeakTurn(
        prompt: 'You see someone collapse.',
        expected: 'Tolong! Panggil ambulans!',
      ),
      SpeakTurn(
        prompt: 'You call emergency services.',
        expected: 'Ada kecelakaan di sini.',
      ),
      SpeakTurn(
        prompt: 'You describe the urgency.',
        expected: 'Saya butuh dokter sekarang.',
      ),
      SpeakTurn(
        prompt: 'You need directions fast.',
        expected: 'Rumah sakit terdekat di mana?',
      ),
      SpeakTurn(
        prompt: "You're reporting a theft.",
        expected: 'Tas saya dicopet!',
      ),
      SpeakTurn(
        prompt: 'A doctor asks about allergies.',
        expected: 'Saya alergi obat penisilin.',
      ),
      SpeakTurn(
        prompt: 'You need official help.',
        expected: 'Tolong hubungi polisi.',
      ),
      SpeakTurn(
        prompt: "You don't know where you are.",
        expected: 'Saya kesasar, bisa bantu saya?',
      ),
    ],
  ),
  Scenario(
    id: 'id_routine',
    lang: LearnLang.id,
    cefr: Cefr.a1,
    minutes: 7,
    titles: {UiLang.tr: 'Günlük rutin', UiLang.en: 'Daily routine'},
    clipLine: 'Saya biasanya bangun jam tujuh.',
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr:
            '"Mandi" (duş almak) gibi günlük rutin fiilleri tek başına kullanılır, İngilizce\'deki gibi bir nesne ya da "kendini" almaz.',
        UiLang.en:
            'Everyday routine verbs like "mandi" (to shower) stand alone — no object or reflexive pronoun needed, unlike English "take a shower".',
      },
      goodExample: 'Dia mandi tiap pagi.',
      badExample: 'Dia mandi dirinya tiap pagi.',
    ),
    phrases: [
      Phrase(
        id: 'id_routine_0',
        target: 'Saya biasanya bangun jam tujuh.',
        gloss: {
          UiLang.tr: 'Genelde saat yedide kalkarım.',
          UiLang.en: 'I usually wake up at seven.',
        },
      ),
      Phrase(
        id: 'id_routine_1',
        target: 'Dia mandi tiap pagi.',
        gloss: {
          UiLang.tr: 'Her sabah duş alır.',
          UiLang.en: 'She showers every morning.',
        },
      ),
      Phrase(
        id: 'id_routine_2',
        target: 'Kita sarapan bareng-bareng.',
        gloss: {
          UiLang.tr: 'Birlikte kahvaltı yaparız.',
          UiLang.en: 'We have breakfast together.',
        },
      ),
      Phrase(
        id: 'id_routine_3',
        target: 'Dia ke kantor naik motor.',
        gloss: {
          UiLang.tr: 'Ofise motosikletle gider.',
          UiLang.en: 'He goes to the office by motorbike.',
        },
      ),
      Phrase(
        id: 'id_routine_4',
        target: 'Saya selalu gosok gigi dua kali sehari.',
        gloss: {
          UiLang.tr: 'Her zaman günde iki kez dişlerimi fırçalarım.',
          UiLang.en: 'I always brush my teeth twice a day.',
        },
      ),
      Phrase(
        id: 'id_routine_5',
        target: 'Mereka biasanya tidur larut.',
        gloss: {
          UiLang.tr: 'Genelde geç yatarlar.',
          UiLang.en: 'They usually go to bed late.',
        },
      ),
      Phrase(
        id: 'id_routine_6',
        target: 'Hari Minggu saya bangun siang.',
        gloss: {
          UiLang.tr: 'Pazar günleri geç kalkarım.',
          UiLang.en: 'On Sundays I sleep in.',
        },
      ),
    ],
    turns: [
      SpeakTurn(
        prompt: 'Someone asks about your morning.',
        expected: 'Saya biasanya bangun jam tujuh.',
      ),
      SpeakTurn(
        prompt: "You describe your sister's routine.",
        expected: 'Dia mandi tiap pagi.',
      ),
      SpeakTurn(
        prompt: "You talk about your family's mornings.",
        expected: 'Kita sarapan bareng-bareng.',
      ),
      SpeakTurn(
        prompt: "You describe your brother's commute.",
        expected: 'Dia ke kantor naik motor.',
      ),
      SpeakTurn(
        prompt: "You're talking about hygiene habits.",
        expected: 'Saya selalu gosok gigi dua kali sehari.',
      ),
      SpeakTurn(
        prompt: 'You describe your roommates.',
        expected: 'Mereka biasanya tidur larut.',
      ),
      SpeakTurn(
        prompt: 'Someone asks about your weekend.',
        expected: 'Hari Minggu saya bangun siang.',
      ),
    ],
  ),
  Scenario(
    id: 'id_past_story',
    lang: LearnLang.id,
    cefr: Cefr.a1,
    minutes: 7,
    titles: {UiLang.tr: 'Bir olayı anlatmak', UiLang.en: 'Telling a story'},
    clipLine: 'Kemarin saya pergi ke pasar.',
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr:
            'Geçmiş zaman fiil değişimiyle değil, "kemarin" (dün) gibi zaman belirteçleriyle gösterilir.',
        UiLang.en:
            'Past time is shown with time words like "kemarin" (yesterday), not by changing the verb.',
      },
      goodExample: 'Kemarin saya pergi ke pasar.',
      badExample: 'Kemarin saya pergilah ke pasar.',
    ),
    phrases: [
      Phrase(
        id: 'id_past_story_0',
        target: 'Kemarin saya pergi ke pasar.',
        gloss: {
          UiLang.tr: 'Dün pazara gittim.',
          UiLang.en: 'Yesterday I went to the market.',
        },
      ),
      Phrase(
        id: 'id_past_story_1',
        target: 'Saya beli sayur segar.',
        gloss: {
          UiLang.tr: 'Taze sebze aldım.',
          UiLang.en: 'I bought some fresh vegetables.',
        },
      ),
      Phrase(
        id: 'id_past_story_2',
        target: 'Terus, saya ketemu teman lama.',
        gloss: {
          UiLang.tr: 'Sonra eski bir arkadaşımla karşılaştım.',
          UiLang.en: 'Then I ran into an old friend.',
        },
      ),
      Phrase(
        id: 'id_past_story_3',
        target: 'Kita ngobrol sejam-an.',
        gloss: {
          UiLang.tr: 'Bir saat kadar sohbet ettik.',
          UiLang.en: 'We chatted for about an hour.',
        },
      ),
      Phrase(
        id: 'id_past_story_4',
        target: 'Dompet saya hilang di jalan pulang.',
        gloss: {
          UiLang.tr: 'Eve dönerken cüzdanımı kaybettim.',
          UiLang.en: 'I lost my wallet on the way home.',
        },
      ),
      Phrase(
        id: 'id_past_story_5',
        target: 'Untungnya, ada yang nemuin.',
        gloss: {
          UiLang.tr: 'Neyse ki biri buldu.',
          UiLang.en: 'Luckily, someone found it.',
        },
      ),
      Phrase(
        id: 'id_past_story_6',
        target: 'Gila juga, deh, hari itu!',
        gloss: {
          UiLang.tr: 'O gün çılgıncaydı!',
          UiLang.en: 'That day was crazy!',
        },
      ),
    ],
    turns: [
      SpeakTurn(
        prompt: "You're telling a friend about your day.",
        expected: 'Kemarin saya pergi ke pasar.',
      ),
      SpeakTurn(
        prompt: 'You continue the story.',
        expected: 'Saya beli sayur segar.',
      ),
      SpeakTurn(
        prompt: 'Something unexpected happened.',
        expected: 'Terus, saya ketemu teman lama.',
      ),
      SpeakTurn(
        prompt: 'You describe the encounter.',
        expected: 'Kita ngobrol sejam-an.',
      ),
      SpeakTurn(
        prompt: 'Something went wrong.',
        expected: 'Dompet saya hilang di jalan pulang.',
      ),
      SpeakTurn(
        prompt: 'It has a happy ending.',
        expected: 'Untungnya, ada yang nemuin.',
      ),
      SpeakTurn(
        prompt: "You're wrapping up the story.",
        expected: 'Gila juga, deh, hari itu!',
      ),
    ],
  ),

  // ===================== SWAHILI =====================
  // LOWER-RESOURCE LANGUAGE WARNING: Swahili content in this section was
  // generated by a model that is less reliable in Swahili than in
  // English/Spanish/French. Every single Scenario below has `target` phrases
  // flagged with `// TODO: native review` and MUST be checked by a native
  // speaker (register/dialect, grammar, natural phrasing) before it is wired
  // into the live Catalog or shipped to users.
  Scenario(
    id: 'sw_intro',
    lang: LearnLang.sw,
    cefr: Cefr.a1,
    minutes: 7,
    titles: {UiLang.tr: 'Tanışma', UiLang.en: 'Meeting someone'},
    clipLine: 'Habari, jina langu ni Amani.',
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr:
            'Swahili fiillerinde özne, ayrı bir zamir olarak değil, fiilin başına eklenen bir önek olarak gösterilir.',
        UiLang.en:
            'Swahili verbs mark the subject as a prefix attached to the verb stem, not as a separate pronoun word.',
      },
      goodExample: 'Ninafanya kazi.',
      badExample: 'Mimi fanya kazi.',
    ),
    phrases: [
      Phrase(
        id: 'sw_intro_0',
        target: 'Habari, jina langu ni Amani.', // TODO: native review
        gloss: {
          UiLang.tr: 'Merhaba, benim adım Amani.',
          UiLang.en: 'Hi, my name is Amani.',
        },
      ),
      Phrase(
        id: 'sw_intro_1',
        target: 'Jina lako nani?', // TODO: native review
        gloss: {UiLang.tr: 'Senin adın ne?', UiLang.en: "What's your name?"},
      ),
      Phrase(
        id: 'sw_intro_2',
        target: 'Naitwa Fatuma, na wewe?', // TODO: native review
        gloss: {
          UiLang.tr: "Benim adım Fatuma, ya sen?",
          UiLang.en: "I'm called Fatuma, and you?",
        },
      ),
      Phrase(
        id: 'sw_intro_3',
        target: 'Unafanya kazi gani?', // TODO: native review
        gloss: {
          UiLang.tr: 'Ne iş yapıyorsun?',
          UiLang.en: 'What work do you do?',
        },
      ),
      Phrase(
        id: 'sw_intro_4',
        target: 'Mimi ni mwalimu.', // TODO: native review
        gloss: {UiLang.tr: 'Ben öğretmenim.', UiLang.en: "I'm a teacher."},
      ),
      Phrase(
        id: 'sw_intro_5',
        target: 'Naweza kupata namba yako?', // TODO: native review
        gloss: {
          UiLang.tr: 'Numaranı alabilir miyim?',
          UiLang.en: 'Can I get your number?',
        },
      ),
      Phrase(
        id: 'sw_intro_6',
        target: 'Tuonane baadaye!', // TODO: native review
        gloss: {UiLang.tr: 'Sonra görüşürüz!', UiLang.en: 'See you later!'},
      ),
    ],
    turns: [
      SpeakTurn(
        prompt: "You're meeting someone new and want to break the ice.",
        expected: 'Habari, jina langu ni Amani.',
      ),
      SpeakTurn(
        prompt: 'You want to know their name.',
        expected: 'Jina lako nani?',
      ),
      SpeakTurn(
        prompt: 'They ask for your name back.',
        expected: 'Naitwa Fatuma, na wewe?',
      ),
      SpeakTurn(
        prompt: "You're curious about their job.",
        expected: 'Unafanya kazi gani?',
      ),
      SpeakTurn(prompt: 'They ask what you do.', expected: 'Mimi ni mwalimu.'),
      SpeakTurn(
        prompt: 'You want to stay in touch.',
        expected: 'Naweza kupata namba yako?',
      ),
      SpeakTurn(prompt: "You're saying goodbye.", expected: 'Tuonane baadaye!'),
    ],
  ),
  Scenario(
    id: 'sw_shopping',
    lang: LearnLang.sw,
    cefr: Cefr.a1,
    minutes: 7,
    titles: {UiLang.tr: 'Alışveriş', UiLang.en: 'Shopping'},
    clipLine: 'Punguza bei kidogo, tafadhali.',
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr:
            'Şimdiki zaman olumsuzlaması, özne önekinin başına eklenen "ha-" öneki ile yapılır.',
        UiLang.en:
            'Present-tense negation adds the prefix "ha-" before the subject marker on the verb.',
      },
      goodExample: 'Sina pesa za kutosha.',
      badExample: 'Nina siyo pesa za kutosha.',
    ),
    phrases: [
      Phrase(
        id: 'sw_shopping_0',
        target: 'Naangalia tu, asante.', // TODO: native review
        gloss: {
          UiLang.tr: 'Sadece bakıyorum, teşekkürler.',
          UiLang.en: "I'm just looking, thanks.",
        },
      ),
      Phrase(
        id: 'sw_shopping_1',
        target: 'Una hii kwa size arobaini?', // TODO: native review
        gloss: {
          UiLang.tr: 'Bunun 40 numarası var mı?',
          UiLang.en: 'Do you have this in size 40?',
        },
      ),
      Phrase(
        id: 'sw_shopping_2',
        target: 'Naweza kujaribu?', // TODO: native review
        gloss: {UiLang.tr: 'Deneyebilir miyim?', UiLang.en: 'Can I try it on?'},
      ),
      Phrase(
        id: 'sw_shopping_3',
        target: 'Viatu hivi bei gani?', // TODO: native review
        gloss: {
          UiLang.tr: 'Bu ayakkabılar kaç para?',
          UiLang.en: 'How much are these shoes?',
        },
      ),
      Phrase(
        id: 'sw_shopping_4',
        target: 'Mnapokea kadi?', // TODO: native review
        gloss: {
          UiLang.tr: 'Kart kabul ediyor musunuz?',
          UiLang.en: 'Do you accept cards?',
        },
      ),
      Phrase(
        id: 'sw_shopping_5',
        target: 'Ni ghali sana.', // TODO: native review
        gloss: {UiLang.tr: 'Çok pahalı.', UiLang.en: "It's too expensive."},
      ),
      Phrase(
        id: 'sw_shopping_6',
        target: 'Punguza bei kidogo, tafadhali.', // TODO: native review
        gloss: {
          UiLang.tr: 'Biraz indirim yapın lütfen.',
          UiLang.en: 'Please lower the price a bit.',
        },
      ),
      Phrase(
        id: 'sw_shopping_7',
        target: 'Sawa, nitachukua hii.', // TODO: native review
        gloss: {
          UiLang.tr: 'Tamam, bunu alıyorum.',
          UiLang.en: "Okay, I'll take this.",
        },
      ),
    ],
    turns: [
      SpeakTurn(
        prompt: 'A clerk asks if you need help.',
        expected: 'Naangalia tu, asante.',
      ),
      SpeakTurn(
        prompt: 'You found something you like.',
        expected: 'Una hii kwa size arobaini?',
      ),
      SpeakTurn(
        prompt: 'You want to test the fit.',
        expected: 'Naweza kujaribu?',
      ),
      SpeakTurn(
        prompt: "You're checking the price.",
        expected: 'Viatu hivi bei gani?',
      ),
      SpeakTurn(prompt: "You're ready to pay.", expected: 'Mnapokea kadi?'),
      SpeakTurn(
        prompt: 'You think the price is high.',
        expected: 'Ni ghali sana.',
      ),
      SpeakTurn(
        prompt: "You're trying to bargain a little.",
        expected: 'Punguza bei kidogo, tafadhali.',
      ),
      SpeakTurn(
        prompt: "You've decided to buy it.",
        expected: 'Sawa, nitachukua hii.',
      ),
    ],
  ),
  Scenario(
    id: 'sw_numbers_time',
    lang: LearnLang.sw,
    cefr: Cefr.a1,
    minutes: 7,
    titles: {UiLang.tr: 'Sayılar ve saat', UiLang.en: 'Numbers and time'},
    clipLine: 'Sasa ni saa ngapi?',
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr:
            'Svahili saatleri gün doğumundan itibaren sayılır: "saa moja" (saat bir) sabah 07:00 demektir, sabah 01:00 değil.',
        UiLang.en:
            'Swahili clock time counts from sunrise: "saa moja" (hour one) means 7 AM, not 1 AM — it runs six hours behind Western time.',
      },
      goodExample: 'Treni linaondoka saa tatu asubuhi.',
      badExample: 'Treni linaondoka saa tisa asubuhi.',
    ),
    phrases: [
      Phrase(
        id: 'sw_numbers_time_0',
        target: 'Sasa ni saa ngapi?', // TODO: native review
        gloss: {
          UiLang.tr: 'Şimdi saat kaç?',
          UiLang.en: 'What time is it now?',
        },
      ),
      Phrase(
        id: 'sw_numbers_time_1',
        target: 'Ni saa tisa na nusu.', // TODO: native review
        gloss: {
          UiLang.tr: 'Saat üç buçuk.',
          UiLang.en: "It's half past three.",
        },
      ),
      Phrase(
        id: 'sw_numbers_time_2',
        target: 'Treni linaondoka saa tatu asubuhi.', // TODO: native review
        gloss: {
          UiLang.tr: 'Tren sabah dokuzda kalkıyor.',
          UiLang.en: 'The train leaves at nine in the morning.',
        },
      ),
      Phrase(
        id: 'sw_numbers_time_3',
        target: 'Nina tiketi mbili.', // TODO: native review
        gloss: {
          UiLang.tr: 'İki biletim var.',
          UiLang.en: 'I have two tickets.',
        },
      ),
      Phrase(
        id: 'sw_numbers_time_4',
        target: 'Ni shilingi elfu kumi na mbili.', // TODO: native review
        gloss: {
          UiLang.tr: 'On iki bin şilin tutuyor.',
          UiLang.en: 'That comes to twelve thousand shillings.',
        },
      ),
      Phrase(
        id: 'sw_numbers_time_5',
        target: 'Tuonane saa kumi na moja jioni?', // TODO: native review
        gloss: {
          UiLang.tr: 'Akşam beşte buluşalım mı?',
          UiLang.en: 'Shall we meet at five in the evening?',
        },
      ),
      Phrase(
        id: 'sw_numbers_time_6',
        target: 'Nitafika baada ya dakika kumi.', // TODO: native review
        gloss: {
          UiLang.tr: 'On dakika sonra varırım.',
          UiLang.en: "I'll arrive in ten minutes.",
        },
      ),
    ],
    turns: [
      SpeakTurn(
        prompt: "You don't know the time.",
        expected: 'Sasa ni saa ngapi?',
      ),
      SpeakTurn(
        prompt: 'Someone asks you the time.',
        expected: 'Ni saa tisa na nusu.',
      ),
      SpeakTurn(
        prompt: "You're checking the schedule.",
        expected: 'Treni linaondoka saa tatu asubuhi.',
      ),
      SpeakTurn(prompt: 'At the counter.', expected: 'Nina tiketi mbili.'),
      SpeakTurn(
        prompt: 'The clerk tells you the price.',
        expected: 'Ni shilingi elfu kumi na mbili.',
      ),
      SpeakTurn(
        prompt: "You're planning to meet a friend.",
        expected: 'Tuonane saa kumi na moja jioni?',
      ),
      SpeakTurn(
        prompt: "You're running a bit late.",
        expected: 'Nitafika baada ya dakika kumi.',
      ),
    ],
  ),
  Scenario(
    id: 'sw_family',
    lang: LearnLang.sw,
    cefr: Cefr.a1,
    minutes: 7,
    titles: {UiLang.tr: 'Aile', UiLang.en: 'Family'},
    clipLine: 'Hii ni familia yangu.',
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr:
            'İyelik eki ("wangu" - benim), ismin ait olduğu sınıfa göre değişir: "mtoto wangu" (çocuğum) ama "kitabu changu" (kitabım).',
        UiLang.en:
            'The possessive ("my") changes form to match the noun\'s class: "mtoto wangu" (my child) but "kitabu changu" (my book).',
      },
      goodExample: 'Huyu ni mtoto wangu.',
      badExample: 'Huyu ni mtoto changu.',
    ),
    phrases: [
      Phrase(
        id: 'sw_family_0',
        target: 'Hii ni familia yangu.', // TODO: native review
        gloss: {UiLang.tr: 'Bu benim ailem.', UiLang.en: 'This is my family.'},
      ),
      Phrase(
        id: 'sw_family_1',
        target: 'Nina kaka wawili na dada mmoja.', // TODO: native review
        gloss: {
          UiLang.tr: 'İki erkek kardeşim ve bir kız kardeşim var.',
          UiLang.en: 'I have two brothers and one sister.',
        },
      ),
      Phrase(
        id: 'sw_family_2',
        target: 'Mama yangu ni daktari.', // TODO: native review
        gloss: {
          UiLang.tr: 'Annem doktor.',
          UiLang.en: 'My mother is a doctor.',
        },
      ),
      Phrase(
        id: 'sw_family_3',
        target: 'Anampenda sana kaka yake.', // TODO: native review
        gloss: {
          UiLang.tr: 'Erkek kardeşini çok seviyor.',
          UiLang.en: 'She loves her brother a lot.',
        },
      ),
      Phrase(
        id: 'sw_family_4',
        target: 'Binti yako ana miaka mingapi?', // TODO: native review
        gloss: {
          UiLang.tr: 'Kızın kaç yaşında?',
          UiLang.en: 'How old is your daughter?',
        },
      ),
      Phrase(
        id: 'sw_family_5',
        target: 'Wazazi wangu wanaishi Arusha.', // TODO: native review
        gloss: {
          UiLang.tr: "Ailem Arusha'da yaşıyor.",
          UiLang.en: 'My parents live in Arusha.',
        },
      ),
      Phrase(
        id: 'sw_family_6',
        target: 'Una watoto?', // TODO: native review
        gloss: {
          UiLang.tr: 'Çocuğun var mı?',
          UiLang.en: 'Do you have children?',
        },
      ),
    ],
    turns: [
      SpeakTurn(
        prompt: "You're showing a photo.",
        expected: 'Hii ni familia yangu.',
      ),
      SpeakTurn(
        prompt: 'Someone asks about your siblings.',
        expected: 'Nina kaka wawili na dada mmoja.',
      ),
      SpeakTurn(
        prompt: 'They ask what your mother does.',
        expected: 'Mama yangu ni daktari.',
      ),
      SpeakTurn(
        prompt: "You're talking about your sister.",
        expected: 'Anampenda sana kaka yake.',
      ),
      SpeakTurn(
        prompt: "You want to know a friend's daughter's age.",
        expected: 'Binti yako ana miaka mingapi?',
      ),
      SpeakTurn(
        prompt: 'They ask where your parents live.',
        expected: 'Wazazi wangu wanaishi Arusha.',
      ),
      SpeakTurn(prompt: "You're asking a new friend.", expected: 'Una watoto?'),
    ],
  ),
  Scenario(
    id: 'sw_weather',
    lang: LearnLang.sw,
    cefr: Cefr.a1,
    minutes: 7,
    titles: {UiLang.tr: 'Hava durumu', UiLang.en: 'Weather'},
    clipLine: 'Kuna mvua leo, chukua mwavuli.',
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr:
            'Hava durumu ifadeleri "kuna" (var) yapısını kullanır; İngilizce\'deki "it" gibi bir özneye gerek yoktur.',
        UiLang.en:
            'Weather expressions use the existential "kuna" (there is), with no subject like English "it".',
      },
      goodExample: 'Kuna mvua leo.',
      badExample: 'Ni mvua leo.',
    ),
    phrases: [
      Phrase(
        id: 'sw_weather_0',
        target: 'Hali ya hewa ikoje leo?', // TODO: native review
        gloss: {
          UiLang.tr: 'Bugün hava nasıl?',
          UiLang.en: "What's the weather like today?",
        },
      ),
      Phrase(
        id: 'sw_weather_1',
        target: 'Kuna mvua leo.', // TODO: native review
        gloss: {
          UiLang.tr: 'Bugün yağmur var.',
          UiLang.en: "There's rain today.",
        },
      ),
      Phrase(
        id: 'sw_weather_2',
        target: 'Kuna joto sana nje.', // TODO: native review
        gloss: {
          UiLang.tr: 'Dışarısı çok sıcak.',
          UiLang.en: "It's very hot outside.",
        },
      ),
      Phrase(
        id: 'sw_weather_3',
        target: 'Chukua mwavuli, huenda ikanyesha.', // TODO: native review
        gloss: {
          UiLang.tr: 'Şemsiye al, yağmur yağabilir.',
          UiLang.en: 'Take an umbrella, it might rain.',
        },
      ),
      Phrase(
        id: 'sw_weather_4',
        target: 'Kuna baridi sana asubuhi hii.', // TODO: native review
        gloss: {
          UiLang.tr: 'Bu sabah çok soğuk.',
          UiLang.en: "It's very cold this morning.",
        },
      ),
      Phrase(
        id: 'sw_weather_5',
        target: 'Napenda siku za jua.', // TODO: native review
        gloss: {
          UiLang.tr: 'Güneşli günleri severim.',
          UiLang.en: 'I love sunny days.',
        },
      ),
      Phrase(
        id: 'sw_weather_6',
        target: 'Kuna upepo mkali leo?', // TODO: native review
        gloss: {
          UiLang.tr: 'Bugün rüzgar sert mi?',
          UiLang.en: 'Is the wind strong today?',
        },
      ),
    ],
    turns: [
      SpeakTurn(
        prompt: "You're about to go outside.",
        expected: 'Hali ya hewa ikoje leo?',
      ),
      SpeakTurn(
        prompt: 'Someone asks about the weather.',
        expected: 'Kuna mvua leo.',
      ),
      SpeakTurn(prompt: 'You step outside.', expected: 'Kuna joto sana nje.'),
      SpeakTurn(
        prompt: 'Your friend is leaving the house.',
        expected: 'Chukua mwavuli, huenda ikanyesha.',
      ),
      SpeakTurn(
        prompt: 'You wake up and check the window.',
        expected: 'Kuna baridi sana asubuhi hii.',
      ),
      SpeakTurn(
        prompt: "You're talking about your favorite weather.",
        expected: 'Napenda siku za jua.',
      ),
      SpeakTurn(
        prompt: "You're deciding what to wear.",
        expected: 'Kuna upepo mkali leo?',
      ),
    ],
  ),
  Scenario(
    id: 'sw_transport',
    lang: LearnLang.sw,
    cefr: Cefr.a1,
    minutes: 7,
    titles: {UiLang.tr: 'Ulaşım', UiLang.en: 'Getting around'},
    clipLine: 'Naenda kazini kwa daladala.',
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr:
            'Bir araca binmek için "kupanda" (binmek) fiili doğrudan aracın adıyla kullanılır, edat gerekmez.',
        UiLang.en:
            '"kupanda" (to board) is used directly with the vehicle name to mean "take/ride" — no preposition needed.',
      },
      goodExample: 'Napanda daladala kwenda kazini.',
      badExample: 'Napanda kwa daladala kwenda kazini.',
    ),
    phrases: [
      Phrase(
        id: 'sw_transport_0',
        target:
            'Kituo cha basi kilicho karibu kiko wapi?', // TODO: native review
        gloss: {
          UiLang.tr: 'En yakın otobüs durağı nerede?',
          UiLang.en: "Where's the nearest bus stop?",
        },
      ),
      Phrase(
        id: 'sw_transport_1',
        target: 'Napanda daladala kwenda kazini.', // TODO: native review
        gloss: {
          UiLang.tr: 'İşe minibüsle gidiyorum.',
          UiLang.en: 'I take a daladala (minibus) to work.',
        },
      ),
      Phrase(
        id: 'sw_transport_2',
        target: 'Ni jukwaa gani?', // TODO: native review
        gloss: {UiLang.tr: 'Hangi peron?', UiLang.en: 'Which platform is it?'},
      ),
      Phrase(
        id: 'sw_transport_3',
        target: 'Tiketi moja kwenda mjini, tafadhali.', // TODO: native review
        gloss: {
          UiLang.tr: 'Şehir merkezine bir bilet lütfen.',
          UiLang.en: 'One ticket to town, please.',
        },
      ),
      Phrase(
        id: 'sw_transport_4',
        target: 'Treni hii inasimama uwanja wa ndege?', // TODO: native review
        gloss: {
          UiLang.tr: 'Bu tren havalimanında duruyor mu?',
          UiLang.en: 'Does this train stop at the airport?',
        },
      ),
      Phrase(
        id: 'sw_transport_5',
        target: 'Nahitaji teksi.', // TODO: native review
        gloss: {
          UiLang.tr: 'Taksiye ihtiyacım var.',
          UiLang.en: 'I need a taxi.',
        },
      ),
      Phrase(
        id: 'sw_transport_6',
        target: 'Safari inachukua muda gani?', // TODO: native review
        gloss: {
          UiLang.tr: 'Yolculuk ne kadar sürüyor?',
          UiLang.en: 'How long does the trip take?',
        },
      ),
      Phrase(
        id: 'sw_transport_7',
        target: 'Napendelea kutembea tu.', // TODO: native review
        gloss: {
          UiLang.tr: 'Yürümeyi tercih ederim.',
          UiLang.en: 'I prefer to just walk.',
        },
      ),
    ],
    turns: [
      SpeakTurn(
        prompt: 'You need to find a bus.',
        expected: 'Kituo cha basi kilicho karibu kiko wapi?',
      ),
      SpeakTurn(
        prompt: 'Someone asks how you commute.',
        expected: 'Napanda daladala kwenda kazini.',
      ),
      SpeakTurn(
        prompt: "You're at the train station.",
        expected: 'Ni jukwaa gani?',
      ),
      SpeakTurn(
        prompt: 'At the ticket counter.',
        expected: 'Tiketi moja kwenda mjini, tafadhali.',
      ),
      SpeakTurn(
        prompt: "You're not sure of the route.",
        expected: 'Treni hii inasimama uwanja wa ndege?',
      ),
      SpeakTurn(
        prompt: 'You missed the last bus.',
        expected: 'Nahitaji teksi.',
      ),
      SpeakTurn(
        prompt: "You're asking about travel time.",
        expected: 'Safari inachukua muda gani?',
      ),
      SpeakTurn(
        prompt: "It's a short distance.",
        expected: 'Napendelea kutembea tu.',
      ),
    ],
  ),
  Scenario(
    id: 'sw_emergency',
    lang: LearnLang.sw,
    cefr: Cefr.a1,
    minutes: 7,
    titles: {UiLang.tr: 'Acil durum', UiLang.en: 'Emergency'},
    clipLine: 'Msaada! Pigeni simu ambulansi!',
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr:
            'Birden fazla kişiye ya da saygıyla emir verirken fiil "-eni" ekiyle biter, tekilde sadece "-a" kalır.',
        UiLang.en:
            'Commanding a group (or a respectful "you") adds the ending "-eni" to the verb, unlike the plain singular form.',
      },
      goodExample: 'Pigeni simu ambulansi!',
      badExample: 'Piga simu ambulansi, watu wote!',
    ),
    phrases: [
      Phrase(
        id: 'sw_emergency_0',
        target: 'Msaada! Pigeni simu ambulansi!', // TODO: native review
        gloss: {
          UiLang.tr: 'İmdat! Ambulans çağırın!',
          UiLang.en: 'Help! Call an ambulance!',
        },
      ),
      Phrase(
        id: 'sw_emergency_1',
        target: 'Kumetokea ajali hapa.', // TODO: native review
        gloss: {
          UiLang.tr: 'Burada bir kaza oldu.',
          UiLang.en: "There's been an accident here.",
        },
      ),
      Phrase(
        id: 'sw_emergency_2',
        target: 'Nahitaji daktari sasa hivi.', // TODO: native review
        gloss: {
          UiLang.tr: 'Şimdi bir doktora ihtiyacım var.',
          UiLang.en: 'I need a doctor right now.',
        },
      ),
      Phrase(
        id: 'sw_emergency_3',
        target: 'Hospitali iliyo karibu iko wapi?', // TODO: native review
        gloss: {
          UiLang.tr: 'En yakın hastane nerede?',
          UiLang.en: "Where's the nearest hospital?",
        },
      ),
      Phrase(
        id: 'sw_emergency_4',
        target: 'Mtu ameiba mkoba wangu!', // TODO: native review
        gloss: {
          UiLang.tr: 'Biri çantamı çaldı!',
          UiLang.en: 'Someone stole my bag!',
        },
      ),
      Phrase(
        id: 'sw_emergency_5',
        target: 'Nina mzio wa penicillin.', // TODO: native review
        gloss: {
          UiLang.tr: 'Penisiline alerjim var.',
          UiLang.en: "I'm allergic to penicillin.",
        },
      ),
      Phrase(
        id: 'sw_emergency_6',
        target: 'Tafadhali mwiteni polisi.', // TODO: native review
        gloss: {
          UiLang.tr: 'Lütfen polisi çağırın.',
          UiLang.en: 'Please call the police.',
        },
      ),
      Phrase(
        id: 'sw_emergency_7',
        target: 'Nimepotea, unaweza kunisaidia?', // TODO: native review
        gloss: {
          UiLang.tr: 'Kayboldum, bana yardım edebilir misiniz?',
          UiLang.en: "I'm lost, can you help me?",
        },
      ),
    ],
    turns: [
      SpeakTurn(
        prompt: 'You see someone collapse.',
        expected: 'Msaada! Pigeni simu ambulansi!',
      ),
      SpeakTurn(
        prompt: 'You call emergency services.',
        expected: 'Kumetokea ajali hapa.',
      ),
      SpeakTurn(
        prompt: 'You describe the urgency.',
        expected: 'Nahitaji daktari sasa hivi.',
      ),
      SpeakTurn(
        prompt: 'You need directions fast.',
        expected: 'Hospitali iliyo karibu iko wapi?',
      ),
      SpeakTurn(
        prompt: "You're reporting a theft.",
        expected: 'Mtu ameiba mkoba wangu!',
      ),
      SpeakTurn(
        prompt: 'A doctor asks about allergies.',
        expected: 'Nina mzio wa penicillin.',
      ),
      SpeakTurn(
        prompt: 'You need official help.',
        expected: 'Tafadhali mwiteni polisi.',
      ),
      SpeakTurn(
        prompt: "You don't know where you are.",
        expected: 'Nimepotea, unaweza kunisaidia?',
      ),
    ],
  ),
  Scenario(
    id: 'sw_routine',
    lang: LearnLang.sw,
    cefr: Cefr.a1,
    minutes: 7,
    titles: {UiLang.tr: 'Günlük rutin', UiLang.en: 'Daily routine'},
    clipLine: 'Ninaamka saa moja asubuhi.',
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr:
            'Fiilin içindeki "-na-" eki (özne öneki ile fiil kökü arasında), alışkanlık ya da şu anki eylemi gösterir.',
        UiLang.en:
            'The infix "-na-" inside the verb (between subject marker and root) marks habitual or ongoing action.',
      },
      goodExample: 'Ninaamka saa moja asubuhi.',
      badExample: 'Niamka saa moja asubuhi.',
    ),
    phrases: [
      Phrase(
        id: 'sw_routine_0',
        target: 'Ninaamka saa moja asubuhi.', // TODO: native review
        gloss: {
          UiLang.tr: 'Genelde sabah saat yedide kalkarım.',
          UiLang.en: 'I usually wake up at seven in the morning.',
        },
      ),
      Phrase(
        id: 'sw_routine_1',
        target: 'Anaoga kila asubuhi.', // TODO: native review
        gloss: {
          UiLang.tr: 'Her sabah duş alır.',
          UiLang.en: 'She showers every morning.',
        },
      ),
      Phrase(
        id: 'sw_routine_2',
        target: 'Tunakula kifungua kinywa pamoja.', // TODO: native review
        gloss: {
          UiLang.tr: 'Birlikte kahvaltı yaparız.',
          UiLang.en: 'We have breakfast together.',
        },
      ),
      Phrase(
        id: 'sw_routine_3',
        target: 'Anaenda kazini kwa baiskeli.', // TODO: native review
        gloss: {
          UiLang.tr: 'İşe bisikletle gider.',
          UiLang.en: 'He goes to work by bicycle.',
        },
      ),
      Phrase(
        id: 'sw_routine_4',
        target: 'Ninapiga mswaki mara mbili kwa siku.', // TODO: native review
        gloss: {
          UiLang.tr: 'Günde iki kez dişlerimi fırçalarım.',
          UiLang.en: 'I brush my teeth twice a day.',
        },
      ),
      Phrase(
        id: 'sw_routine_5',
        target: 'Kawaida wanalala usiku sana.', // TODO: native review
        gloss: {
          UiLang.tr: 'Genelde geç yatarlar.',
          UiLang.en: 'They usually go to bed late.',
        },
      ),
      Phrase(
        id: 'sw_routine_6',
        target: 'Jumapili ninaamka mchana.', // TODO: native review
        gloss: {
          UiLang.tr: 'Pazar günleri geç kalkarım.',
          UiLang.en: 'On Sundays I wake up late.',
        },
      ),
    ],
    turns: [
      SpeakTurn(
        prompt: 'Someone asks about your morning.',
        expected: 'Ninaamka saa moja asubuhi.',
      ),
      SpeakTurn(
        prompt: "You describe your sister's routine.",
        expected: 'Anaoga kila asubuhi.',
      ),
      SpeakTurn(
        prompt: "You talk about your family's mornings.",
        expected: 'Tunakula kifungua kinywa pamoja.',
      ),
      SpeakTurn(
        prompt: "You describe your brother's commute.",
        expected: 'Anaenda kazini kwa baiskeli.',
      ),
      SpeakTurn(
        prompt: "You're talking about hygiene habits.",
        expected: 'Ninapiga mswaki mara mbili kwa siku.',
      ),
      SpeakTurn(
        prompt: 'You describe your roommates.',
        expected: 'Kawaida wanalala usiku sana.',
      ),
      SpeakTurn(
        prompt: 'Someone asks about your weekend.',
        expected: 'Jumapili ninaamka mchana.',
      ),
    ],
  ),
  Scenario(
    id: 'sw_past_story',
    lang: LearnLang.sw,
    cefr: Cefr.a1,
    minutes: 7,
    titles: {UiLang.tr: 'Bir olayı anlatmak', UiLang.en: 'Telling a story'},
    clipLine: 'Jana nilienda sokoni.',
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr:
            'Geçmiş zaman, fiildeki "-na-" yerine gelen "-li-" ekiyle gösterilir.',
        UiLang.en:
            'Past tense is marked by replacing "-na-" with "-li-" inside the verb.',
      },
      goodExample: 'Jana nilienda sokoni.',
      badExample: 'Jana ninaenda sokoni.',
    ),
    phrases: [
      Phrase(
        id: 'sw_past_story_0',
        target: 'Jana nilienda sokoni.', // TODO: native review
        gloss: {
          UiLang.tr: 'Dün pazara gittim.',
          UiLang.en: 'Yesterday I went to the market.',
        },
      ),
      Phrase(
        id: 'sw_past_story_1',
        target: 'Nilinunua mboga safi.', // TODO: native review
        gloss: {
          UiLang.tr: 'Taze sebze aldım.',
          UiLang.en: 'I bought fresh vegetables.',
        },
      ),
      Phrase(
        id: 'sw_past_story_2',
        target: 'Kisha nilikutana na rafiki wa zamani.', // TODO: native review
        gloss: {
          UiLang.tr: 'Sonra eski bir arkadaşımla karşılaştım.',
          UiLang.en: 'Then I met an old friend.',
        },
      ),
      Phrase(
        id: 'sw_past_story_3',
        target: 'Tulizungumza kwa saa moja.', // TODO: native review
        gloss: {
          UiLang.tr: 'Bir saat konuştuk.',
          UiLang.en: 'We talked for an hour.',
        },
      ),
      Phrase(
        id: 'sw_past_story_4',
        target:
            'Nilipoteza mkoba wangu njiani kurudi nyumbani.', // TODO: native review
        gloss: {
          UiLang.tr: 'Eve dönerken çantamı kaybettim.',
          UiLang.en: 'I lost my bag on the way home.',
        },
      ),
      Phrase(
        id: 'sw_past_story_5',
        target: 'Kwa bahati nzuri, mtu aliupata.', // TODO: native review
        gloss: {
          UiLang.tr: 'Neyse ki biri onu buldu.',
          UiLang.en: 'Luckily, someone found it.',
        },
      ),
      Phrase(
        id: 'sw_past_story_6',
        target: 'Ilikuwa siku ya ajabu!', // TODO: native review
        gloss: {
          UiLang.tr: 'Çılgın bir gündü!',
          UiLang.en: 'It was a crazy day!',
        },
      ),
    ],
    turns: [
      SpeakTurn(
        prompt: "You're telling a friend about your day.",
        expected: 'Jana nilienda sokoni.',
      ),
      SpeakTurn(
        prompt: 'You continue the story.',
        expected: 'Nilinunua mboga safi.',
      ),
      SpeakTurn(
        prompt: 'Something unexpected happened.',
        expected: 'Kisha nilikutana na rafiki wa zamani.',
      ),
      SpeakTurn(
        prompt: 'You describe the encounter.',
        expected: 'Tulizungumza kwa saa moja.',
      ),
      SpeakTurn(
        prompt: 'Something went wrong.',
        expected: 'Nilipoteza mkoba wangu njiani kurudi nyumbani.',
      ),
      SpeakTurn(
        prompt: 'It has a happy ending.',
        expected: 'Kwa bahati nzuri, mtu aliupata.',
      ),
      SpeakTurn(
        prompt: "You're wrapping up the story.",
        expected: 'Ilikuwa siku ya ajabu!',
      ),
    ],
  ),

  // ===================== HUNGARIAN =====================
  Scenario(
    id: 'hu_intro',
    lang: LearnLang.hu,
    cefr: Cefr.a1,
    minutes: 7,
    titles: {UiLang.tr: 'Tanışma', UiLang.en: 'Meeting someone'},
    clipLine: 'Örülök, hogy megismerhetlek.',
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr:
            'Fiil kişiye göre çekimlenir: "ben" = vagyok. "van" yalnızca üçüncü şahıs içindir (ve "o bir öğretmen" derken hiç söylenmez). Zamir "én" genelde düşer: "Tanár vagyok."',
        UiLang.en:
            'The verb is conjugated for the person: "I am" = vagyok; "van" is only third person. The pronoun "én" is usually dropped: "Tanár vagyok."',
      },
      goodExample: 'Tanár vagyok.',
      badExample: 'Én tanár van.',
    ),
    phrases: [
      Phrase(
        id: 'hu_intro_0',
        target: 'Szia, örülök, hogy megismerhetlek.',
        gloss: {
          UiLang.tr: 'Merhaba, tanıştığımıza memnun oldum.',
          UiLang.en: 'Hi, nice to meet you.',
        },
      ),
      Phrase(
        id: 'hu_intro_1',
        target: 'Hogy hívnak?',
        gloss: {UiLang.tr: 'Adın ne?', UiLang.en: "What's your name?"},
      ),
      Phrase(
        id: 'hu_intro_2',
        target: 'Kata vagyok, és téged?',
        gloss: {
          UiLang.tr: 'Ben Kata, ya sen?',
          UiLang.en: "I'm Kata, and you?",
        },
      ),
      Phrase(
        id: 'hu_intro_3',
        target: 'Mivel foglalkozol?',
        gloss: {UiLang.tr: 'Ne iş yapıyorsun?', UiLang.en: 'What do you do?'},
      ),
      Phrase(
        id: 'hu_intro_4',
        target: 'Tanár vagyok.',
        gloss: {UiLang.tr: 'Öğretmenim.', UiLang.en: "I'm a teacher."},
      ),
      Phrase(
        id: 'hu_intro_5',
        target: 'Elkérhetem a számod?',
        gloss: {
          UiLang.tr: 'Numaranı alabilir miyim?',
          UiLang.en: 'Can I get your number?',
        },
      ),
      Phrase(
        id: 'hu_intro_6',
        target: 'Hamarosan találkozunk!',
        gloss: {UiLang.tr: 'Yakında görüşürüz!', UiLang.en: 'See you soon!'},
      ),
    ],
    turns: [
      SpeakTurn(
        prompt: 'You just met someone new.',
        expected: 'Szia, örülök, hogy megismerhetlek.',
      ),
      SpeakTurn(
        prompt: 'You want to know their name.',
        expected: 'Hogy hívnak?',
      ),
      SpeakTurn(
        prompt: 'They ask for your name back.',
        expected: 'Kata vagyok, és téged?',
      ),
      SpeakTurn(
        prompt: "You're curious about their job.",
        expected: 'Mivel foglalkozol?',
      ),
      SpeakTurn(prompt: 'They ask what you do.', expected: 'Tanár vagyok.'),
      SpeakTurn(
        prompt: 'You want to stay in touch.',
        expected: 'Elkérhetem a számod?',
      ),
      SpeakTurn(
        prompt: "You're saying goodbye.",
        expected: 'Hamarosan találkozunk!',
      ),
    ],
  ),
  Scenario(
    id: 'hu_shopping',
    lang: LearnLang.hu,
    cefr: Cefr.a1,
    minutes: 7,
    titles: {UiLang.tr: 'Alışveriş', UiLang.en: 'Shopping'},
    clipLine: 'Fizethetek kártyával?',
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr:
            '"-val/-vel" (ile) eki isme doğrudan eklenir ve ünlü uyumuna uyar: kártyával (kartla), készpénzzel (nakitle).',
        UiLang.en:
            'The suffix "-val/-vel" (with) attaches directly to the noun and follows vowel harmony: kártyával (with card), készpénzzel (with cash).',
      },
      goodExample: 'Fizethetek kártyával?',
      badExample: 'Fizethetek val kártya?',
    ),
    phrases: [
      Phrase(
        id: 'hu_shopping_0',
        target: 'Csak nézelődöm, köszönöm.',
        gloss: {
          UiLang.tr: 'Sadece bakıyorum, teşekkürler.',
          UiLang.en: "I'm just looking, thanks.",
        },
      ),
      Phrase(
        id: 'hu_shopping_1',
        target: 'Megvan ez 40-es méretben?',
        gloss: {
          UiLang.tr: 'Bunun 40 numarası var mı?',
          UiLang.en: 'Do you have this in a size 40?',
        },
      ),
      Phrase(
        id: 'hu_shopping_2',
        target: 'Felpróbálhatom?',
        gloss: {UiLang.tr: 'Deneyebilir miyim?', UiLang.en: 'Can I try it on?'},
      ),
      Phrase(
        id: 'hu_shopping_3',
        target: 'Mennyibe kerül ez a cipő?',
        gloss: {
          UiLang.tr: 'Bu ayakkabı ne kadar?',
          UiLang.en: 'How much is this shoe?',
        },
      ),
      Phrase(
        id: 'hu_shopping_4',
        target: 'Fizethetek kártyával?',
        gloss: {
          UiLang.tr: 'Kartla ödeyebilir miyim?',
          UiLang.en: 'Can I pay by card?',
        },
      ),
      Phrase(
        id: 'hu_shopping_5',
        target: 'Ez túl drága.',
        gloss: {
          UiLang.tr: 'Bu çok pahalı.',
          UiLang.en: 'This is too expensive.',
        },
      ),
      Phrase(
        id: 'hu_shopping_6',
        target: 'Van kisebb méret?',
        gloss: {
          UiLang.tr: 'Daha küçük beden var mı?',
          UiLang.en: 'Is there a smaller size?',
        },
      ),
      Phrase(
        id: 'hu_shopping_7',
        target: 'Ezt elviszem.',
        gloss: {UiLang.tr: 'Bunu alıyorum.', UiLang.en: "I'll take this."},
      ),
    ],
    turns: [
      SpeakTurn(
        prompt: 'A clerk asks if you need help.',
        expected: 'Csak nézelődöm, köszönöm.',
      ),
      SpeakTurn(
        prompt: 'You found something you like.',
        expected: 'Megvan ez 40-es méretben?',
      ),
      SpeakTurn(
        prompt: 'You want to test the fit.',
        expected: 'Felpróbálhatom?',
      ),
      SpeakTurn(
        prompt: "You're checking the price.",
        expected: 'Mennyibe kerül ez a cipő?',
      ),
      SpeakTurn(
        prompt: "You're ready to pay.",
        expected: 'Fizethetek kártyával?',
      ),
      SpeakTurn(
        prompt: 'You think the price is high.',
        expected: 'Ez túl drága.',
      ),
      SpeakTurn(prompt: "It doesn't fit.", expected: 'Van kisebb méret?'),
      SpeakTurn(prompt: "You've decided to buy it.", expected: 'Ezt elviszem.'),
    ],
  ),
  Scenario(
    id: 'hu_numbers_time',
    lang: LearnLang.hu,
    cefr: Cefr.a1,
    minutes: 7,
    titles: {UiLang.tr: 'Sayılar ve saat', UiLang.en: 'Numbers and time'},
    clipLine: 'Most fél négy van.',
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr:
            '"Fél" (yarım) ile saat söylenirken bir sonraki saat kullanılır: "fél négy" saat 3:30 demektir, 4:30 değil.',
        UiLang.en:
            'With "fél" (half), Hungarian names the NEXT hour: "fél négy" (half four) means 3:30, not 4:30.',
      },
      goodExample: 'Most fél négy van.',
      badExample: 'Most négy és fél van.',
    ),
    phrases: [
      Phrase(
        id: 'hu_numbers_time_0',
        target: 'Hány óra van most?',
        gloss: {
          UiLang.tr: 'Şimdi saat kaç?',
          UiLang.en: 'What time is it now?',
        },
      ),
      Phrase(
        id: 'hu_numbers_time_1',
        target: 'Most fél négy van.',
        gloss: {
          UiLang.tr: 'Şimdi saat üç buçuk.',
          UiLang.en: "It's half past three now.",
        },
      ),
      Phrase(
        id: 'hu_numbers_time_2',
        target: 'A vonat kilenckor indul.',
        gloss: {
          UiLang.tr: 'Tren dokuzda kalkıyor.',
          UiLang.en: 'The train leaves at nine.',
        },
      ),
      Phrase(
        id: 'hu_numbers_time_3',
        target: 'Két jegyem van.',
        gloss: {
          UiLang.tr: 'İki biletim var.',
          UiLang.en: 'I have two tickets.',
        },
      ),
      Phrase(
        id: 'hu_numbers_time_4',
        target: 'Ez tizenkét euróba kerül.',
        gloss: {
          UiLang.tr: 'Bu on iki avroya mal oluyor.',
          UiLang.en: 'That comes to twelve euros.',
        },
      ),
      Phrase(
        id: 'hu_numbers_time_5',
        target: 'Találkozzunk ötkor?',
        gloss: {
          UiLang.tr: 'Beşte buluşalım mı?',
          UiLang.en: 'Shall we meet at five?',
        },
      ),
      Phrase(
        id: 'hu_numbers_time_6',
        target: 'Tíz perc múlva ott vagyok.',
        gloss: {
          UiLang.tr: 'On dakikaya orada olurum.',
          UiLang.en: "I'll be there in ten minutes.",
        },
      ),
    ],
    turns: [
      SpeakTurn(
        prompt: "You don't know the time.",
        expected: 'Hány óra van most?',
      ),
      SpeakTurn(
        prompt: 'Someone asks you the time.',
        expected: 'Most fél négy van.',
      ),
      SpeakTurn(
        prompt: "You're checking the schedule.",
        expected: 'A vonat kilenckor indul.',
      ),
      SpeakTurn(prompt: 'At the counter.', expected: 'Két jegyem van.'),
      SpeakTurn(
        prompt: 'The clerk tells you the price.',
        expected: 'Ez tizenkét euróba kerül.',
      ),
      SpeakTurn(
        prompt: "You're planning to meet a friend.",
        expected: 'Találkozzunk ötkor?',
      ),
      SpeakTurn(
        prompt: "You're running a bit late.",
        expected: 'Tíz perc múlva ott vagyok.',
      ),
    ],
  ),
  Scenario(
    id: 'hu_family',
    lang: LearnLang.hu,
    cefr: Cefr.a1,
    minutes: 7,
    titles: {UiLang.tr: 'Aile', UiLang.en: 'Family'},
    clipLine: 'Ez itt a családom.',
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr:
            'İyelik ayrı bir kelime değil, isme eklenen bir ekle gösterilir: anya (anne) + m = anyám (annem).',
        UiLang.en:
            'Possession is shown by a suffix on the noun itself, not a separate word: anya (mother) + m = anyám (my mother).',
      },
      goodExample: 'Anyám orvos.',
      badExample: 'Az én anya orvos.',
    ),
    phrases: [
      Phrase(
        id: 'hu_family_0',
        target: 'Ez itt a családom.',
        gloss: {UiLang.tr: 'Bu benim ailem.', UiLang.en: 'This is my family.'},
      ),
      Phrase(
        id: 'hu_family_1',
        target: 'Két öcsém és egy nővérem van.',
        gloss: {
          UiLang.tr: 'İki küçük erkek kardeşim ve bir büyük kız kardeşim var.',
          UiLang.en: 'I have two younger brothers and one older sister.',
        },
      ),
      Phrase(
        id: 'hu_family_2',
        target: 'Anyám orvos.',
        gloss: {
          UiLang.tr: 'Annem doktor.',
          UiLang.en: 'My mother is a doctor.',
        },
      ),
      Phrase(
        id: 'hu_family_3',
        target: 'Nagyon szereti az öccsét.',
        gloss: {
          UiLang.tr: 'Küçük kardeşini çok seviyor.',
          UiLang.en: 'She loves her little brother a lot.',
        },
      ),
      Phrase(
        id: 'hu_family_4',
        target: 'Hány éves a lányod?',
        gloss: {
          UiLang.tr: 'Kızın kaç yaşında?',
          UiLang.en: 'How old is your daughter?',
        },
      ),
      Phrase(
        id: 'hu_family_5',
        target: 'A szüleim Szegeden élnek.',
        gloss: {
          UiLang.tr: "Ailem Szeged'de yaşıyor.",
          UiLang.en: 'My parents live in Szeged.',
        },
      ),
      Phrase(
        id: 'hu_family_6',
        target: 'Vannak gyerekeid?',
        gloss: {UiLang.tr: 'Çocuğun var mı?', UiLang.en: 'Do you have kids?'},
      ),
    ],
    turns: [
      SpeakTurn(
        prompt: "You're showing a photo.",
        expected: 'Ez itt a családom.',
      ),
      SpeakTurn(
        prompt: 'Someone asks about your siblings.',
        expected: 'Két öcsém és egy nővérem van.',
      ),
      SpeakTurn(
        prompt: 'They ask what your mother does.',
        expected: 'Anyám orvos.',
      ),
      SpeakTurn(
        prompt: "You're talking about your sister.",
        expected: 'Nagyon szereti az öccsét.',
      ),
      SpeakTurn(
        prompt: "You want to know a friend's daughter's age.",
        expected: 'Hány éves a lányod?',
      ),
      SpeakTurn(
        prompt: 'They ask where your parents live.',
        expected: 'A szüleim Szegeden élnek.',
      ),
      SpeakTurn(
        prompt: "You're asking a new friend.",
        expected: 'Vannak gyerekeid?',
      ),
    ],
  ),
  Scenario(
    id: 'hu_weather',
    lang: LearnLang.hu,
    cefr: Cefr.a1,
    minutes: 7,
    titles: {UiLang.tr: 'Hava durumu', UiLang.en: 'Weather'},
    clipLine: 'Esik ma, vigyél esernyőt.',
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr:
            'Hava durumu ifadelerinde İngilizce\'deki "it" gibi bir özne yoktur; fiil öznesiz üçüncü tekil şahısta kullanılır.',
        UiLang.en:
            'Weather expressions have no dummy subject like English "it" — the verb simply stands alone in third-person singular.',
      },
      goodExample: 'Esik ma.',
      badExample: 'Az esik ma.',
    ),
    phrases: [
      Phrase(
        id: 'hu_weather_0',
        target: 'Milyen ma az idő?',
        gloss: {
          UiLang.tr: 'Bugün hava nasıl?',
          UiLang.en: "What's the weather like today?",
        },
      ),
      Phrase(
        id: 'hu_weather_1',
        target: 'Esik ma.',
        gloss: {
          UiLang.tr: 'Bugün yağmur yağıyor.',
          UiLang.en: "It's raining today.",
        },
      ),
      Phrase(
        id: 'hu_weather_2',
        target: 'Nagyon meleg van kint.',
        gloss: {
          UiLang.tr: 'Dışarısı çok sıcak.',
          UiLang.en: "It's very hot outside.",
        },
      ),
      Phrase(
        id: 'hu_weather_3',
        target: 'Vigyél esernyőt, lehet, hogy esik.',
        gloss: {
          UiLang.tr: 'Şemsiye al, yağmur yağabilir.',
          UiLang.en: 'Take an umbrella, it might rain.',
        },
      ),
      Phrase(
        id: 'hu_weather_4',
        target: 'Nagyon hideg van ma reggel.',
        gloss: {
          UiLang.tr: 'Bu sabah çok soğuk.',
          UiLang.en: "It's very cold this morning.",
        },
      ),
      Phrase(
        id: 'hu_weather_5',
        target: 'Szeretem a napos napokat.',
        gloss: {
          UiLang.tr: 'Güneşli günleri severim.',
          UiLang.en: 'I love sunny days.',
        },
      ),
      Phrase(
        id: 'hu_weather_6',
        target: 'Szeles van ma?',
        gloss: {
          UiLang.tr: 'Bugün rüzgarlı mı?',
          UiLang.en: 'Is it windy today?',
        },
      ),
    ],
    turns: [
      SpeakTurn(
        prompt: "You're about to go outside.",
        expected: 'Milyen ma az idő?',
      ),
      SpeakTurn(
        prompt: 'Someone asks about the weather.',
        expected: 'Esik ma.',
      ),
      SpeakTurn(
        prompt: 'You step outside.',
        expected: 'Nagyon meleg van kint.',
      ),
      SpeakTurn(
        prompt: 'Your friend is leaving the house.',
        expected: 'Vigyél esernyőt, lehet, hogy esik.',
      ),
      SpeakTurn(
        prompt: 'You wake up and check the window.',
        expected: 'Nagyon hideg van ma reggel.',
      ),
      SpeakTurn(
        prompt: "You're talking about your favorite weather.",
        expected: 'Szeretem a napos napokat.',
      ),
      SpeakTurn(
        prompt: "You're deciding what to wear.",
        expected: 'Szeles van ma?',
      ),
    ],
  ),
  Scenario(
    id: 'hu_transport',
    lang: LearnLang.hu,
    cefr: Cefr.a1,
    minutes: 7,
    titles: {UiLang.tr: 'Ulaşım', UiLang.en: 'Getting around'},
    clipLine: 'Hol a legközelebbi buszmegálló?',
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr:
            '"-ba/-be" eki bir yere doğru hareketi gösterir ("a városba" - şehre), "-ban/-ben" ise sadece bir yerde bulunmayı gösterir ("a városban" - şehirde).',
        UiLang.en:
            '"-ba/-be" (into) shows movement toward a place ("a városba" - to the city), while "-ban/-ben" (in) shows just being located there ("a városban" - in the city).',
      },
      goodExample: 'Egy jegyet a városba, legyen szíves.',
      badExample: 'Egy jegyet a városban, legyen szíves.',
    ),
    phrases: [
      Phrase(
        id: 'hu_transport_0',
        target: 'Hol a legközelebbi buszmegálló?',
        gloss: {
          UiLang.tr: 'En yakın otobüs durağı nerede?',
          UiLang.en: "Where's the nearest bus stop?",
        },
      ),
      Phrase(
        id: 'hu_transport_1',
        target: 'Busszal járok dolgozni.',
        gloss: {
          UiLang.tr: 'İşe otobüsle gidiyorum.',
          UiLang.en: 'I go to work by bus.',
        },
      ),
      Phrase(
        id: 'hu_transport_2',
        target: 'Melyik vágányról indul?',
        gloss: {
          UiLang.tr: 'Hangi perondan kalkıyor?',
          UiLang.en: 'Which platform does it leave from?',
        },
      ),
      Phrase(
        id: 'hu_transport_3',
        target: 'Egy jegyet a városba, legyen szíves.',
        gloss: {
          UiLang.tr: 'Şehir merkezine bir bilet lütfen.',
          UiLang.en: 'One ticket to the city center, please.',
        },
      ),
      Phrase(
        id: 'hu_transport_4',
        target: 'Ez a vonat megáll a reptérnél?',
        gloss: {
          UiLang.tr: 'Bu tren havalimanında duruyor mu?',
          UiLang.en: 'Does this train stop at the airport?',
        },
      ),
      Phrase(
        id: 'hu_transport_5',
        target: 'Taxira van szükségem.',
        gloss: {
          UiLang.tr: 'Taksiye ihtiyacım var.',
          UiLang.en: 'I need a taxi.',
        },
      ),
      Phrase(
        id: 'hu_transport_6',
        target: 'Mennyi ideig tart az út?',
        gloss: {
          UiLang.tr: 'Yolculuk ne kadar sürüyor?',
          UiLang.en: 'How long does the trip take?',
        },
      ),
      Phrase(
        id: 'hu_transport_7',
        target: 'Inkább gyalog megyek.',
        gloss: {
          UiLang.tr: 'Yürüyerek gitmeyi tercih ederim.',
          UiLang.en: "I'd rather walk.",
        },
      ),
    ],
    turns: [
      SpeakTurn(
        prompt: 'You need to find a bus.',
        expected: 'Hol a legközelebbi buszmegálló?',
      ),
      SpeakTurn(
        prompt: 'Someone asks how you commute.',
        expected: 'Busszal járok dolgozni.',
      ),
      SpeakTurn(
        prompt: "You're at the train station.",
        expected: 'Melyik vágányról indul?',
      ),
      SpeakTurn(
        prompt: 'At the ticket counter.',
        expected: 'Egy jegyet a városba, legyen szíves.',
      ),
      SpeakTurn(
        prompt: "You're not sure of the route.",
        expected: 'Ez a vonat megáll a reptérnél?',
      ),
      SpeakTurn(
        prompt: 'You missed the last bus.',
        expected: 'Taxira van szükségem.',
      ),
      SpeakTurn(
        prompt: "You're asking about travel time.",
        expected: 'Mennyi ideig tart az út?',
      ),
      SpeakTurn(
        prompt: "It's a short distance.",
        expected: 'Inkább gyalog megyek.',
      ),
    ],
  ),
  Scenario(
    id: 'hu_emergency',
    lang: LearnLang.hu,
    cefr: Cefr.a1,
    minutes: 7,
    titles: {UiLang.tr: 'Acil durum', UiLang.en: 'Emergency'},
    clipLine: 'Segítség! Hívjon mentőt!',
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr:
            'Buyurma kipi fiil sonuna eklenen bir ekle kurulur: resmi "ön" için "-jon/-jen", senli "sen" için "-j".',
        UiLang.en:
            'The imperative is formed by changing the verb ending: formal "you" takes "-jon/-jen", informal "you" takes "-j".',
      },
      goodExample: 'Hívjon mentőt!',
      badExample: 'Hív mentőt!',
    ),
    phrases: [
      Phrase(
        id: 'hu_emergency_0',
        target: 'Segítség! Hívjon mentőt!',
        gloss: {
          UiLang.tr: 'İmdat! Ambulans çağırın!',
          UiLang.en: 'Help! Call an ambulance!',
        },
      ),
      Phrase(
        id: 'hu_emergency_1',
        target: 'Történt egy baleset.',
        gloss: {
          UiLang.tr: 'Bir kaza oldu.',
          UiLang.en: "There's been an accident.",
        },
      ),
      Phrase(
        id: 'hu_emergency_2',
        target: 'Most azonnal orvosra van szükségem.',
        gloss: {
          UiLang.tr: 'Şimdi bir doktora ihtiyacım var.',
          UiLang.en: 'I need a doctor right now.',
        },
      ),
      Phrase(
        id: 'hu_emergency_3',
        target: 'Hol a legközelebbi kórház?',
        gloss: {
          UiLang.tr: 'En yakın hastane nerede?',
          UiLang.en: "Where's the nearest hospital?",
        },
      ),
      Phrase(
        id: 'hu_emergency_4',
        target: 'Valaki ellopta a táskámat.',
        gloss: {
          UiLang.tr: 'Biri çantamı çaldı.',
          UiLang.en: 'Someone stole my bag.',
        },
      ),
      Phrase(
        id: 'hu_emergency_5',
        target: 'Allergiás vagyok a penicillinre.',
        gloss: {
          UiLang.tr: 'Penisiline alerjim var.',
          UiLang.en: "I'm allergic to penicillin.",
        },
      ),
      Phrase(
        id: 'hu_emergency_6',
        target: 'Kérem, hívja a rendőrséget.',
        gloss: {
          UiLang.tr: 'Lütfen polisi arayın.',
          UiLang.en: 'Please call the police.',
        },
      ),
      Phrase(
        id: 'hu_emergency_7',
        target: 'Eltévedtem, tudna segíteni?',
        gloss: {
          UiLang.tr: 'Kayboldum, bana yardım edebilir misiniz?',
          UiLang.en: "I'm lost, can you help me?",
        },
      ),
    ],
    turns: [
      SpeakTurn(
        prompt: 'You see someone collapse.',
        expected: 'Segítség! Hívjon mentőt!',
      ),
      SpeakTurn(
        prompt: 'You call emergency services.',
        expected: 'Történt egy baleset.',
      ),
      SpeakTurn(
        prompt: 'You describe the urgency.',
        expected: 'Most azonnal orvosra van szükségem.',
      ),
      SpeakTurn(
        prompt: 'You need directions fast.',
        expected: 'Hol a legközelebbi kórház?',
      ),
      SpeakTurn(
        prompt: "You're reporting a theft.",
        expected: 'Valaki ellopta a táskámat.',
      ),
      SpeakTurn(
        prompt: 'A doctor asks about allergies.',
        expected: 'Allergiás vagyok a penicillinre.',
      ),
      SpeakTurn(
        prompt: 'You need official help.',
        expected: 'Kérem, hívja a rendőrséget.',
      ),
      SpeakTurn(
        prompt: "You don't know where you are.",
        expected: 'Eltévedtem, tudna segíteni?',
      ),
    ],
  ),
  Scenario(
    id: 'hu_routine',
    lang: LearnLang.hu,
    cefr: Cefr.a1,
    minutes: 7,
    titles: {UiLang.tr: 'Günlük rutin', UiLang.en: 'Daily routine'},
    clipLine: 'Általában hétkor kelek.',
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr:
            '"Mindig" (her zaman) gibi zaman zarfları cümle sonunda değil, doğrudan fiilden önce kullanılır.',
        UiLang.en:
            'Frequency adverbs like "mindig" (always) go directly before the verb, not at the end of the sentence.',
      },
      goodExample: 'Mindig hétkor kelek.',
      badExample: 'Kelek hétkor mindig.',
    ),
    phrases: [
      Phrase(
        id: 'hu_routine_0',
        target: 'Általában hétkor kelek.',
        gloss: {
          UiLang.tr: 'Genelde saat yedide kalkarım.',
          UiLang.en: 'I usually wake up at seven.',
        },
      ),
      Phrase(
        id: 'hu_routine_1',
        target: 'Minden reggel zuhanyzik.',
        gloss: {
          UiLang.tr: 'Her sabah duş alır.',
          UiLang.en: 'She showers every morning.',
        },
      ),
      Phrase(
        id: 'hu_routine_2',
        target: 'Együtt reggelizünk.',
        gloss: {
          UiLang.tr: 'Birlikte kahvaltı yaparız.',
          UiLang.en: 'We have breakfast together.',
        },
      ),
      Phrase(
        id: 'hu_routine_3',
        target: 'Biciklivel jár dolgozni.',
        gloss: {
          UiLang.tr: 'İşe bisikletle gider.',
          UiLang.en: 'He goes to work by bike.',
        },
      ),
      Phrase(
        id: 'hu_routine_4',
        target: 'Naponta kétszer fogat mosok.',
        gloss: {
          UiLang.tr: 'Günde iki kez dişlerimi fırçalarım.',
          UiLang.en: 'I brush my teeth twice a day.',
        },
      ),
      Phrase(
        id: 'hu_routine_5',
        target: 'Általában későn fekszenek le.',
        gloss: {
          UiLang.tr: 'Genelde geç yatarlar.',
          UiLang.en: 'They usually go to bed late.',
        },
      ),
      Phrase(
        id: 'hu_routine_6',
        target: 'Vasárnaponként sokáig alszom.',
        gloss: {
          UiLang.tr: 'Pazar günleri geç kalkarım.',
          UiLang.en: 'On Sundays I sleep in.',
        },
      ),
    ],
    turns: [
      SpeakTurn(
        prompt: 'Someone asks about your morning.',
        expected: 'Általában hétkor kelek.',
      ),
      SpeakTurn(
        prompt: "You describe your sister's routine.",
        expected: 'Minden reggel zuhanyzik.',
      ),
      SpeakTurn(
        prompt: "You talk about your family's mornings.",
        expected: 'Együtt reggelizünk.',
      ),
      SpeakTurn(
        prompt: "You describe your brother's commute.",
        expected: 'Biciklivel jár dolgozni.',
      ),
      SpeakTurn(
        prompt: "You're talking about hygiene habits.",
        expected: 'Naponta kétszer fogat mosok.',
      ),
      SpeakTurn(
        prompt: 'You describe your roommates.',
        expected: 'Általában későn fekszenek le.',
      ),
      SpeakTurn(
        prompt: 'Someone asks about your weekend.',
        expected: 'Vasárnaponként sokáig alszom.',
      ),
    ],
  ),
  Scenario(
    id: 'hu_past_story',
    lang: LearnLang.hu,
    cefr: Cefr.a1,
    minutes: 7,
    titles: {UiLang.tr: 'Bir olayı anlatmak', UiLang.en: 'Telling a story'},
    clipLine: 'Tegnap elmentem a piacra.',
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr: 'Geçmiş zaman, fiil köküne eklenen "-t/-tt" ekiyle kurulur.',
        UiLang.en:
            'The past tense is formed by adding the suffix "-t/-tt" to the verb stem.',
      },
      goodExample: 'Tegnap elmentem a piacra.',
      badExample: 'Tegnap elmegyek a piacra.',
    ),
    phrases: [
      Phrase(
        id: 'hu_past_story_0',
        target: 'Tegnap elmentem a piacra.',
        gloss: {
          UiLang.tr: 'Dün pazara gittim.',
          UiLang.en: 'Yesterday I went to the market.',
        },
      ),
      Phrase(
        id: 'hu_past_story_1',
        target: 'Vettem friss zöldséget.',
        gloss: {
          UiLang.tr: 'Taze sebze aldım.',
          UiLang.en: 'I bought fresh vegetables.',
        },
      ),
      Phrase(
        id: 'hu_past_story_2',
        target: 'Aztán találkoztam egy régi barátommal.',
        gloss: {
          UiLang.tr: 'Sonra eski bir arkadaşımla karşılaştım.',
          UiLang.en: 'Then I met an old friend of mine.',
        },
      ),
      Phrase(
        id: 'hu_past_story_3',
        target: 'Egy órát beszélgettünk.',
        gloss: {
          UiLang.tr: 'Bir saat konuştuk.',
          UiLang.en: 'We talked for an hour.',
        },
      ),
      Phrase(
        id: 'hu_past_story_4',
        target: 'Elvesztettem a pénztárcámat hazafelé.',
        gloss: {
          UiLang.tr: 'Eve dönerken cüzdanımı kaybettim.',
          UiLang.en: 'I lost my wallet on the way home.',
        },
      ),
      Phrase(
        id: 'hu_past_story_5',
        target: 'Szerencsére valaki megtalálta.',
        gloss: {
          UiLang.tr: 'Neyse ki biri buldu.',
          UiLang.en: 'Luckily, someone found it.',
        },
      ),
      Phrase(
        id: 'hu_past_story_6',
        target: 'Ez egy őrült nap volt!',
        gloss: {
          UiLang.tr: 'Çılgın bir gündü!',
          UiLang.en: 'It was a crazy day!',
        },
      ),
    ],
    turns: [
      SpeakTurn(
        prompt: "You're telling a friend about your day.",
        expected: 'Tegnap elmentem a piacra.',
      ),
      SpeakTurn(
        prompt: 'You continue the story.',
        expected: 'Vettem friss zöldséget.',
      ),
      SpeakTurn(
        prompt: 'Something unexpected happened.',
        expected: 'Aztán találkoztam egy régi barátommal.',
      ),
      SpeakTurn(
        prompt: 'You describe the encounter.',
        expected: 'Egy órát beszélgettünk.',
      ),
      SpeakTurn(
        prompt: 'Something went wrong.',
        expected: 'Elvesztettem a pénztárcámat hazafelé.',
      ),
      SpeakTurn(
        prompt: 'It has a happy ending.',
        expected: 'Szerencsére valaki megtalálta.',
      ),
      SpeakTurn(
        prompt: "You're wrapping up the story.",
        expected: 'Ez egy őrült nap volt!',
      ),
    ],
  ),
];
