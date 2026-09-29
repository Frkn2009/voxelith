import '../features.dart';
import '../legal_info.dart';
import 'i18n.dart';

/// Mağaza onayı için gereken metinler: abonelik ekranı, abonelik
/// açıklaması, gizlilik/kullanım koşulları ve ana ekran widget'ı.
///
/// Kısa etiketler 30 dilin tamamında; uzun hukuki metinler şimdilik
/// tr/en (+ abonelik açıklaması birkaç büyük pazarda) — I18n'in 'en'
/// fallback'i diğer dillerde İngilizce metni gösterir.
extension StoreStrings on I18n {
  // ---------------------------------------------------------------- Paywall

  String get paywallSubtitle => t({
    'tr': 'Sınırsız konuşma pratiği, tüm diller, reklamsız.',
    'en': 'Unlimited speaking practice, every language, no ads.',
    'es': 'Práctica oral ilimitada, todos los idiomas, sin anuncios.',
    'de': 'Unbegrenztes Sprechtraining, alle Sprachen, keine Werbung.',
    'fr': 'Pratique orale illimitée, toutes les langues, sans publicité.',
    'nl': 'Onbeperkt spreken oefenen, alle talen, geen advertenties.',
    'ar': 'تدريب غير محدود على التحدث، كل اللغات، بدون إعلانات.',
    'pt': 'Prática de fala ilimitada, todos os idiomas, sem anúncios.',
    'it': 'Pratica orale illimitata, tutte le lingue, senza pubblicità.',
    'ru': 'Безлимитная разговорная практика, все языки, без рекламы.',
    'zh': '无限口语练习，所有语言，无广告。',
    'ja': 'スピーキング練習し放題、全言語、広告なし。',
    'ko': '무제한 말하기 연습, 모든 언어, 광고 없음.',
    'pl': 'Nielimitowana praktyka mówienia, wszystkie języki, bez reklam.',
    'sv': 'Obegränsad talträning, alla språk, utan annonser.',
    'da': 'Ubegrænset taletræning, alle sprog, ingen reklamer.',
    'no': 'Ubegrenset taletrening, alle språk, ingen reklame.',
    'fi': 'Rajaton puheharjoittelu, kaikki kielet, ei mainoksia.',
    'el': 'Απεριόριστη εξάσκηση ομιλίας, όλες οι γλώσσες, χωρίς διαφημίσεις.',
    'cs': 'Neomezené procvičování mluvení, všechny jazyky, bez reklam.',
    'ro': 'Exersare nelimitată a vorbirii, toate limbile, fără reclame.',
    'hu': 'Korlátlan beszédgyakorlás, minden nyelv, reklámok nélkül.',
    'hi': 'असीमित बोलने का अभ्यास, सभी भाषाएँ, बिना विज्ञापन।',
    'th': 'ฝึกพูดได้ไม่จำกัด ทุกภาษา ไม่มีโฆษณา',
    'vi': 'Luyện nói không giới hạn, mọi ngôn ngữ, không quảng cáo.',
    'id': 'Latihan bicara tanpa batas, semua bahasa, tanpa iklan.',
    'uk': 'Безлімітна розмовна практика, усі мови, без реклами.',
    'he': 'תרגול דיבור ללא הגבלה, כל השפות, בלי פרסומות.',
    'fa': 'تمرین نامحدود صحبت، همه زبان‌ها، بدون تبلیغ.',
    'sw': 'Mazoezi ya kuzungumza bila kikomo, lugha zote, bila matangazo.',
  });

  String get planMonthly => t({
    'tr': 'Aylık',
    'en': 'Monthly',
    'es': 'Mensual',
    'de': 'Monatlich',
    'fr': 'Mensuel',
    'nl': 'Maandelijks',
    'ar': 'شهري',
    'pt': 'Mensal',
    'it': 'Mensile',
    'ru': 'Ежемесячно',
    'zh': '月度',
    'ja': '月額',
    'ko': '월간',
    'pl': 'Miesięcznie',
    'sv': 'Månadsvis',
    'da': 'Månedlig',
    'no': 'Månedlig',
    'fi': 'Kuukausittain',
    'el': 'Μηνιαία',
    'cs': 'Měsíčně',
    'ro': 'Lunar',
    'hu': 'Havi',
    'hi': 'मासिक',
    'th': 'รายเดือน',
    'vi': 'Hằng tháng',
    'id': 'Bulanan',
    'uk': 'Щомісяця',
    'he': 'חודשי',
    'fa': 'ماهانه',
    'sw': 'Kila mwezi',
  });

  String get planYearlyBest => t({
    'tr': 'Yıllık · en iyi değer',
    'en': 'Yearly · best value',
    'es': 'Anual · mejor valor',
    'de': 'Jährlich · bester Wert',
    'fr': 'Annuel · meilleur rapport',
    'nl': 'Jaarlijks · beste waarde',
    'ar': 'سنوي · أفضل قيمة',
    'pt': 'Anual · melhor valor',
    'it': 'Annuale · miglior valore',
    'ru': 'Ежегодно · выгоднее всего',
    'zh': '年度 · 最超值',
    'ja': '年額 · いちばんお得',
    'ko': '연간 · 최고의 가치',
    'pl': 'Rocznie · najlepsza wartość',
    'sv': 'Årsvis · bäst värde',
    'da': 'Årlig · bedste værdi',
    'no': 'Årlig · best verdi',
    'fi': 'Vuosittain · paras hinta',
    'el': 'Ετήσια · καλύτερη αξία',
    'cs': 'Ročně · nejvýhodnější',
    'ro': 'Anual · cea mai bună valoare',
    'hu': 'Éves · legjobb ár',
    'hi': 'वार्षिक · सबसे अच्छा मूल्य',
    'th': 'รายปี · คุ้มที่สุด',
    'vi': 'Hằng năm · giá trị nhất',
    'id': 'Tahunan · nilai terbaik',
    'uk': 'Щороку · найвигідніше',
    'he': 'שנתי · המשתלם ביותר',
    'fa': 'سالانه · بهترین ارزش',
    'sw': 'Kila mwaka · thamani bora',
  });

  String get planFamily => t({
    'tr': 'Aile',
    'en': 'Family',
    'es': 'Familiar',
    'de': 'Familie',
    'fr': 'Famille',
    'nl': 'Gezin',
    'ar': 'العائلة',
    'pt': 'Família',
    'it': 'Famiglia',
    'ru': 'Семейный',
    'zh': '家庭',
    'ja': 'ファミリー',
    'ko': '가족',
    'pl': 'Rodzina',
    'sv': 'Familj',
    'da': 'Familie',
    'no': 'Familie',
    'fi': 'Perhe',
    'el': 'Οικογένεια',
    'cs': 'Rodina',
    'ro': 'Familie',
    'hu': 'Család',
    'hi': 'परिवार',
    'th': 'ครอบครัว',
    'vi': 'Gia đình',
    'id': 'Keluarga',
    'uk': 'Сімейний',
    'he': 'משפחה',
    'fa': 'خانواده',
    'sw': 'Familia',
  });

  String get billedMonthly => t({
    'tr': 'Her ay yenilenir',
    'en': 'Renews every month',
    'es': 'Se renueva cada mes',
    'de': 'Verlängert sich monatlich',
    'fr': 'Renouvelé chaque mois',
    'nl': 'Wordt elke maand verlengd',
    'ar': 'يتجدد كل شهر',
    'pt': 'Renova todo mês',
    'it': 'Si rinnova ogni mese',
    'ru': 'Продлевается каждый месяц',
    'zh': '每月自动续订',
    'ja': '毎月自動更新',
    'ko': '매월 갱신',
    'pl': 'Odnawia się co miesiąc',
    'sv': 'Förnyas varje månad',
    'da': 'Fornyes hver måned',
    'no': 'Fornyes hver måned',
    'fi': 'Uusiutuu kuukausittain',
    'el': 'Ανανεώνεται κάθε μήνα',
    'cs': 'Obnovuje se každý měsíc',
    'ro': 'Se reînnoiește lunar',
    'hu': 'Havonta megújul',
    'hi': 'हर महीने नवीनीकृत होता है',
    'th': 'ต่ออายุทุกเดือน',
    'vi': 'Gia hạn hằng tháng',
    'id': 'Diperpanjang setiap bulan',
    'uk': 'Поновлюється щомісяця',
    'he': 'מתחדש מדי חודש',
    'fa': 'هر ماه تمدید می‌شود',
    'sw': 'Husasishwa kila mwezi',
  });

