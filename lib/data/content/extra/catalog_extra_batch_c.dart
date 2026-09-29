// Batch C — missing A1 topics for French, Italian, Romanian.
// Topics: intro, shopping, numbers_time, family, weather, transport,
// emergency, routine, past_story (per docs/ICERIK_URETIM_BRIEFI.md §2).
// ignore_for_file: lines_longer_than_80_chars

import "../../models/models.dart";

final List<Scenario> catalogExtraBatchC = [
  // ===================== FRENCH =====================
  Scenario(
    id: "fr_intro",
    lang: LearnLang.fr,
    cefr: Cefr.a1,
    minutes: 7,
    titles: {UiLang.tr: "Tanışma", UiLang.en: "Introductions"},
    clipLine: "Je m'appelle Ali.",
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr:
            "Adım ... derken fiilin önüne m' refleksif zamiri gelir: Je m'appelle, Je appelle değil.",
        UiLang.en:
            "To be called needs the reflexive pronoun me (m'): say Je m'appelle, never Je appelle.",
      },
      goodExample: "Je m'appelle Léa.",
      badExample: "Je appelle Léa.",
    ),
    phrases: [
      Phrase(
        id: "fr_intro_0",
        target: "Bonjour, enchanté !",
        gloss: {
          UiLang.tr: "Merhaba, memnun oldum!",
          UiLang.en: "Hello, nice to meet you!",
        },
      ),
      Phrase(
        id: "fr_intro_1",
        target: "Comment tu t'appelles ?",
        gloss: {UiLang.tr: "Adın ne?", UiLang.en: "What's your name?"},
      ),
      Phrase(
        id: "fr_intro_2",
        target: "Je m'appelle Ali.",
        gloss: {UiLang.tr: "Benim adım Ali.", UiLang.en: "My name is Ali."},
      ),
      Phrase(
        id: "fr_intro_3",
        target: "Tu viens d'où ?",
        gloss: {UiLang.tr: "Nerelisin?", UiLang.en: "Where are you from?"},
      ),
      Phrase(
        id: "fr_intro_4",
        target: "Je viens de Turquie.",
        gloss: {UiLang.tr: "Türkiye'denim.", UiLang.en: "I'm from Turkey."},
      ),
      Phrase(
        id: "fr_intro_5",
        target: "Qu'est-ce que tu fais dans la vie ?",
        gloss: {
          UiLang.tr: "Ne iş yapıyorsun?",
          UiLang.en: "What do you do for a living?",
        },
      ),
      Phrase(
        id: "fr_intro_6",
        target: "Je suis étudiant.",
        gloss: {UiLang.tr: "Öğrenciyim.", UiLang.en: "I'm a student."},
      ),
      Phrase(
        id: "fr_intro_7",
        target: "Ravi d'avoir discuté, à bientôt !",
        gloss: {
          UiLang.tr: "Konuştuğumuza sevindim, görüşürüz!",
          UiLang.en: "Nice talking to you, see you soon!",
        },
      ),
    ],
    turns: [
      SpeakTurn(
        prompt: "Someone new smiles at you.",
        expected: "Bonjour, enchanté !",
      ),
      SpeakTurn(
        prompt: "You want to know their name.",
        expected: "Comment tu t'appelles ?",
      ),
      SpeakTurn(
        prompt: "They ask your name back.",
        expected: "Je m'appelle Ali.",
      ),
      SpeakTurn(
        prompt: "You're curious where they're from.",
        expected: "Tu viens d'où ?",
      ),
      SpeakTurn(
        prompt: "They ask where you're from.",
        expected: "Je viens de Turquie.",
      ),
      SpeakTurn(
        prompt: "You ask about their job.",
        expected: "Qu'est-ce que tu fais dans la vie ?",
      ),
      SpeakTurn(prompt: "They ask what you do.", expected: "Je suis étudiant."),
      SpeakTurn(
        prompt: "Time to say goodbye.",
        expected: "Ravi d'avoir discuté, à bientôt !",
      ),
    ],
  ),
  Scenario(
    id: "fr_shopping",
    lang: LearnLang.fr,
    cefr: Cefr.a1,
    minutes: 7,
    titles: {UiLang.tr: "Alışveriş", UiLang.en: "Shopping"},
    clipLine: "C'est trop cher.",
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr:
            "Sıfat, önüne geldiği ismin cinsiyetine uyar: dişil isimlerde sıfata '-e' eklenir (cher → chère).",
        UiLang.en:
            "Adjectives agree with the noun's gender — feminine nouns take an extra '-e' (cher becomes chère).",
      },
      goodExample: "La robe est chère.",
      badExample: "La robe est cher.",
    ),
    phrases: [
      Phrase(
        id: "fr_shopping_0",
        target: "Excusez-moi, combien coûte ceci ?",
        gloss: {
          UiLang.tr: "Affedersiniz, bu ne kadar?",
          UiLang.en: "Excuse me, how much is this?",
        },
      ),
      Phrase(
        id: "fr_shopping_1",
        target: "Vous l'avez dans une autre taille ?",
        gloss: {
          UiLang.tr: "Bunun başka bedeni var mı?",
          UiLang.en: "Do you have this in another size?",
        },
      ),
      Phrase(
        id: "fr_shopping_2",
        target: "Je peux l'essayer ?",
        gloss: {
          UiLang.tr: "Bunu deneyebilir miyim?",
          UiLang.en: "Can I try it on?",
        },
      ),
      Phrase(
        id: "fr_shopping_3",
        target: "C'est trop cher.",
        gloss: {UiLang.tr: "Bu çok pahalı.", UiLang.en: "It's too expensive."},
      ),
      Phrase(
        id: "fr_shopping_4",
        target: "Vous avez moins cher ?",
        gloss: {
          UiLang.tr: "Daha ucuzu var mı?",
          UiLang.en: "Do you have something cheaper?",
        },
      ),
      Phrase(
        id: "fr_shopping_5",
        target: "Je prends celui-ci.",
        gloss: {UiLang.tr: "Bunu alıyorum.", UiLang.en: "I'll take this one."},
      ),
      Phrase(
        id: "fr_shopping_6",
        target: "Je peux payer par carte ?",
        gloss: {
          UiLang.tr: "Kartla ödeyebilir miyim?",
          UiLang.en: "Can I pay by card?",
        },
      ),
    ],
    turns: [
      SpeakTurn(
        prompt: "You see a nice item in the shop.",
        expected: "Excusez-moi, combien coûte ceci ?",
      ),
      SpeakTurn(
        prompt: "The price is fine, but you want a different size.",
        expected: "Vous l'avez dans une autre taille ?",
      ),
      SpeakTurn(prompt: "The seller nods.", expected: "Je peux l'essayer ?"),
      SpeakTurn(
        prompt: "You look at the price tag again.",
        expected: "C'est trop cher.",
      ),
      SpeakTurn(
        prompt: "You ask for a better option.",
        expected: "Vous avez moins cher ?",
      ),
      SpeakTurn(
        prompt: "You decide to buy it.",
        expected: "Je prends celui-ci.",
      ),
      SpeakTurn(
        prompt: "You go to the register.",
        expected: "Je peux payer par carte ?",
      ),
    ],
  ),
  Scenario(
    id: "fr_numbers_time",
    lang: LearnLang.fr,
    cefr: Cefr.a1,
    minutes: 7,
    titles: {UiLang.tr: "Sayılar ve saat", UiLang.en: "Numbers and time"},
    clipLine: "Il est trois heures.",
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr:
            "Saat söylerken 'heure' ikiden itibaren çoğul olur ve sonuna '-s' alır.",
        UiLang.en:
            "When telling time, 'heure' becomes plural with an '-s' from two o'clock onward.",
      },
      goodExample: "Il est deux heures.",
      badExample: "Il est deux heure.",
    ),
    phrases: [
      Phrase(
        id: "fr_numbers_time_0",
        target: "Quelle heure est-il ?",
        gloss: {UiLang.tr: "Saat kaç?", UiLang.en: "What time is it?"},
      ),
      Phrase(
        id: "fr_numbers_time_1",
        target: "Il est trois heures.",
        gloss: {UiLang.tr: "Saat üç.", UiLang.en: "It's three o'clock."},
      ),
      Phrase(
        id: "fr_numbers_time_2",
        target: "Le magasin ouvre à quelle heure ?",
        gloss: {
          UiLang.tr: "Mağaza saat kaçta açılıyor?",
          UiLang.en: "What time does the shop open?",
        },
      ),
      Phrase(
        id: "fr_numbers_time_3",
        target: "Il ouvre à neuf heures.",
        gloss: {UiLang.tr: "Dokuzda açılıyor.", UiLang.en: "It opens at nine."},
      ),
      Phrase(
        id: "fr_numbers_time_4",
        target: "J'ai rendez-vous à cinq heures.",
        gloss: {
          UiLang.tr: "Saat beşte randevum var.",
          UiLang.en: "I have an appointment at five.",
        },
      ),
      Phrase(
        id: "fr_numbers_time_5",
        target: "J'ai vingt-cinq ans.",
        gloss: {
          UiLang.tr: "Yirmi beş yaşındayım.",
          UiLang.en: "I'm twenty-five years old.",
        },
      ),
      Phrase(
        id: "fr_numbers_time_6",
        target: "On se voit à six heures et demie.",
        gloss: {
          UiLang.tr: "Altı buçukta görüşürüz.",
          UiLang.en: "See you at half past six.",
        },
      ),
    ],
    turns: [
      SpeakTurn(
        prompt: "You want to know the time.",
        expected: "Quelle heure est-il ?",
      ),
      SpeakTurn(
        prompt: "Someone answers you.",
        expected: "Il est trois heures.",
      ),
      SpeakTurn(
        prompt: "You want to visit a shop later.",
        expected: "Le magasin ouvre à quelle heure ?",
      ),
      SpeakTurn(
        prompt: "You get the answer.",
        expected: "Il ouvre à neuf heures.",
      ),
      SpeakTurn(
        prompt: "You check your schedule.",
        expected: "J'ai rendez-vous à cinq heures.",
      ),
      SpeakTurn(
        prompt: "A new friend asks your age.",
        expected: "J'ai vingt-cinq ans.",
      ),
      SpeakTurn(
        prompt: "You say goodbye for now.",
        expected: "On se voit à six heures et demie.",
      ),
    ],
  ),
  Scenario(
    id: "fr_family",
    lang: LearnLang.fr,
    cefr: Cefr.a1,
    minutes: 7,
    titles: {UiLang.tr: "Aile", UiLang.en: "Family"},
    clipLine: "Voici ma famille.",
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr:
            "İyelik sıfatı (mon/ma) sahibinin değil, ismin cinsiyetine göre seçilir.",
        UiLang.en:
            "Possessive adjectives (mon/ma) agree with the noun's gender, not the owner's.",
      },
      goodExample: "Ma sœur habite à Paris.",
      badExample: "Mon sœur habite à Paris.",
    ),
    phrases: [
      Phrase(
        id: "fr_family_0",
        target: "Voici ma famille.",
        gloss: {UiLang.tr: "İşte ailem.", UiLang.en: "This is my family."},
      ),
      Phrase(
        id: "fr_family_1",
        target: "Voici ma mère.",
        gloss: {UiLang.tr: "İşte annem.", UiLang.en: "This is my mother."},
      ),
      Phrase(
        id: "fr_family_2",
        target: "Voici mon père.",
        gloss: {UiLang.tr: "İşte babam.", UiLang.en: "This is my father."},
      ),
      Phrase(
        id: "fr_family_3",
        target: "J'ai une petite sœur.",
        gloss: {
          UiLang.tr: "Küçük bir kız kardeşim var.",
          UiLang.en: "I have a younger sister.",
        },
      ),
      Phrase(
        id: "fr_family_4",
        target: "Mon frère habite à Lyon.",
        gloss: {
          UiLang.tr: "Erkek kardeşim Lyon'da yaşıyor.",
          UiLang.en: "My brother lives in Lyon.",
        },
      ),
      Phrase(
        id: "fr_family_5",
        target: "Tu as des frères et sœurs ?",
        gloss: {
          UiLang.tr: "Kardeşin var mı?",
          UiLang.en: "Do you have brothers or sisters?",
        },
      ),
      Phrase(
        id: "fr_family_6",
        target: "Mes parents habitent à la campagne.",
        gloss: {
          UiLang.tr: "Ailem kırsalda yaşıyor.",
          UiLang.en: "My parents live in the countryside.",
        },
      ),
    ],
    turns: [
      SpeakTurn(prompt: "You show a photo.", expected: "Voici ma famille."),
      SpeakTurn(prompt: "You point to a woman.", expected: "Voici ma mère."),
      SpeakTurn(prompt: "You point to a man.", expected: "Voici mon père."),
      SpeakTurn(
        prompt: "You mention your siblings.",
        expected: "J'ai une petite sœur.",
      ),
      SpeakTurn(
        prompt: "You talk about your brother.",
        expected: "Mon frère habite à Lyon.",
      ),
      SpeakTurn(
        prompt: "You're curious about their family.",
        expected: "Tu as des frères et sœurs ?",
      ),
      SpeakTurn(
        prompt: "You describe where your parents live.",
        expected: "Mes parents habitent à la campagne.",
      ),
    ],
  ),
  Scenario(
    id: "fr_weather",
    lang: LearnLang.fr,
    cefr: Cefr.a1,
    minutes: 7,
    titles: {UiLang.tr: "Hava durumu", UiLang.en: "Weather"},
    clipLine: "Il fait beau aujourd'hui.",
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr:
            "Hava durumu anlatılırken 'il fait + sıfat' kalıbı kullanılır, 'il est' değil.",
        UiLang.en:
            "Weather is described with 'il fait + adjective', not 'il est'.",
      },
      goodExample: "Il fait chaud aujourd'hui.",
      badExample: "Il est chaud aujourd'hui.",
    ),
    phrases: [
      Phrase(
        id: "fr_weather_0",
        target: "Quel temps fait-il aujourd'hui ?",
        gloss: {
          UiLang.tr: "Bugün hava nasıl?",
          UiLang.en: "What's the weather like today?",
        },
      ),
      Phrase(
        id: "fr_weather_1",
        target: "Il fait beau aujourd'hui.",
        gloss: {
          UiLang.tr: "Bugün hava güzel.",
          UiLang.en: "It's nice out today.",
        },
      ),
      Phrase(
        id: "fr_weather_2",
        target: "Il pleut.",
        gloss: {UiLang.tr: "Yağmur yağıyor.", UiLang.en: "It's raining."},
      ),
      Phrase(
        id: "fr_weather_3",
        target: "Il fait très froid en hiver.",
        gloss: {
          UiLang.tr: "Kışın hava çok soğuk oluyor.",
          UiLang.en: "It's very cold in winter.",
        },
      ),
      Phrase(
        id: "fr_weather_4",
        target: "Il fait chaud en été.",
        gloss: {
          UiLang.tr: "Yazın hava sıcak oluyor.",
          UiLang.en: "It's hot in summer.",
        },
      ),
      Phrase(
        id: "fr_weather_5",
        target: "Prends un parapluie, il va peut-être pleuvoir.",
        gloss: {
          UiLang.tr: "Şemsiye al, yağmur yağabilir.",
          UiLang.en: "Take an umbrella, it might rain.",
        },
      ),
      Phrase(
        id: "fr_weather_6",
        target: "Il fait du vent.",
        gloss: {UiLang.tr: "Rüzgâr var.", UiLang.en: "It's windy."},
      ),
    ],
    turns: [
      SpeakTurn(
        prompt: "You start small talk about the weather.",
        expected: "Quel temps fait-il aujourd'hui ?",
      ),
      SpeakTurn(
        prompt: "You look outside, the sun is shining.",
        expected: "Il fait beau aujourd'hui.",
      ),
      SpeakTurn(prompt: "Clouds appear and it starts.", expected: "Il pleut."),
      SpeakTurn(
        prompt: "You talk about winter.",
        expected: "Il fait très froid en hiver.",
      ),
      SpeakTurn(
        prompt: "You talk about summer.",
        expected: "Il fait chaud en été.",
      ),
      SpeakTurn(
        prompt: "You warn a friend before they leave.",
        expected: "Prends un parapluie, il va peut-être pleuvoir.",
      ),
      SpeakTurn(
        prompt: "You notice the trees moving.",
        expected: "Il fait du vent.",
      ),
    ],
  ),
  Scenario(
    id: "fr_transport",
    lang: LearnLang.fr,
    cefr: Cefr.a1,
    minutes: 7,
    titles: {UiLang.tr: "Ulaşım", UiLang.en: "Transport"},
    clipLine: "Je vais au travail en bus.",
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr:
            "Ulaşım aracından bahsederken 'en' edatı kullanılır (en bus), 'avec' değil.",
        UiLang.en:
            "Use the preposition 'en' for transport modes (en bus), not 'avec'.",
      },
      goodExample: "Je vais au travail en bus.",
      badExample: "Je vais au travail avec bus.",
    ),
    phrases: [
      Phrase(
        id: "fr_transport_0",
        target: "Comment on va au centre-ville ?",
        gloss: {
          UiLang.tr: "Şehir merkezine nasıl gidilir?",
          UiLang.en: "How do I get to the city center?",
        },
      ),
      Phrase(
        id: "fr_transport_1",
        target: "Prenez le bus numéro cinq.",
        gloss: {
          UiLang.tr: "Beş numaralı otobüse binin.",
          UiLang.en: "Take bus number five.",
        },
      ),
      Phrase(
        id: "fr_transport_2",
        target: "Je vais au travail en bus.",
        gloss: {
          UiLang.tr: "İşe otobüsle gidiyorum.",
          UiLang.en: "I go to work by bus.",
        },
      ),
      Phrase(
        id: "fr_transport_3",
        target: "Où est la station de métro la plus proche ?",
        gloss: {
          UiLang.tr: "En yakın metro istasyonu nerede?",
          UiLang.en: "Where is the nearest metro station?",
        },
      ),
      Phrase(
        id: "fr_transport_4",
        target: "Un billet pour l'aéroport, s'il vous plaît.",
        gloss: {
          UiLang.tr: "Havaalanına bir bilet, lütfen.",
          UiLang.en: "One ticket to the airport, please.",
        },
      ),
      Phrase(
        id: "fr_transport_5",
        target: "Le train part à quelle heure ?",
        gloss: {
          UiLang.tr: "Tren saat kaçta kalkıyor?",
          UiLang.en: "What time does the train leave?",
        },
      ),
      Phrase(
        id: "fr_transport_6",
        target: "Je préfère marcher.",
        gloss: {
          UiLang.tr: "Yürümeyi tercih ederim.",
          UiLang.en: "I prefer to walk.",
        },
      ),
    ],
    turns: [
      SpeakTurn(
        prompt: "You're lost downtown.",
        expected: "Comment on va au centre-ville ?",
      ),
      SpeakTurn(
        prompt: "A local points to a bus stop.",
        expected: "Prenez le bus numéro cinq.",
      ),
      SpeakTurn(
        prompt: "Someone asks how you commute.",
        expected: "Je vais au travail en bus.",
      ),
      SpeakTurn(
        prompt: "You need the metro.",
        expected: "Où est la station de métro la plus proche ?",
      ),
      SpeakTurn(
        prompt: "You're at the ticket counter.",
        expected: "Un billet pour l'aéroport, s'il vous plaît.",
      ),
      SpeakTurn(
        prompt: "You check the schedule board.",
        expected: "Le train part à quelle heure ?",
      ),
      SpeakTurn(
        prompt: "Someone offers a ride, but it's close.",
        expected: "Je préfère marcher.",
      ),
    ],
  ),
  Scenario(
    id: "fr_emergency",
    lang: LearnLang.fr,
    cefr: Cefr.a1,
    minutes: 7,
    titles: {UiLang.tr: "Acil durum", UiLang.en: "Emergency"},
    clipLine: "Appelez une ambulance !",
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr:
            "Emir kipinde özne zamiri ('vous') kullanılmaz, doğrudan fiil ile başlanır.",
        UiLang.en:
            "In the imperative, no subject pronoun ('vous') is used — start directly with the verb.",
      },
      goodExample: "Appelez une ambulance !",
      badExample: "Vous appelez une ambulance !",
    ),
    phrases: [
      Phrase(
        id: "fr_emergency_0",
        target: "Au secours !",
        gloss: {UiLang.tr: "İmdat!", UiLang.en: "Help!"},
      ),
      Phrase(
        id: "fr_emergency_1",
        target: "Appelez une ambulance !",
        gloss: {
          UiLang.tr: "Ambulans çağırın!",
          UiLang.en: "Call an ambulance!",
        },
      ),
      Phrase(
        id: "fr_emergency_2",
        target: "J'ai besoin d'un médecin.",
        gloss: {
          UiLang.tr: "Bir doktora ihtiyacım var.",
          UiLang.en: "I need a doctor.",
        },
      ),
      Phrase(
        id: "fr_emergency_3",
        target: "Où est l'hôpital le plus proche ?",
        gloss: {
          UiLang.tr: "En yakın hastane nerede?",
          UiLang.en: "Where is the nearest hospital?",
        },
      ),
      Phrase(
        id: "fr_emergency_4",
        target: "J'ai perdu mon passeport.",
        gloss: {
          UiLang.tr: "Pasaportumu kaybettim.",
          UiLang.en: "I've lost my passport.",
        },
      ),
      Phrase(
        id: "fr_emergency_5",
        target: "Appelez la police !",
        gloss: {UiLang.tr: "Polis çağırın!", UiLang.en: "Call the police!"},
      ),
      Phrase(
        id: "fr_emergency_6",
        target: "Je me sens très mal.",
        gloss: {
          UiLang.tr: "Kendimi çok kötü hissediyorum.",
          UiLang.en: "I feel very sick.",
        },
      ),
    ],
    turns: [
      SpeakTurn(
        prompt: "Something dangerous just happened.",
        expected: "Au secours !",
      ),
      SpeakTurn(
        prompt: "Someone is badly hurt.",
        expected: "Appelez une ambulance !",
      ),
      SpeakTurn(
        prompt: "You don't feel well.",
        expected: "J'ai besoin d'un médecin.",
      ),
      SpeakTurn(
        prompt: "You need directions urgently.",
        expected: "Où est l'hôpital le plus proche ?",
      ),
      SpeakTurn(
        prompt: "You check your bag, it's missing.",
        expected: "J'ai perdu mon passeport.",
      ),
      SpeakTurn(
        prompt: "You witness a crime.",
        expected: "Appelez la police !",
      ),
      SpeakTurn(
        prompt: "A stranger asks if you're okay.",
        expected: "Je me sens très mal.",
      ),
    ],
  ),
  Scenario(
    id: "fr_routine",
    lang: LearnLang.fr,
    cefr: Cefr.a1,
    minutes: 7,
    titles: {UiLang.tr: "Günlük rutin", UiLang.en: "Daily routine"},
    clipLine: "Je me lève à sept heures.",
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr:
            "Günlük eylemleri anlatan fiiller (se lever) refleksiftir, önlerine 'me/te/se' gelir.",
        UiLang.en:
            "Daily-routine verbs like 'se lever' are reflexive — they need 'me/te/se' before the verb.",
      },
      goodExample: "Je me lève à sept heures.",
      badExample: "Je lève à sept heures.",
    ),
    phrases: [
      Phrase(
        id: "fr_routine_0",
        target: "Je me lève à sept heures.",
        gloss: {
          UiLang.tr: "Saat yedide kalkarım.",
          UiLang.en: "I wake up at seven.",
        },
      ),
      Phrase(
        id: "fr_routine_1",
        target: "Je prends une douche.",
        gloss: {UiLang.tr: "Duş alırım.", UiLang.en: "I take a shower."},
      ),
      Phrase(
        id: "fr_routine_2",
        target: "Je prends le petit-déjeuner à huit heures.",
        gloss: {
          UiLang.tr: "Saat sekizde kahvaltı ederim.",
          UiLang.en: "I have breakfast at eight.",
        },
      ),
      Phrase(
        id: "fr_routine_3",
        target: "Je commence le travail à neuf heures.",
        gloss: {
          UiLang.tr: "İşe dokuzda başlarım.",
          UiLang.en: "I start work at nine.",
        },
      ),
      Phrase(
        id: "fr_routine_4",
        target: "Je rentre à la maison à six heures du soir.",
        gloss: {
          UiLang.tr: "Akşam altıda eve dönerim.",
          UiLang.en: "I get home at six in the evening.",
        },
      ),
      Phrase(
        id: "fr_routine_5",
        target: "Je dîne avec ma famille.",
        gloss: {
          UiLang.tr: "Ailemle akşam yemeği yerim.",
          UiLang.en: "I have dinner with my family.",
        },
      ),
      Phrase(
        id: "fr_routine_6",
        target: "Je me couche à onze heures.",
        gloss: {
          UiLang.tr: "Saat on birde yatarım.",
          UiLang.en: "I go to bed at eleven.",
        },
      ),
    ],
    turns: [
      SpeakTurn(
        prompt: "Describe your morning.",
        expected: "Je me lève à sept heures.",
      ),
      SpeakTurn(prompt: "What's next?", expected: "Je prends une douche."),
      SpeakTurn(
        prompt: "And breakfast?",
        expected: "Je prends le petit-déjeuner à huit heures.",
      ),
      SpeakTurn(
        prompt: "When does work start?",
        expected: "Je commence le travail à neuf heures.",
      ),
      SpeakTurn(
        prompt: "When are you home?",
        expected: "Je rentre à la maison à six heures du soir.",
      ),
      SpeakTurn(
        prompt: "What about the evening?",
        expected: "Je dîne avec ma famille.",
      ),
      SpeakTurn(
        prompt: "And finally?",
        expected: "Je me couche à onze heures.",
      ),
    ],
  ),
  Scenario(
    id: "fr_past_story",
    lang: LearnLang.fr,
    cefr: Cefr.a1,
    minutes: 7,
    titles: {
      UiLang.tr: "Geçmişte bir olay anlatmak",
      UiLang.en: "Telling a story in the past",
    },
    clipLine: "Le week-end dernier, j'ai visité Paris.",
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr:
            "Geçmiş zamanda (passé composé) fiilin sonu 'participe passé' olur, mastar hali kullanılmaz.",
        UiLang.en:
            "In the past tense (passé composé), the verb takes its past-participle form, not the infinitive.",
      },
      goodExample: "J'ai visité Paris.",
      badExample: "J'ai visiter Paris.",
    ),
    phrases: [
      Phrase(
        id: "fr_past_story_0",
        target: "Le week-end dernier, j'ai visité Paris.",
        gloss: {
          UiLang.tr: "Geçen hafta sonu Paris'i ziyaret ettim.",
          UiLang.en: "Last weekend I visited Paris.",
        },
      ),
      Phrase(
        id: "fr_past_story_1",
        target: "J'ai pris le train le matin.",
        gloss: {
          UiLang.tr: "Sabah treni aldım.",
          UiLang.en: "I took the train in the morning.",
        },
      ),
      Phrase(
        id: "fr_past_story_2",
        target: "J'ai visité un musée.",
        gloss: {
          UiLang.tr: "Bir müze gezdim.",
          UiLang.en: "I visited a museum.",
        },
      ),
      Phrase(
        id: "fr_past_story_3",
        target: "J'ai mangé un repas délicieux.",
        gloss: {
          UiLang.tr: "Nefis bir yemek yedim.",
          UiLang.en: "I ate a delicious meal.",
        },
      ),
      Phrase(
        id: "fr_past_story_4",
        target: "J'ai rencontré une amie.",
        gloss: {
          UiLang.tr: "Bir arkadaşımla buluştum.",
          UiLang.en: "I met a friend.",
        },
      ),
      Phrase(
        id: "fr_past_story_5",
        target: "J'ai pris beaucoup de photos.",
        gloss: {
          UiLang.tr: "Bir sürü fotoğraf çektim.",
          UiLang.en: "I took a lot of photos.",
        },
      ),
      Phrase(
        id: "fr_past_story_6",
        target: "C'était une journée magnifique.",
        gloss: {
          UiLang.tr: "Harika bir gündü.",
          UiLang.en: "It was a wonderful day.",
        },
      ),
    ],
    turns: [
      SpeakTurn(
        prompt: "Tell a friend about your weekend.",
        expected: "Le week-end dernier, j'ai visité Paris.",
      ),
      SpeakTurn(
        prompt: "How did you get there?",
        expected: "J'ai pris le train le matin.",
      ),
      SpeakTurn(
        prompt: "What did you do first?",
        expected: "J'ai visité un musée.",
      ),
      SpeakTurn(
        prompt: "Did you eat well?",
        expected: "J'ai mangé un repas délicieux.",
      ),
      SpeakTurn(
        prompt: "Did you see anyone you know?",
        expected: "J'ai rencontré une amie.",
      ),
      SpeakTurn(
        prompt: "Did you take pictures?",
        expected: "J'ai pris beaucoup de photos.",
      ),
      SpeakTurn(
        prompt: "How was the day overall?",
        expected: "C'était une journée magnifique.",
      ),
    ],
  ),

  // ===================== ITALIAN =====================
  Scenario(
    id: "it_intro",
    lang: LearnLang.it,
    cefr: Cefr.a1,
    minutes: 7,
    titles: {UiLang.tr: "Tanışma", UiLang.en: "Meeting someone"},
    clipLine: "Piacere, io sono Marco.",
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr:
            "Meslek söylerken 'essere'den sonra artikel genelde düşer (Sono insegnante). Ama mesleğe bir sıfat eklenirse artikel zorunludur.",
        UiLang.en:
            "After 'essere' + profession the article is usually dropped (Sono insegnante), but once you add an adjective the article is required.",
      },
      goodExample: "Sono un bravo insegnante.",
      badExample: "Sono bravo insegnante.",
    ),
    phrases: [
      Phrase(
        id: "it_intro_0",
        target: "Piacere, io sono Marco.",
        gloss: {
          UiLang.tr: "Memnun oldum, ben Marco.",
          UiLang.en: "Nice to meet you, I'm Marco.",
        },
      ),
      Phrase(
        id: "it_intro_1",
        target: "Come ti chiami?",
        gloss: {UiLang.tr: "Adın ne?", UiLang.en: "What's your name?"},
      ),
      Phrase(
        id: "it_intro_2",
        target: "Mi chiamo Elena, e tu?",
        gloss: {
          UiLang.tr: "Benim adım Elena, ya sen?",
          UiLang.en: "My name's Elena, and you?",
        },
      ),
      Phrase(
        id: "it_intro_3",
        target: "Di dove sei?",
        gloss: {UiLang.tr: "Nerelisin?", UiLang.en: "Where are you from?"},
      ),
      Phrase(
        id: "it_intro_4",
        target: "Sono di Istanbul.",
        gloss: {UiLang.tr: "İstanbulluyum.", UiLang.en: "I'm from Istanbul."},
      ),
      Phrase(
        id: "it_intro_5",
        target: "Che lavoro fai?",
        gloss: {
          UiLang.tr: "Ne iş yapıyorsun?",
          UiLang.en: "What do you do for work?",
        },
      ),
      Phrase(
        id: "it_intro_6",
        target: "Sono insegnante.",
        gloss: {UiLang.tr: "Öğretmenim.", UiLang.en: "I'm a teacher."},
      ),
      Phrase(
        id: "it_intro_7",
        target: "Piacere di averti conosciuto, a presto!",
        gloss: {
          UiLang.tr: "Seninle tanıştığıma sevindim, yakında görüşürüz!",
          UiLang.en: "Nice meeting you, see you soon!",
        },
      ),
    ],
    turns: [
      SpeakTurn(
        prompt: "Someone new smiles at you.",
        expected: "Piacere, io sono Marco.",
      ),
      SpeakTurn(
        prompt: "You want to know their name.",
        expected: "Come ti chiami?",
      ),
      SpeakTurn(
        prompt: "They ask your name back.",
        expected: "Mi chiamo Elena, e tu?",
      ),
      SpeakTurn(
        prompt: "You're curious where they're from.",
        expected: "Di dove sei?",
      ),
      SpeakTurn(
        prompt: "They ask where you're from.",
        expected: "Sono di Istanbul.",
      ),
      SpeakTurn(
        prompt: "You ask about their job.",
        expected: "Che lavoro fai?",
      ),
      SpeakTurn(prompt: "They ask what you do.", expected: "Sono insegnante."),
      SpeakTurn(
        prompt: "Time to say goodbye.",
        expected: "Piacere di averti conosciuto, a presto!",
      ),
    ],
  ),
  Scenario(
    id: "it_shopping",
    lang: LearnLang.it,
    cefr: Cefr.a1,
    minutes: 7,
    titles: {UiLang.tr: "Alışveriş", UiLang.en: "Shopping"},
    clipLine: "Sto solo dando un'occhiata, grazie.",
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr:
            "Gösterme sıfatları ismin cinsiyet ve sayısına uyar: questo/questa/questi/queste.",
        UiLang.en:
            "Demonstratives agree with the noun's gender and number: questo/questa/questi/queste.",
      },
      goodExample: "Quanto costano queste scarpe?",
      badExample: "Quanto costano questi scarpe?",
    ),
    phrases: [
      Phrase(
        id: "it_shopping_0",
        target: "Sto solo dando un'occhiata, grazie.",
        gloss: {
          UiLang.tr: "Sadece bakıyorum, teşekkürler.",
          UiLang.en: "I'm just looking, thanks.",
        },
      ),
      Phrase(
        id: "it_shopping_1",
        target: "Avete questo in taglia 42?",
        gloss: {
          UiLang.tr: "Bunun 42 numarası var mı?",
          UiLang.en: "Do you have this in size 42?",
        },
      ),
      Phrase(
        id: "it_shopping_2",
        target: "Posso provarlo?",
        gloss: {UiLang.tr: "Deneyebilir miyim?", UiLang.en: "Can I try it on?"},
      ),
      Phrase(
        id: "it_shopping_3",
        target: "Quanto costano queste scarpe?",
        gloss: {
          UiLang.tr: "Bu ayakkabılar ne kadar?",
          UiLang.en: "How much are these shoes?",
        },
      ),
      Phrase(
        id: "it_shopping_4",
        target: "Accettate carte di credito?",
        gloss: {
          UiLang.tr: "Kredi kartı geçiyor mu?",
          UiLang.en: "Do you accept credit cards?",
        },
      ),
      Phrase(
        id: "it_shopping_5",
        target: "È troppo caro.",
        gloss: {UiLang.tr: "Çok pahalı.", UiLang.en: "It's too expensive."},
      ),
      Phrase(
        id: "it_shopping_6",
        target: "Avete una taglia più piccola?",
        gloss: {
          UiLang.tr: "Daha küçük bedeniniz var mı?",
          UiLang.en: "Do you have a smaller size?",
        },
      ),
      Phrase(
        id: "it_shopping_7",
        target: "Lo prendo.",
        gloss: {UiLang.tr: "Bunu alıyorum.", UiLang.en: "I'll take it."},
      ),
    ],
    turns: [
      SpeakTurn(
        prompt: "A clerk asks if you need help.",
        expected: "Sto solo dando un'occhiata, grazie.",
      ),
      SpeakTurn(
        prompt: "You found something you like.",
        expected: "Avete questo in taglia 42?",
      ),
      SpeakTurn(
        prompt: "You want to test the fit.",
        expected: "Posso provarlo?",
      ),
      SpeakTurn(
        prompt: "You're checking the price.",
        expected: "Quanto costano queste scarpe?",
      ),
      SpeakTurn(
        prompt: "You're ready to pay.",
        expected: "Accettate carte di credito?",
      ),
      SpeakTurn(
        prompt: "You think the price is high.",
        expected: "È troppo caro.",
      ),
      SpeakTurn(
        prompt: "It doesn't fit.",
        expected: "Avete una taglia più piccola?",
      ),
      SpeakTurn(prompt: "You've decided to buy it.", expected: "Lo prendo."),
    ],
  ),
  Scenario(
    id: "it_numbers_time",
    lang: LearnLang.it,
    cefr: Cefr.a1,
    minutes: 7,
    titles: {UiLang.tr: "Sayılar ve saat", UiLang.en: "Numbers and time"},
    clipLine: "Che ore sono?",
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr:
            "Saat 'bir' için 'è l'una' (tekil), diğer saatler için 'sono le...' (çoğul) kullanılır.",
        UiLang.en:
            "Use 'è l'una' (singular) only for one o'clock; every other hour takes 'sono le...' (plural).",
      },
      goodExample: "Sono le tre e mezza.",
      badExample: "È le tre e mezza.",
    ),
    phrases: [
      Phrase(
        id: "it_numbers_time_0",
        target: "Che ore sono?",
        gloss: {UiLang.tr: "Saat kaç?", UiLang.en: "What time is it?"},
      ),
      Phrase(
        id: "it_numbers_time_1",
        target: "Sono le tre e mezza.",
        gloss: {
          UiLang.tr: "Saat üç buçuk.",
          UiLang.en: "It's half past three.",
        },
      ),
      Phrase(
        id: "it_numbers_time_2",
        target: "Il negozio apre alle nove.",
        gloss: {
          UiLang.tr: "Dükkan dokuzda açılıyor.",
          UiLang.en: "The shop opens at nine.",
        },
      ),
      Phrase(
        id: "it_numbers_time_3",
        target: "Ho due biglietti.",
        gloss: {
          UiLang.tr: "İki biletim var.",
          UiLang.en: "I have two tickets.",
        },
      ),
      Phrase(
        id: "it_numbers_time_4",
        target: "Sono dodici euro in tutto.",
        gloss: {
          UiLang.tr: "Toplam on iki euro.",
          UiLang.en: "That's twelve euros in total.",
        },
      ),
      Phrase(
        id: "it_numbers_time_5",
        target: "Ci vediamo alle cinque?",
        gloss: {
          UiLang.tr: "Saat beşte görüşelim mi?",
          UiLang.en: "Shall we meet at five?",
        },
      ),
      Phrase(
        id: "it_numbers_time_6",
        target: "Arrivo tra dieci minuti.",
        gloss: {
          UiLang.tr: "On dakikaya varırım.",
          UiLang.en: "I'll arrive in ten minutes.",
        },
      ),
    ],
    turns: [
      SpeakTurn(prompt: "You don't know the time.", expected: "Che ore sono?"),
      SpeakTurn(
        prompt: "Someone asks you the time.",
        expected: "Sono le tre e mezza.",
      ),
      SpeakTurn(
        prompt: "You want to visit a shop later.",
        expected: "Il negozio apre alle nove.",
      ),
      SpeakTurn(prompt: "At the counter.", expected: "Ho due biglietti."),
      SpeakTurn(
        prompt: "The clerk tells you the price.",
        expected: "Sono dodici euro in tutto.",
      ),
      SpeakTurn(
        prompt: "You're planning to meet a friend.",
        expected: "Ci vediamo alle cinque?",
      ),
      SpeakTurn(
        prompt: "You're running a bit late.",
        expected: "Arrivo tra dieci minuti.",
      ),
    ],
  ),
  Scenario(
    id: "it_family",
    lang: LearnLang.it,
    cefr: Cefr.a1,
    minutes: 7,
    titles: {UiLang.tr: "Aile", UiLang.en: "Family"},
    clipLine: "Questa è la mia famiglia.",
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr:
            "Tekil, sıfatsız yakın akraba isimleriyle (madre, sorella, padre...) iyelik sıfatından önce belirli tanımlık kullanılmaz.",
        UiLang.en:
            "With singular, unmodified close-family nouns (madre, sorella, padre...), the definite article before the possessive is dropped.",
      },
      goodExample: "Mia sorella vive a Milano.",
      badExample: "La mia sorella vive a Milano.",
    ),
    phrases: [
      Phrase(
        id: "it_family_0",
        target: "Questa è la mia famiglia.",
        gloss: {UiLang.tr: "Bu benim ailem.", UiLang.en: "This is my family."},
      ),
      Phrase(
        id: "it_family_1",
        target: "Ho due fratelli e una sorella.",
        gloss: {
          UiLang.tr: "İki erkek kardeşim ve bir kız kardeşim var.",
          UiLang.en: "I have two brothers and a sister.",
        },
      ),
      Phrase(
        id: "it_family_2",
        target: "Mia madre è medica.",
        gloss: {
          UiLang.tr: "Annem doktor.",
          UiLang.en: "My mother is a doctor.",
        },
      ),
      Phrase(
        id: "it_family_3",
        target: "Mia sorella vive a Milano.",
        gloss: {
          UiLang.tr: "Kız kardeşim Milano'da yaşıyor.",
          UiLang.en: "My sister lives in Milan.",
        },
      ),
      Phrase(
        id: "it_family_4",
        target: "Quanti anni ha tua figlia?",
        gloss: {
          UiLang.tr: "Kızın kaç yaşında?",
          UiLang.en: "How old is your daughter?",
        },
      ),
      Phrase(
        id: "it_family_5",
        target: "I miei genitori abitano in campagna.",
        gloss: {
          UiLang.tr: "Ailem kırsalda yaşıyor.",
          UiLang.en: "My parents live in the countryside.",
        },
      ),
      Phrase(
        id: "it_family_6",
        target: "Hai figli?",
        gloss: {
          UiLang.tr: "Çocuğun var mı?",
          UiLang.en: "Do you have children?",
        },
      ),
    ],
    turns: [
      SpeakTurn(
        prompt: "You're showing a photo.",
        expected: "Questa è la mia famiglia.",
      ),
      SpeakTurn(
        prompt: "Someone asks about your siblings.",
        expected: "Ho due fratelli e una sorella.",
      ),
      SpeakTurn(
        prompt: "They ask what your mother does.",
        expected: "Mia madre è medica.",
      ),
      SpeakTurn(
        prompt: "You're talking about your sister.",
        expected: "Mia sorella vive a Milano.",
      ),
      SpeakTurn(
        prompt: "You want to know a friend's daughter's age.",
        expected: "Quanti anni ha tua figlia?",
      ),
      SpeakTurn(
        prompt: "They ask where your parents live.",
        expected: "I miei genitori abitano in campagna.",
      ),
      SpeakTurn(prompt: "You're asking a new friend.", expected: "Hai figli?"),
    ],
  ),
  Scenario(
    id: "it_weather",
    lang: LearnLang.it,
    cefr: Cefr.a1,
    minutes: 7,
    titles: {UiLang.tr: "Hava durumu", UiLang.en: "Weather"},
    clipLine: "Che tempo fa oggi?",
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr:
            "Sıcaklık/soğukluk anlatılırken 'fare' + isim kalıbı kullanılır (fa caldo, fa freddo), sıfatla 'essere' değil.",
        UiLang.en:
            "Temperature is expressed with 'fare' + noun (fa caldo, fa freddo), not 'essere' + adjective.",
      },
      goodExample: "Fa molto caldo oggi.",
      badExample: "È molto caldo oggi.",
    ),
    phrases: [
      Phrase(
        id: "it_weather_0",
        target: "Che tempo fa oggi?",
        gloss: {
          UiLang.tr: "Bugün hava nasıl?",
          UiLang.en: "What's the weather like today?",
        },
      ),
      Phrase(
        id: "it_weather_1",
        target: "Piove oggi.",
        gloss: {
          UiLang.tr: "Bugün yağmur yağıyor.",
          UiLang.en: "It's raining today.",
        },
      ),
      Phrase(
        id: "it_weather_2",
        target: "Fa molto caldo fuori.",
        gloss: {
          UiLang.tr: "Dışarısı çok sıcak.",
          UiLang.en: "It's really hot outside.",
        },
      ),
      Phrase(
        id: "it_weather_3",
        target: "Porta l'ombrello, potrebbe piovere.",
        gloss: {
          UiLang.tr: "Şemsiyeni al, yağmur yağabilir.",
          UiLang.en: "Take an umbrella, it might rain.",
        },
      ),
      Phrase(
        id: "it_weather_4",
        target: "Fa freddissimo stamattina.",
        gloss: {
          UiLang.tr: "Bu sabah dondurucu soğuk.",
          UiLang.en: "It's freezing this morning.",
        },
      ),
      Phrase(
        id: "it_weather_5",
        target: "Adoro le giornate di sole.",
        gloss: {
          UiLang.tr: "Güneşli günleri severim.",
          UiLang.en: "I love sunny days.",
        },
      ),
      Phrase(
        id: "it_weather_6",
        target: "Tira vento oggi?",
        gloss: {
          UiLang.tr: "Bugün rüzgar var mı?",
          UiLang.en: "Is it windy today?",
        },
      ),
    ],
    turns: [
      SpeakTurn(
        prompt: "You're about to go outside.",
        expected: "Che tempo fa oggi?",
      ),
      SpeakTurn(
        prompt: "Someone asks about the weather.",
        expected: "Piove oggi.",
      ),
      SpeakTurn(prompt: "You step outside.", expected: "Fa molto caldo fuori."),
      SpeakTurn(
        prompt: "Your friend is leaving the house.",
        expected: "Porta l'ombrello, potrebbe piovere.",
      ),
      SpeakTurn(
        prompt: "You wake up and check the window.",
        expected: "Fa freddissimo stamattina.",
      ),
      SpeakTurn(
        prompt: "You're talking about your favorite weather.",
        expected: "Adoro le giornate di sole.",
      ),
      SpeakTurn(
        prompt: "You're deciding what to wear.",
        expected: "Tira vento oggi?",
      ),
    ],
  ),
  Scenario(
    id: "it_transport",
    lang: LearnLang.it,
    cefr: Cefr.a1,
    minutes: 7,
    titles: {UiLang.tr: "Ulaşım", UiLang.en: "Getting around"},
    clipLine: "Dov'è la fermata dell'autobus più vicina?",
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr:
            "Ulaşım aracından önce 'in' gelir (in autobus, in treno), ama 'a piedi' içinde 'in' yoktur.",
        UiLang.en:
            "Use 'in' + vehicle (in autobus, in treno), but 'a piedi' (on foot) takes no preposition.",
      },
      goodExample: "Vado al lavoro in autobus.",
      badExample: "Vado al lavoro con l'autobus.",
    ),
    phrases: [
      Phrase(
        id: "it_transport_0",
        target: "Dov'è la fermata dell'autobus più vicina?",
        gloss: {
          UiLang.tr: "En yakın otobüs durağı nerede?",
          UiLang.en: "Where's the nearest bus stop?",
        },
      ),
      Phrase(
        id: "it_transport_1",
        target: "Vado al lavoro in autobus.",
        gloss: {
          UiLang.tr: "İşe otobüsle gidiyorum.",
          UiLang.en: "I go to work by bus.",
        },
      ),
      Phrase(
        id: "it_transport_2",
        target: "Da che binario parte?",
        gloss: {
          UiLang.tr: "Hangi perondan kalkıyor?",
          UiLang.en: "Which platform does it leave from?",
        },
      ),
      Phrase(
        id: "it_transport_3",
        target: "Un biglietto per il centro, per favore.",
        gloss: {
          UiLang.tr: "Şehir merkezine bir bilet, lütfen.",
          UiLang.en: "One ticket to the center, please.",
        },
      ),
      Phrase(
        id: "it_transport_4",
        target: "Questo treno ferma all'aeroporto?",
        gloss: {
          UiLang.tr: "Bu tren havalimanında duruyor mu?",
          UiLang.en: "Does this train stop at the airport?",
        },
      ),
      Phrase(
        id: "it_transport_5",
        target: "Ho bisogno di un taxi.",
        gloss: {
          UiLang.tr: "Taksiye ihtiyacım var.",
          UiLang.en: "I need a taxi.",
        },
      ),
      Phrase(
        id: "it_transport_6",
        target: "Quanto tempo ci vuole?",
        gloss: {
          UiLang.tr: "Ne kadar sürüyor?",
          UiLang.en: "How long does it take?",
        },
      ),
      Phrase(
        id: "it_transport_7",
        target: "Preferisco andare a piedi.",
        gloss: {
          UiLang.tr: "Yürüyerek gitmeyi tercih ederim.",
          UiLang.en: "I prefer to go on foot.",
        },
      ),
    ],
    turns: [
      SpeakTurn(
        prompt: "You need to find a bus.",
        expected: "Dov'è la fermata dell'autobus più vicina?",
      ),
      SpeakTurn(
        prompt: "Someone asks how you commute.",
        expected: "Vado al lavoro in autobus.",
      ),
      SpeakTurn(
        prompt: "You're at the train station.",
        expected: "Da che binario parte?",
      ),
      SpeakTurn(
        prompt: "At the ticket counter.",
        expected: "Un biglietto per il centro, per favore.",
      ),
      SpeakTurn(
        prompt: "You're not sure of the route.",
        expected: "Questo treno ferma all'aeroporto?",
      ),
      SpeakTurn(
        prompt: "You missed the last bus.",
        expected: "Ho bisogno di un taxi.",
      ),
      SpeakTurn(
        prompt: "You're asking about travel time.",
        expected: "Quanto tempo ci vuole?",
      ),
      SpeakTurn(
        prompt: "It's a short distance.",
        expected: "Preferisco andare a piedi.",
      ),
    ],
  ),
  Scenario(
    id: "it_emergency",
    lang: LearnLang.it,
    cefr: Cefr.a1,
    minutes: 7,
    titles: {UiLang.tr: "Acil durum", UiLang.en: "Emergency"},
    clipLine: "Aiuto! Chiamate un'ambulanza!",
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr:
            "Bir olayı bildirirken 'c'è stato/a' kullanılır, 'ha' değil.",
        UiLang.en:
            "Report an occurrence with 'c'è stato/a' (there has been), not 'ha'.",
      },
      goodExample: "C'è stato un incidente.",
      badExample: "Ha un incidente.",
    ),
    phrases: [
      Phrase(
        id: "it_emergency_0",
        target: "Aiuto! Chiamate un'ambulanza!",
        gloss: {
          UiLang.tr: "İmdat! Ambulans çağırın!",
          UiLang.en: "Help! Call an ambulance!",
        },
      ),
      Phrase(
        id: "it_emergency_1",
        target: "C'è stato un incidente.",
        gloss: {
          UiLang.tr: "Bir kaza oldu.",
          UiLang.en: "There's been an accident.",
        },
      ),
      Phrase(
        id: "it_emergency_2",
        target: "Ho bisogno di un medico subito.",
        gloss: {
          UiLang.tr: "Hemen bir doktora ihtiyacım var.",
          UiLang.en: "I need a doctor right away.",
        },
      ),
      Phrase(
        id: "it_emergency_3",
        target: "Dov'è l'ospedale più vicino?",
        gloss: {
          UiLang.tr: "En yakın hastane nerede?",
          UiLang.en: "Where is the nearest hospital?",
        },
      ),
      Phrase(
        id: "it_emergency_4",
        target: "Qualcuno mi ha rubato la borsa.",
        gloss: {
          UiLang.tr: "Biri çantamı çaldı.",
          UiLang.en: "Someone stole my bag.",
        },
      ),
      Phrase(
        id: "it_emergency_5",
        target: "Sono allergico alla penicillina.",
        gloss: {
          UiLang.tr: "Penisiline alerjim var.",
          UiLang.en: "I'm allergic to penicillin.",
        },
      ),
      Phrase(
        id: "it_emergency_6",
        target: "Chiamate la polizia, per favore.",
        gloss: {
          UiLang.tr: "Lütfen polisi arayın.",
          UiLang.en: "Please call the police.",
        },
      ),
      Phrase(
        id: "it_emergency_7",
        target: "Mi sono perso, può aiutarmi?",
        gloss: {
          UiLang.tr: "Kayboldum, bana yardım edebilir misiniz?",
          UiLang.en: "I'm lost, can you help me?",
        },
      ),
    ],
    turns: [
      SpeakTurn(
        prompt: "You see someone collapse.",
        expected: "Aiuto! Chiamate un'ambulanza!",
      ),
      SpeakTurn(
        prompt: "You call emergency services.",
        expected: "C'è stato un incidente.",
      ),
      SpeakTurn(
        prompt: "You describe the urgency.",
        expected: "Ho bisogno di un medico subito.",
      ),
      SpeakTurn(
        prompt: "You need directions fast.",
        expected: "Dov'è l'ospedale più vicino?",
      ),
      SpeakTurn(
        prompt: "You're reporting a theft.",
        expected: "Qualcuno mi ha rubato la borsa.",
      ),
      SpeakTurn(
        prompt: "A doctor asks about allergies.",
        expected: "Sono allergico alla penicillina.",
      ),
      SpeakTurn(
        prompt: "You need official help.",
        expected: "Chiamate la polizia, per favore.",
      ),
      SpeakTurn(
        prompt: "You don't know where you are.",
        expected: "Mi sono perso, può aiutarmi?",
      ),
    ],
  ),
  Scenario(
    id: "it_routine",
    lang: LearnLang.it,
    cefr: Cefr.a1,
    minutes: 7,
    titles: {UiLang.tr: "Günlük rutin", UiLang.en: "Daily routine"},
    clipLine: "Di solito mi sveglio alle sette.",
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr:
            "Günlük eylemleri anlatan refleksif fiillerde ('svegliarsi') zamir çekimli fiilden önce gelir.",
        UiLang.en:
            "Daily-routine reflexive verbs like 'svegliarsi' need the reflexive pronoun before the conjugated verb.",
      },
      goodExample: "Mi sveglio alle sette.",
      badExample: "Sveglio alle sette.",
    ),
    phrases: [
      Phrase(
        id: "it_routine_0",
        target: "Di solito mi sveglio alle sette.",
        gloss: {
          UiLang.tr: "Genelde saat yedide uyanırım.",
          UiLang.en: "I usually wake up at seven.",
        },
      ),
      Phrase(
        id: "it_routine_1",
        target: "Faccio la doccia ogni mattina.",
        gloss: {
          UiLang.tr: "Her sabah duş alırım.",
          UiLang.en: "I take a shower every morning.",
        },
      ),
      Phrase(
        id: "it_routine_2",
        target: "Facciamo colazione insieme.",
        gloss: {
          UiLang.tr: "Birlikte kahvaltı yaparız.",
          UiLang.en: "We have breakfast together.",
        },
      ),
      Phrase(
        id: "it_routine_3",
        target: "Vado al lavoro in bicicletta.",
        gloss: {
          UiLang.tr: "İşe bisikletle giderim.",
          UiLang.en: "I go to work by bike.",
        },
      ),
      Phrase(
        id: "it_routine_4",
        target: "Mi lavo i denti due volte al giorno.",
        gloss: {
          UiLang.tr: "Günde iki kez dişlerimi fırçalarım.",
          UiLang.en: "I brush my teeth twice a day.",
        },
      ),
      Phrase(
        id: "it_routine_5",
        target: "La sera guardiamo un po' di televisione.",
        gloss: {
          UiLang.tr: "Akşamları biraz televizyon izleriz.",
          UiLang.en: "In the evening we watch a bit of TV.",
        },
      ),
      Phrase(
        id: "it_routine_6",
        target: "La domenica mi alzo tardi.",
        gloss: {
          UiLang.tr: "Pazar günleri geç kalkarım.",
          UiLang.en: "On Sundays I get up late.",
        },
      ),
    ],
    turns: [
      SpeakTurn(
        prompt: "Someone asks about your morning.",
        expected: "Di solito mi sveglio alle sette.",
      ),
      SpeakTurn(
        prompt: "What do you do next?",
        expected: "Faccio la doccia ogni mattina.",
      ),
      SpeakTurn(
        prompt: "You talk about your family's mornings.",
        expected: "Facciamo colazione insieme.",
      ),
      SpeakTurn(
        prompt: "You describe your commute.",
        expected: "Vado al lavoro in bicicletta.",
      ),
      SpeakTurn(
        prompt: "You're talking about hygiene habits.",
        expected: "Mi lavo i denti due volte al giorno.",
      ),
      SpeakTurn(
        prompt: "Someone asks about your evenings.",
        expected: "La sera guardiamo un po' di televisione.",
      ),
      SpeakTurn(
        prompt: "Someone asks about your weekend.",
        expected: "La domenica mi alzo tardi.",
      ),
    ],
  ),
  Scenario(
    id: "it_past_story",
    lang: LearnLang.it,
    cefr: Cefr.a1,
    minutes: 7,
    titles: {
      UiLang.tr: "Basit geçmiş zamanla bir olay anlatma",
      UiLang.en: "Telling a story in the past",
    },
    clipLine: "Ieri sono andato al mercato.",
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr:
            "Hareket fiillerinde passato prossimo 'essere' ile çekimlenir ve fiil öznenin cinsiyet/sayısına uyar.",
        UiLang.en:
            "Motion verbs form the past tense with 'essere', and the participle agrees with the subject's gender and number.",
      },
      goodExample: "Sono andato al mercato.",
      badExample: "Ho andato al mercato.",
    ),
    phrases: [
      Phrase(
        id: "it_past_story_0",
        target: "Ieri sono andato al mercato.",
        gloss: {
          UiLang.tr: "Dün pazara gittim.",
          UiLang.en: "Yesterday I went to the market.",
        },
      ),
      Phrase(
        id: "it_past_story_1",
        target: "Ho comprato della verdura fresca.",
        gloss: {
          UiLang.tr: "Biraz taze sebze aldım.",
          UiLang.en: "I bought some fresh vegetables.",
        },
      ),
      Phrase(
        id: "it_past_story_2",
        target: "Poi ho incontrato un vecchio amico.",
        gloss: {
          UiLang.tr: "Sonra eski bir arkadaşımla karşılaştım.",
          UiLang.en: "Then I met an old friend.",
        },
      ),
      Phrase(
        id: "it_past_story_3",
        target: "Abbiamo parlato per un'ora.",
        gloss: {
          UiLang.tr: "Bir saat konuştuk.",
          UiLang.en: "We talked for an hour.",
        },
      ),
      Phrase(
        id: "it_past_story_4",
        target: "Ho perso il portafoglio per strada.",
        gloss: {
          UiLang.tr: "Yolda cüzdanımı kaybettim.",
          UiLang.en: "I lost my wallet on the way.",
        },
      ),
      Phrase(
        id: "it_past_story_5",
        target: "Per fortuna qualcuno l'ha trovato.",
        gloss: {
          UiLang.tr: "Neyse ki biri onu buldu.",
          UiLang.en: "Luckily, someone found it.",
        },
      ),
      Phrase(
        id: "it_past_story_6",
        target: "È stata una giornata pazzesca!",
        gloss: {
          UiLang.tr: "Çılgın bir gündü!",
          UiLang.en: "It was a crazy day!",
        },
      ),
    ],
    turns: [
      SpeakTurn(
        prompt: "You're telling a friend about your day.",
        expected: "Ieri sono andato al mercato.",
      ),
      SpeakTurn(
        prompt: "You continue the story.",
        expected: "Ho comprato della verdura fresca.",
      ),
      SpeakTurn(
        prompt: "Something unexpected happened.",
        expected: "Poi ho incontrato un vecchio amico.",
      ),
      SpeakTurn(
        prompt: "You describe the encounter.",
        expected: "Abbiamo parlato per un'ora.",
      ),
      SpeakTurn(
        prompt: "Something went wrong.",
        expected: "Ho perso il portafoglio per strada.",
      ),
      SpeakTurn(
        prompt: "It has a happy ending.",
        expected: "Per fortuna qualcuno l'ha trovato.",
      ),
      SpeakTurn(
        prompt: "You're wrapping up the story.",
        expected: "È stata una giornata pazzesca!",
      ),
    ],
  ),

  // ===================== ROMANIAN =====================
  Scenario(
    id: "ro_intro",
    lang: LearnLang.ro,
    cefr: Cefr.a1,
    minutes: 7,
    titles: {UiLang.tr: "Tanışma", UiLang.en: "Meeting someone"},
    clipLine: "Îmi pare bine, eu sunt Mihai.",
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr:
            "Meslek adı konuşanın cinsiyetine uyar: erkek 'profesor', kadın 'profesoară'. 'a fi'den sonra artikel genelde düşer.",
        UiLang.en:
            "Job titles agree with the speaker's gender: a man is 'profesor', a woman is 'profesoară'. After 'a fi' the article is usually dropped.",
      },
      goodExample: "Ea este profesoară.",
      badExample: "Ea este profesor.",
    ),
    phrases: [
      Phrase(
        id: "ro_intro_0",
        target: "Îmi pare bine, eu sunt Mihai.",
        gloss: {
          UiLang.tr: "Memnun oldum, ben Mihai.",
          UiLang.en: "Nice to meet you, I'm Mihai.",
        },
      ),
      Phrase(
        id: "ro_intro_1",
        target: "Cum te cheamă?",
        gloss: {UiLang.tr: "Adın ne?", UiLang.en: "What's your name?"},
      ),
      Phrase(
        id: "ro_intro_2",
        target: "Mă numesc Ioana, dar tu?",
        gloss: {
          UiLang.tr: "Benim adım Ioana, ya sen?",
          UiLang.en: "My name's Ioana, and you?",
        },
      ),
      Phrase(
        id: "ro_intro_3",
        target: "De unde ești?",
        gloss: {UiLang.tr: "Nerelisin?", UiLang.en: "Where are you from?"},
      ),
      Phrase(
        id: "ro_intro_4",
        target: "Sunt din Istanbul.",
        gloss: {UiLang.tr: "İstanbulluyum.", UiLang.en: "I'm from Istanbul."},
      ),
      Phrase(
        id: "ro_intro_5",
        target: "Cu ce te ocupi?",
        gloss: {UiLang.tr: "Ne iş yapıyorsun?", UiLang.en: "What do you do?"},
      ),
      Phrase(
        id: "ro_intro_6",
        target: "Sunt profesoară.",
        gloss: {UiLang.tr: "Öğretmenim.", UiLang.en: "I'm a teacher."},
      ),
      Phrase(
        id: "ro_intro_7",
        target: "Mi-a făcut plăcere, pe curând!",
        gloss: {
          UiLang.tr: "Tanıştığımıza sevindim, yakında görüşürüz!",
          UiLang.en: "Nice meeting you, see you soon!",
        },
      ),
    ],
    turns: [
      SpeakTurn(
        prompt: "Someone new smiles at you.",
        expected: "Îmi pare bine, eu sunt Mihai.",
      ),
      SpeakTurn(
        prompt: "You want to know their name.",
        expected: "Cum te cheamă?",
      ),
      SpeakTurn(
        prompt: "They ask your name back.",
        expected: "Mă numesc Ioana, dar tu?",
      ),
      SpeakTurn(
        prompt: "You're curious where they're from.",
        expected: "De unde ești?",
      ),
      SpeakTurn(
        prompt: "They ask where you're from.",
        expected: "Sunt din Istanbul.",
      ),
      SpeakTurn(
        prompt: "You ask about their job.",
        expected: "Cu ce te ocupi?",
      ),
      SpeakTurn(prompt: "They ask what you do.", expected: "Sunt profesoară."),
      SpeakTurn(
        prompt: "Time to say goodbye.",
        expected: "Mi-a făcut plăcere, pe curând!",
      ),
    ],
  ),
  Scenario(
    id: "ro_shopping",
    lang: LearnLang.ro,
    cefr: Cefr.a1,
    minutes: 7,
    titles: {UiLang.tr: "Alışveriş", UiLang.en: "Shopping"},
    clipLine: "Doar mă uit, mulțumesc.",
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr:
            "Gösterme sıfatı ismin cinsiyetine uyar: acest/această, acești/aceste.",
        UiLang.en:
            "Demonstratives agree with the noun's gender: acest/această, acești/aceste.",
      },
      goodExample: "Cât costă acești pantofi?",
      badExample: "Cât costă această pantofi?",
    ),
    phrases: [
      Phrase(
        id: "ro_shopping_0",
        target: "Doar mă uit, mulțumesc.",
        gloss: {
          UiLang.tr: "Sadece bakıyorum, teşekkürler.",
          UiLang.en: "I'm just looking, thanks.",
        },
      ),
      Phrase(
        id: "ro_shopping_1",
        target: "Aveți asta la mărimea 40?",
        gloss: {
          UiLang.tr: "Bunun 40 numarası var mı?",
          UiLang.en: "Do you have this in size 40?",
        },
      ),
      Phrase(
        id: "ro_shopping_2",
        target: "Pot să-l probez?",
        gloss: {UiLang.tr: "Deneyebilir miyim?", UiLang.en: "Can I try it on?"},
      ),
      Phrase(
        id: "ro_shopping_3",
        target: "Cât costă acești pantofi?",
        gloss: {
          UiLang.tr: "Bu ayakkabılar ne kadar?",
          UiLang.en: "How much are these shoes?",
        },
      ),
      Phrase(
        id: "ro_shopping_4",
        target: "Acceptați cardul?",
        gloss: {UiLang.tr: "Kart geçiyor mu?", UiLang.en: "Do you take cards?"},
      ),
      Phrase(
        id: "ro_shopping_5",
        target: "E prea scump.",
        gloss: {UiLang.tr: "Çok pahalı.", UiLang.en: "It's too expensive."},
      ),
      Phrase(
        id: "ro_shopping_6",
        target: "Aveți o mărime mai mică?",
        gloss: {
          UiLang.tr: "Daha küçük bedeniniz var mı?",
          UiLang.en: "Do you have a smaller size?",
        },
      ),
      Phrase(
        id: "ro_shopping_7",
        target: "Îl iau.",
        gloss: {UiLang.tr: "Bunu alıyorum.", UiLang.en: "I'll take it."},
      ),
    ],
    turns: [
      SpeakTurn(
        prompt: "A clerk asks if you need help.",
        expected: "Doar mă uit, mulțumesc.",
      ),
      SpeakTurn(
        prompt: "You found something you like.",
        expected: "Aveți asta la mărimea 40?",
      ),
      SpeakTurn(
        prompt: "You want to test the fit.",
        expected: "Pot să-l probez?",
      ),
      SpeakTurn(
        prompt: "You're checking the price.",
        expected: "Cât costă acești pantofi?",
      ),
      SpeakTurn(prompt: "You're ready to pay.", expected: "Acceptați cardul?"),
      SpeakTurn(
        prompt: "You think the price is high.",
        expected: "E prea scump.",
      ),
      SpeakTurn(
        prompt: "It doesn't fit.",
        expected: "Aveți o mărime mai mică?",
      ),
      SpeakTurn(prompt: "You've decided to buy it.", expected: "Îl iau."),
    ],
  ),
  Scenario(
    id: "ro_numbers_time",
    lang: LearnLang.ro,
    cefr: Cefr.a1,
    minutes: 7,
    titles: {UiLang.tr: "Sayılar ve saat", UiLang.en: "Numbers and time"},
    clipLine: "Cât e ceasul?",
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr:
            "Saat söylerken 'bir' için 'e ora unu' (tekil), diğer saatler için 'sunt orele...' (çoğul) kullanılır.",
        UiLang.en:
            "Use 'e ora unu' (singular) only for one o'clock; other hours take 'sunt orele...' (plural).",
      },
      goodExample: "Sunt orele trei și jumătate.",
      badExample: "E ora trei și jumătate.",
    ),
    phrases: [
      Phrase(
        id: "ro_numbers_time_0",
        target: "Cât e ceasul?",
        gloss: {UiLang.tr: "Saat kaç?", UiLang.en: "What time is it?"},
      ),
      Phrase(
        id: "ro_numbers_time_1",
        target: "Sunt orele trei și jumătate.",
        gloss: {
          UiLang.tr: "Saat üç buçuk.",
          UiLang.en: "It's half past three.",
        },
      ),
      Phrase(
        id: "ro_numbers_time_2",
        target: "Magazinul se deschide la nouă.",
        gloss: {
          UiLang.tr: "Dükkan dokuzda açılıyor.",
          UiLang.en: "The shop opens at nine.",
        },
      ),
      Phrase(
        id: "ro_numbers_time_3",
        target: "Am două bilete.",
        gloss: {
          UiLang.tr: "İki biletim var.",
          UiLang.en: "I have two tickets.",
        },
      ),
      Phrase(
        id: "ro_numbers_time_4",
        target: "Fac doisprezece euro în total.",
        gloss: {
          UiLang.tr: "Toplam on iki euro tutuyor.",
          UiLang.en: "That's twelve euros in total.",
        },
      ),
      Phrase(
        id: "ro_numbers_time_5",
        target: "Ne vedem la ora cinci?",
        gloss: {
          UiLang.tr: "Saat beşte görüşelim mi?",
          UiLang.en: "Shall we meet at five?",
        },
      ),
      Phrase(
        id: "ro_numbers_time_6",
        target: "Ajung în zece minute.",
        gloss: {
          UiLang.tr: "On dakikaya varırım.",
          UiLang.en: "I'll arrive in ten minutes.",
        },
      ),
    ],
    turns: [
      SpeakTurn(prompt: "You don't know the time.", expected: "Cât e ceasul?"),
      SpeakTurn(
        prompt: "Someone asks you the time.",
        expected: "Sunt orele trei și jumătate.",
      ),
      SpeakTurn(
        prompt: "You want to visit a shop later.",
        expected: "Magazinul se deschide la nouă.",
      ),
      SpeakTurn(prompt: "At the counter.", expected: "Am două bilete."),
      SpeakTurn(
        prompt: "The clerk tells you the price.",
        expected: "Fac doisprezece euro în total.",
      ),
      SpeakTurn(
        prompt: "You're planning to meet a friend.",
        expected: "Ne vedem la ora cinci?",
      ),
      SpeakTurn(
        prompt: "You're running a bit late.",
        expected: "Ajung în zece minute.",
      ),
    ],
  ),
  Scenario(
    id: "ro_family",
    lang: LearnLang.ro,
    cefr: Cefr.a1,
    minutes: 7,
    titles: {UiLang.tr: "Aile", UiLang.en: "Family"},
    clipLine: "Aceasta este familia mea.",
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr:
            "İyelik sıfatı isimden sonra gelir ve isme uyar: 'sora mea' (kız kardeşim), 'mea sora' değil.",
        UiLang.en:
            "Possessive adjectives follow the noun and agree with it: 'sora mea' (my sister), never 'mea sora'.",
      },
      goodExample: "Sora mea locuiește la Cluj.",
      badExample: "Mea sora locuiește la Cluj.",
    ),
    phrases: [
      Phrase(
        id: "ro_family_0",
        target: "Aceasta este familia mea.",
        gloss: {UiLang.tr: "Bu benim ailem.", UiLang.en: "This is my family."},
      ),
      Phrase(
        id: "ro_family_1",
        target: "Am doi frați și o soră.",
        gloss: {
          UiLang.tr: "İki erkek kardeşim ve bir kız kardeşim var.",
          UiLang.en: "I have two brothers and a sister.",
        },
      ),
      Phrase(
        id: "ro_family_2",
        target: "Mama mea este doctoriță.",
        gloss: {
          UiLang.tr: "Annem doktor.",
          UiLang.en: "My mother is a doctor.",
        },
      ),
      Phrase(
        id: "ro_family_3",
        target: "Sora mea locuiește la Cluj.",
        gloss: {
          UiLang.tr: "Kız kardeşim Cluj'da yaşıyor.",
          UiLang.en: "My sister lives in Cluj.",
        },
      ),
      Phrase(
        id: "ro_family_4",
        target: "Câți ani are fiica ta?",
        gloss: {
          UiLang.tr: "Kızın kaç yaşında?",
          UiLang.en: "How old is your daughter?",
        },
      ),
      Phrase(
        id: "ro_family_5",
        target: "Părinții mei locuiesc la țară.",
        gloss: {
          UiLang.tr: "Ailem kırsalda yaşıyor.",
          UiLang.en: "My parents live in the countryside.",
        },
      ),
      Phrase(
        id: "ro_family_6",
        target: "Ai copii?",
        gloss: {
          UiLang.tr: "Çocuğun var mı?",
          UiLang.en: "Do you have children?",
        },
      ),
    ],
    turns: [
      SpeakTurn(
        prompt: "You're showing a photo.",
        expected: "Aceasta este familia mea.",
      ),
      SpeakTurn(
        prompt: "Someone asks about your siblings.",
        expected: "Am doi frați și o soră.",
      ),
      SpeakTurn(
        prompt: "They ask what your mother does.",
        expected: "Mama mea este doctoriță.",
      ),
      SpeakTurn(
        prompt: "You're talking about your sister.",
        expected: "Sora mea locuiește la Cluj.",
      ),
      SpeakTurn(
        prompt: "You want to know a friend's daughter's age.",
        expected: "Câți ani are fiica ta?",
      ),
      SpeakTurn(
        prompt: "They ask where your parents live.",
        expected: "Părinții mei locuiesc la țară.",
      ),
      SpeakTurn(prompt: "You're asking a new friend.", expected: "Ai copii?"),
    ],
  ),
  Scenario(
    id: "ro_weather",
    lang: LearnLang.ro,
    cefr: Cefr.a1,
    minutes: 7,
    titles: {UiLang.tr: "Hava durumu", UiLang.en: "Weather"},
    clipLine: "Cum e vremea azi?",
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr:
            "'a ploua' (yağmur yağmak) kişisiz bir fiildir, yalnızca tekil üçüncü şahısta kullanılır: 'plouă'.",
        UiLang.en:
            "'A ploua' (to rain) is an impersonal verb — it only ever appears in its third-person singular form 'plouă'.",
      },
      goodExample: "Plouă azi.",
      badExample: "Eu plou azi.",
    ),
    phrases: [
      Phrase(
        id: "ro_weather_0",
        target: "Cum e vremea azi?",
        gloss: {
          UiLang.tr: "Bugün hava nasıl?",
          UiLang.en: "What's the weather like today?",
        },
      ),
      Phrase(
        id: "ro_weather_1",
        target: "Plouă azi.",
        gloss: {
          UiLang.tr: "Bugün yağmur yağıyor.",
          UiLang.en: "It's raining today.",
        },
      ),
      Phrase(
        id: "ro_weather_2",
        target: "E foarte cald afară.",
        gloss: {
          UiLang.tr: "Dışarısı çok sıcak.",
          UiLang.en: "It's really hot outside.",
        },
      ),
      Phrase(
        id: "ro_weather_3",
        target: "Ia o umbrelă, poate plouă.",
        gloss: {
          UiLang.tr: "Şemsiyeni al, yağmur yağabilir.",
          UiLang.en: "Take an umbrella, it might rain.",
        },
      ),
      Phrase(
        id: "ro_weather_4",
        target: "E ger dimineața asta.",
        gloss: {
          UiLang.tr: "Bu sabah dondurucu soğuk.",
          UiLang.en: "It's freezing this morning.",
        },
      ),
      Phrase(
        id: "ro_weather_5",
        target: "Îmi plac zilele însorite.",
        gloss: {
          UiLang.tr: "Güneşli günleri severim.",
          UiLang.en: "I love sunny days.",
        },
      ),
      Phrase(
        id: "ro_weather_6",
        target: "Bate vântul azi?",
        gloss: {
          UiLang.tr: "Bugün rüzgar var mı?",
          UiLang.en: "Is it windy today?",
        },
      ),
    ],
    turns: [
      SpeakTurn(
        prompt: "You're about to go outside.",
        expected: "Cum e vremea azi?",
      ),
      SpeakTurn(
        prompt: "Someone asks about the weather.",
        expected: "Plouă azi.",
      ),
      SpeakTurn(prompt: "You step outside.", expected: "E foarte cald afară."),
      SpeakTurn(
        prompt: "Your friend is leaving the house.",
        expected: "Ia o umbrelă, poate plouă.",
      ),
      SpeakTurn(
        prompt: "You wake up and check the window.",
        expected: "E ger dimineața asta.",
      ),
      SpeakTurn(
        prompt: "You're talking about your favorite weather.",
        expected: "Îmi plac zilele însorite.",
      ),
      SpeakTurn(
        prompt: "You're deciding what to wear.",
        expected: "Bate vântul azi?",
      ),
    ],
  ),
  Scenario(
    id: "ro_transport",
    lang: LearnLang.ro,
    cefr: Cefr.a1,
    minutes: 7,
    titles: {UiLang.tr: "Ulaşım", UiLang.en: "Getting around"},
    clipLine: "Unde e cea mai apropiată stație de autobuz?",
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr:
            "Ulaşım aracından bahsederken 'cu' edatı belirli tanımlıklı isimle kullanılır: 'cu autobuzul', 'cu autobuz' değil.",
        UiLang.en:
            "Transport uses 'cu' + the definite article on the vehicle: 'cu autobuzul', never 'cu autobuz'.",
      },
      goodExample: "Merg la muncă cu autobuzul.",
      badExample: "Merg la muncă cu autobuz.",
    ),
    phrases: [
      Phrase(
        id: "ro_transport_0",
        target: "Unde e cea mai apropiată stație de autobuz?",
        gloss: {
          UiLang.tr: "En yakın otobüs durağı nerede?",
          UiLang.en: "Where's the nearest bus stop?",
        },
      ),
      Phrase(
        id: "ro_transport_1",
        target: "Merg la muncă cu autobuzul.",
        gloss: {
          UiLang.tr: "İşe otobüsle gidiyorum.",
          UiLang.en: "I go to work by bus.",
        },
      ),
      Phrase(
        id: "ro_transport_2",
        target: "De la ce peron pleacă?",
        gloss: {
          UiLang.tr: "Hangi perondan kalkıyor?",
          UiLang.en: "Which platform does it leave from?",
        },
      ),
      Phrase(
        id: "ro_transport_3",
        target: "Un bilet spre centru, vă rog.",
        gloss: {
          UiLang.tr: "Şehir merkezine bir bilet, lütfen.",
          UiLang.en: "One ticket to the center, please.",
        },
      ),
      Phrase(
        id: "ro_transport_4",
        target: "Trenul acesta oprește la aeroport?",
        gloss: {
          UiLang.tr: "Bu tren havalimanında duruyor mu?",
          UiLang.en: "Does this train stop at the airport?",
        },
      ),
      Phrase(
        id: "ro_transport_5",
        target: "Am nevoie de un taxi.",
        gloss: {
          UiLang.tr: "Taksiye ihtiyacım var.",
          UiLang.en: "I need a taxi.",
        },
      ),
      Phrase(
        id: "ro_transport_6",
        target: "Cât durează?",
        gloss: {
          UiLang.tr: "Ne kadar sürüyor?",
          UiLang.en: "How long does it take?",
        },
      ),
      Phrase(
        id: "ro_transport_7",
        target: "Prefer să merg pe jos.",
        gloss: {
          UiLang.tr: "Yürüyerek gitmeyi tercih ederim.",
          UiLang.en: "I prefer to go on foot.",
        },
      ),
    ],
    turns: [
      SpeakTurn(
        prompt: "You need to find a bus.",
        expected: "Unde e cea mai apropiată stație de autobuz?",
      ),
      SpeakTurn(
        prompt: "Someone asks how you commute.",
        expected: "Merg la muncă cu autobuzul.",
      ),
      SpeakTurn(
        prompt: "You're at the train station.",
        expected: "De la ce peron pleacă?",
      ),
      SpeakTurn(
        prompt: "At the ticket counter.",
        expected: "Un bilet spre centru, vă rog.",
      ),
      SpeakTurn(
        prompt: "You're not sure of the route.",
        expected: "Trenul acesta oprește la aeroport?",
      ),
      SpeakTurn(
        prompt: "You missed the last bus.",
        expected: "Am nevoie de un taxi.",
      ),
      SpeakTurn(
        prompt: "You're asking about travel time.",
        expected: "Cât durează?",
      ),
      SpeakTurn(
        prompt: "It's a short distance.",
        expected: "Prefer să merg pe jos.",
      ),
    ],
  ),
  Scenario(
    id: "ro_emergency",
    lang: LearnLang.ro,
    cefr: Cefr.a1,
    minutes: 7,
    titles: {UiLang.tr: "Acil durum", UiLang.en: "Emergency"},
    clipLine: "Ajutor! Chemați o ambulanță!",
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr:
            "Emir kipinde özne zamiri ('voi') kullanılmaz, doğrudan fiil ile başlanır.",
        UiLang.en:
            "In the imperative, no subject pronoun ('voi') is used — start directly with the verb.",
      },
      goodExample: "Chemați poliția!",
      badExample: "Voi chemați poliția!",
    ),
    phrases: [
      Phrase(
        id: "ro_emergency_0",
        target: "Ajutor! Chemați o ambulanță!",
        gloss: {
          UiLang.tr: "İmdat! Ambulans çağırın!",
          UiLang.en: "Help! Call an ambulance!",
        },
      ),
      Phrase(
        id: "ro_emergency_1",
        target: "S-a întâmplat un accident.",
        gloss: {
          UiLang.tr: "Bir kaza oldu.",
          UiLang.en: "An accident happened.",
        },
      ),
      Phrase(
        id: "ro_emergency_2",
        target: "Am nevoie de un doctor acum.",
        gloss: {
          UiLang.tr: "Şimdi bir doktora ihtiyacım var.",
          UiLang.en: "I need a doctor now.",
        },
      ),
      Phrase(
        id: "ro_emergency_3",
        target: "Unde e cel mai apropiat spital?",
        gloss: {
          UiLang.tr: "En yakın hastane nerede?",
          UiLang.en: "Where is the nearest hospital?",
        },
      ),
      Phrase(
        id: "ro_emergency_4",
        target: "Cineva mi-a furat geanta.",
        gloss: {
          UiLang.tr: "Biri çantamı çaldı.",
          UiLang.en: "Someone stole my bag.",
        },
      ),
      Phrase(
        id: "ro_emergency_5",
        target: "Sunt alergic la penicilină.",
        gloss: {
          UiLang.tr: "Penisiline alerjim var.",
          UiLang.en: "I'm allergic to penicillin.",
        },
      ),
      Phrase(
        id: "ro_emergency_6",
        target: "Chemați poliția, vă rog.",
        gloss: {
          UiLang.tr: "Lütfen polisi arayın.",
          UiLang.en: "Please call the police.",
        },
      ),
      Phrase(
        id: "ro_emergency_7",
        target: "M-am rătăcit, mă puteți ajuta?",
        gloss: {
          UiLang.tr: "Kayboldum, bana yardım edebilir misiniz?",
          UiLang.en: "I'm lost, can you help me?",
        },
      ),
    ],
    turns: [
      SpeakTurn(
        prompt: "You see someone collapse.",
        expected: "Ajutor! Chemați o ambulanță!",
      ),
      SpeakTurn(
        prompt: "You call emergency services.",
        expected: "S-a întâmplat un accident.",
      ),
      SpeakTurn(
        prompt: "You describe the urgency.",
        expected: "Am nevoie de un doctor acum.",
      ),
      SpeakTurn(
        prompt: "You need directions fast.",
        expected: "Unde e cel mai apropiat spital?",
      ),
      SpeakTurn(
        prompt: "You're reporting a theft.",
        expected: "Cineva mi-a furat geanta.",
      ),
      SpeakTurn(
        prompt: "A doctor asks about allergies.",
        expected: "Sunt alergic la penicilină.",
      ),
      SpeakTurn(
        prompt: "You need official help.",
        expected: "Chemați poliția, vă rog.",
      ),
      SpeakTurn(
        prompt: "You don't know where you are.",
        expected: "M-am rătăcit, mă puteți ajuta?",
      ),
    ],
  ),
  Scenario(
    id: "ro_routine",
    lang: LearnLang.ro,
    cefr: Cefr.a1,
    minutes: 7,
    titles: {UiLang.tr: "Günlük rutin", UiLang.en: "Daily routine"},
    clipLine: "De obicei mă trezesc la ora șapte.",
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr:
            "Günlük eylemleri anlatan refleksif fiillerde ('a se trezi') zamir çekimli fiilden önce gelir.",
        UiLang.en:
            "Daily-routine reflexive verbs like 'a se trezi' need the reflexive pronoun right before the conjugated verb.",
      },
      goodExample: "Mă trezesc la ora șapte.",
      badExample: "Trezesc la ora șapte.",
    ),
    phrases: [
      Phrase(
        id: "ro_routine_0",
        target: "De obicei mă trezesc la ora șapte.",
        gloss: {
          UiLang.tr: "Genelde saat yedide uyanırım.",
          UiLang.en: "I usually wake up at seven.",
        },
      ),
      Phrase(
        id: "ro_routine_1",
        target: "Fac duș în fiecare dimineață.",
        gloss: {
          UiLang.tr: "Her sabah duş alırım.",
          UiLang.en: "I take a shower every morning.",
        },
      ),
      Phrase(
        id: "ro_routine_2",
        target: "Luăm micul dejun împreună.",
        gloss: {
          UiLang.tr: "Birlikte kahvaltı yaparız.",
          UiLang.en: "We have breakfast together.",
        },
      ),
      Phrase(
        id: "ro_routine_3",
        target: "Merg la muncă cu bicicleta.",
        gloss: {
          UiLang.tr: "İşe bisikletle giderim.",
          UiLang.en: "I go to work by bike.",
        },
      ),
      Phrase(
        id: "ro_routine_4",
        target: "Mă spăl pe dinți de două ori pe zi.",
        gloss: {
          UiLang.tr: "Günde iki kez dişlerimi fırçalarım.",
          UiLang.en: "I brush my teeth twice a day.",
        },
      ),
      Phrase(
        id: "ro_routine_5",
        target: "Seara ne uităm puțin la televizor.",
        gloss: {
          UiLang.tr: "Akşamları biraz televizyon izleriz.",
          UiLang.en: "In the evening we watch a bit of TV.",
        },
      ),
      Phrase(
        id: "ro_routine_6",
        target: "Duminica mă trezesc târziu.",
        gloss: {
          UiLang.tr: "Pazar günleri geç kalkarım.",
          UiLang.en: "On Sundays I get up late.",
        },
      ),
    ],
    turns: [
      SpeakTurn(
        prompt: "Someone asks about your morning.",
        expected: "De obicei mă trezesc la ora șapte.",
      ),
      SpeakTurn(
        prompt: "What do you do next?",
        expected: "Fac duș în fiecare dimineață.",
      ),
      SpeakTurn(
        prompt: "You talk about your family's mornings.",
        expected: "Luăm micul dejun împreună.",
      ),
      SpeakTurn(
        prompt: "You describe your commute.",
        expected: "Merg la muncă cu bicicleta.",
      ),
      SpeakTurn(
        prompt: "You're talking about hygiene habits.",
        expected: "Mă spăl pe dinți de două ori pe zi.",
      ),
      SpeakTurn(
        prompt: "Someone asks about your evenings.",
        expected: "Seara ne uităm puțin la televizor.",
      ),
      SpeakTurn(
        prompt: "Someone asks about your weekend.",
        expected: "Duminica mă trezesc târziu.",
      ),
    ],
  ),
  Scenario(
    id: "ro_past_story",
    lang: LearnLang.ro,
    cefr: Cefr.a1,
    minutes: 7,
    titles: {
      UiLang.tr: "Basit geçmiş zamanla bir olay anlatma",
      UiLang.en: "Telling a story in the past",
    },
    clipLine: "Ieri am fost la piață.",
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr:
            "Geçmiş zaman (perfectul compus) neredeyse tüm fiillerde 'a avea' (am, ai, a...) yardımcı fiiliyle kurulur, İtalyanca/Fransızca'nın aksine hareket fiillerinde bile.",
        UiLang.en:
            "The past tense (perfect compus) uses the auxiliary 'a avea' (am, ai, a...) for nearly all verbs, even motion verbs — unlike Italian or French.",
      },
      goodExample: "Ieri am fost la piață.",
      badExample: "Ieri sunt fost la piață.",
    ),
    phrases: [
      Phrase(
        id: "ro_past_story_0",
        target: "Ieri am fost la piață.",
        gloss: {
          UiLang.tr: "Dün pazara gittim.",
          UiLang.en: "Yesterday I went to the market.",
        },
      ),
      Phrase(
        id: "ro_past_story_1",
        target: "Am cumpărat legume proaspete.",
        gloss: {
          UiLang.tr: "Taze sebze aldım.",
          UiLang.en: "I bought fresh vegetables.",
        },
      ),
      Phrase(
        id: "ro_past_story_2",
        target: "Apoi am întâlnit un vechi prieten.",
        gloss: {
          UiLang.tr: "Sonra eski bir arkadaşımla karşılaştım.",
          UiLang.en: "Then I met an old friend.",
        },
      ),
      Phrase(
        id: "ro_past_story_3",
        target: "Am vorbit timp de o oră.",
        gloss: {
          UiLang.tr: "Bir saat konuştuk.",
          UiLang.en: "We talked for an hour.",
        },
      ),
      Phrase(
        id: "ro_past_story_4",
        target: "Mi-am pierdut portofelul pe drum.",
        gloss: {
          UiLang.tr: "Yolda cüzdanımı kaybettim.",
          UiLang.en: "I lost my wallet on the way.",
        },
      ),
      Phrase(
        id: "ro_past_story_5",
        target: "Din fericire, cineva l-a găsit.",
        gloss: {
          UiLang.tr: "Neyse ki biri onu buldu.",
          UiLang.en: "Luckily, someone found it.",
        },
      ),
      Phrase(
        id: "ro_past_story_6",
        target: "A fost o zi nebună!",
        gloss: {
          UiLang.tr: "Çılgın bir gündü!",
          UiLang.en: "It was a crazy day!",
        },
      ),
    ],
    turns: [
      SpeakTurn(
        prompt: "You're telling a friend about your day.",
        expected: "Ieri am fost la piață.",
      ),
      SpeakTurn(
        prompt: "You continue the story.",
        expected: "Am cumpărat legume proaspete.",
      ),
      SpeakTurn(
        prompt: "Something unexpected happened.",
        expected: "Apoi am întâlnit un vechi prieten.",
      ),
      SpeakTurn(
        prompt: "You describe the encounter.",
        expected: "Am vorbit timp de o oră.",
      ),
      SpeakTurn(
        prompt: "Something went wrong.",
        expected: "Mi-am pierdut portofelul pe drum.",
      ),
      SpeakTurn(
        prompt: "It has a happy ending.",
        expected: "Din fericire, cineva l-a găsit.",
      ),
      SpeakTurn(
        prompt: "You're wrapping up the story.",
        expected: "A fost o zi nebună!",
      ),
    ],
  ),
];
