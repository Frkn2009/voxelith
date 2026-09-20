import '../models/models.dart';

class LibrarySentence {
  const LibrarySentence({required this.target, required this.glossTr});
  final String target;
  final String glossTr;
}

class LibraryStory {
  const LibraryStory({
    required this.id,
    required this.lang,
    required this.level,
    required this.title,
    required this.titleTr,
    required this.sentences,
  });
  final String id;
  final LearnLang lang;
  final Cefr level;
  final String title;
  final String titleTr;
  final List<LibrarySentence> sentences;
}

/// VOXELITH kitaplığı — seviyeye göre kısa okuma parçaları. Sesler cihaz TTS'i
/// ile okunur (bkz. StoryReaderScreen); metinler gerçek, dilbilgisi olarak
/// doğru cümlelerdir, otomatik çeviri değildir.
class VoxelithLibrary {
  static List<LibraryStory> forLang(LearnLang lang) =>
      _all.where((s) => s.lang == lang).toList(growable: false);

  static LibraryStory? byId(String id) {
    for (final story in _all) {
      if (story.id == id) return story;
    }
    return null;
  }

  static const _all = <LibraryStory>[
    LibraryStory(
      id: 'en_first_day',
      lang: LearnLang.en,
      level: Cefr.a1,
      title: 'First Day',
      titleTr: 'İlk Gün',
      sentences: [
        LibrarySentence(
          target: 'Today is my first day at work.',
          glossTr: 'Bugün işteki ilk günüm.',
        ),
        LibrarySentence(
          target: 'I wake up early and drink my coffee.',
          glossTr: 'Erken kalkıp kahvemi içiyorum.',
        ),
        LibrarySentence(
          target: 'The office is not far from my house.',
          glossTr: 'Ofis evimden uzak değil.',
        ),
        LibrarySentence(
          target: 'My new colleagues are very friendly.',
          glossTr: 'Yeni iş arkadaşlarım çok samimi.',
        ),
        LibrarySentence(
          target: 'I am a little nervous, but also happy.',
          glossTr: 'Biraz heyecanlıyım, ama aynı zamanda mutluyum.',
        ),
      ],
    ),
    LibraryStory(
      id: 'en_weekend',
      lang: LearnLang.en,
      level: Cefr.a1,
      title: 'Weekend Plan',
      titleTr: 'Hafta Sonu Planı',
      sentences: [
        LibrarySentence(
          target: 'This weekend I want to visit my grandmother.',
          glossTr: 'Bu hafta sonu büyükannemi ziyaret etmek istiyorum.',
        ),
        LibrarySentence(
          target: 'She lives in a small village near the sea.',
          glossTr: 'Denizin yakınında küçük bir köyde yaşıyor.',
        ),
        LibrarySentence(
          target: 'We usually cook together and talk for hours.',
          glossTr: 'Genelde birlikte yemek yapıp saatlerce konuşuruz.',
        ),
        LibrarySentence(
          target: 'In the evening, we watch the sunset from her garden.',
          glossTr: 'Akşam, bahçesinden gün batımını izleriz.',
        ),
        LibrarySentence(
          target: 'I always feel calm when I am there.',
          glossTr: 'Orada olduğumda hep sakin hissederim.',
        ),
      ],
    ),
    LibraryStory(
      id: 'en_new_hobby',
      lang: LearnLang.en,
      level: Cefr.a1,
      title: 'A New Hobby',
      titleTr: 'Yeni Bir Hobi',
      sentences: [
        LibrarySentence(
          target: 'Last month I started learning to paint.',
          glossTr: 'Geçen ay resim yapmayı öğrenmeye başladım.',
        ),
        LibrarySentence(
          target: 'I go to a small class near my house.',
          glossTr: 'Evimin yakınındaki küçük bir kursa gidiyorum.',
        ),
        LibrarySentence(
          target: 'My first paintings were not very good.',
          glossTr: 'İlk resimlerim çok iyi değildi.',
        ),
        LibrarySentence(
          target: 'But every week I feel more confident.',
          glossTr: 'Ama her hafta kendimi daha güvenli hissediyorum.',
        ),
        LibrarySentence(
          target: 'Now I want to paint a picture for my mother.',
          glossTr: 'Şimdi anneme bir tablo yapmak istiyorum.',
        ),
      ],
    ),
    LibraryStory(
      id: 'es_mercado',
      lang: LearnLang.es,
      level: Cefr.a1,
      title: 'El Mercado',
      titleTr: 'Pazar',
      sentences: [
        LibrarySentence(
          target: 'Los sábados voy al mercado con mi madre.',
          glossTr: 'Cumartesileri annemle pazara giderim.',
        ),
        LibrarySentence(
          target: 'Compramos frutas frescas y verduras.',
          glossTr: 'Taze meyve ve sebze alırız.',
        ),
        LibrarySentence(
          target: 'El mercado está lleno de gente y colores.',
          glossTr: 'Pazar insan ve renklerle dolu.',
        ),
        LibrarySentence(
          target: 'Me gusta probar el pan recién horneado.',
          glossTr: 'Yeni pişmiş ekmeği tatmayı severim.',
        ),
        LibrarySentence(
          target: 'Volvemos a casa con muchas bolsas.',
          glossTr: 'Eve bir sürü torbayla döneriz.',
        ),
      ],
    ),
    LibraryStory(
      id: 'es_amigo',
      lang: LearnLang.es,
      level: Cefr.a1,
      title: 'Un Amigo Nuevo',
      titleTr: 'Yeni Bir Arkadaş',
      sentences: [
        LibrarySentence(
          target: 'Ayer conocí a un chico en el parque.',
          glossTr: 'Dün parkta bir çocukla tanıştım.',
        ),
        LibrarySentence(
          target: 'Él también estudia español, como yo.',
          glossTr: 'O da benim gibi İspanyolca öğreniyor.',
        ),
        LibrarySentence(
          target: 'Hablamos sobre música y películas.',
          glossTr: 'Müzik ve filmler hakkında konuştuk.',
        ),
        LibrarySentence(
          target: 'Ahora somos amigos y practicamos juntos.',
          glossTr: 'Şimdi arkadaşız ve birlikte pratik yapıyoruz.',
        ),
        LibrarySentence(
          target: 'Espero verlo otra vez la próxima semana.',
          glossTr: 'Onu gelecek hafta tekrar görmeyi umuyorum.',
        ),
      ],
    ),
    LibraryStory(
      id: 'es_vecino',
      lang: LearnLang.es,
      level: Cefr.a1,
      title: 'El Vecino Nuevo',
      titleTr: 'Yeni Komşu',
      sentences: [
        LibrarySentence(
          target: 'Un hombre nuevo vive en el piso de arriba.',
          glossTr: 'Üst kattaki dairede yeni bir adam yaşıyor.',
        ),
        LibrarySentence(
          target: 'Es muy amable y siempre saluda.',
          glossTr: 'Çok kibar ve her zaman selam veriyor.',
        ),
        LibrarySentence(
          target: 'Un día me ayudó a subir las bolsas.',
          glossTr: 'Bir gün torbaları çıkarmama yardım etti.',
        ),
        LibrarySentence(
          target: 'Ahora tomamos café juntos los domingos.',
          glossTr: 'Şimdi pazarları birlikte kahve içiyoruz.',
        ),
        LibrarySentence(
          target: 'Me alegra tener un buen vecino.',
          glossTr: 'İyi bir komşum olduğu için mutluyum.',
        ),
      ],
    ),
    LibraryStory(
      id: 'de_regentag',
      lang: LearnLang.de,
      level: Cefr.a1,
      title: 'Der Regentag',
      titleTr: 'Yağmurlu Gün',
      sentences: [
        LibrarySentence(
          target: 'Heute regnet es den ganzen Tag.',
          glossTr: 'Bugün bütün gün yağmur yağıyor.',
        ),
        LibrarySentence(
          target: 'Ich bleibe zu Hause und lese ein Buch.',
          glossTr: 'Evde kalıp bir kitap okuyorum.',
        ),
        LibrarySentence(
          target: 'Meine Katze schläft neben mir auf dem Sofa.',
          glossTr: 'Kedim yanımda kanepede uyuyor.',
        ),
        LibrarySentence(
          target: 'Später koche ich eine warme Suppe.',
          glossTr: 'Sonra sıcak bir çorba pişiriyorum.',
        ),
        LibrarySentence(
          target: 'Regentage sind manchmal sehr gemütlich.',
          glossTr: 'Yağmurlu günler bazen çok keyiflidir.',
        ),
      ],
    ),
    LibraryStory(
      id: 'de_reise',
      lang: LearnLang.de,
      level: Cefr.a1,
      title: 'Die Reise',
      titleTr: 'Yolculuk',
      sentences: [
        LibrarySentence(
          target: 'Nächsten Monat fliege ich nach Berlin.',
          glossTr: 'Gelecek ay Berlin\'e uçuyorum.',
        ),
        LibrarySentence(
          target: 'Ich habe noch nie eine große Stadt besucht.',
          glossTr: 'Daha önce hiç büyük bir şehir ziyaret etmedim.',
        ),
        LibrarySentence(
          target: 'Meine Freundin zeigt mir die schönsten Orte.',
          glossTr: 'Arkadaşım bana en güzel yerleri gösterecek.',
        ),
        LibrarySentence(
          target: 'Wir wollen auch viele Fotos machen.',
          glossTr: 'Ayrıca bir sürü fotoğraf çekmek istiyoruz.',
        ),
        LibrarySentence(
          target: 'Ich bin sehr aufgeregt für die Reise.',
          glossTr: 'Yolculuk için çok heyecanlıyım.',
        ),
      ],
    ),
    LibraryStory(
      id: 'de_markt',
      lang: LearnLang.de,
      level: Cefr.a1,
      title: 'Der Wochenmarkt',
      titleTr: 'Haftalık Pazar',
      sentences: [
        LibrarySentence(
          target: 'Am Samstag gehe ich immer auf den Markt.',
          glossTr: 'Cumartesi günleri her zaman pazara giderim.',
        ),
        LibrarySentence(
          target: 'Dort kaufe ich frisches Gemüse und Käse.',
          glossTr: 'Orada taze sebze ve peynir alırım.',
        ),
        LibrarySentence(
          target: 'Die Verkäuferin kennt mich schon gut.',
          glossTr: 'Satıcı beni artık iyi tanıyor.',
        ),
        LibrarySentence(
          target: 'Wir sprechen kurz über das Wetter.',
          glossTr: 'Kısaca hava durumu hakkında konuşuruz.',
        ),
        LibrarySentence(
          target: 'Danach trage ich alles nach Hause.',
          glossTr: 'Sonra her şeyi eve taşırım.',
        ),
      ],
    ),
    LibraryStory(
      id: 'fr_cafe',
      lang: LearnLang.fr,
      level: Cefr.a1,
      title: 'Le Café du Matin',
      titleTr: 'Sabah Kahvesi',
      sentences: [
        LibrarySentence(
          target: 'Chaque matin, je bois un café avant le travail.',
          glossTr: 'Her sabah işten önce kahve içerim.',
        ),
        LibrarySentence(
          target: 'Le café est près de chez moi.',
          glossTr: 'Kafe evimin yakınında.',
        ),
        LibrarySentence(
          target: 'Le serveur connaît toujours ma commande.',
          glossTr: 'Garson her zaman siparişimi bilir.',
        ),
        LibrarySentence(
          target: "J'aime lire le journal pendant dix minutes.",
          glossTr: 'On dakika gazete okumayı severim.',
        ),
        LibrarySentence(
          target: 'Ensuite, je pars travailler content.',
          glossTr: 'Sonra mutlu bir şekilde işe giderim.',
        ),
      ],
    ),
    LibraryStory(
      id: 'fr_grandmere',
      lang: LearnLang.fr,
      level: Cefr.a1,
      title: 'La Cuisine de Grand-mère',
      titleTr: 'Büyükannenin Mutfağı',
      sentences: [
        LibrarySentence(
          target: 'Ma grand-mère cuisine très bien.',
          glossTr: 'Büyükannem çok iyi yemek yapar.',
        ),
        LibrarySentence(
          target: 'Chaque dimanche, toute la famille se réunit.',
          glossTr: 'Her pazar bütün aile bir araya gelir.',
        ),
        LibrarySentence(
          target: 'Elle prépare une soupe et du pain frais.',
          glossTr: 'Bir çorba ve taze ekmek hazırlar.',
        ),
        LibrarySentence(
          target: 'Nous parlons et rions autour de la table.',
          glossTr: 'Masanın etrafında konuşur ve güleriz.',
        ),
        LibrarySentence(
          target: 'Ces moments sont très importants pour moi.',
          glossTr: 'Bu anlar benim için çok önemli.',
        ),
      ],
    ),
    LibraryStory(
      id: 'fr_velo',
      lang: LearnLang.fr,
      level: Cefr.a1,
      title: "Le Nouveau Vélo",
      titleTr: 'Yeni Bisiklet',
      sentences: [
        LibrarySentence(
          target: "J'ai acheté un nouveau vélo la semaine dernière.",
          glossTr: 'Geçen hafta yeni bir bisiklet aldım.',
        ),
        LibrarySentence(
          target: 'Je vais au travail à vélo chaque matin.',
          glossTr: 'Her sabah bisikletle işe gidiyorum.',
        ),
        LibrarySentence(
          target: "L'air frais me réveille complètement.",
          glossTr: 'Temiz hava beni tamamen uyandırıyor.',
        ),
        LibrarySentence(
          target: 'Parfois, je prends un chemin plus long.',
          glossTr: 'Bazen daha uzun bir yol seçiyorum.',
        ),
        LibrarySentence(
          target: 'Faire du vélo me rend vraiment heureux.',
          glossTr: 'Bisiklete binmek beni gerçekten mutlu ediyor.',
        ),
      ],
    ),
    LibraryStory(
      id: 'ar_madina',
      lang: LearnLang.ar,
      level: Cefr.a1,
      title: 'يوم في المدينة',
      titleTr: 'Şehirde Bir Gün',
      sentences: [
        LibrarySentence(
          target: 'أذهب إلى المدينة كل يوم جمعة.',
          glossTr: 'Her Cuma günü şehre giderim.',
        ),
        LibrarySentence(
          target: 'أزور السوق وأشتري الفواكه.',
          glossTr: 'Pazarı ziyaret eder ve meyve alırım.',
        ),
        LibrarySentence(
          target: 'أحب الجلوس في مقهى صغير.',
          glossTr: 'Küçük bir kafede oturmayı severim.',
        ),
        LibrarySentence(
          target: 'أشاهد الناس وأشرب الشاي.',
          glossTr: 'İnsanları izler ve çay içerim.',
        ),
        LibrarySentence(
          target: 'أعود إلى البيت مساءً.',
          glossTr: 'Akşam eve dönerim.',
        ),
      ],
    ),
    LibraryStory(
      id: 'ar_sadiqa',
      lang: LearnLang.ar,
      level: Cefr.a1,
      title: 'صديقتي الجديدة',
      titleTr: 'Yeni Arkadaşım',
      sentences: [
        LibrarySentence(
          target: 'قابلت صديقة جديدة في الجامعة.',
          glossTr: 'Üniversitede yeni bir arkadaş tanıdım.',
        ),
        LibrarySentence(
          target: 'هي تتحدث العربية والإنجليزية.',
          glossTr: 'O Arapça ve İngilizce konuşuyor.',
        ),
        LibrarySentence(
          target: 'ندرس معًا كل أسبوع.',
          glossTr: 'Her hafta birlikte ders çalışıyoruz.',
        ),
        LibrarySentence(
          target: 'نشرب القهوة ونتحدث كثيرًا.',
          glossTr: 'Kahve içip çok konuşuyoruz.',
        ),
        LibrarySentence(
          target: 'أنا سعيدة بهذه الصداقة.',
          glossTr: 'Bu arkadaşlıktan mutluyum.',
        ),
      ],
    ),
    LibraryStory(
      id: 'ar_hadiqa',
      lang: LearnLang.ar,
      level: Cefr.a1,
      title: 'الحديقة القريبة',
      titleTr: 'Yakındaki Park',
      sentences: [
        LibrarySentence(
          target: 'بجانب بيتي حديقة صغيرة وجميلة.',
          glossTr: 'Evimin yanında küçük ve güzel bir park var.',
        ),
        LibrarySentence(
          target: 'أذهب إليها كل صباح للمشي.',
          glossTr: 'Her sabah yürüyüş yapmak için oraya giderim.',
        ),
        LibrarySentence(
          target: 'الأطفال يلعبون هناك بسعادة.',
          glossTr: 'Çocuklar orada mutlu bir şekilde oynar.',
        ),
        LibrarySentence(
          target: 'أجلس على مقعد وأشرب قهوتي.',
          glossTr: 'Bir bankta oturup kahvemi içerim.',
        ),
        LibrarySentence(
          target: 'هذه اللحظات الهادئة تعجبني كثيراً.',
          glossTr: 'Bu sakin anları çok seviyorum.',
        ),
      ],
    ),
    LibraryStory(
      id: 'pt_first_day',
      lang: LearnLang.pt,
      level: Cefr.a1,
      title: 'O primeiro dia de trabalho',
      titleTr: 'İlk İş Günü',
      sentences: [
        LibrarySentence(
          target: 'Ontem foi meu primeiro dia no novo emprego.',
          glossTr: 'Dün yeni işimdeki ilk günüm oldu.',
        ),
        LibrarySentence(
          target: 'O escritório é bonito e o meu chefe é simpático.',
          glossTr: 'Ofis güzel, patronum da kibar.',
        ),
        LibrarySentence(
          target: 'De manhã, tomei um café e comi um pão.',
          glossTr: 'Sabah bir kahve içtim ve ekmek yedim.',
        ),
        LibrarySentence(
          target: 'No almoço, falei com os colegas.',
          glossTr: 'Öğle yemeğinde iş arkadaşlarımla konuştum.',
        ),
        LibrarySentence(
          target: 'À tarde, trabalhei com documentos.',
          glossTr: 'Öğleden sonra belgelerle çalıştım.',
        ),
        LibrarySentence(
          target: 'Hoje estou cansado, mas feliz.',
          glossTr: 'Bugün yorgun ama mutluyum.',
        ),
      ],
    ),
    LibraryStory(
      id: 'pt_sunny_day',
      lang: LearnLang.pt,
      level: Cefr.a1,
      title: 'Um dia de sol',
      titleTr: 'Güneşli Bir Gün',
      sentences: [
        LibrarySentence(
          target: 'Hoje o tempo está muito bom, com sol e vento leve.',
          glossTr: 'Bugün hava çok güzel, güneşli ve hafif rüzgarlı.',
        ),
        LibrarySentence(
          target: 'No sábado de manhã, fui ao parque com os meus amigos.',
          glossTr: 'Cumartesi sabahı arkadaşlarımla parka gittim.',
        ),
        LibrarySentence(
          target: 'Sentamos na relva e conversamos.',
          glossTr: 'Çimlere oturup sohbet ettik.',
        ),
        LibrarySentence(
          target: 'Almoçamos sanduíches e frutas.',
          glossTr: 'Öğle yemeğinde sandviç ve meyve yedik.',
        ),
        LibrarySentence(
          target: 'À tarde, ouvimos música e brincamos.',
          glossTr: 'Öğleden sonra müzik dinledik ve oyunlar oynadık.',
        ),
        LibrarySentence(
          target: 'Foi um dia perfeito para mim.',
          glossTr: 'Benim için mükemmel bir gündü.',
        ),
      ],
    ),
    LibraryStory(
      id: 'pt_market',
      lang: LearnLang.pt,
      level: Cefr.a1,
      title: 'Na feira',
      titleTr: 'Pazar Günü',
      sentences: [
        LibrarySentence(
          target: 'Toda semana, vou à feira no sábado.',
          glossTr: 'Her hafta cumartesi pazar yerine gidiyorum.',
        ),
        LibrarySentence(
          target: 'Lá compro legumes, frutas e pão fresco.',
          glossTr: 'Orada sebzeler, meyveler ve taze ekmek alıyorum.',
        ),
        LibrarySentence(
          target: 'A feira tem muitas cores e bons cheiros.',
          glossTr: 'Pazar çok renkli ve güzel kokularla dolu.',
        ),
        LibrarySentence(
          target: 'Ontem comprei tomates, alface e queijo.',
          glossTr: 'Dün domates, marul ve peynir aldım.',
        ),
        LibrarySentence(
          target: 'No domingo, fiz uma salada grande.',
          glossTr: 'Pazar günü büyük bir salata yaptım.',
        ),
        LibrarySentence(
          target: 'Minha família adorou a salada.',
          glossTr: 'Ailem salatanın tadını çok çıkardı.',
        ),
      ],
    ),
    LibraryStory(
      id: 'it_family',
      lang: LearnLang.it,
      level: Cefr.a1,
      title: 'La mia famiglia',
      titleTr: 'Ailem',
      sentences: [
        LibrarySentence(
          target: 'Mio padre è medico e mia madre insegna in una scuola.',
          glossTr: 'Babam doktor, annem bir okulda öğretmen.',
        ),
        LibrarySentence(
          target: 'Abbiamo una casa piccola ma bella, vicino al centro.',
          glossTr: 'Merkeze yakın küçük ama güzel bir evimiz var.',
        ),
        LibrarySentence(
          target: 'La domenica siamo sempre tutti a casa.',
          glossTr: 'Pazar günü hepimiz her zaman evdeyiz.',
        ),
        LibrarySentence(
          target: 'Prepariamo la pasta e guardiamo un film.',
          glossTr: 'Makarna yapıp bir film izliyoruz.',
        ),
        LibrarySentence(
          target: 'La sera mangiamo insieme e parliamo di tante cose.',
          glossTr:
              'Akşam birlikte yemek yiyip birçok konu hakkında konuşuyoruz.',
        ),
        LibrarySentence(
          target: 'La domenica per me è il giorno più bello della settimana.',
          glossTr: 'Pazar benim için haftanın en güzel günü.',
        ),
      ],
    ),
    LibraryStory(
      id: 'it_my_job',
      lang: LearnLang.it,
      level: Cefr.a1,
      title: 'Il mio lavoro',
      titleTr: 'Benim İşim',
      sentences: [
        LibrarySentence(
          target: 'Lavoro in un ufficio vicino alla stazione.',
          glossTr: 'İstasyona yakın bir ofiste çalışıyorum.',
        ),
        LibrarySentence(
          target: 'Ogni mattina prendo il treno e arrivo in ufficio alle nove.',
          glossTr: 'Her sabah trene biniyorum ve ofise dokuzda varıyorum.',
        ),
        LibrarySentence(
          target: 'Di solito lavoro al computer e parlo con i clienti.',
          glossTr: 'Genelde bilgisayarla çalışıp müşterilerle konuşuyorum.',
        ),
        LibrarySentence(
          target: 'A mezzogiorno mangio un panino con i colleghi.',
          glossTr: 'Öğle saatlerinde iş arkadaşlarımla bir sandviç yiyorum.',
        ),
        LibrarySentence(
          target: 'Alle sei finisco il lavoro e torno a casa.',
          glossTr: 'Altıda işi bitirip eve dönüyorum.',
        ),
        LibrarySentence(
          target: 'La sera leggo o guardo la televisione.',
          glossTr: 'Akşam kitap okuyorum ya da televizyon izliyorum.',
        ),
      ],
    ),
    LibraryStory(
      id: 'it_beach_vacation',
      lang: LearnLang.it,
      level: Cefr.a1,
      title: 'Una vacanza al mare',
      titleTr: 'Deniz Kenarında Tatil',
      sentences: [
        LibrarySentence(
          target: 'In agosto andiamo al mare con la mia famiglia.',
          glossTr: 'Ağustos ayında ailemle denize gidiyoruz.',
        ),
        LibrarySentence(
          target: "L'hotel è piccolo, ma la stanza è molto comoda.",
          glossTr: 'Otel küçük, ama oda çok konforlu.',
        ),
        LibrarySentence(
          target: 'Ogni mattina nuotiamo in mare e dopo mangiamo una pizza.',
          glossTr: 'Her sabah denizde yüzüyor, sonra bir pizza yiyoruz.',
        ),
        LibrarySentence(
          target:
              'Il pomeriggio di solito restiamo al bar, perché fa molto caldo.',
          glossTr:
              'Öğleden sonra genellikle barda kalıyoruz, çünkü hava çok sıcak.',
        ),
        LibrarySentence(
          target: 'La sera camminiamo sulla spiaggia e guardiamo le stelle.',
          glossTr: 'Akşam plajda yürüyüp yıldızlara bakıyoruz.',
        ),
        LibrarySentence(
          target: 'È sempre una vacanza molto bella.',
          glossTr: 'Her zaman çok güzel bir tatil.',
        ),
      ],
    ),
    LibraryStory(
      id: 'ru_my_friend',
      lang: LearnLang.ru,
      level: Cefr.a1,
      title: 'Мой друг',
      titleTr: 'Arkadaşım',
      sentences: [
        LibrarySentence(
          target: 'У меня есть друг.',
          glossTr: 'Bir arkadaşım var.',
        ),
        LibrarySentence(
          target: 'Его зовут Дима, и он живёт рядом со мной.',
          glossTr: 'Adı Dima ve yanımda yaşıyor.',
        ),
        LibrarySentence(
          target: 'По субботам мы гуляем в парке.',
          glossTr: 'Cumartesi günleri parkta yürüyoruz.',
        ),
        LibrarySentence(
          target: 'Мы любим музыку и спорт.',
          glossTr: 'Müzik ve sporu seviyoruz.',
        ),
        LibrarySentence(
          target: 'На прошлых выходных мы играли в футбол.',
          glossTr: 'Geçen hafta sonu futbol oynadık.',
        ),
        LibrarySentence(
          target: 'Вечером Дима пришёл ко мне, и мы пили чай.',
          glossTr: 'Akşam Dima bana geldi, çay içtik.',
        ),
      ],
    ),
    LibraryStory(
      id: 'ru_weather',
      lang: LearnLang.ru,
      level: Cefr.a1,
      title: 'Погода',
      titleTr: 'Hava',
      sentences: [
        LibrarySentence(
          target: 'Сегодня утром было холодно.',
          glossTr: 'Bu sabah hava soğuktu.',
        ),
        LibrarySentence(
          target: 'Днём пошёл дождь.',
          glossTr: 'Öğlen yağmur başladı.',
        ),
        LibrarySentence(
          target: 'Я взял зонт и пошёл на работу.',
          glossTr: 'Şemsiyemi alıp işe gittim.',
        ),
        LibrarySentence(
          target: 'На работе было тепло.',
          glossTr: 'İş yerinde sıcaktı.',
        ),
        LibrarySentence(
          target: 'Вечером дождь закончился, и выглянуло солнце.',
          glossTr: 'Akşam yağmur durdu, güneş çıktı.',
        ),
        LibrarySentence(
          target: 'Я позвонил другу и пригласил его гулять.',
          glossTr: 'Arkadaşıma telefon edip yürüyüşe davet ettim.',
        ),
      ],
    ),
    LibraryStory(
      id: 'ru_at_the_store',
      lang: LearnLang.ru,
      level: Cefr.a1,
      title: 'В магазине',
      titleTr: 'Mağazada',
      sentences: [
        LibrarySentence(
          target: 'В воскресенье утром я пошёл в магазин.',
          glossTr: 'Pazar sabahı mağazaya gittim.',
        ),
        LibrarySentence(
          target: 'Я купил хлеб, молоко и яблоки.',
          glossTr: 'Ekmek, süt ve elma aldım.',
        ),
        LibrarySentence(
          target: 'У меня был список, поэтому я ничего не забыл.',
          glossTr: 'Bir listem vardı, bu yüzden hiçbir şeyi unutmadım.',
        ),
        LibrarySentence(
          target: 'В магазине была очередь, но она была короткая.',
          glossTr: 'Mağazada kuyruk vardı, ama kısaydı.',
        ),
        LibrarySentence(
          target: 'После магазина я сделал большой завтрак.',
          glossTr: 'Mağazadan sonra büyük bir kahvaltı hazırladım.',
        ),
        LibrarySentence(
          target: 'С кофе и сыром завтрак был отличный.',
          glossTr: 'Kahve ve peynirle kahvaltı harikaydı.',
        ),
      ],
    ),
    LibraryStory(
      id: 'zh_weekend',
      lang: LearnLang.zh,
      level: Cefr.a1,
      title: '周末',
      titleTr: 'Hafta Sonu',
      sentences: [
        LibrarySentence(
          target: '星期六早上，我去了公园。',
          glossTr: 'Cumartesi sabahı parka gittim.',
        ),
        LibrarySentence(
          target: '我和朋友一起散步。',
          glossTr: 'Arkadaşımla birlikte yürüdük.',
        ),
        LibrarySentence(
          target: '公园里有花，还有小鸟。',
          glossTr: 'Parkta çiçekler ve küçük kuşlar vardı.',
        ),
        LibrarySentence(
          target: '中午，我们吃面。',
          glossTr: 'Öğle yemeğinde noodle yedik.',
        ),
        LibrarySentence(
          target: '面条很好吃，我们都很开心。',
          glossTr: 'Noodle çok lezzetliydi, hepimiz çok mutlu olduk.',
        ),
        LibrarySentence(target: '这个周末很好。', glossTr: 'Bu hafta sonu güzeldi.'),
      ],
    ),
    LibraryStory(
      id: 'zh_my_job',
      lang: LearnLang.zh,
      level: Cefr.a1,
      title: '我的工作',
      titleTr: 'Benim İşim',
      sentences: [
        LibrarySentence(
          target: '我在医院当医生。',
          glossTr: 'Hastanede doktor olarak çalışıyorum.',
        ),
        LibrarySentence(
          target: '我每天早上八点去上班。',
          glossTr: 'Her sabah sekizde işe gidiyorum.',
        ),
        LibrarySentence(
          target: '我的工作是帮病人。',
          glossTr: 'İşim hastalara yardım etmek.',
        ),
        LibrarySentence(
          target: '中午在医院吃饭。',
          glossTr: 'Öğle yemeğini hastanede yiyorum.',
        ),
        LibrarySentence(
          target: '晚上我回家，给妈妈打电话。',
          glossTr: 'Akşam eve dönüyorum, anneme telefon ediyorum.',
        ),
        LibrarySentence(
          target: '工作很累，但我喜欢。',
          glossTr: 'İş yorucu, ama seviyorum.',
        ),
      ],
    ),
    LibraryStory(
      id: 'zh_shopping',
      lang: LearnLang.zh,
      level: Cefr.a1,
      title: '买东西',
      titleTr: 'Alışveriş',
      sentences: [
        LibrarySentence(
          target: '今天天气很好，我去了超市。',
          glossTr: 'Bugün hava çok güzel, süpermarkete gittim.',
        ),
        LibrarySentence(
          target: '超市里的人很多，东西很新鲜。',
          glossTr: 'Süpermarkette çok insan vardı, ürünler çok taze.',
        ),
        LibrarySentence(
          target: '我买了蔬菜、水果和面包。',
          glossTr: 'Sebze, meyve ve ekmek aldım.',
        ),
        LibrarySentence(
          target: '我带了一个大袋子回家。',
          glossTr: 'Büyük bir poşetle eve döndüm.',
        ),
        LibrarySentence(
          target: '下午我在家里做饭。',
          glossTr: 'Öğleden sonra evde yemek yaptım.',
        ),
        LibrarySentence(
          target: '晚上，我和家人一起吃饭。',
          glossTr: 'Akşam ailemle birlikte yemek yedik.',
        ),
      ],
    ),
    LibraryStory(
      id: 'ja_weekend',
      lang: LearnLang.ja,
      level: Cefr.a1,
      title: '週末',
      titleTr: 'Hafta Sonu',
      sentences: [
        LibrarySentence(
          target: '土曜日の朝、公園に行きました。',
          glossTr: 'Cumartesi sabahı parka gittim.',
        ),
        LibrarySentence(target: '友達と散歩しました。', glossTr: 'Arkadaşımla yürüdük.'),
        LibrarySentence(
          target: '公園には花がたくさんありました。',
          glossTr: 'Parkta çok çiçek vardı.',
        ),
        LibrarySentence(target: '昼はラーメンを食べました。', glossTr: 'Öğlen ramen yedik.'),
        LibrarySentence(
          target: 'ラーメンはとてもおいしかったです。',
          glossTr: 'Ramen çok lezzetliydi.',
        ),
        LibrarySentence(
          target: 'いい週末でした。',
          glossTr: 'Güzel bir hafta sonuydu.',
        ),
      ],
    ),
    LibraryStory(
      id: 'ja_my_job',
      lang: LearnLang.ja,
      level: Cefr.a1,
      title: '私の仕事',
      titleTr: 'Benim İşim',
      sentences: [
        LibrarySentence(
          target: '私は会社の近くに住んでいます。',
          glossTr: 'Şirketin yakınında oturuyorum.',
        ),
        LibrarySentence(
          target: '朝は電車で会社に行きます。',
          glossTr: 'Sabahları trenle şirkete gidiyorum.',
        ),
        LibrarySentence(
          target: '午前中はパソコンで仕事をします。',
          glossTr: 'Öğlene kadar bilgisayarla çalışıyorum.',
        ),
        LibrarySentence(
          target: '昼は友達と昼ご飯を食べます。',
          glossTr: 'Öğlen arkadaşlarımla yemek yiyorum.',
        ),
        LibrarySentence(
          target: '六時に仕事を終えます。',
          glossTr: 'Altıda işi bitiriyorum.',
        ),
        LibrarySentence(
          target: '夜は家でゆっくり休みます。',
          glossTr: 'Akşam evde rahatça dinleniyorum.',
        ),
      ],
    ),
    LibraryStory(
      id: 'ja_weather',
      lang: LearnLang.ja,
      level: Cefr.a1,
      title: '天気',
      titleTr: 'Hava Durumu',
      sentences: [
        LibrarySentence(target: '今日はお天気がいいです。', glossTr: 'Bugün hava güzel.'),
        LibrarySentence(target: '朝は少し寒かったです。', glossTr: 'Sabah biraz soğuktu.'),
        LibrarySentence(target: '昼は雨が降りました。', glossTr: 'Öğlen yağmur yağdı.'),
        LibrarySentence(
          target: '私は傘を持って出かけました。',
          glossTr: 'Şemsiyemi alıp dışarı çıktım.',
        ),
        LibrarySentence(target: '夜は雨が終わりました。', glossTr: 'Akşam yağmur durdu.'),
        LibrarySentence(
          target: '明日はきっと晴れます。',
          glossTr: 'Yarın kesinlikle güneşli olacak.',
        ),
      ],
    ),
    LibraryStory(
      id: 'ko_my_friend',
      lang: LearnLang.ko,
      level: Cefr.a1,
      title: '내 친구',
      titleTr: 'Arkadaşım',
      sentences: [
        LibrarySentence(
          target: '내 친구 이름은 민준입니다.',
          glossTr: 'Arkadaşımın adı Minjun.',
        ),
        LibrarySentence(
          target: '그는 우리 회사에서 일합니다.',
          glossTr: 'O bizim şirketimizde çalışıyor.',
        ),
        LibrarySentence(
          target: '토요일에 우리는 공원에 갑니다.',
          glossTr: 'Cumartesi günleri parka gideriz.',
        ),
        LibrarySentence(
          target: '우리는 음악과 운동을 좋아합니다.',
          glossTr: 'Müzik ve sporu seviyoruz.',
        ),
        LibrarySentence(
          target: '지난 주말에 우리는 축구했습니다.',
          glossTr: 'Geçen hafta sonu futbol oynadık.',
        ),
        LibrarySentence(
          target: '저녁에 민준이 집에 왔고, 우리는 차를 마셨습니다.',
          glossTr: 'Akşam Minjun bana geldi, çay içtik.',
        ),
      ],
    ),
    LibraryStory(
      id: 'ko_weather',
      lang: LearnLang.ko,
      level: Cefr.a1,
      title: '날씨',
      titleTr: 'Hava',
      sentences: [
        LibrarySentence(target: '오늘 아침은 춥습니다.', glossTr: 'Bugün sabah soğuk.'),
        LibrarySentence(target: '낮에는 비가 왔습니다.', glossTr: 'Öğlen yağmur yağdı.'),
        LibrarySentence(
          target: '우산을 가지고 회사에 갔습니다.',
          glossTr: 'Şemsiyemi alıp şirkete gittim.',
        ),
        LibrarySentence(
          target: '회사에서는 따뜻하고 편했습니다.',
          glossTr: 'Şirkette sıcak ve rahattı.',
        ),
        LibrarySentence(
          target: '저녁에 비가 그쳤습니다.',
          glossTr: 'Akşam yağmur durdu.',
        ),
        LibrarySentence(
          target: '친구에게 전화를 걸고 산책하자고 했습니다.',
          glossTr: 'Arkadaşıma telefon edip yürüyüşe çıkmayı teklif ettim.',
        ),
      ],
    ),
    LibraryStory(
      id: 'ko_shopping',
      lang: LearnLang.ko,
      level: Cefr.a1,
      title: '장보기',
      titleTr: 'Alışveriş',
      sentences: [
        LibrarySentence(
          target: '일요일 아침에 저는 시장에 갔습니다.',
          glossTr: 'Pazar sabahı pazara gittim.',
        ),
        LibrarySentence(
          target: '빵, 우유, 사과를 샀습니다.',
          glossTr: 'Ekmek, süt ve elma aldım.',
        ),
        LibrarySentence(
          target: '시장에서 물건은 싼 편입니다.',
          glossTr: 'Pazarda ürünler nispeten ucuz.',
        ),
        LibrarySentence(
          target: '저는 목록을 가지고 가서 아무것도 잊지 않았습니다.',
          glossTr: 'Listemi alıp gittim, hiçbir şeyi unutmadım.',
        ),
        LibrarySentence(
          target: '집에 돌아와서 맛있는 아침을 만들었습니다.',
          glossTr: 'Eve dönüp lezzetli bir kahvaltı hazırladım.',
        ),
        LibrarySentence(
          target: '커피를 마시고 아침을 먹었습니다.',
          glossTr: 'Kahve içip kahvaltı yaptım.',
        ),
      ],
    ),
    LibraryStory(
      id: 'hi_my_weekend',
      lang: LearnLang.hi,
      level: Cefr.a1,
      title: 'मेरा वीकेंड',
      titleTr: 'Benim Hafta Sonum',
      sentences: [
        LibrarySentence(
          target: 'शनिवार की सुबह मैं पार्क गया।',
          glossTr: 'Cumartesi sabahı parka gittim.',
        ),
        LibrarySentence(
          target: 'मैंने दोस्तों के साथ सैर की।',
          glossTr: 'Arkadaşlarımla yürüyüş yaptım.',
        ),
        LibrarySentence(
          target: 'पार्क में फूल और पक्षी थे।',
          glossTr: 'Parkta çiçekler ve kuşlar vardı.',
        ),
        LibrarySentence(
          target: 'दोपहर में हमने चावल और सब्ज़ी खाई।',
          glossTr: 'Öğlen pirinç ve sebze yedik.',
        ),
        LibrarySentence(target: 'सब खुश थे।', glossTr: 'Herkes mutluydu.'),
        LibrarySentence(
          target: 'यह एक अच्छा वीकेंड था।',
          glossTr: 'Bu güzel bir hafta sonuydu.',
        ),
      ],
    ),
    LibraryStory(
      id: 'hi_my_job',
      lang: LearnLang.hi,
      level: Cefr.a1,
      title: 'मेरा काम',
      titleTr: 'Benim İşim',
      sentences: [
        LibrarySentence(
          target: 'मैं एक अस्पताल में काम करता हूँ।',
          glossTr: 'Bir hastanede çalışıyorum.',
        ),
        LibrarySentence(
          target: 'मैं हर सुबह नौ बजे काम पर जाता हूँ।',
          glossTr: 'Her sabah dokuzda işe gidiyorum.',
        ),
        LibrarySentence(
          target: 'मेरा काम मरीज़ों की मदद करना है।',
          glossTr: 'İşim hastalara yardım etmek.',
        ),
        LibrarySentence(
          target: 'दोपहर में मैं अस्पताल में खाना खाता हूँ।',
          glossTr: 'Öğlen hastanede yemek yiyorum.',
        ),
        LibrarySentence(
          target: 'शाम को मैं घर लौटता हूँ।',
          glossTr: 'Akşam eve dönüyorum.',
        ),
        LibrarySentence(
          target: 'काम थका देता है, लेकिन मुझे यह पसंद है।',
          glossTr: 'İş yoruyor, ama seviyorum.',
        ),
      ],
    ),
    LibraryStory(
      id: 'hi_shopping',
      lang: LearnLang.hi,
      level: Cefr.a1,
      title: 'खरीदारी',
      titleTr: 'Alışveriş',
      sentences: [
        LibrarySentence(
          target: 'आज मौसम अच्छा था, इसलिए मैं सुपरमार्क गया।',
          glossTr: 'Bugün hava güzeldi, o yüzden süpermarkete gittim.',
        ),
        LibrarySentence(
          target: 'सुपरमार्क में बहुत लोग थे।',
          glossTr: 'Süpermarkette çok insan vardı.',
        ),
        LibrarySentence(
          target: 'मैंने सब्ज़ियाँ, फल और रोटी खरीदीं।',
          glossTr: 'Sebze, meyve ve ekmek aldım.',
        ),
        LibrarySentence(
          target: 'सब चीज़ें ताज़ी थीं।',
          glossTr: 'Her şey taze idi.',
        ),
        LibrarySentence(
          target: 'दोपहर में मैंने घर पर खाना बनाया।',
          glossTr: 'Öğleden sonra evde yemek yaptım.',
        ),
        LibrarySentence(
          target: 'शाम को मैंने अपने परिवार के साथ खाना खाया।',
          glossTr: 'Akşam ailemle birlikte yemek yedim.',
        ),
      ],
    ),
    LibraryStory(
      id: 'th_my_weekend',
      lang: LearnLang.th,
      level: Cefr.a1,
      title: 'สุดสัปดาห์ของฉัน',
      titleTr: 'Benim Hafta Sonum',
      sentences: [
        LibrarySentence(
          target: 'วันเสาร์เช้าฉันไปสวนสาธารณะ',
          glossTr: 'Cumartesi sabahı parka gittim.',
        ),
        LibrarySentence(
          target: 'ฉันเดินเล่นกับเพื่อน',
          glossTr: 'Arkadaşımla yürüdüm.',
        ),
        LibrarySentence(
          target: 'ในสวนมีดอกไม้และนก',
          glossTr: 'Parkta çiçekler ve kuşlar vardı.',
        ),
        LibrarySentence(
          target: 'ตอนเที่ยงเรากินก๋วยเตี๋ยว',
          glossTr: 'Öğlen noodle yedik.',
        ),
        LibrarySentence(
          target: 'ก๋วยเตี๋ยวอร่อยมาก',
          glossTr: 'Noodle çok lezzetliydi.',
        ),
        LibrarySentence(
          target: 'เป็นสุดสัปดาห์ที่ดีมาก',
          glossTr: 'Çok güzel bir hafta sonuydu.',
        ),
      ],
    ),
    LibraryStory(
      id: 'th_my_job',
      lang: LearnLang.th,
      level: Cefr.a1,
      title: 'งานของฉัน',
      titleTr: 'Benim İşim',
      sentences: [
        LibrarySentence(
          target: 'ฉันทำงานในสำนักงาน',
          glossTr: 'Bir ofiste çalışıyorum.',
        ),
        LibrarySentence(
          target: 'ทุกวันฉันนั่งรถเมล์ไปทำงาน',
          glossTr: 'Her gün otobüsle işe gidiyorum.',
        ),
        LibrarySentence(
          target: 'ตอนเช้าฉันใช้คอมพิวเตอร์ทำงาน',
          glossTr: 'Sabahları bilgisayarla çalışıyorum.',
        ),
        LibrarySentence(
          target: 'ตอนเที่ยงฉันกินข้าวกับเพื่อน',
          glossTr: 'Öğlen arkadaşlarımla yemek yiyorum.',
        ),
        LibrarySentence(
          target: 'หกโมงเย็นฉันเลิกงาน',
          glossTr: 'Altıda işten ayrılıyorum.',
        ),
        LibrarySentence(
          target: 'ตอนเย็นฉันดูทีวีที่บ้าน',
          glossTr: 'Akşam evde televizyon izliyorum.',
        ),
      ],
    ),
    LibraryStory(
      id: 'th_weather',
      lang: LearnLang.th,
      level: Cefr.a1,
      title: 'สภาพอากาศ',
      titleTr: 'Hava Durumu',
      sentences: [
        LibrarySentence(target: 'วันนี้อากาศดี', glossTr: 'Bugün hava güzel.'),
        LibrarySentence(
          target: 'เช้าอากาศเย็นเล็กน้อย',
          glossTr: 'Sabah hava biraz serin.',
        ),
        LibrarySentence(
          target: 'ตอนบ่ายฝนตก',
          glossTr: 'Öğleden sonra yağmur yağdı.',
        ),
        LibrarySentence(
          target: 'ฉันเอาร่มไปด้วย',
          glossTr: 'Yanımda şemsiye taşıdım.',
        ),
        LibrarySentence(
          target: 'ตอนเย็นฝนหยุด',
          glossTr: 'Akşam yağmur durdu.',
        ),
        LibrarySentence(
          target: 'พรุ่งนี้อากาศจะดี',
          glossTr: 'Yarın hava güzel olacak.',
        ),
      ],
    ),
    LibraryStory(
      id: 'el_family',
      lang: LearnLang.el,
      level: Cefr.a1,
      title: 'Η οικογένειά μου',
      titleTr: 'Ailem',
      sentences: [
        LibrarySentence(
          target: 'Ο πατέρας μου είναι γιατρός.',
          glossTr: 'Babam doktor.',
        ),
        LibrarySentence(
          target: 'Η μητέρα μου δουλεύει σε ένα σχολείο.',
          glossTr: 'Annem bir okulda çalışıyor.',
        ),
        LibrarySentence(
          target: 'Έχω μια αδερφή.',
          glossTr: 'Bir kız kardeşim var.',
        ),
        LibrarySentence(
          target: 'Το σπίτι μας είναι μικρό, αλλά όμορφο.',
          glossTr: 'Evimiz küçük ama güzel.',
        ),
        LibrarySentence(
          target: 'Το απόγευμα της Κυριακής μαγειρεύουμε μαζί.',
          glossTr: 'Pazar öğleden sonraları birlikte yemek yapıyoruz.',
        ),
        LibrarySentence(
          target: 'Στο τέλος της ημέρας τρώμε όλοι μαζί.',
          glossTr: 'Günün sonunda hepimiz birlikte yemek yiyoruz.',
        ),
      ],
    ),
    LibraryStory(
      id: 'el_my_job',
      lang: LearnLang.el,
      level: Cefr.a1,
      title: 'Η δουλειά μου',
      titleTr: 'Benim İşim',
      sentences: [
        LibrarySentence(
          target: 'Δουλεύω σε ένα γραφείο κοντά στον σταθμό.',
          glossTr: 'İstasyona yakın bir ofiste çalışıyorum.',
        ),
        LibrarySentence(
          target: 'Το πρωί πίνω ένα καφέ και ξεκινώ στις εννιά.',
          glossTr: 'Sabah bir kahve içiyorum ve dokuzda işe başlıyorum.',
        ),
        LibrarySentence(
          target: 'Συχνά μιλάω με τους πελάτες.',
          glossTr: 'Sık sık müşterilerle konuşuyorum.',
        ),
        LibrarySentence(
          target: 'Για μεσημέρι τρώω ένα σάντουιτς.',
          glossTr: 'Öğle yemeğinde bir sandviç yiyorum.',
        ),
        LibrarySentence(
          target: 'Στις έξι τελειώνω και γυρίζω στο σπίτι.',
          glossTr: 'Altıda bitirip eve dönüyorum.',
        ),
        LibrarySentence(
          target: 'Το απόγευμα διαβάζω ή βλέπω τηλεόραση.',
          glossTr: 'Öğleden sonra kitap okuyorum ya da televizyon izliyorum.',
        ),
      ],
    ),
    LibraryStory(
      id: 'el_market',
      lang: LearnLang.el,
      level: Cefr.a1,
      title: 'Η αγορά',
      titleTr: 'Haftalık Alışveriş',
      sentences: [
        LibrarySentence(
          target: 'Κάθε Κυριακή πηγαίνω στην αγορά.',
          glossTr: 'Her pazar pazar yerine gidiyorum.',
        ),
        LibrarySentence(
          target: 'Αγοράζω λαχανικά, φρούτα και ψωμί.',
          glossTr: 'Sebze, meyve ve ekmek alıyorum.',
        ),
        LibrarySentence(
          target: 'Στην αγορά υπάρχουν πολλά χρώματα.',
          glossTr: 'Pazar yerinde çok renk var.',
        ),
        LibrarySentence(
          target: 'Χθες αγόρασα ντομάτες και αγγούρια.',
          glossTr: 'Dün domates ve salatalık aldım.',
        ),
        LibrarySentence(
          target: 'Σαν βράδυ έφτιαξα μια σαλάτα.',
          glossTr: 'Akşam bir salata yaptım.',
        ),
        LibrarySentence(
          target: 'Όλοι την φάγαμε με πολλή όρεξη.',
          glossTr: 'Hepimiz iştahla yedik.',
        ),
      ],
    ),
    LibraryStory(
      id: 'tr_weekend',
      lang: LearnLang.tr,
      level: Cefr.a1,
      title: 'Hafta Sonu',
      titleTr: 'Hafta Sonu',
      sentences: [
        LibrarySentence(
          target: 'Cumartesi sabahı parka gittim.',
          glossTr: 'Cumartesi sabahı parka gittim.',
        ),
        LibrarySentence(
          target: 'Arkadaşımla birlikte yürüdük.',
          glossTr: 'Arkadaşımla birlikte yürüdük.',
        ),
        LibrarySentence(
          target: 'Parkta çiçekler ve kuşlar vardı.',
          glossTr: 'Parkta çiçekler ve kuşlar vardı.',
        ),
        LibrarySentence(
          target: 'Öğlen çorba ve ekmek yedik.',
          glossTr: 'Öğlen çorba ve ekmek yedik.',
        ),
        LibrarySentence(
          target: 'Hava çok güzeldi.',
          glossTr: 'Hava çok güzeldi.',
        ),
        LibrarySentence(
          target: 'Güzel bir hafta sonuydu.',
          glossTr: 'Güzel bir hafta sonuydu.',
        ),
      ],
    ),
    LibraryStory(
      id: 'tr_my_job',
      lang: LearnLang.tr,
      level: Cefr.a1,
      title: 'Benim İşim',
      titleTr: 'Benim İşim',
      sentences: [
        LibrarySentence(
          target: 'Ben bir hastanede çalışıyorum.',
          glossTr: 'Ben bir hastanede çalışıyorum.',
        ),
        LibrarySentence(
          target: 'Her sabah dokuzda işe giderim.',
          glossTr: 'Her sabah dokuzda işe giderim.',
        ),
        LibrarySentence(
          target: 'Benim işim hastalara yardım etmek.',
          glossTr: 'Benim işim hastalara yardım etmek.',
        ),
        LibrarySentence(
          target: 'Öğlen hastanede yemek yerim.',
          glossTr: 'Öğlen hastanede yemek yerim.',
        ),
        LibrarySentence(
          target: 'Akşam eve dönerim.',
          glossTr: 'Akşam eve dönerim.',
        ),
        LibrarySentence(
          target: 'İş yorucu, ama ben seviyorum.',
          glossTr: 'İş yorucu, ama ben seviyorum.',
        ),
      ],
    ),
    LibraryStory(
      id: 'tr_shopping',
      lang: LearnLang.tr,
      level: Cefr.a1,
      title: 'Alışveriş',
      titleTr: 'Alışveriş',
      sentences: [
        LibrarySentence(
          target: 'Pazar sabahı markete gittim.',
          glossTr: 'Pazar sabahı markete gittim.',
        ),
        LibrarySentence(
          target: 'Ekmek, süt ve elma aldım.',
          glossTr: 'Ekmek, süt ve elma aldım.',
        ),
        LibrarySentence(
          target: 'Market çok kalabalıktı.',
          glossTr: 'Market çok kalabalıktı.',
        ),
        LibrarySentence(
          target: 'Evde büyük bir kahvaltı yaptım.',
          glossTr: 'Evde büyük bir kahvaltı yaptım.',
        ),
        LibrarySentence(
          target: 'Çay ve peynirle kahvaltı çok güzeldi.',
          glossTr: 'Çay ve peynirle kahvaltı çok güzeldi.',
        ),
        LibrarySentence(
          target: 'Güne güzel başladım.',
          glossTr: 'Güne güzel başladım.',
        ),
      ],
    ),
    // --- Nederlands (nl) ---
    LibraryStory(
      id: 'nl_morning_coffee',
      lang: LearnLang.nl,
      level: Cefr.a1,
      title: 'Mijn ochtend',
      titleTr: 'Benim Sabahım',
      sentences: [
        LibrarySentence(
          target: 'Elke ochtend begin ik met een kop koffie.',
          glossTr: 'Her sabah bir fincan kahveyle güne başlarım.',
        ),
        LibrarySentence(
          target: 'Ik maak koffie voor mezelf en thee voor mijn moeder.',
          glossTr: 'Kendime kahve, anama çay hazırlarım.',
        ),
        LibrarySentence(
          target: 'We drinken samen in de tuin.',
          glossTr: 'Birlikte bahçede içeriz.',
        ),
        LibrarySentence(
          target: 'Mijn moeder leest de krant en ik luister naar de vogels.',
          glossTr: 'Annem gazete okur, ben kuşları dinlerim.',
        ),
        LibrarySentence(
          target: 'Op zondag bak ik ook gebak.',
          glossTr: 'Pazar günleri ayrıca kek yaparım.',
        ),
        LibrarySentence(
          target: 'Het is het lekkerste moment van de dag.',
          glossTr: 'Günün en keyifli anıdır.',
        ),
      ],
    ),
    LibraryStory(
      id: 'nl_garden',
      lang: LearnLang.nl,
      level: Cefr.a1,
      title: 'De groene tuin',
      titleTr: 'Yeşil Bahçe',
      sentences: [
        LibrarySentence(
          target: 'De zomer is er en de tuin groeit mooi.',
          glossTr: 'Yaz geldi ve bahçe güzelce büyüyor.',
        ),
        LibrarySentence(
          target: 'Elke ochtend geef ik water aan de planten.',
          glossTr: 'Her sabah bitkilere su veririm.',
        ),
        LibrarySentence(
          target: 'Ik heb tomaten, komkommers en kruiden geplant.',
          glossTr: 'Domates, salatalık ve otlar ektim.',
        ),
        LibrarySentence(
          target: 'Mijn vader graaft de aarde en ik plant.',
          glossTr: 'Babam toprağı kazar, ben ekerim.',
        ),
        LibrarySentence(
          target: 'In de avond eten we vaak groenten uit de tuin.',
          glossTr: 'Akşamları sıklıkla bahçeden sebze yeriz.',
        ),
        LibrarySentence(
          target: 'Eigen groenten zijn de lekkerste.',
          glossTr: 'Kendi yetiştirdiğimiz sebzeler en lezzetlisidir.',
        ),
      ],
    ),
    LibraryStory(
      id: 'nl_birthday',
      lang: LearnLang.nl,
      level: Cefr.a1,
      title: 'De verjaardag van mijn zus',
      titleTr: 'Kardeşimin Doğum Günü',
      sentences: [
        LibrarySentence(
          target: 'Vandaag is de verjaardag van mijn zus.',
          glossTr: 'Bugün kız kardeşimin doğum günü.',
        ),
        LibrarySentence(
          target: 'Ik koop een klein cadeautje en rode bloemen.',
          glossTr: 'Küçük bir hediye ve kırmızı çiçekler alıyorum.',
        ),
        LibrarySentence(
          target: 'We koken samen een groot diner.',
          glossTr: 'Birlikte büyük bir akşam yemeği pişiriyoruz.',
        ),
        LibrarySentence(
          target: 'We eten een grote taart met kaarsen.',
          glossTr: 'Mumlu büyük bir pasta yiyoruz.',
        ),
        LibrarySentence(
          target: 'Mijn zus blaast de kaarsen uit en we drinken chocolademelk.',
          glossTr:
              'Kız kardeşim mumları üflüyor, birlikte çikolatalı süt içiyoruz.',
        ),
        LibrarySentence(
          target: 'Het is een vrolijke en warme avond.',
          glossTr: 'Neşeli ve sıcak bir akşam.',
        ),
      ],
    ),

    // --- Polski (pl) ---
    LibraryStory(
      id: 'pl_sport',
      lang: LearnLang.pl,
      level: Cefr.a1,
      title: 'Sport',
      titleTr: 'Spor',
      sentences: [
        LibrarySentence(
          target: 'Codziennie rano biegam w parku.',
          glossTr: 'Her sabah parkta koşarım.',
        ),
        LibrarySentence(
          target: 'Biegam z moim psem Burekiem.',
          glossTr: 'Köpeğim Burek ile koşarım.',
        ),
        LibrarySentence(
          target: 'Po bieganiu pije kawę z mlekiem.',
          glossTr: 'Koşudan sonra sütlü kahve içerim.',
        ),
        LibrarySentence(
          target: 'Wieczorem idę na basen.',
          glossTr: 'Akşam yüzme havuzuna giderim.',
        ),
        LibrarySentence(
          target: 'Pływanie pomaga mi się zrelaksować.',
          glossTr: 'Yüzmek rahatlamama yardımcı olur.',
        ),
        LibrarySentence(
          target: 'Sport to najlepszy początek dnia.',
          glossTr: 'Spor, günün en iyi başlangıcıdır.',
        ),
      ],
    ),
    LibraryStory(
      id: 'pl_phone_call',
      lang: LearnLang.pl,
      level: Cefr.a1,
      title: 'Rozmowa z mamą',
      titleTr: 'Annemle Telefon',
      sentences: [
        LibrarySentence(
          target: 'O siódmej rano dzwoni mama.',
          glossTr: 'Sabah yedide anne arar.',
        ),
        LibrarySentence(
          target: 'Pyta, czy już wstałem.',
          glossTr: 'Kalkıp kalkmadığımı sorar.',
        ),
        LibrarySentence(
          target: 'Mówi, że dziś są urodziny jej siostry.',
          glossTr: 'Bugün ablasının doğum günü olduğunu söylüyor.',
        ),
        LibrarySentence(
          target: 'Musi kupić ciasto i kwiaty.',
          glossTr: 'Pasta ve çiçek almalı.',
        ),
        LibrarySentence(
          target: 'Ja kupię prezent i przyjadę wieczorem.',
          glossTr: 'Ben hediye alıp akşam geleceğim.',
        ),
        LibrarySentence(
          target: 'Rozmowy z mamą to zawsze dobry początek dnia.',
          glossTr:
              'Anne ile yapılan konuşmalar her zaman günün iyi başlangıcıdır.',
        ),
      ],
    ),
    LibraryStory(
      id: 'pl_library',
      lang: LearnLang.pl,
      level: Cefr.a1,
      title: 'W bibliotece',
      titleTr: 'Kütüphanede',
      sentences: [
        LibrarySentence(
          target: 'W moim mieście jest nowa biblioteka.',
          glossTr: 'Şehrimde yeni bir kütüphane var.',
        ),
        LibrarySentence(
          target: 'Codziennie po pracy czytam tam książkę.',
          glossTr: 'Her gün işten sonra orada kitap okurum.',
        ),
        LibrarySentence(
          target: 'Wypożyczam książki po polsku i po angielsku.',
          glossTr: 'Lehçe ve İngilizce kitap ödünç alırım.',
        ),
        LibrarySentence(
          target: 'W sobotę o dwunastej jest spotkanie miłośników książek.',
          glossTr: 'Cumartesi on ikide kitap dostları buluşması var.',
        ),
        LibrarySentence(
          target: 'Często rozmawiamy o nowych książkach.',
          glossTr: 'Yeni kitaplardan sıkça konuşuruz.',
        ),
        LibrarySentence(
          target: 'Lubię ten cichy i spokojny dom.',
          glossTr: 'Bu sessiz ve huzurlu mekânı severim.',
        ),
      ],
    ),

    // --- Svenska (sv) ---
    LibraryStory(
      id: 'sv_cat',
      lang: LearnLang.sv,
      level: Cefr.a1,
      title: 'Min katt Luna',
      titleTr: 'Kedim Luna',
      sentences: [
        LibrarySentence(
          target: 'Jag har en katt. Hennes namn är Luna.',
          glossTr: 'Bir kedim var. Adı Luna.',
        ),
        LibrarySentence(
          target: 'Luna sover mycket och äter mycket.',
          glossTr: 'Luna çok uyur ve çok yer.',
        ),
        LibrarySentence(
          target: 'Varje morgon väcker hon mig klockan sju.',
          glossTr: 'Her sabah beni saat yedide uyandırır.',
        ),
        LibrarySentence(
          target: 'Jag ger henne mat och vatten.',
          glossTr: 'Ona mama ve su veririm.',
        ),
        LibrarySentence(
          target: 'Hon gillar att leka med en liten boll.',
          glossTr: 'Küçük bir top ile oynamayı sever.',
        ),
        LibrarySentence(
          target: 'Luna gör mitt hem gladare.',
          glossTr: 'Luna evimi daha mutlu kılıyor.',
        ),
      ],
    ),
    LibraryStory(
      id: 'sv_vacation',
      lang: LearnLang.sv,
      level: Cefr.a1,
      title: 'Semesterplaner',
      titleTr: 'Tatil Planları',
      sentences: [
        LibrarySentence(
          target: 'Vi reser till fjällen i höst.',
          glossTr: 'Sonbaharda dağa gideceğiz.',
        ),
        LibrarySentence(
          target: 'Jag bokade stugan i fjol.',
          glossTr: 'Geçen yıl kulübeyi ayırtım.',
        ),
        LibrarySentence(
          target: 'Vi ska åka skidor och sova sent.',
          glossTr: 'Kayak yapıp geç uyuyacağız.',
        ),
        LibrarySentence(
          target: 'Min syster gör picknickmat.',
          glossTr: 'Ablam piknik hazırlıyor.',
        ),
        LibrarySentence(
          target: 'Vi tar med kaffe, choklad och korv.',
          glossTr: 'Kahve, çikolata ve sosis götürüyoruz.',
        ),
        LibrarySentence(
          target: 'Det kommer att bli en fin semester.',
          glossTr: 'Çok güzel bir tatil olacak.',
        ),
      ],
    ),
    LibraryStory(
      id: 'sv_housework',
      lang: LearnLang.sv,
      level: Cefr.a1,
      title: 'Söndagsrengöring',
      titleTr: 'Pazar Temizliği',
      sentences: [
        LibrarySentence(
          target: 'Varje söndag städar vi vårt hem.',
          glossTr: 'Her pazar evimizi temizleriz.',
        ),
        LibrarySentence(
          target: 'Jag dammsugar och min man tvättar köket.',
          glossTr: 'Ben süpürgeyle temizlerim, kocalım mutfakları yıkar.',
        ),
        LibrarySentence(
          target: 'Vi lyssnar på musik medan vi jobbar.',
          glossTr: 'İş yaparken müzik dinleriz.',
        ),
        LibrarySentence(
          target: 'Tvättmaskinen är alltid full på söndagar.',
          glossTr: 'Çamaşır makinesi pazar günleri hep doludur.',
        ),
        LibrarySentence(
          target: 'Efteråt lagar vi en enkel middag.',
          glossTr: 'Sonra basit bir akşam yemeği hazırlarız.',
        ),
        LibrarySentence(
          target: 'Ett rent hem ger en lugn känsla.',
          glossTr: 'Temiz ev huzurlu bir his verir.',
        ),
      ],
    ),

    // --- Dansk (da) ---
    LibraryStory(
      id: 'da_restaurant',
      lang: LearnLang.da,
      level: Cefr.a1,
      title: 'På restaurant',
      titleTr: 'Restoranda',
      sentences: [
        LibrarySentence(
          target: 'I aften går jeg på restaurant med en kollega.',
          glossTr: 'Bu akşam bir iş arkadaşımla restorana gidiyorum.',
        ),
        LibrarySentence(
          target: 'Vi bestiller den danske mad.',
          glossTr: 'Danimarka yemekleri söylüyoruz.',
        ),
        LibrarySentence(
          target: 'Jeg tager en stor fisk med kartofler.',
          glossTr: 'Ben büyük bir balık patatesli alıyorum.',
        ),
        LibrarySentence(
          target: 'Kaffen og kagen er meget gode.',
          glossTr: 'Kahve ve pasta çok iyi.',
        ),
        LibrarySentence(
          target: 'Vi snakker om arbejde og familie.',
          glossTr: 'İş ve aileden konuşuyoruz.',
        ),
        LibrarySentence(
          target: 'Det er en dejlig aften.',
          glossTr: 'Güzel bir akşam.',
        ),
      ],
    ),
    LibraryStory(
      id: 'da_neighbor',
      lang: LearnLang.da,
      level: Cefr.a1,
      title: 'Min nabo',
      titleTr: 'Komşum',
      sentences: [
        LibrarySentence(
          target: 'Min nabo hedder Jens.',
          glossTr: 'Komşumun adı Jens.',
        ),
        LibrarySentence(
          target: 'Han bor i huset ved siden af mig.',
          glossTr: 'Yanımdaki evde oturuyor.',
        ),
        LibrarySentence(
          target: 'Jens er en meget venlig mand.',
          glossTr: 'Jens çok nazik bir adam.',
        ),
        LibrarySentence(
          target: 'Når jeg er på arbejde, vander han min hund.',
          glossTr: 'Ben işteyken o köpeğimi yürütür.',
        ),
        LibrarySentence(
          target: 'På lørdag laver vi mad sammen.',
          glossTr: 'Cumartesi birlikte yemek pişiririz.',
        ),
        LibrarySentence(
          target: 'Vi drikker altid en kop kaffe til sidst.',
          glossTr: 'Sonunda her zaman bir fincan kahve içeriz.',
        ),
      ],
    ),
    LibraryStory(
      id: 'da_forest_walk',
      lang: LearnLang.da,
      level: Cefr.a1,
      title: 'Tur i skoven',
      titleTr: 'Ormanda Yürüyüş',
      sentences: [
        LibrarySentence(
          target: 'I morgen går jeg en lang tur i skoven.',
          glossTr: 'Yarın ormanda uzun bir yürüyüş yapacağım.',
        ),
        LibrarySentence(
          target: 'Jeg tager min vandflaske og lidt mad med.',
          glossTr: 'Yanıma su şişesi ve biraz yiyecek alıyorum.',
        ),
        LibrarySentence(
          target: 'Om efteråret er træerne gule og røde.',
          glossTr: 'Sonbaharda ağaçlar sarı ve kırmızı.',
        ),
        LibrarySentence(
          target: 'Jeg ser mange fugle og små dyr.',
          glossTr: 'Birçok kuş ve küçük hayvan görüyorum.',
        ),
        LibrarySentence(
          target: 'Jeg spiser min mad ved en sø.',
          glossTr: 'Bir gölün yanında yemeğimi yiyorum.',
        ),
        LibrarySentence(
          target: 'Den friske luft er den bedste pause.',
          glossTr: 'Taze hava en iyi mola.',
        ),
      ],
    ),

    // --- Norsk (no) ---
    LibraryStory(
      id: 'no_concert',
      lang: LearnLang.no,
      level: Cefr.a1,
      title: 'Konsert i byen',
      titleTr: 'Şehirde Konser',
      sentences: [
        LibrarySentence(
          target: 'I morgen er det konsert i byen.',
          glossTr: 'Yarın şehirde konser var.',
        ),
        LibrarySentence(
          target: 'Jeg kjøpte billett forrige uke.',
          glossTr: 'Geçen hafta bilet aldım.',
        ),
        LibrarySentence(
          target: 'Min venn Erik er med.',
          glossTr: 'Arkadaşım Erik de katılıyor.',
        ),
        LibrarySentence(
          target: 'Vi spiser pizza og drikker saft før vi går.',
          glossTr: 'Giderken önce pizza yiyip meyve suyu içeriz.',
        ),
        LibrarySentence(
          target: 'Musikken er veldig sterk og fin.',
          glossTr: 'Müzik çok güçlü ve güzel.',
        ),
        LibrarySentence(
          target: 'Jeg danser hele kvelden.',
          glossTr: 'Bütün akşam dans ediyorum.',
        ),
      ],
    ),
    LibraryStory(
      id: 'no_homework',
      lang: LearnLang.no,
      level: Cefr.a1,
      title: 'Leksen',
      titleTr: 'Ödev',
      sentences: [
        LibrarySentence(
          target: 'Etter skolen gjør jeg leksene.',
          glossTr: 'Okuldan sonra ödev yapıyorum.',
        ),
        LibrarySentence(
          target: 'Matematikken er ikke vanskelig, men jeg trenger tid.',
          glossTr: 'Matematik zor değil ama vaktim lazım.',
        ),
        LibrarySentence(
          target: 'Mor hjelper meg med engelsk.',
          glossTr: 'Annem İngilizce konusunda bana yardım ediyor.',
        ),
        LibrarySentence(
          target: 'Så ser jeg en kort film.',
          glossTr: 'Sonra kısa bir film izliyorum.',
        ),
        LibrarySentence(
          target: 'Om kvelden leser jeg en bok.',
          glossTr: 'Akşam bir kitap okuyorum.',
        ),
        LibrarySentence(
          target: 'Faren er stolt av meg.',
          glossTr: 'Babam benimle gurur duyuyor.',
        ),
      ],
    ),
    LibraryStory(
      id: 'no_coffee_break',
      lang: LearnLang.no,
      level: Cefr.a1,
      title: 'Kaffepause',
      titleTr: 'Kahve Molası',
      sentences: [
        LibrarySentence(
          target: 'På mitt arbeid har vi kaffepause klokka ti.',
          glossTr: 'İş yerimizde saat onda kahve molası var.',
        ),
        LibrarySentence(
          target: 'Kaffen er sterk, kaken er hjemmelaget.',
          glossTr: 'Kahve kuvvetli, kek ev yapımı.',
        ),
        LibrarySentence(
          target: 'Mine kollegaer lager alltid te til meg.',
          glossTr: 'İş arkadaşlarım bana her zaman çay hazırlar.',
        ),
        LibrarySentence(
          target: 'Vi prater litt og ler mye.',
          glossTr: 'Biraz sohbet edip çok güleriz.',
        ),
        LibrarySentence(
          target: 'Kaffebrøyet er min favoritt.',
          glossTr: 'Kruvasan favorim.',
        ),
        LibrarySentence(
          target: 'Den korte pausen gjør dagen bedre.',
          glossTr: 'Kısa mola günü güzelleştiriyor.',
        ),
      ],
    ),

    // --- Suomi (fi) ---
    LibraryStory(
      id: 'fi_balcony',
      lang: LearnLang.fi,
      level: Cefr.a1,
      title: 'Parvekkeeni',
      titleTr: 'Balkonum',
      sentences: [
        LibrarySentence(
          target: 'Minulla on pieni parveke.',
          glossTr: 'Küçük bir balkonum var.',
        ),
        LibrarySentence(
          target: 'Parvekkeella kasvaa tomaatteja ja basilikaa.',
          glossTr: 'Balkonda domates ve fesleğen büyüyor.',
        ),
        LibrarySentence(
          target: 'Joka aamu kastan kasvit.',
          glossTr: 'Her sabah bitkilere su veririm.',
        ),
        LibrarySentence(
          target: 'Meidän kissa aina katsoo kukkia.',
          glossTr: 'Bizim kedi hep çiçeklere bakar.',
        ),
        LibrarySentence(
          target: 'Kesällä söimme tomaatteja aamiaisella.',
          glossTr: 'Yazın kahvaltıda domates yedik.',
        ),
        LibrarySentence(
          target: 'Pieni parveke on minun rauhani.',
          glossTr: 'Küçük balkon benim sükunetim.',
        ),
      ],
    ),
    LibraryStory(
      id: 'fi_laundry',
      lang: LearnLang.fi,
      level: Cefr.a1,
      title: 'Pesupäivä',
      titleTr: 'Çamaşır Günü',
      sentences: [
        LibrarySentence(
          target: 'Maanantai on pesupäivä.',
          glossTr: 'Pazartesi çamaşır günü.',
        ),
        LibrarySentence(
          target: 'Laitan pyykin täyteen ja käynnistän koneen.',
          glossTr: 'Çamaşır sepetini doldurup makineyi başlatırım.',
        ),
        LibrarySentence(
          target: 'Koneen aikana luen sanomalehtiä.',
          glossTr: 'Makine çalışırken gazete okurum.',
        ),
        LibrarySentence(
          target: 'Iltapäivällä ripustan pyykkiä.',
          glossTr: 'Öğleden sonra çamaşırları asarım.',
        ),
        LibrarySentence(
          target: 'Launtaina taitan pyykkiä ja laitan sen kaappiin.',
          glossTr: 'Cumartesi çamaşırları katlayıp dolaba koyarım.',
        ),
        LibrarySentence(
          target: 'Puhtaat vaatteet tuntuvat hyvältä.',
          glossTr: 'Temiz kıyafetler iyi hissettirir.',
        ),
      ],
    ),
    LibraryStory(
      id: 'fi_birthday',
      lang: LearnLang.fi,
      level: Cefr.a1,
      title: 'Ystäväni syntymäpäivä',
      titleTr: 'Arkadaşımın Doğum Günü',
      sentences: [
        LibrarySentence(
          target: 'Eilen oli ystäväni syntymäpäivä.',
          glossTr: 'Dün arkadaşımın doğum günüydü.',
        ),
        LibrarySentence(
          target: 'Teimme yhdessä suuren juhlapöydän.',
          glossTr: 'Birlikte büyük bir kutlama sofrası hazırladık.',
        ),
        LibrarySentence(
          target: 'Laulimme syntymäpäivälaulun.',
          glossTr: 'Doğum günü şarkısını söyledik.',
        ),
        LibrarySentence(
          target: 'Söimme kakkua ja juomimme kaakaota.',
          glossTr: 'Pasta yedik, kakao içtik.',
        ),
        LibrarySentence(
          target: 'Ystäväni sai paljon lahjoja.',
          glossTr: 'Arkadaşım çok hediye aldı.',
        ),
        LibrarySentence(
          target: 'Se oli iloinen ilta.',
          glossTr: 'Neşeli bir akşamdı.',
        ),
      ],
    ),

    // --- Čeština (cs) ---
    LibraryStory(
      id: 'cs_library',
      lang: LearnLang.cs,
      level: Cefr.a1,
      title: 'Stará knihovna',
      titleTr: 'Eski Kütüphane',
      sentences: [
        LibrarySentence(
          target: 'V našem městě je stará, krásná knihovna.',
          glossTr: 'Şehrimizde eski ve güzel bir kütüphane var.',
        ),
        LibrarySentence(
          target: 'V knihovně je velký sál a malý dětský koutek.',
          glossTr: 'Kütüphanede büyük bir salon ve küçük bir çocuk köşesi var.',
        ),
        LibrarySentence(
          target: 'Každý pátek odpoledne chodím tam s dcerou.',
          glossTr: 'Her cuma öğleden sonra kızım oraya gider.',
        ),
        LibrarySentence(
          target: 'Moje dcera tam čte obrázkové knížky.',
          glossTr: 'Kızım orada resimli kitaplar okur.',
        ),
        LibrarySentence(
          target: 'Paní knihovnice je velmi přátelská.',
          glossTr: 'Kütüphaneci çok güler yüzlüdür.',
        ),
        LibrarySentence(
          target: 'Knihovna je jako tichý domov.',
          glossTr: 'Kütüphane sessiz bir ev gibidir.',
        ),
      ],
    ),
    LibraryStory(
      id: 'cs_pet',
      lang: LearnLang.cs,
      level: Cefr.a1,
      title: 'Můj pes',
      titleTr: 'Köpeğim',
      sentences: [
        LibrarySentence(
          target: 'Mám psa. Jmenuje se Max.',
          glossTr: 'Bir köpeğim var. Adı Max.',
        ),
        LibrarySentence(
          target: 'Max je velký a černý.',
          glossTr: 'Max büyük ve siyah.',
        ),
        LibrarySentence(
          target: 'Každý večer s ním chodím na procházku.',
          glossTr: 'Her akşam onunla yürüyüşe çıkarım.',
        ),
        LibrarySentence(
          target: 'Rád chytá míč a přináší mi ho.',
          glossTr: 'Topu yakalayıp bana getirmeyi sever.',
        ),
        LibrarySentence(
          target: 'V zimě rád leží u ohně.',
          glossTr: 'Kışın soba başında yatmayı sever.',
        ),
        LibrarySentence(
          target: 'Bez Maxe je můj domov tichý.',
          glossTr: 'Max olmadan evim sessizdir.',
        ),
      ],
    ),
    LibraryStory(
      id: 'cs_restaurant',
      lang: LearnLang.cs,
      level: Cefr.a1,
      title: 'V neděli v restauraci',
      titleTr: 'Pazar Restoranı',
      sentences: [
        LibrarySentence(
          target: 'Každou neděli chodíme s rodinou do restaurace.',
          glossTr: 'Her pazar aileyle restorana gideriz.',
        ),
        LibrarySentence(
          target: 'Náš favorit je v starém měste.',
          glossTr: 'Favorimiz eski şehirde.',
        ),
        LibrarySentence(
          target: 'Otec si dá guláš se knedlíky.',
          glossTr: 'Babam knedlíkli gulyaş ister.',
        ),
        LibrarySentence(
          target: 'Máma si dá kuře s rýží.',
          glossTr: 'Annem pirincli tavuk ister.',
        ),
        LibrarySentence(
          target: 'Jíme pomalu a povídáme si.',
          glossTr: 'Yavaşça yiyip sohbet ederiz.',
        ),
        LibrarySentence(
          target: 'Na závěr pijeme kávu a jíme dort.',
          glossTr: 'Sonunda kahve içip pasta yeriz.',
        ),
      ],
    ),

    // --- Română (ro) ---
    LibraryStory(
      id: 'ro_birthday',
      lang: LearnLang.ro,
      level: Cefr.a1,
      title: 'Ziua de naștere a fratelui meu',
      titleTr: 'Kardeşimin Doğum Günü',
      sentences: [
        LibrarySentence(
          target: 'Astăzi este ziua de naștere a fratelui meu.',
          glossTr: 'Bugün erkek kardeşimin doğum günü.',
        ),
        LibrarySentence(
          target: 'Rudele vin la noi.',
          glossTr: 'Akrabalar bize geliyor.',
        ),
        LibrarySentence(
          target: 'Gătim împreună o cină mare.',
          glossTr: 'Birlikte büyük bir akşam yemeği pişiriyoruz.',
        ),
        LibrarySentence(
          target: 'Pregătim și un tort cu fructe.',
          glossTr: 'Meyveli bir pasta da hazırlıyoruz.',
        ),
        LibrarySentence(
          target: 'Fratele meu stinge lumânările, și bem suc.',
          glossTr:
              'Erkek kardeşim mumları söndürüyor, birlikte meyve suyu içiyoruz.',
        ),
        LibrarySentence(
          target: 'Toată lumea este fericită.',
          glossTr: 'Herkes mutlu.',
        ),
      ],
    ),
    LibraryStory(
      id: 'ro_phone_call',
      lang: LearnLang.ro,
      level: Cefr.a1,
      title: 'O plimbare la munte',
      titleTr: 'Dağa Yürüyüş',
      sentences: [
        LibrarySentence(
          target: 'Sâmbătă dimineața sună prietenul meu Andrei.',
          glossTr: 'Cumartesi sabahı arkadaşım Andrei arar.',
        ),
        LibrarySentence(
          target: 'El vrea să mergem la munte.',
          glossTr: 'Dağa gitmek istiyor.',
        ),
        LibrarySentence(
          target: 'Cumpăr pâine, fructe și apă.',
          glossTr: 'Ekmek, meyve ve su alıyorum.',
        ),
        LibrarySentence(
          target: 'Andrei are o haină groasă și un sac mare.',
          glossTr: 'Andrei’nin kalın bir ceket ve büyük bir çantası var.',
        ),
        LibrarySentence(
          target: 'Pe drum, ascultăm muzică.',
          glossTr: 'Yolda müzik dinliyoruz.',
        ),
        LibrarySentence(
          target: 'Muntele este frumos și liniștit.',
          glossTr: 'Dağ güzel ve sakin.',
        ),
      ],
    ),
    LibraryStory(
      id: 'ro_park_walk',
      lang: LearnLang.ro,
      level: Cefr.a1,
      title: 'O plimbare în parc',
      titleTr: 'Parkta Yürüyüş',
      sentences: [
        LibrarySentence(
          target: 'Duminica mergem în parc cu un prieten.',
          glossTr: 'Pazar günü bir arkadaşla parka gideriz.',
        ),
        LibrarySentence(
          target: 'În parc există flori și copaci mari.',
          glossTr: 'Parkta çiçekler ve büyük ağaçlar var.',
        ),
        LibrarySentence(
          target: 'Plimbăm încet printre copaci.',
          glossTr: 'Ağaçların arasında yavaşça yürüyoruz.',
        ),
        LibrarySentence(
          target: 'Ascultăm păsările și vorbim despre vară.',
          glossTr: 'Kuşları dinleyip yazdan konuşuruz.',
        ),
        LibrarySentence(
          target: 'La prânz, mâncăm sandvișuri și fructe.',
          glossTr: 'Öğlen sandviç ve meyve yiyoruz.',
        ),
        LibrarySentence(
          target: 'Este o dimineață frumoasă.',
          glossTr: 'Güzel bir sabah.',
        ),
      ],
    ),

    // --- Magyar (hu) ---
    LibraryStory(
      id: 'hu_neighbor',
      lang: LearnLang.hu,
      level: Cefr.a1,
      title: 'Margit néni',
      titleTr: 'Margit Teyze',
      sentences: [
        LibrarySentence(
          target: 'A szomszédom Margit néni.',
          glossTr: 'Komşum Margit teyze.',
        ),
        LibrarySentence(
          target: 'Ő mindig segít a gyerekeknek.',
          glossTr: 'O hep çocuklara yardım eder.',
        ),
        LibrarySentence(
          target: 'Ő süt süteményt, és ad nekünk.',
          glossTr: 'Kurabiye pişirip bize verir.',
        ),
        LibrarySentence(
          target: 'Ha a kutyám sír, ő kiengedi.',
          glossTr: 'Köpeğim uluduğunda o bırakır.',
        ),
        LibrarySentence(
          target: 'Nyáron a kertben beszélgetünk.',
          glossTr: 'Yazın bahçede sohbet ederiz.',
        ),
        LibrarySentence(
          target: 'Margit néni jó és kedves ember.',
          glossTr: 'Margit teyze iyi ve nazik bir insandır.',
        ),
      ],
    ),
    LibraryStory(
      id: 'hu_river_walk',
      lang: LearnLang.hu,
      level: Cefr.a1,
      title: 'A folyó mellett',
      titleTr: 'Nehir Kenarı',
      sentences: [
        LibrarySentence(
          target: 'Minden délután sétálok a folyó mellett.',
          glossTr: 'Her öğleden sonra nehir kenarında yürüyorum.',
        ),
        LibrarySentence(
          target: 'A kutyám, Burek, az előttem fut.',
          glossTr: 'Köpeğim Burek önümde koşar.',
        ),
        LibrarySentence(
          target: 'Délben a gyerekek a folyóban úsznak.',
          glossTr: 'Öğlen çocuklar nehre girer.',
        ),
        LibrarySentence(
          target: 'Este a levegő hűs, és a nap lenyugszik.',
          glossTr: 'Akşam hava serin, güneş batıyor.',
        ),
        LibrarySentence(
          target: 'Én csak teát iszom, és a csillagokat figyelem.',
          glossTr: 'Ben sadece çay içip yıldızlara bakarım.',
        ),
        LibrarySentence(
          target: 'A természet a legjobb pihenés.',
          glossTr: 'Doğa en iyi dinlence.',
        ),
      ],
    ),
    LibraryStory(
      id: 'hu_vacation',
      lang: LearnLang.hu,
      level: Cefr.a1,
      title: 'A tengeri nyaralás',
      titleTr: 'Deniz Tatili',
      sentences: [
        LibrarySentence(
          target: 'Nyáron a család a tengerhez megy.',
          glossTr: 'Yazın aile denize gider.',
        ),
        LibrarySentence(
          target: 'A hotel a strand közelében van.',
          glossTr: 'Hotel plajın yakınında.',
        ),
        LibrarySentence(
          target: 'Reggel a gyerekek a tengerben úsznak.',
          glossTr: 'Sabah çocuklar denize girer.',
        ),
        LibrarySentence(
          target: 'Délben süt a nap, és a víz meleg.',
          glossTr: 'Öğlen güneş var ve su sıcak.',
        ),
        LibrarySentence(
          target: 'Este a család a tengerparton sétál.',
          glossTr: 'Akşam aile sahil yürüyüşü yapar.',
        ),
        LibrarySentence(
          target: 'Mindenkinek tetszik a nyaralás.',
          glossTr: 'Herkese tatil hoşuna gidiyor.',
        ),
      ],
    ),

    // --- Tiếng Việt (vi) ---
    LibraryStory(
      id: 'vi_river_walk',
      lang: LearnLang.vi,
      level: Cefr.a1,
      title: 'Đi dạo bên sông',
      titleTr: 'Nehir Kenarında Yürüyüş',
      sentences: [
        LibrarySentence(
          target: 'Mỗi sáng, tôi đi dạo bên sông.',
          glossTr: 'Her sabah nehir kenarında yürüyüşe çıkarım.',
        ),
        LibrarySentence(
          target: 'Tôi mang theo bình nước và một ít trái cây.',
          glossTr: 'Yanıma su şişesi ve biraz meyve alıyorum.',
        ),
        LibrarySentence(
          target: 'Sáng sớm, nước sông rất trong.',
          glossTr: 'Sabah erken saatlerde nehir suyu çok berrak.',
        ),
        LibrarySentence(
          target: 'Tôi thấy nhiều chim trên cây.',
          glossTr: 'Ağaçlarda birçok kuş görüyorum.',
        ),
        LibrarySentence(
          target: 'Đôi khi tôi ngồi và xem cá bơi.',
          glossTr: 'Bazen oturup balıkların yüzmese izlerim.',
        ),
        LibrarySentence(
          target: 'Tôi rất thích buổi sáng bên sông.',
          glossTr: 'Nehir kenarındaki sabahları çok severim.',
        ),
      ],
    ),
    LibraryStory(
      id: 'vi_library',
      lang: LearnLang.vi,
      level: Cefr.a1,
      title: 'Góc đọc sách',
      titleTr: 'Okuma Köşesi',
      sentences: [
        LibrarySentence(
          target: 'Gần nhà tôi có một thư viện cũ và đẹp.',
          glossTr: 'Evinin yakınında eski ve güzel bir kütüphane var.',
        ),
        LibrarySentence(
          target: 'Mỗi chiều, tôi đọc sách ở đó.',
          glossTr: 'Her akşam orada kitap okurum.',
        ),
        LibrarySentence(
          target: 'Tôi mượn sách tiếng Việt, tiếng Anh và tiếng Pháp.',
          glossTr: 'Vietnamca, İngilizce ve Fransızca kitap ödünç alırım.',
        ),
        LibrarySentence(
          target: 'Góc đọc gần cửa sổ là chỗ yêu thích của tôi.',
          glossTr: 'Pencereye yakın okuma köşesi favorim.',
        ),
        LibrarySentence(
          target: 'Ở đó, thời gian trôi rất chậm.',
          glossTr: 'Orada zaman çok yavaş akar.',
        ),
        LibrarySentence(
          target: 'Thư viện giúp tôi bình yên.',
          glossTr: 'Kütüphane beni sakinleştiriyor.',
        ),
      ],
    ),
    LibraryStory(
      id: 'vi_pet',
      lang: LearnLang.vi,
      level: Cefr.a1,
      title: 'Con mèo của tôi',
      titleTr: 'Kedim',
      sentences: [
        LibrarySentence(
          target: 'Tôi có một con mèo. Tên nó là Tí.',
          glossTr: 'Bir kedim var. Adı Tí.',
        ),
        LibrarySentence(
          target: 'Tí rất thích ngủ trên ghế sofa.',
          glossTr: 'Tí koltukta uyumayı çok sever.',
        ),
        LibrarySentence(
          target: 'Ban ngày nó sưởi nắng trước cửa sổ.',
          glossTr: 'Gündüzleri pencere önünde güneşlenir.',
        ),
        LibrarySentence(
          target: 'Tối tôi cho nó ăn cơm với cá.',
          glossTr: 'Akşamları ona balıklı pirinç yerim.',
        ),
        LibrarySentence(
          target: 'Đôi khi nó đuổi theo bướm.',
          glossTr: 'Bazen kelebekleri kovalar.',
        ),
        LibrarySentence(
          target: 'Tí là thành viên nhỏ trong gia đình tôi.',
          glossTr: 'Tí ailemin küçük üyesi.',
        ),
      ],
    ),

    // --- Bahasa Indonesia (id) ---
    LibraryStory(
      id: 'id_housework',
      lang: LearnLang.id,
      level: Cefr.a1,
      title: 'Berbenah di rumah',
      titleTr: 'Evde Düzen',
      sentences: [
        LibrarySentence(
          target: 'Setiap pagi saya mengepel lantai.',
          glossTr: 'Her sabah zemini silerim.',
        ),
        LibrarySentence(
          target: 'Sebelum matahari panas, saya menyapu halaman.',
          glossTr: 'Güneş ısınmadan önce avluyu süpürürüm.',
        ),
        LibrarySentence(
          target: 'Setelah itu, saya mencuci piring di dapur.',
          glossTr: 'Sonra mutfakta tabakları yıkarım.',
        ),
        LibrarySentence(
          target: 'Suami saya menyiram tanaman di belakang rumah.',
          glossTr: 'Kocam arka bahçedeki bitkilere su verir.',
        ),
        LibrarySentence(
          target: 'Rumah selalu rapi dan bersih.',
          glossTr: 'Ev her zaman düzenli ve temiz.',
        ),
        LibrarySentence(
          target: 'Saya senang dengan rumah bersih.',
          glossTr: 'Temiz evden memnunum.',
        ),
      ],
    ),
    LibraryStory(
      id: 'id_concert',
      lang: LearnLang.id,
      level: Cefr.a1,
      title: 'Konser di teater',
      titleTr: 'Tiyatroda Konser',
      sentences: [
        LibrarySentence(
          target: 'Sabtu depan ada konser di teater.',
          glossTr: 'Önümüzdeki cumartesi tiyatroda konser var.',
        ),
        LibrarySentence(
          target: 'Saya dan sahabatku membeli dua tiket.',
          glossTr: 'Ben ve en yakın arkadaşım iki bilet aldık.',
        ),
        LibrarySentence(
          target: 'Kami akan datang lebih awal dan duduk di baris depan.',
          glossTr: 'Erken gelip ön sıraya otururuz.',
        ),
        LibrarySentence(
          target: 'Musiknya lembut dan indah.',
          glossTr: 'Müzik yumuşak ve güzel.',
        ),
        LibrarySentence(
          target: 'Saya tidak menari, saya hanya mendengarkan.',
          glossTr: 'Dans etmiyorum, sadece dinliyorum.',
        ),
        LibrarySentence(
          target: 'Musik itu membuat saya tenang.',
          glossTr: 'O müzik beni rahatlatıyor.',
        ),
      ],
    ),
    LibraryStory(
      id: 'id_birthday',
      lang: LearnLang.id,
      level: Cefr.a1,
      title: 'Ulang tahun adiku',
      titleTr: 'Kardeşimin Doğum Günü',
      sentences: [
        LibrarySentence(
          target: 'Hari ini ulang tahun adiku.',
          glossTr: 'Bugün kardeşimin doğum günü.',
        ),
        LibrarySentence(
          target: 'Keluarga kami berkumpul di rumah.',
          glossTr: 'Ailemiz evde toplanıyor.',
        ),
        LibrarySentence(
          target: 'Kami memasak makan malam besar bersama.',
          glossTr: 'Birlikte büyük bir akşam yemeği pişiriyoruz.',
        ),
        LibrarySentence(
          target: 'Adikku meniup lilin di kue, lalu kami minum jus.',
          glossTr:
              'Kardeşim pastadaki mumları üflüyor, sonra meyve suyu içiyoruz.',
        ),
        LibrarySentence(
          target: 'Kami menyanyikan lagu ulang tahun.',
          glossTr: 'Doğum günü şarkısı söylüyoruz.',
        ),
        LibrarySentence(
          target: 'Kami semua sangat bahagia.',
          glossTr: 'Hepimiz çok mutlu.',
        ),
      ],
    ),

    // --- Українська (uk) ---
    LibraryStory(
      id: 'uk_vacation',
      lang: LearnLang.uk,
      level: Cefr.a1,
      title: 'Поїздка в Карпати',
      titleTr: 'Karpatlara Yolculuk',
      sentences: [
        LibrarySentence(
          target: 'Восени ми їдемо в Карпати.',
          glossTr: 'Sonbaharda Karpatlara gideceğiz.',
        ),
        LibrarySentence(
          target: 'Ми беремо намет і спальні мішки.',
          glossTr: 'Çadır ve uyku tulumu alıyoruz.',
        ),
        LibrarySentence(
          target: 'Наш друг Олекса їде з нами.',
          glossTr: 'Arkadaşımız Oleksa bizimle geliyor.',
        ),
        LibrarySentence(
          target: 'Ми будемо палити вогонь і пекти ковбасу.',
          glossTr: 'Ateş yakıp sosis pişireceğiz.',
        ),
        LibrarySentence(
          target: 'Вранці ми п’ємо каву і дивимося на гори.',
          glossTr: 'Sabah kahve içip dağlara bakarız.',
        ),
        LibrarySentence(
          target: 'Це буде весела поїздка.',
          glossTr: 'Bu eğlenceli bir yolculuk olacak.',
        ),
      ],
    ),
    LibraryStory(
      id: 'uk_restaurant',
      lang: LearnLang.uk,
      level: Cefr.a1,
      title: 'День народження в ресторані',
      titleTr: 'Restoranda Doğum Günü',
      sentences: [
        LibrarySentence(
          target: 'Сьогодні день народження дружини, тому ми їдемо в ресторан.',
          glossTr: 'Bugün eşimin doğum günü, o yüzden restorana gidiyoruz.',
        ),
        LibrarySentence(
          target: 'Ресторан невеликий, але дуже затишний.',
          glossTr: 'Restoran küçük ama çok samimi.',
        ),
        LibrarySentence(
          target: 'Ми замовляємо борщ і стейк.',
          glossTr: 'Borş ve steak söylüyoruz.',
        ),
        LibrarySentence(
          target: 'Дружина отримує квіти і маленький торт.',
          glossTr: 'Eşim çiçekler ve küçük bir pasta alır.',
        ),
        LibrarySentence(
          target: 'Ми говоримо і сміємось весь вечір.',
          glossTr: 'Bütün akşam konuşup güleriz.',
        ),
        LibrarySentence(
          target: 'Це було чудовий день.',
          glossTr: 'Harika bir gündü.',
        ),
      ],
    ),
    LibraryStory(
      id: 'uk_tea',
      lang: LearnLang.uk,
      level: Cefr.a1,
      title: 'Вечірній чай',
      titleTr: 'Akşam Çayı',
      sentences: [
        LibrarySentence(
          target: 'Увечері наша сіма п’є чай.',
          glossTr: 'Akşam aile çay içer.',
        ),
        LibrarySentence(
          target: 'Чайник завжди стоїть на столі.',
          glossTr: 'Çaydanlık hep masada.',
        ),
        LibrarySentence(
          target: 'Мама п’є зелений чай, а тато — чорний.',
          glossTr: 'Anne yeşil çay, baba siyah çay içer.',
        ),
        LibrarySentence(
          target: 'Ми їмо домашнє печиво.',
          glossTr: 'Ev yapımı kurabiyeler yiyoruz.',
        ),
        LibrarySentence(
          target: 'Ми розповідаємо, як пройшов день.',
          glossTr: 'Günün nasıl geçtiğini anlatırız.',
        ),
        LibrarySentence(
          target: 'Це наші найкращі хвилини.',
          glossTr: 'Bunlar günün en güzel anları.',
        ),
      ],
    ),

    // --- עברית (he) ---
    LibraryStory(
      id: 'he_school',
      lang: LearnLang.he,
      level: Cefr.a1,
      title: 'יום בבית הספר',
      titleTr: 'Okulda Bir Gün',
      sentences: [
        LibrarySentence(
          target: 'היום אני הולך לבית הספר.',
          glossTr: 'Bugün okula gidiyorum.',
        ),
        LibrarySentence(
          target: 'בשבע בבוקר השיעורים מתחילים.',
          glossTr: 'Sabah yedide dersler başlar.',
        ),
        LibrarySentence(
          target: 'אני אוהב את השיעור של מדעים.',
          glossTr: 'Bilim dersini severim.',
        ),
        LibrarySentence(
          target: 'המורה מלמדת אותנו על הצמחים.',
          glossTr: 'Öğretmen bize bitkiler hakkında öğretiyor.',
        ),
        LibrarySentence(
          target: 'בצהריים אוכל עם חבר שלי.',
          glossTr: 'Öğlede arkadaşla yemek yerim.',
        ),
        LibrarySentence(
          target: 'בבית אנחנו עושים שיעורי בית.',
          glossTr: 'Evde ödev yaparız.',
        ),
      ],
    ),
    LibraryStory(
      id: 'he_garden',
      lang: LearnLang.he,
      level: Cefr.a1,
      title: 'הגן של סבא',
      titleTr: 'Dedemin Bahçesi',
      sentences: [
        LibrarySentence(
          target: 'לסבא שלי יש גן גדול.',
          glossTr: 'Dedemin büyük bir bahçesi var.',
        ),
        LibrarySentence(
          target: 'שם גדלים עגבניות, מלפפונים וקישואים.',
          glossTr: 'Orada domates, salatalık ve kabak yetişiyor.',
        ),
        LibrarySentence(
          target: 'סבא משקה את הצמחים כל בוקר.',
          glossTr: 'Dedem her sabah bitkilere su verir.',
        ),
        LibrarySentence(
          target: 'אני אוסף את הירקות עם סבא.',
          glossTr: 'Sebze dedemle toplarım.',
        ),
        LibrarySentence(
          target: 'בקיץ כל המשפחה אוכלת מהגן.',
          glossTr: 'Yazda bütün aile bahçeden yer.',
        ),
        LibrarySentence(
          target: 'הגן של סבא הוא המקום הכי טוב.',
          glossTr: 'Dedemin bahçesi en güzel yer.',
        ),
      ],
    ),
    LibraryStory(
      id: 'he_phone',
      lang: LearnLang.he,
      level: Cefr.a1,
      title: 'טלפון של חבר',
      titleTr: 'Arkadaşın Araması',
      sentences: [
        LibrarySentence(
          target: 'החבר שלי מתקשר בצהריים.',
          glossTr: 'Öğlen arkadaşım arar.',
        ),
        LibrarySentence(
          target: 'הוא רוצה לבוא אליי לערב.',
          glossTr: 'Akşam benim eve gelmek istiyor.',
        ),
        LibrarySentence(
          target: 'אני מבשל עוף ועגבניות.',
          glossTr: 'Tavuk ve domates pişiririm.',
        ),
        LibrarySentence(
          target: 'הוא יביא איתו פירות.',
          glossTr: 'Yanında meyve getirecek.',
        ),
        LibrarySentence(
          target: 'אנחנו נאכל ונשתה תה יחד.',
          glossTr: 'Birlikte yiyip çay içeceğiz.',
        ),
        LibrarySentence(
          target: 'זה תמיד ערב נעים.',
          glossTr: 'Bu her zaman güzel bir akşamdır.',
        ),
      ],
    ),

    // --- فارسی (fa) ---
    LibraryStory(
      id: 'fa_phone',
      lang: LearnLang.fa,
      level: Cefr.a1,
      title: 'قرار با دوست',
      titleTr: 'Arkadaşla Randevu',
      sentences: [
        LibrarySentence(
          target: 'روز شنبه، دوستم رضا زنگ می‌زند.',
          glossTr: 'Cumartesi, arkadaşım Reza arar.',
        ),
        LibrarySentence(
          target: 'می‌گوید که دوست دارد به پارک برود.',
          glossTr: 'Parka gitmek istediğini söylüyor.',
        ),
        LibrarySentence(
          target: 'ما یک‌شنبه به پارک می‌رویم.',
          glossTr: 'Pazar günü parka gideriz.',
        ),
        LibrarySentence(
          target: 'من میوه و نان می‌خرم و او چای می‌آورد.',
          glossTr: 'Ben meyve ve ekmek alıyorum, o çay getiriyor.',
        ),
        LibrarySentence(
          target: 'در پارک زیر درخت می‌نشینیم و حرف می‌زنیم.',
          glossTr: 'Parkta bir ağacın altına oturup sohbet ediyoruz.',
        ),
        LibrarySentence(
          target: 'روزهای ساده بهترین روزها هستند.',
          glossTr: 'Basit günler en iyi günlerdir.',
        ),
      ],
    ),
    LibraryStory(
      id: 'fa_pet',
      lang: LearnLang.fa,
      level: Cefr.a1,
      title: 'گربه من',
      titleTr: 'Kedim',
      sentences: [
        LibrarySentence(
          target: 'من یک گربه دارم. اسمش تیفی است.',
          glossTr: 'Bir kedim var. Adı Tifi.',
        ),
        LibrarySentence(
          target: 'تیفی صبح زود بیدارم می‌کند.',
          glossTr: 'Tifi beni erken sabah uyandırır.',
        ),
        LibrarySentence(
          target: 'او پنجره را دوست دارد و پرنده‌ها را نگاه می‌کند.',
          glossTr: 'Pencereyi sever ve kuşlara bakar.',
        ),
        LibrarySentence(
          target: 'هر روز به او آب تازه می‌دهم.',
          glossTr: 'Her gün ona taze su veririm.',
        ),
        LibrarySentence(
          target: 'تیفی با نخ بازی می‌کند و خیلی خوشحال می‌شود.',
          glossTr: 'Tifi ip ile oynar ve çok mutlu olur.',
        ),
        LibrarySentence(
          target: 'با تیفی خانه ما گرم و شاد است.',
          glossTr: 'Tifi ile evimiz sıcak ve neşeli.',
        ),
      ],
    ),
    LibraryStory(
      id: 'fa_housework',
      lang: LearnLang.fa,
      level: Cefr.a1,
      title: 'خانه تمیز',
      titleTr: 'Temiz Ev',
      sentences: [
        LibrarySentence(
          target: 'ما هر عصر آشپزخانه را مرتب می‌کنیم.',
          glossTr: 'Her akşam mutfakları düzene koyarız.',
        ),
        LibrarySentence(
          target: 'من قابلمه‌ها را می‌شُستم و شوهرم سفره را می‌چیند.',
          glossTr: 'Ben tencereleri yıkarım, kocam sofrayı kurar.',
        ),
        LibrarySentence(
          target: 'ما هنگام آشپزی موسیقی گوش می‌دهیم.',
          glossTr: 'Yemek pişirirken müzik dinleriz.',
        ),
        LibrarySentence(
          target: 'بعد از شام، ظرف‌ها را می‌شوییم.',
          glossTr: 'Akşam yemeğinden sonra tabakları yıkarız.',
        ),
        LibrarySentence(
          target: 'خانه ما همیشه تمیز و مرتب است.',
          glossTr: 'Evimiz her zaman temiz ve düzenlidir.',
        ),
        LibrarySentence(
          target: 'من خانه تمیز را دوست دارم.',
          glossTr: 'Temiz evi severim.',
        ),
      ],
    ),

    // --- Kiswahili (sw) ---
    LibraryStory(
      id: 'sw_doctor',
      lang: LearnLang.sw,
      level: Cefr.a1,
      title: 'Kutembea daktari',
      titleTr: 'Doktor Randevusu',
      sentences: [
        LibrarySentence(
          target: 'Kesho nitaenda kwa daktari saa nane asubuhi.',
          glossTr: 'Yarın sabah sekizde doktora gideceğim.',
        ),
        LibrarySentence(
          target: 'Nina maumivu ya kichwa kidogo.',
          glossTr: 'Hafif bir baş ağrım var.',
        ),
        LibrarySentence(
          target: 'Daktari ananipa chombo cha kupima joto.',
          glossTr: 'Doktor bana termometre veriyor.',
        ),
        LibrarySentence(
          target: 'Anasema niache michezo wiki hii.',
          glossTr: 'Bu hafta spor yapmamamı söylüyor.',
        ),
        LibrarySentence(
          target: 'Ananipa dawa na maji mengi.',
          glossTr: 'Bana ilaç ve bol su veriyor.',
        ),
        LibrarySentence(
          target: 'Nitarudi nyumbani, na hali ni nzuri.',
          glossTr: 'Eve iyi durumda döneceğim.',
        ),
      ],
    ),
    LibraryStory(
      id: 'sw_sport',
      lang: LearnLang.sw,
      level: Cefr.a1,
      title: 'Michezo ya Jumatate',
      titleTr: 'Cumartesi Maçları',
      sentences: [
        LibrarySentence(
          target: 'Jumatate, watoto wanacheza soka katika paki.',
          glossTr: 'Cumartesi, çocuklar parkta futbol oynar.',
        ),
        LibrarySentence(
          target: 'Mchezaji mzuri wa timu ni Juma.',
          glossTr: 'Takımın en iyi oyuncusu Juma’dır.',
        ),
        LibrarySentence(
          target: 'Wanacheza kwa saa moja.',
          glossTr: 'Bir saat oynarlar.',
        ),
        LibrarySentence(
          target: 'Baada ya michezo, wanachoka kahawa.',
          glossTr: 'Maçtan sonra kahve içerler.',
        ),
        LibrarySentence(
          target: 'Michezo inawafanya watu wa kuogelea.',
          glossTr: 'Spor insanı dinlendirir.',
        ),
        LibrarySentence(
          target: 'Siku ya Jumatate ni siku ya furaha.',
          glossTr: 'Cumartesi eğlenceli bir gündür.',
        ),
      ],
    ),
    LibraryStory(
      id: 'sw_restaurant',
      lang: LearnLang.sw,
      level: Cefr.a1,
      title: 'Kituo cha chakula',
      titleTr: 'Restoranda',
      sentences: [
        LibrarySentence(
          target: 'Usiku huu nitaenda kituo cha chakula na mrithi wa kazi.',
          glossTr: 'Bu akşam bir iş arkadaşımla restorana gidiyorum.',
        ),
        LibrarySentence(
          target: 'Tunachagua chakula cha Kenya.',
          glossTr: 'Kenyalı yemekleri seçiyoruz.',
        ),
        LibrarySentence(
          target: 'Ninachagua samaki mkubwa na viazi.',
          glossTr: 'Ben büyük bir balık patatesli alıyorum.',
        ),
        LibrarySentence(
          target: 'Kahawa na keki ni nzuri sana.',
          glossTr: 'Kahve ve pasta çok iyi.',
        ),
        LibrarySentence(
          target: 'Tunazungumza kuhusu kazi na familia.',
          glossTr: 'İş ve aileden konuşuyoruz.',
        ),
        LibrarySentence(target: 'Ni usiku mzuri.', glossTr: 'Güzel bir akşam.'),
      ],
    ),
  ];
}