  String get billedYearly => t({
    'tr': 'Her yıl yenilenir',
    'en': 'Renews every year',
    'es': 'Se renueva cada año',
    'de': 'Verlängert sich jährlich',
    'fr': 'Renouvelé chaque année',
    'nl': 'Wordt elk jaar verlengd',
    'ar': 'يتجدد كل عام',
    'pt': 'Renova todo ano',
    'it': 'Si rinnova ogni anno',
    'ru': 'Продлевается каждый год',
    'zh': '每年自动续订',
    'ja': '毎年自動更新',
    'ko': '매년 갱신',
    'pl': 'Odnawia się co rok',
    'sv': 'Förnyas varje år',
    'da': 'Fornyes hvert år',
    'no': 'Fornyes hvert år',
    'fi': 'Uusiutuu vuosittain',
    'el': 'Ανανεώνεται κάθε χρόνο',
    'cs': 'Obnovuje se každý rok',
    'ro': 'Se reînnoiește anual',
    'hu': 'Évente megújul',
    'hi': 'हर साल नवीनीकृत होता है',
    'th': 'ต่ออายุทุกปี',
    'vi': 'Gia hạn hằng năm',
    'id': 'Diperpanjang setiap tahun',
    'uk': 'Поновлюється щороку',
    'he': 'מתחדש מדי שנה',
    'fa': 'هر سال تمدید می‌شود',
    'sw': 'Husasishwa kila mwaka',
  });

  String get familyProfilesYearly => t({
    'tr': '4 profil · her yıl yenilenir',
    'en': '4 profiles · renews every year',
    'es': '4 perfiles · se renueva cada año',
    'de': '4 Profile · verlängert sich jährlich',
    'fr': '4 profils · renouvelé chaque année',
    'nl': '4 profielen · wordt elk jaar verlengd',
    'ar': '4 ملفات شخصية · يتجدد كل عام',
    'pt': '4 perfis · renova todo ano',
    'it': '4 profili · si rinnova ogni anno',
    'ru': '4 профиля · продлевается каждый год',
    'zh': '4 个档案 · 每年自动续订',
    'ja': '4プロフィール · 毎年自動更新',
    'ko': '프로필 4개 · 매년 갱신',
    'pl': '4 profile · odnawia się co rok',
    'sv': '4 profiler · förnyas varje år',
    'da': '4 profiler · fornyes hvert år',
    'no': '4 profiler · fornyes hvert år',
    'fi': '4 profiilia · uusiutuu vuosittain',
    'el': '4 προφίλ · ανανεώνεται κάθε χρόνο',
    'cs': '4 profily · obnovuje se každý rok',
    'ro': '4 profiluri · se reînnoiește anual',
    'hu': '4 profil · évente megújul',
    'hi': '4 प्रोफ़ाइल · हर साल नवीनीकृत',
    'th': '4 โปรไฟล์ · ต่ออายุทุกปี',
    'vi': '4 hồ sơ · gia hạn hằng năm',
    'id': '4 profil · diperpanjang setiap tahun',
    'uk': '4 профілі · поновлюється щороку',
    'he': '4 פרופילים · מתחדש מדי שנה',
    'fa': '۴ نمایه · هر سال تمدید می‌شود',
    'sw': 'Wasifu 4 · husasishwa kila mwaka',
  });

  String get singleProfileYearly => t({
    'tr': 'Tek profil · her yıl yenilenir',
    'en': 'Single profile · renews every year',
    'es': 'Un perfil · se renueva cada año',
    'de': 'Ein Profil · verlängert sich jährlich',
    'fr': 'Un profil · renouvelé chaque année',
    'nl': 'Eén profiel · wordt elk jaar verlengd',
    'ar': 'ملف شخصي واحد · يتجدد كل عام',
    'pt': 'Um perfil · renova todo ano',
    'it': 'Un profilo · si rinnova ogni anno',
    'ru': 'Один профиль · продлевается каждый год',
    'zh': '单个档案 · 每年自动续订',
    'ja': '1プロフィール · 毎年自動更新',
    'ko': '프로필 1개 · 매년 갱신',
    'pl': 'Jeden profil · odnawia się co rok',
    'sv': 'En profil · förnyas varje år',
    'da': 'Én profil · fornyes hvert år',
    'no': 'Én profil · fornyes hvert år',
    'fi': 'Yksi profiili · uusiutuu vuosittain',
    'el': 'Ένα προφίλ · ανανεώνεται κάθε χρόνο',
    'cs': 'Jeden profil · obnovuje se každý rok',
    'ro': 'Un profil · se reînnoiește anual',
    'hu': 'Egy profil · évente megújul',
    'hi': 'एक प्रोफ़ाइल · हर साल नवीनीकृत',
    'th': '1 โปรไฟล์ · ต่ออายุทุกปี',
    'vi': '1 hồ sơ · gia hạn hằng năm',
    'id': '1 profil · diperpanjang setiap tahun',
    'uk': 'Один профіль · поновлюється щороку',
    'he': 'פרופיל אחד · מתחדש מדי שנה',
    'fa': 'یک نمایه · هر سال تمدید می‌شود',
    'sw': 'Wasifu 1 · husasishwa kila mwaka',
  });

  /// Mağaza fiyatı henüz yüklenmediğinde/bulunamadığında gösterilir.
  String get priceLoading => t({
    'tr': 'Fiyat yükleniyor…',
    'en': 'Loading price…',
    'es': 'Cargando precio…',
    'de': 'Preis wird geladen…',
    'fr': 'Chargement du prix…',
    'nl': 'Prijs laden…',
    'ar': 'جارٍ تحميل السعر…',
    'pt': 'Carregando preço…',
    'it': 'Caricamento prezzo…',
    'ru': 'Загрузка цены…',
    'zh': '正在加载价格…',
    'ja': '価格を読み込み中…',
    'ko': '가격 불러오는 중…',
    'pl': 'Ładowanie ceny…',
    'sv': 'Laddar pris…',
    'da': 'Indlæser pris…',
    'no': 'Laster inn pris…',
    'fi': 'Ladataan hintaa…',
    'el': 'Φόρτωση τιμής…',
    'cs': 'Načítání ceny…',
    'ro': 'Se încarcă prețul…',
    'hu': 'Ár betöltése…',
    'hi': 'कीमत लोड हो रही है…',
    'th': 'กำลังโหลดราคา…',
    'vi': 'Đang tải giá…',
    'id': 'Memuat harga…',
    'uk': 'Завантаження ціни…',
    'he': 'טוען מחיר…',
    'fa': 'در حال بارگذاری قیمت…',
    'sw': 'Inapakia bei…',
  });

  String get priceUnavailable => t({
    'tr': 'Mağaza şu an yanıt vermiyor. Lütfen biraz sonra tekrar dene.',
    'en': 'The store is not responding right now. Please try again later.',
    'es': 'La tienda no responde ahora. Inténtalo más tarde.',
    'de': 'Der Store antwortet gerade nicht. Bitte versuche es später erneut.',
    'fr': 'La boutique ne répond pas. Réessaie plus tard.',
    'nl': 'De winkel reageert nu niet. Probeer het later opnieuw.',
    'ar': 'المتجر لا يستجيب الآن. حاول مرة أخرى لاحقًا.',
    'pt': 'A loja não está respondendo. Tente novamente mais tarde.',
    'it': 'Lo store non risponde. Riprova più tardi.',
    'ru': 'Магазин сейчас не отвечает. Попробуйте позже.',
    'zh': '商店暂时无响应，请稍后再试。',
    'ja': 'ストアが応答していません。しばらくしてから再試行してください。',
    'ko': '스토어가 응답하지 않습니다. 잠시 후 다시 시도하세요.',
    'pl': 'Sklep nie odpowiada. Spróbuj ponownie później.',
    'sv': 'Butiken svarar inte just nu. Försök igen senare.',
    'da': 'Butikken svarer ikke lige nu. Prøv igen senere.',
    'no': 'Butikken svarer ikke nå. Prøv igjen senere.',
    'fi': 'Kauppa ei vastaa juuri nyt. Yritä myöhemmin uudelleen.',
    'el': 'Το κατάστημα δεν αποκρίνεται. Δοκίμασε ξανά αργότερα.',
    'cs': 'Obchod teď neodpovídá. Zkus to později.',
    'ro': 'Magazinul nu răspunde acum. Încearcă mai târziu.',
    'hu': 'Az áruház most nem válaszol. Próbáld újra később.',
    'hi': 'स्टोर अभी जवाब नहीं दे रहा। कृपया बाद में फिर कोशिश करें।',
    'th': 'ร้านค้าไม่ตอบสนองในขณะนี้ โปรดลองอีกครั้งภายหลัง',
    'vi': 'Cửa hàng hiện không phản hồi. Vui lòng thử lại sau.',
    'id': 'Toko sedang tidak merespons. Coba lagi nanti.',
    'uk': 'Магазин зараз не відповідає. Спробуйте пізніше.',
    'he': 'החנות לא מגיבה כרגע. נסה שוב מאוחר יותר.',
    'fa': 'فروشگاه اکنون پاسخ نمی‌دهد. بعداً دوباره امتحان کن.',
    'sw': 'Duka halijibu sasa. Tafadhali jaribu tena baadaye.',
  });

  List<String> get plusFeatures => [
    t({
      'tr': 'Sınırsız konuşma',
      'en': 'Unlimited speaking',
      'es': 'Práctica oral ilimitada',
      'de': 'Unbegrenztes Sprechen',
      'fr': 'Expression orale illimitée',
      'nl': 'Onbeperkt spreken',
      'ar': 'تحدث غير محدود',
      'pt': 'Fala ilimitada',
      'it': 'Conversazione illimitata',
      'ru': 'Безлимитная разговорная практика',
      'zh': '无限口语练习',
      'ja': 'スピーキング無制限',
      'ko': '무제한 말하기',
      'pl': 'Nielimitowane mówienie',
      'sv': 'Obegränsat talande',
      'da': 'Ubegrænset tale',
      'no': 'Ubegrenset snakking',
      'fi': 'Rajaton puhuminen',
      'el': 'Απεριόριστη ομιλία',
      'cs': 'Neomezené mluvení',
      'ro': 'Vorbire nelimitată',
      'hu': 'Korlátlan beszéd',
      'hi': 'असीमित बोलने का अभ्यास',
      'th': 'ฝึกพูดไม่จำกัด',
      'vi': 'Luyện nói không giới hạn',
      'id': 'Latihan bicara tanpa batas',
      'uk': 'Безлімітна розмовна практика',
      'he': 'דיבור ללא הגבלה',
      'fa': 'صحبت نامحدود',
      'sw': 'Kuzungumza bila kikomo',
    }),
    t({
      'tr': '30 dilin tamamı',
      'en': 'All 30 languages',
      'es': 'Los 30 idiomas',
      'de': 'Alle 30 Sprachen',
      'fr': 'Les 30 langues',
      'nl': 'Alle 30 talen',
      'ar': 'جميع اللغات الثلاثين',
      'pt': 'Todos os 30 idiomas',
      'it': 'Tutte le 30 lingue',
      'ru': 'Все 30 языков',
      'zh': '全部 30 种语言',
      'ja': '全30言語',
      'ko': '30개 언어 전체',
      'pl': 'Wszystkie 30 języków',
      'sv': 'Alla 30 språk',
      'da': 'Alle 30 sprog',
      'no': 'Alle 30 språk',
      'fi': 'Kaikki 30 kieltä',
      'el': 'Και οι 30 γλώσσες',
      'cs': 'Všech 30 jazyků',
      'ro': 'Toate cele 30 de limbi',
      'hu': 'Mind a 30 nyelv',
      'hi': 'सभी 30 भाषाएँ',
      'th': 'ครบทั้ง 30 ภาษา',
      'vi': 'Cả 30 ngôn ngữ',
      'id': 'Semua 30 bahasa',
      'uk': 'Усі 30 мов',
      'he': 'כל 30 השפות',
      'fa': 'هر ۳۰ زبان',
      'sw': 'Lugha zote 30',
    }),
    if (Features.paidCloudApis)
      t({
        'tr': 'Voxelith ile canlı sohbet',
        'en': 'Live chat with Voxelith',
        'es': 'Chat en vivo con Voxelith',
        'de': 'Live-Chat mit Voxelith',
        'fr': 'Chat en direct avec Voxelith',
        'nl': 'Live chatten met Voxelith',
        'ar': 'دردشة مباشرة مع Voxelith',
        'pt': 'Chat ao vivo com Voxelith',
        'it': 'Chat dal vivo con Voxelith',
        'ru': 'Живой чат с Voxelith',
        'zh': '与 Voxelith 实时聊天',
        'ja': 'Voxelithとライブチャット',
        'ko': 'Voxelith와 실시간 채팅',
        'pl': 'Czat na żywo z Voxelith',
        'sv': 'Livechatt med Voxelith',
        'da': 'Live-chat med Voxelith',
        'no': 'Livechat med Voxelith',
        'fi': 'Live-chat Voxelithin kanssa',
        'el': 'Ζωντανή συνομιλία με το Voxelith',
        'cs': 'Živý chat s Voxelith',
        'ro': 'Chat live cu Voxelith',
        'hu': 'Élő csevegés a Voxelith-tal',
        'hi': 'Voxelith के साथ लाइव चैट',
        'th': 'แชทสดกับ Voxelith',
        'vi': 'Trò chuyện trực tiếp với Voxelith',
        'id': 'Obrolan langsung dengan Voxelith',
        'uk': 'Живий чат з Voxelith',
        'he': 'צ׳אט חי עם Voxelith',
        'fa': 'گفت‌وگوی زنده با Voxelith',
        'sw': 'Gumzo la moja kwa moja na Voxelith',
      }),
    if (Features.paidCloudApis)
      t({
        'tr': 'Çevir + SRS kaydet',
        'en': 'Translate + save to review',
        'es': 'Traduce + guarda para repasar',
        'de': 'Übersetzen + zum Wiederholen speichern',
        'fr': 'Traduire + enregistrer pour réviser',
        'nl': 'Vertalen + opslaan om te herhalen',
        'ar': 'ترجم واحفظ للمراجعة',
        'pt': 'Traduza + salve para revisar',
        'it': 'Traduci + salva per il ripasso',
        'ru': 'Перевод + сохранение для повторения',
        'zh': '翻译并保存复习',
        'ja': '翻訳して復習に保存',
        'ko': '번역 + 복습에 저장',
        'pl': 'Tłumacz + zapisz do powtórek',
        'sv': 'Översätt + spara för repetition',
        'da': 'Oversæt + gem til repetition',
        'no': 'Oversett + lagre for repetisjon',
        'fi': 'Käännä + tallenna kertaukseen',
        'el': 'Μετάφραση + αποθήκευση για επανάληψη',
        'cs': 'Překlad + uložení k opakování',
        'ro': 'Traduce + salvează pentru recapitulare',
        'hu': 'Fordítás + mentés ismétléshez',
        'hi': 'अनुवाद करें + दोहराने के लिए सहेजें',
        'th': 'แปล + บันทึกไว้ทบทวน',
        'vi': 'Dịch + lưu để ôn tập',
        'id': 'Terjemahkan + simpan untuk diulang',
        'uk': 'Переклад + збереження для повторення',
        'he': 'תרגום + שמירה לחזרה',
        'fa': 'ترجمه + ذخیره برای مرور',
        'sw': 'Tafsiri + hifadhi kwa marudio',
      }),
    t({
      'tr': 'Her hafta 2 seri koruma 🧊',
      'en': '2 streak freezes every week 🧊',
      'es': '2 protectores de racha cada semana 🧊',
      'de': 'Jede Woche 2 Serienschützer 🧊',
      'fr': '2 gels de série chaque semaine 🧊',
      'nl': 'Elke week 2 reeksbevriezers 🧊',
      'ar': 'حمايتان للسلسلة كل أسبوع 🧊',
      'pt': '2 proteções de sequência por semana 🧊',
      'it': '2 protezioni della serie ogni settimana 🧊',
      'ru': '2 заморозки серии каждую неделю 🧊',
      'zh': '每周 2 次连胜保护 🧊',
      'ja': '毎週2回の連続記録キープ 🧊',
      'ko': '매주 연속 기록 보호 2회 🧊',
      'pl': '2 zamrożenia serii co tydzień 🧊',
      'sv': '2 sviteskydd varje vecka 🧊',
      'da': '2 stribebeskyttelser hver uge 🧊',
      'no': '2 rekkebeskyttelser hver uke 🧊',
      'fi': '2 putkensuojaa joka viikko 🧊',
      'el': '2 προστασίες σερί κάθε εβδομάδα 🧊',
      'cs': '2 ochrany série každý týden 🧊',
      'ro': '2 protecții de serie în fiecare săptămână 🧊',
      'hu': 'Hetente 2 sorozatvédő 🧊',
      'hi': 'हर हफ़्ते 2 स्ट्रीक सुरक्षा 🧊',
      'th': 'ป้องกันสตรีค 2 ครั้งทุกสัปดาห์ 🧊',
      'vi': '2 lần giữ chuỗi mỗi tuần 🧊',
      'id': '2 pelindung runtutan setiap minggu 🧊',
      'uk': '2 заморозки серії щотижня 🧊',
      'he': '2 הגנות רצף בכל שבוע 🧊',
      'fa': 'هر هفته ۲ محافظ زنجیره 🧊',
      'sw': 'Ulinzi 2 wa mfululizo kila wiki 🧊',
    }),
    t({
      'tr': 'Reklamsız',
      'en': 'No ads',
      'es': 'Sin anuncios',
      'de': 'Werbefrei',
      'fr': 'Sans publicité',
      'nl': 'Zonder advertenties',
      'ar': 'بدون إعلانات',
      'pt': 'Sem anúncios',
      'it': 'Senza pubblicità',
      'ru': 'Без рекламы',
      'zh': '无广告',
      'ja': '広告なし',
      'ko': '광고 없음',
      'pl': 'Bez reklam',
      'sv': 'Utan annonser',
      'da': 'Uden reklamer',
      'no': 'Uten reklame',
      'fi': 'Ei mainoksia',
      'el': 'Χωρίς διαφημίσεις',
      'cs': 'Bez reklam',
      'ro': 'Fără reclame',
      'hu': 'Reklámmentes',
      'hi': 'बिना विज्ञापन',
      'th': 'ไม่มีโฆษณา',
      'vi': 'Không quảng cáo',
      'id': 'Tanpa iklan',
      'uk': 'Без реклами',
      'he': 'ללא פרסומות',
      'fa': 'بدون تبلیغ',
      'sw': 'Bila matangazo',
    }),
  ];

  List<String> get businessFeatures => [
    t({
      'tr': 'Tüm Plus özellikleri',
      'en': 'Everything in Plus',
      'es': 'Todo lo de Plus',
      'de': 'Alles aus Plus',
      'fr': 'Tout Plus inclus',
      'nl': 'Alles van Plus',
      'ar': 'كل ميزات Plus',
      'pt': 'Tudo do Plus',
      'it': 'Tutto di Plus',
      'ru': 'Всё из Plus',
      'zh': 'Plus 全部功能',
      'ja': 'Plusのすべての機能',
      'ko': 'Plus의 모든 기능',
      'pl': 'Wszystko z Plus',
      'sv': 'Allt i Plus',
      'da': 'Alt i Plus',
      'no': 'Alt i Plus',
      'fi': 'Kaikki Plus-ominaisuudet',
      'el': 'Όλα όσα έχει το Plus',
      'cs': 'Vše z Plus',
      'ro': 'Tot ce include Plus',
      'hu': 'Minden Plus-funkció',
      'hi': 'Plus की सभी सुविधाएँ',
      'th': 'ทุกฟีเจอร์ของ Plus',
      'vi': 'Mọi tính năng của Plus',
      'id': 'Semua fitur Plus',
      'uk': 'Усе з Plus',
      'he': 'כל מה שיש ב-Plus',
      'fa': 'همه امکانات Plus',
      'sw': 'Kila kitu cha Plus',
    }),
    t({
      'tr': 'Günlük AI analiz, sohbet, ses ve çeviri hakkı ~3 kat daha yüksek',
      'en':
          '~3× higher daily limits for AI feedback, chat, voice and translation',
      'es': 'Límites diarios ~3× mayores de IA, chat, voz y traducción',
      'de':
          '~3× höhere Tageslimits für KI-Feedback, Chat, Stimme und Übersetzung',
      'fr':
          'Limites quotidiennes ~3× plus élevées (IA, chat, voix, traduction)',
      'nl': '~3× hogere daglimieten voor AI-feedback, chat, stem en vertaling',
      'ar':
          'حدود يومية أعلى بنحو 3 أضعاف للذكاء الاصطناعي والدردشة والصوت والترجمة',
      'pt': 'Limites diários ~3× maiores de IA, chat, voz e tradução',
      'it': 'Limiti giornalieri ~3× più alti per IA, chat, voce e traduzione',
      'ru': 'Дневные лимиты на ИИ, чат, голос и перевод примерно в 3 раза выше',
      'zh': 'AI 反馈、聊天、语音和翻译每日额度约提高 3 倍',
      'ja': 'AIフィードバック・チャット・音声・翻訳の1日上限が約3倍',
      'ko': 'AI 피드백·채팅·음성·번역 일일 한도 약 3배',
      'pl': 'Ok. 3× wyższe dzienne limity AI, czatu, głosu i tłumaczeń',
      'sv': '~3× högre dagliga gränser för AI, chatt, röst och översättning',
      'da': '~3× højere daglige grænser for AI, chat, stemme og oversættelse',
      'no': '~3× høyere daglige grenser for AI, chat, stemme og oversettelse',
      'fi':
          'Noin 3× suuremmat päivärajat tekoälylle, chatille, äänelle ja käännöksille',
      'el':
          'Περίπου 3× υψηλότερα ημερήσια όρια για AI, συνομιλία, φωνή και μετάφραση',
      'cs': 'Asi 3× vyšší denní limity pro AI, chat, hlas a překlad',
      'ro': 'Limite zilnice de ~3× mai mari pentru AI, chat, voce și traducere',
      'hu':
          'Kb. 3× magasabb napi keret AI-ra, csevegésre, hangra és fordításra',
      'hi': 'AI, चैट, आवाज़ और अनुवाद की दैनिक सीमा लगभग 3 गुना',
      'th': 'โควตารายวันสำหรับ AI แชท เสียง และการแปลสูงขึ้นราว 3 เท่า',
      'vi': 'Hạn mức hằng ngày cho AI, chat, giọng nói và dịch cao gấp ~3 lần',
      'id': 'Batas harian AI, obrolan, suara, dan terjemahan ~3× lebih tinggi',
      'uk': 'Денні ліміти на ШІ, чат, голос і переклад приблизно втричі вищі',
      'he': 'מגבלות יומיות גבוהות פי ~3 ל-AI, צ׳אט, קול ותרגום',
      'fa': 'سقف روزانه حدود ۳ برابر برای هوش مصنوعی، گفت‌وگو، صدا و ترجمه',
      'sw':
          'Vikomo vya kila siku ~mara 3 zaidi kwa AI, gumzo, sauti na tafsiri',
    }),
    t({
      'tr': 'Öncelikli destek',
      'en': 'Priority support',
      'es': 'Soporte prioritario',
      'de': 'Priorisierter Support',
      'fr': 'Support prioritaire',
      'nl': 'Voorrangsondersteuning',
      'ar': 'دعم ذو أولوية',
      'pt': 'Suporte prioritário',
      'it': 'Assistenza prioritaria',
      'ru': 'Приоритетная поддержка',
      'zh': '优先支持',
      'ja': '優先サポート',
      'ko': '우선 지원',
      'pl': 'Priorytetowe wsparcie',
      'sv': 'Prioriterad support',
      'da': 'Prioriteret support',
      'no': 'Prioritert støtte',
      'fi': 'Ensisijainen tuki',
      'el': 'Υποστήριξη προτεραιότητας',
      'cs': 'Prioritní podpora',
      'ro': 'Asistență prioritară',
      'hu': 'Elsőbbségi támogatás',
      'hi': 'प्राथमिकता सहायता',
      'th': 'การสนับสนุนแบบเร่งด่วน',
      'vi': 'Hỗ trợ ưu tiên',
      'id': 'Dukungan prioritas',
      'uk': 'Пріоритетна підтримка',
      'he': 'תמיכה בעדיפות',
      'fa': 'پشتیبانی اولویت‌دار',
      'sw': 'Usaidizi wa kipaumbele',
    }),
  ];

  String get restorePurchases => t({
    'tr': 'Satın alımları geri yükle',
    'en': 'Restore purchases',
    'es': 'Restaurar compras',
    'de': 'Käufe wiederherstellen',
    'fr': 'Restaurer les achats',
    'nl': 'Aankopen herstellen',
    'ar': 'استعادة المشتريات',
    'pt': 'Restaurar compras',
    'it': 'Ripristina acquisti',
    'ru': 'Восстановить покупки',
    'zh': '恢复购买',
    'ja': '購入を復元',
    'ko': '구매 복원',
    'pl': 'Przywróć zakupy',
    'sv': 'Återställ köp',
    'da': 'Gendan køb',
    'no': 'Gjenopprett kjøp',
    'fi': 'Palauta ostokset',
    'el': 'Επαναφορά αγορών',
    'cs': 'Obnovit nákupy',
    'ro': 'Restaurează achizițiile',
    'hu': 'Vásárlások visszaállítása',
    'hi': 'खरीदारी पुनर्स्थापित करें',
    'th': 'กู้คืนการซื้อ',
    'vi': 'Khôi phục giao dịch',
    'id': 'Pulihkan pembelian',
    'uk': 'Відновити покупки',
    'he': 'שחזור רכישות',
    'fa': 'بازیابی خریدها',
    'sw': 'Rejesha ununuzi',
  });

  String get restoreSuccess => t({
    'tr': 'Satın alımların geri yüklendi.',
    'en': 'Your purchases have been restored.',
    'es': 'Tus compras se han restaurado.',
    'de': 'Deine Käufe wurden wiederhergestellt.',
    'fr': 'Tes achats ont été restaurés.',
    'nl': 'Je aankopen zijn hersteld.',
    'ar': 'تمت استعادة مشترياتك.',
    'pt': 'Suas compras foram restauradas.',
    'it': 'I tuoi acquisti sono stati ripristinati.',
    'ru': 'Ваши покупки восстановлены.',
    'zh': '已恢复你的购买。',
    'ja': '購入を復元しました。',
    'ko': '구매가 복원되었습니다.',
    'pl': 'Zakupy zostały przywrócone.',
    'sv': 'Dina köp har återställts.',
    'da': 'Dine køb er gendannet.',
    'no': 'Kjøpene dine er gjenopprettet.',
    'fi': 'Ostoksesi on palautettu.',
    'el': 'Οι αγορές σου επαναφέρθηκαν.',
    'cs': 'Tvoje nákupy byly obnoveny.',
    'ro': 'Achizițiile tale au fost restaurate.',
    'hu': 'A vásárlásaid visszaállítva.',
    'hi': 'आपकी खरीदारी पुनर्स्थापित हो गई।',
    'th': 'กู้คืนการซื้อของคุณแล้ว',
    'vi': 'Đã khôi phục giao dịch của bạn.',
    'id': 'Pembelianmu telah dipulihkan.',
    'uk': 'Ваші покупки відновлено.',
    'he': 'הרכישות שלך שוחזרו.',
    'fa': 'خریدهایت بازیابی شد.',
    'sw': 'Ununuzi wako umerejeshwa.',
  });

  String get restoreNone => t({
    'tr': 'Geri yüklenecek bir satın alma bulunamadı.',
    'en': 'No purchases to restore were found.',
    'es': 'No se encontraron compras para restaurar.',
    'de': 'Keine wiederherstellbaren Käufe gefunden.',
    'fr': 'Aucun achat à restaurer.',
    'nl': 'Geen aankopen gevonden om te herstellen.',
    'ar': 'لم يتم العثور على مشتريات لاستعادتها.',
    'pt': 'Nenhuma compra para restaurar foi encontrada.',
    'it': 'Nessun acquisto da ripristinare.',
    'ru': 'Покупки для восстановления не найдены.',
    'zh': '没有可恢复的购买。',
    'ja': '復元できる購入が見つかりません。',
    'ko': '복원할 구매가 없습니다.',
    'pl': 'Nie znaleziono zakupów do przywrócenia.',
    'sv': 'Inga köp att återställa hittades.',
    'da': 'Ingen køb at gendanne blev fundet.',
    'no': 'Fant ingen kjøp å gjenopprette.',
    'fi': 'Palautettavia ostoksia ei löytynyt.',
    'el': 'Δεν βρέθηκαν αγορές για επαναφορά.',
    'cs': 'Nebyly nalezeny žádné nákupy k obnovení.',
    'ro': 'Nu s-au găsit achiziții de restaurat.',
    'hu': 'Nem található visszaállítható vásárlás.',
    'hi': 'पुनर्स्थापित करने के लिए कोई खरीदारी नहीं मिली।',
    'th': 'ไม่พบการซื้อที่จะกู้คืน',
    'vi': 'Không tìm thấy giao dịch để khôi phục.',
    'id': 'Tidak ada pembelian untuk dipulihkan.',
    'uk': 'Покупок для відновлення не знайдено.',
    'he': 'לא נמצאו רכישות לשחזור.',
    'fa': 'خریدی برای بازیابی پیدا نشد.',
    'sw': 'Hakuna ununuzi wa kurejesha uliopatikana.',
  });

  String get purchaseFailed => t({
    'tr': 'Satın alma tamamlanamadı.',
    'en': 'The purchase could not be completed.',
    'es': 'No se pudo completar la compra.',
    'de': 'Der Kauf konnte nicht abgeschlossen werden.',
    'fr': "L'achat n'a pas pu être finalisé.",
    'nl': 'De aankoop kon niet worden voltooid.',
    'ar': 'تعذر إتمام عملية الشراء.',
    'pt': 'Não foi possível concluir a compra.',
    'it': "Impossibile completare l'acquisto.",
    'ru': 'Не удалось завершить покупку.',
    'zh': '无法完成购买。',
    'ja': '購入を完了できませんでした。',
    'ko': '구매를 완료할 수 없습니다.',
    'pl': 'Nie udało się dokończyć zakupu.',
    'sv': 'Köpet kunde inte slutföras.',
    'da': 'Købet kunne ikke gennemføres.',
    'no': 'Kjøpet kunne ikke fullføres.',
    'fi': 'Ostoa ei voitu viedä loppuun.',
    'el': 'Η αγορά δεν ολοκληρώθηκε.',
    'cs': 'Nákup se nepodařilo dokončit.',
    'ro': 'Achiziția nu a putut fi finalizată.',
    'hu': 'A vásárlást nem sikerült befejezni.',
    'hi': 'खरीदारी पूरी नहीं हो सकी।',
    'th': 'ไม่สามารถทำการซื้อให้เสร็จได้',
    'vi': 'Không thể hoàn tất giao dịch.',
    'id': 'Pembelian tidak dapat diselesaikan.',
    'uk': 'Не вдалося завершити покупку.',
    'he': 'לא ניתן היה להשלים את הרכישה.',
    'fa': 'خرید کامل نشد.',
    'sw': 'Ununuzi haukuweza kukamilika.',
  });

  String get closeLabel => t({
    'tr': 'Kapat',
    'en': 'Close',
    'es': 'Cerrar',
    'de': 'Schließen',
    'fr': 'Fermer',
    'nl': 'Sluiten',
    'ar': 'إغلاق',
    'pt': 'Fechar',
    'it': 'Chiudi',
    'ru': 'Закрыть',
    'zh': '关闭',
    'ja': '閉じる',
    'ko': '닫기',
    'pl': 'Zamknij',
    'sv': 'Stäng',
    'da': 'Luk',
    'no': 'Lukk',
    'fi': 'Sulje',
    'el': 'Κλείσιμο',
    'cs': 'Zavřít',
    'ro': 'Închide',
    'hu': 'Bezárás',
    'hi': 'बंद करें',
    'th': 'ปิด',
    'vi': 'Đóng',
    'id': 'Tutup',
    'uk': 'Закрити',
    'he': 'סגור',
    'fa': 'بستن',
    'sw': 'Funga',
  });

  String get privacyChoices => t({
    'tr': 'Gizlilik seçenekleri',
    'en': 'Privacy choices',
    'es': 'Opciones de privacidad',
    'de': 'Datenschutzoptionen',
    'fr': 'Choix de confidentialité',
    'nl': 'Privacykeuzes',
    'ar': 'خيارات الخصوصية',
    'pt': 'Opções de privacidade',
    'it': 'Scelte sulla privacy',
    'ru': 'Настройки конфиденциальности',
    'zh': '隐私选项',
    'ja': 'プライバシーの選択',
    'ko': '개인정보 선택',
    'pl': 'Ustawienia prywatności',
    'sv': 'Integritetsval',
    'da': 'Privatlivsvalg',
    'no': 'Personvernvalg',
    'fi': 'Tietosuojavalinnat',
    'el': 'Επιλογές απορρήτου',
    'cs': 'Možnosti ochrany soukromí',
    'ro': 'Opțiuni de confidențialitate',
    'hu': 'Adatvédelmi beállítások',
    'hi': 'गोपनीयता विकल्प',
    'th': 'ตัวเลือกความเป็นส่วนตัว',
    'vi': 'Lựa chọn quyền riêng tư',
    'id': 'Pilihan privasi',
    'uk': 'Налаштування конфіденційності',
    'he': 'אפשרויות פרטיות',
    'fa': 'گزینه‌های حریم خصوصی',
    'sw': 'Chaguo za faragha',
  });

  String get termsTitle => t({
    'tr': 'Kullanım Koşulları',
    'en': 'Terms of Use',
    'es': 'Términos de uso',
    'de': 'Nutzungsbedingungen',
    'fr': "Conditions d'utilisation",
    'nl': 'Gebruiksvoorwaarden',
    'ar': 'شروط الاستخدام',
    'pt': 'Termos de uso',
    'it': "Termini d'uso",
    'ru': 'Условия использования',
    'zh': '使用条款',
    'ja': '利用規約',
    'ko': '이용약관',
    'pl': 'Warunki korzystania',
    'sv': 'Användarvillkor',
    'da': 'Brugsvilkår',
    'no': 'Bruksvilkår',
    'fi': 'Käyttöehdot',
    'el': 'Όροι χρήσης',
    'cs': 'Podmínky použití',
    'ro': 'Termeni de utilizare',
    'hu': 'Felhasználási feltételek',
    'hi': 'उपयोग की शर्तें',
    'th': 'ข้อกำหนดการใช้งาน',
    'vi': 'Điều khoản sử dụng',
    'id': 'Ketentuan Penggunaan',
    'uk': 'Умови використання',
    'he': 'תנאי שימוש',
    'fa': 'شرایط استفاده',
    'sw': 'Masharti ya Matumizi',
  });

  String get privacyTitle => t({
    'tr': 'Gizlilik Politikası',
    'en': 'Privacy Policy',
    'es': 'Política de privacidad',
    'de': 'Datenschutzerklärung',
    'fr': 'Politique de confidentialité',
    'nl': 'Privacybeleid',
    'ar': 'سياسة الخصوصية',
    'pt': 'Política de privacidade',
    'it': 'Informativa sulla privacy',
    'ru': 'Политика конфиденциальности',
    'zh': '隐私政策',
    'ja': 'プライバシーポリシー',
    'ko': '개인정보 처리방침',
    'pl': 'Polityka prywatności',
    'sv': 'Integritetspolicy',
    'da': 'Privatlivspolitik',
    'no': 'Personvernerklæring',
    'fi': 'Tietosuojakäytäntö',
    'el': 'Πολιτική απορρήτου',
    'cs': 'Zásady ochrany soukromí',
    'ro': 'Politica de confidențialitate',
    'hu': 'Adatvédelmi irányelvek',
    'hi': 'गोपनीयता नीति',
    'th': 'นโยบายความเป็นส่วนตัว',
    'vi': 'Chính sách quyền riêng tư',
    'id': 'Kebijakan Privasi',
    'uk': 'Політика конфіденційності',
    'he': 'מדיניות פרטיות',
    'fa': 'سیاست حریم خصوصی',
    'sw': 'Sera ya Faragha',
  });

  /// App Store 3.1.2 / Google Play abonelik politikası: satın alma
  /// butonunun yakınında otomatik yenileme ve iptal koşulları.
  String get autoRenewDisclosure => t({
    'tr':
        'Abonelik, seçtiğin dönem (aylık/yıllık) sonunda otomatik olarak '
        'yenilenir. Ücret, satın alma onayında mağaza hesabından alınır. '
        'Mevcut dönem bitmeden en az 24 saat önce iptal edilmezse yenileme '
        'ücreti dönem bitimine 24 saat kala tahsil edilir. Aboneliğini '
        'App Store / Google Play hesap ayarlarından yönetebilir ve iptal '
        'edebilirsin.',
    'en':
        'Your subscription renews automatically at the end of each period '
        '(monthly/yearly). Payment is charged to your store account at '
        'confirmation of purchase. The subscription renews unless it is '
        'cancelled at least 24 hours before the end of the current period, '
        'and your account is charged for renewal within 24 hours before the '
        'end of the current period. You can manage and cancel your '
        'subscription in your App Store / Google Play account settings.',
    'es':
        'La suscripción se renueva automáticamente al final de cada periodo '
        '(mensual/anual). El pago se carga a tu cuenta de la tienda al '
        'confirmar la compra. Se renueva salvo que la canceles al menos 24 '
        'horas antes del final del periodo actual, y el cargo de renovación '
        'se realiza en las 24 horas previas. Puedes gestionarla y cancelarla '
        'en los ajustes de tu cuenta de App Store / Google Play.',
    'de':
        'Dein Abo verlängert sich automatisch am Ende jedes Zeitraums '
        '(monatlich/jährlich). Die Zahlung wird bei Kaufbestätigung über '
        'dein Store-Konto abgerechnet. Das Abo verlängert sich, sofern es '
        'nicht mindestens 24 Stunden vor Ende des aktuellen Zeitraums '
        'gekündigt wird; die Verlängerung wird innerhalb dieser 24 Stunden '
        'berechnet. Du kannst das Abo in deinen App-Store-/Google-Play-'
        'Kontoeinstellungen verwalten und kündigen.',
    'fr':
        "Ton abonnement se renouvelle automatiquement à la fin de chaque "
        "période (mensuelle/annuelle). Le paiement est débité de ton compte "
        "de la boutique à la confirmation de l'achat. Il se renouvelle sauf "
        "résiliation au moins 24 heures avant la fin de la période en cours ; "
        "le renouvellement est facturé dans les 24 heures précédant cette "
        "fin. Tu peux gérer et résilier l'abonnement dans les réglages de "
        "ton compte App Store / Google Play.",
    'pt':
        'A assinatura é renovada automaticamente ao fim de cada período '
        '(mensal/anual). O pagamento é cobrado na sua conta da loja na '
        'confirmação da compra. Ela é renovada a menos que seja cancelada '
        'pelo menos 24 horas antes do fim do período atual, e a renovação é '
        'cobrada nas 24 horas anteriores. Você pode gerenciar e cancelar a '
        'assinatura nas configurações da sua conta App Store / Google Play.',
    'it':
        "L'abbonamento si rinnova automaticamente alla fine di ogni periodo "
        "(mensile/annuale). Il pagamento viene addebitato sul tuo account "
        "dello store alla conferma dell'acquisto. Si rinnova se non viene "
        "annullato almeno 24 ore prima della fine del periodo in corso; il "
        "rinnovo viene addebitato nelle 24 ore precedenti. Puoi gestirlo e "
        "annullarlo dalle impostazioni del tuo account App Store / Google Play.",
  });

  String get subscribeCta => t({
    'tr': 'Abone ol',
    'en': 'Subscribe',
    'es': 'Suscribirse',
    'de': 'Abonnieren',
    'fr': "S'abonner",
    'nl': 'Abonneren',
    'ar': 'اشترك',
    'pt': 'Assinar',
    'it': 'Abbonati',
    'ru': 'Оформить подписку',
    'zh': '订阅',
    'ja': '登録する',
    'ko': '구독하기',
    'pl': 'Subskrybuj',
    'sv': 'Prenumerera',
    'da': 'Abonner',
    'no': 'Abonner',
    'fi': 'Tilaa',
    'el': 'Εγγραφή',
    'cs': 'Předplatit',
    'ro': 'Abonează-te',
    'hu': 'Előfizetés',
    'hi': 'सदस्यता लें',
    'th': 'สมัครสมาชิก',
    'vi': 'Đăng ký',
    'id': 'Berlangganan',
    'uk': 'Оформити підписку',
    'he': 'הירשם',
    'fa': 'اشتراک',
    'sw': 'Jisajili',
  });

  /// Yalnızca mağaza ürünü gerçekten ücretsiz deneme içeriyorsa kullanılır.
  String trialCta(int days) => t({
    'tr': '$days gün ücretsiz dene',
    'en': 'Start $days-day free trial',
    'es': 'Prueba gratis $days días',
    'de': '$days Tage kostenlos testen',
    'fr': 'Essai gratuit de $days jours',
    'nl': '$days dagen gratis proberen',
    'ar': 'جرّب مجانًا لمدة $days أيام',
    'pt': 'Teste grátis por $days dias',
    'it': 'Prova gratis per $days giorni',
    'ru': 'Бесплатно $days дн.',
    'zh': '开始 $days 天免费试用',
    'ja': '$days日間無料で試す',
    'ko': '$days일 무료 체험 시작',
    'pl': 'Wypróbuj za darmo przez $days dni',
    'sv': 'Prova gratis i $days dagar',
    'da': 'Prøv gratis i $days dage',
    'no': 'Prøv gratis i $days dager',
    'fi': 'Kokeile ilmaiseksi $days päivää',
    'el': 'Δωρεάν δοκιμή $days ημερών',
    'cs': 'Vyzkoušej zdarma na $days dní',
    'ro': 'Încearcă gratuit $days zile',
    'hu': '$days napos ingyenes próba',
    'hi': '$days दिन का मुफ़्त ट्रायल शुरू करें',
    'th': 'ทดลองใช้ฟรี $days วัน',
    'vi': 'Dùng thử miễn phí $days ngày',
    'id': 'Coba gratis $days hari',
    'uk': 'Безкоштовно $days дн.',
    'he': 'ניסיון חינם ל-$days ימים',
    'fa': '$days روز آزمایش رایگان',
    'sw': 'Jaribu bure kwa siku $days',
  });

  String trialThenPrice(int days, String price) => t({
    'tr':
        '$days gün ücretsiz, sonra $price. Deneme bitmeden iptal edersen ücret alınmaz.',
    'en':
        '$days days free, then $price. Cancel before the trial ends and you won\'t be charged.',
    'es':
        '$days días gratis, luego $price. Cancela antes de que acabe la prueba y no se te cobrará.',
    'de':
        '$days Tage kostenlos, danach $price. Kündige vor Ende des Tests, dann wird nichts berechnet.',
    'fr':
        '$days jours gratuits, puis $price. Résilie avant la fin de l\'essai pour ne rien payer.',
    'pt':
        '$days dias grátis, depois $price. Cancele antes do fim do teste e nada será cobrado.',
    'it':
        '$days giorni gratis, poi $price. Annulla prima della fine della prova e non ti verrà addebitato nulla.',
  });

  // --------------------------------------------------------- Notifications

  String get notifChannelName =>
      t({'tr': 'Günlük pratik', 'en': 'Daily practice'});

  String get notifChannelDescription => t({
    'tr': 'VOXELITH günlük ders ve seri hatırlatmaları',
    'en': 'VOXELITH daily lesson and streak reminders',
  });

  String get notifPlusBody => t({
    'tr': 'Sınırsız konuşma hakkın hazır. Bugünün sahnesine geç!',
    'en': 'Unlimited speaking is ready. Start today’s scene.',
  });

  String get notifStreakTitle =>
      t({'tr': 'Serini koru', 'en': 'Keep your streak'});

  String notifStreakBody(int days) => t({
    'tr': '🔥 Serin $days gün! Bugün kırma!',
    'en': '🔥 $days days strong. Keep the chain alive today.',
  });

  String get notifGameTitle =>
      t({'tr': 'Yeni oyun', 'en': 'Ready for a quick game?'});

  String get notifGameBody => t({
    'tr': '🎮 Yeni oyun: Harf Sıralama dene!',
    'en': '🎮 Try Letter Order to sharpen your vocabulary.',
  });

  String get notifPracticeTitle =>
      t({'tr': 'Hadi derse! 📚', 'en': 'Time to practise! 📚'});

  String get notifPracticeBody => t({
    'tr': 'Bugün henüz pratik yapmadın. Kısa bir konuşma yeter.',
    'en': 'You have not practised today. One short conversation is enough.',
  });

  // --------------------------------------------------------------- Legal

  String privacyBody() => t({
    'tr':
        'Son güncelleme: 29 Eylül 2026\n\n'
        '1. Veri sorumlusu\n'
        'VOXELITH uygulamasının veri sorumlusu ${LegalInfo.companyLegalName}, '
        '${LegalInfo.companyAddress} (Hollanda Ticaret Odası/KvK no: '
        '${LegalInfo.kvkNumber}). Gizlilik soruların için: '
        '${LegalInfo.privacyEmail}. Bu politika AB Genel Veri Koruma Tüzüğü '
        '(GDPR) ve Hollanda hukukuna göre hazırlanmıştır.\n\n'
        '2. Cihazında saklananlar\n'
        'Dil seçimlerin, seri, XP, öğrendiğin kalıplar, tekrar takvimi ve '
        'ayarların yalnızca telefonunda saklanır. Uygulamayı hesap açmadan '
        'kullanabilirsin.\n\n'
        '3. Hesap, liderlik tablosu ve klanlar\n'
        'Hesap açarsan e-posta adresin, şifren (yalnızca sunucuda, '
        'hash\'lenmiş olarak), görünen adın, öğrenme ilerlemen, XP ve serin '
        'saklanır. Görünen adın ve XP\'n liderlik tablosunda ve klanında '
        'diğer kullanıcılara gösterilir; klan sohbeti mesajların klan '
        'üyelerince görülür. Hukuki dayanak: sözleşmenin ifası (GDPR md. '
        '6/1-b).\n\n'
        '4. Mikrofon ve konuşma tanıma\n'
        'Mikrofon yalnızca konuşma alıştırmasında kullanılır. Söylediklerin '
        'cihazının konuşma tanıma hizmeti (iOS\'ta Apple, Android\'de Google) '
        'tarafından yazıya çevrilir; bu hizmet sesi kendi sunucularında '
        'işleyebilir. VOXELITH ses kaydı almaz ve saklamaz. Yapay zekâ veya '
        'bulut çeviri hizmeti kullanılmaz; çeviri ve telaffuz puanı cihazında '
        'üretilir.\n\n'
        '5. Satın almalar\n'
        'Ödemeyi App Store veya Google Play alır; kart bilgilerini görmeyiz. '
        'Aboneliğini doğrulamak için RevenueCat satın alma kaydını ve takma '
        'adlı bir kullanıcı kimliğini işler. Hukuki dayanak: sözleşmenin '
        'ifası (md. 6/1-b) ve yasal yükümlülükler (md. 6/1-c).\n\n'
        '6. Reklamlar (ücretsiz sürüm)\n'
        'Ücretsiz sürümde Google AdMob reklamları gösterilir. AdMob reklam '
        'kimliği, IP adresi, yaklaşık konum ve reklam etkileşimleri gibi '
        'verileri işleyebilir. AB/AEA ve Birleşik Krallık\'ta ilk açılışta '
        'bir izin formu gösterilir; kişiselleştirilmiş reklam yalnızca iznin '
        'varsa kullanılır (md. 6/1-a). iOS\'ta ayrıca takip izni sorulur. '
        'İznini istediğin an Sen → Gizlilik seçenekleri\'nden değiştirebilir '
        'veya geri çekebilirsin. Plus kullanıcılarına reklam gösterilmez.\n\n'
        '7. Bildirimler\n'
        'Hatırlatıcılar cihazında planlanır; içerikleri sunucuya '
        'gönderilmez.\n\n'
        '8. Alıcılar ve AB dışına aktarım\n'
        'Verilerini yalnızca hizmeti sunmak için veri işleyenlerle paylaşırız: '
        'Supabase (hesap ve veritabanı), RevenueCat (abonelik), Google '
        '(reklam) ve Apple/Google (mağaza, konuşma tanıma). Bazıları verileri '
        'AEA dışında (ör. ABD) işleyebilir; bu aktarımlar AB–ABD Veri Gizliliği '
        'Çerçevesi veya AB Standart Sözleşme Maddeleri ile korunur.\n\n'
        '9. Saklama süresi\n'
        'Hesap verilerin hesabın açık olduğu sürece saklanır. Hesabını Sen → '
        'Hesabı sil ile sildiğinde sunucudaki hesabın ve profil kaydın hemen '
        'silinir; e-postayla gelen silme talepleri 30 gün içinde yerine '
        'getirilir. Cihazdaki veriler uygulamayı silince kaldırılır.\n\n'
        '10. Hakların\n'
        'Verilerine erişme, düzeltme, silme, işlemeyi kısıtlama, veri '
        'taşınabilirliği ve itiraz hakların vardır; iznini istediğin an geri '
        'çekebilirsin. Talepler için: ${LegalInfo.privacyEmail}. Ayrıca '
        '${LegalInfo.supervisoryAuthority} kurumuna şikâyette '
        'bulunabilirsin.\n\n'
        '11. Çocuklar\n'
        'VOXELITH 16 yaşından küçüklere yönelik değildir.\n\n'
        '12. Değişiklikler\n'
        'Bu politikayı güncellersek tarih değişir ve önemli değişiklikleri '
        'uygulamada duyururuz.',
    'en':
        'Last updated: September 29, 2026\n\n'
        '1. Controller\n'
        'The controller for the VOXELITH app is ${LegalInfo.companyLegalName}, '
        '${LegalInfo.companyAddress} (Netherlands Chamber of Commerce/KvK no. '
        '${LegalInfo.kvkNumber}). Privacy questions: '
        '${LegalInfo.privacyEmail}. This policy follows the EU General Data '
        'Protection Regulation (GDPR) and Dutch law.\n\n'
        '2. Stored on your device\n'
        'Your language choices, streak, XP, learned phrases, review schedule '
        'and settings are stored only on your phone. You can use the app '
        'without an account.\n\n'
        '3. Account, leaderboards and clans\n'
        'If you create an account we store your email address, your password '
        '(on the server only, hashed), display name, learning progress, XP and '
        'streak. Your display name and XP are shown to other users on '
        'leaderboards and in your clan; clan chat messages are visible to clan '
        'members. Legal basis: performance of a contract (GDPR Art. '
        '6(1)(b)).\n\n'
        '4. Microphone and speech recognition\n'
        'The microphone is used only during speaking practice. What you say '
        "is transcribed by your device's speech recognition service (Apple on "
        'iOS, Google on Android), which may process audio on its own servers. '
        'VOXELITH does not receive or store recordings. No AI or cloud '
        'translation service is used; translations and pronunciation scores '
        'are produced on your device.\n\n'
        '5. Purchases\n'
        'Payments are handled by the App Store or Google Play; we never see '
        'your card details. RevenueCat processes purchase receipts and a '
        'pseudonymous user ID to verify your subscription. Legal basis: '
        'performance of a contract (Art. 6(1)(b)) and legal obligations '
        '(Art. 6(1)(c)).\n\n'
        '6. Ads (free version)\n'
        'The free version shows Google AdMob ads. AdMob may process data such '
        'as your advertising ID, IP address, approximate location and ad '
        'interactions. In the EU/EEA and UK a consent form is shown on first '
        'launch; personalised ads are used only with your consent (Art. '
        '6(1)(a)). On iOS you are also asked for tracking permission. You can '
        'change or withdraw your consent at any time in You → Privacy choices. '
        'No ads are shown to Plus users.\n\n'
        '7. Notifications\n'
        'Reminders are scheduled on your device; their content is not sent to '
        'our servers.\n\n'
        '8. Recipients and transfers outside the EU\n'
        'We share data only with processors that help us provide the service: '
        'Supabase (accounts and database), RevenueCat (subscriptions), Google '
        '(ads) and Apple/Google (stores, speech recognition). Some of them may '
        'process data outside the EEA (e.g. in the US); such transfers are '
        'protected by the EU–US Data Privacy Framework or the EU Standard '
        'Contractual Clauses.\n\n'
        '9. Retention\n'
        'Account data is kept while your account exists. When you delete your '
        'account via You → Delete account, your server account and profile are '
        'deleted immediately; deletion requests by email are completed within '
        '30 days. Data on your device is removed when you uninstall the '
        'app.\n\n'
        '10. Your rights\n'
        'You have the right to access, rectify and erase your data, to '
        'restrict or object to processing and to data portability, and you '
        'can withdraw consent at any time. Requests: '
        '${LegalInfo.privacyEmail}. You can also lodge a complaint with the '
        '${LegalInfo.supervisoryAuthority}.\n\n'
        '11. Children\n'
        'VOXELITH is not directed to children under 16.\n\n'
        '12. Changes\n'
        'If we update this policy the date above changes and we announce '
        'important changes in the app.',
  });

  String termsBody() => t({
    'tr':
        'Son güncelleme: 29 Eylül 2026\n\n'
        '1. Hizmet sağlayıcı\n'
        'VOXELITH, ${LegalInfo.companyLegalName} (${LegalInfo.companyAddress}, '
        'KvK no: ${LegalInfo.kvkNumber}) tarafından sunulur. İletişim: '
        '${LegalInfo.supportEmail}.\n\n'
        '2. Abonelik\n'
        'VOXELITH Plus, seçtiğin süre için (aylık/yıllık) otomatik olarak '
        'yenilenir. Ücret, satın alma onayında mağaza hesabına yansıtılır ve '
        'mevcut dönem bitmeden en az 24 saat önce iptal etmediğin sürece her '
        'yenileme döneminde aynı tutar tekrar tahsil edilir. Aboneliğini '
        'istediğin an App Store veya Google Play hesap ayarlarından iptal '
        'edebilirsin; erişimin dönem sonuna kadar sürer. İndirimli/tanıtım '
        'fiyatları yalnızca belirtilen ilk dönem için geçerlidir.\n\n'
        '3. Cayma hakkı ve iadeler\n'
        'Plus satın alarak dijital içeriğe hemen erişmeyi talep etmiş ve bu '
        'nedenle AB 14 günlük cayma hakkını kaybettiğini kabul etmiş olursun. '
        'İadeler, ödemeyi alan App Store veya Google Play\'in kurallarına göre '
        'yapılır. Kanunun sana tanıdığı tüketici hakları saklıdır.\n\n'
        '4. Kullanıcı içeriği\n'
        'Klan adları ve klan sohbeti mesajları diğer kullanıcılarca görülür. '
        'Hakaret, taciz, nefret söylemi, cinsel içerik, spam veya yasa dışı '
        'içerik kesinlikle yasaktır (sıfır tolerans). Uygunsuz içeriği ve '
        'kullanıcıları uygulama içinden bildirebilir ve engelleyebilirsin; '
        'bildirimleri 24 saat içinde inceler, ihlal eden içeriği kaldırır ve '
        'hesabı kapatabiliriz.\n\n'
        '5. İçeriğin kullanımı\n'
        'Uygulama içi içerik (konuşma senaryoları, alfabe, kitaplık) kişisel '
        've ticari olmayan öğrenim amaçlıdır; yeniden dağıtılamaz veya '
        'satılamaz.\n\n'
        '6. Hesap silme\n'
        'Hesabını istediğin an silebilirsin (Sen → Hesabı sil). Bu, aktif bir '
        'aboneliği otomatik iptal etmez; aboneliği ayrıca mağaza üzerinden '
        'iptal etmelisin.\n\n'
        '7. Uygulanacak hukuk\n'
        'Bu koşullara Hollanda hukuku uygulanır. Bulunduğun ülkenin zorunlu '
        'tüketici koruma kuralları saklıdır. iOS\'ta ayrıca Apple\'ın standart '
        'Lisanslı Uygulama Son Kullanıcı Lisans Sözleşmesi (EULA) geçerlidir.',
    'en':
        'Last updated: September 29, 2026\n\n'
        '1. Provider\n'
        'VOXELITH is provided by ${LegalInfo.companyLegalName} '
        '(${LegalInfo.companyAddress}, KvK no. ${LegalInfo.kvkNumber}). '
        'Contact: ${LegalInfo.supportEmail}.\n\n'
        '2. Subscription\n'
        'VOXELITH Plus renews automatically for the period you choose '
        '(monthly/yearly). Payment is charged to your store account at '
        'confirmation of purchase, and the same amount is charged for each '
        'renewal period unless you cancel at least 24 hours before the end of '
        'the current period. You can cancel at any time in your App Store or '
        'Google Play account settings and keep access until the end of the '
        'period. Discounted/introductory prices apply only to the stated first '
        'period.\n\n'
        '3. Right of withdrawal and refunds\n'
        'By buying Plus you request immediate access to digital content and '
        'acknowledge that you thereby lose the EU 14-day right of withdrawal. '
        'Refunds are handled by the App Store or Google Play under their '
        'policies. Your statutory consumer rights are not affected.\n\n'
        '4. User content\n'
        'Clan names and clan chat messages are visible to other users. '
        'Abusive, harassing, hateful, sexual, spam or illegal content is '
        'strictly prohibited (zero tolerance). You can report and block '
        'objectionable content and users in the app; we review reports within '
        '24 hours, remove violating content and may terminate the offending '
        'account.\n\n'
        '5. Use of content\n'
        'In-app content (speaking scenarios, alphabets, library) is for '
        'personal, non-commercial learning and may not be redistributed or '
        'sold.\n\n'
        '6. Account deletion\n'
        'You can delete your account at any time (You → Delete account). This '
        'does not cancel an active subscription automatically — cancel it '
        'separately in your store account.\n\n'
        '7. Governing law\n'
        'These terms are governed by Dutch law. Mandatory consumer protection '
        'rules of your country of residence remain unaffected. On iOS, '
        "Apple's standard Licensed Application End User License Agreement "
        '(EULA) also applies.',
  });

  // -------------------------------------------------------- Home widget

  String get widgetTodayPractice => t({
    'tr': 'Bugünün pratiği',
    'en': "Today's practice",
    'es': 'Práctica de hoy',
    'de': 'Heutige Übung',
    'fr': 'Pratique du jour',
    'nl': 'Oefening van vandaag',
    'ar': 'تدريب اليوم',
    'pt': 'Prática de hoje',
    'it': 'Pratica di oggi',
    'ru': 'Практика на сегодня',
    'zh': '今日练习',
    'ja': '今日の練習',
    'ko': '오늘의 연습',
    'pl': 'Dzisiejsza praktyka',
    'sv': 'Dagens övning',
    'da': 'Dagens øvelse',
    'no': 'Dagens øvelse',
    'fi': 'Päivän harjoitus',
    'el': 'Σημερινή εξάσκηση',
    'cs': 'Dnešní procvičování',
    'ro': 'Exercițiul de azi',
    'hu': 'Mai gyakorlás',
    'hi': 'आज का अभ्यास',
    'th': 'แบบฝึกวันนี้',
    'vi': 'Luyện tập hôm nay',
    'id': 'Latihan hari ini',
    'uk': 'Практика на сьогодні',
    'he': 'התרגול של היום',
    'fa': 'تمرین امروز',
    'sw': 'Mazoezi ya leo',
  });

  String widgetStreakDays(int n) => t({
    'tr': '$n gün',
    'en': n == 1 ? '1 day' : '$n days',
    'es': n == 1 ? '1 día' : '$n días',
    'de': n == 1 ? '1 Tag' : '$n Tage',
    'fr': n <= 1 ? '$n jour' : '$n jours',
    'nl': n == 1 ? '1 dag' : '$n dagen',
    'ar': '$n يوم',
    'pt': n == 1 ? '1 dia' : '$n dias',
    'it': n == 1 ? '1 giorno' : '$n giorni',
    'ru': '$n дн.',
    'zh': '$n 天',
    'ja': '$n日',
    'ko': '$n일',
    'pl': '$n dni',
    'sv': n == 1 ? '1 dag' : '$n dagar',
    'da': n == 1 ? '1 dag' : '$n dage',
    'no': n == 1 ? '1 dag' : '$n dager',
    'fi': n == 1 ? '1 päivä' : '$n päivää',
    'el': n == 1 ? '1 ημέρα' : '$n ημέρες',
    'cs': '$n dní',
    'ro': n == 1 ? '1 zi' : '$n zile',
    'hu': '$n nap',
    'hi': '$n दिन',
    'th': '$n วัน',
    'vi': '$n ngày',
    'id': '$n hari',
    'uk': '$n дн.',
    'he': n == 1 ? 'יום 1' : '$n ימים',
    'fa': '$n روز',
    'sw': 'Siku $n',
  });
}
