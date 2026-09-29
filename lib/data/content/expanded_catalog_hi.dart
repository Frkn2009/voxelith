import '../models/models.dart';

/// Hintçe (resmî "आप" hitabı) için 12 B1/B2 gerçek-hayat senaryosu.
class ExpandedCatalogHi {
  static List<Scenario> build(LearnLang language) =>
      language == LearnLang.hi ? _scenarios : const [];

  static final List<Scenario> _scenarios = [
    Scenario(
      id: 'hi_exp_job_interview',
      lang: LearnLang.hi,
      cefr: Cefr.b1,
      minutes: 9,
      titles: {UiLang.tr: 'İş görüşmesi', UiLang.en: 'Job interview'},
      clipLine: 'साक्षात्कार के लिए बुलाने का धन्यवाद।',
      phrases: [
        Phrase(
          id: 'hi_exp_interview_0',
          target: 'साक्षात्कार के लिए बुलाने का धन्यवाद।',
          gloss: {UiLang.tr: 'Görüşmeye davet için teşekkürler.'},
        ),
        Phrase(
          id: 'hi_exp_interview_1',
          target: 'मैं पाँच साल से प्रोडक्ट टीम में काम कर रहा/रही हूँ।',
          gloss: {UiLang.tr: 'Beş yıldır ürün ekibinde çalışıyorum.'},
        ),
        Phrase(
          id: 'hi_exp_interview_2',
          target: 'मेरी प्राथमिकता ग्राहक की ज़रूरत समझना है।',
          gloss: {UiLang.tr: 'Önceliğim müşterinin ihtiyacını anlamaktır.'},
        ),
        Phrase(
          id: 'hi_exp_interview_3',
          target:
              'कमज़ोरी यह है कि कभी विवरण में उलझ जाता/जाती हूँ; चेकलिस्ट चलाता/चलाती हूँ।',
          gloss: {
            UiLang.tr:
                'Zayıf yönüm bazen detaylara takılmam; kontrol listesi kullanıyorum.',
          },
        ),
        Phrase(
          id: 'hi_exp_interview_4',
          target: 'क्या वेतन सीमा बता सकते हैं?',
          gloss: {UiLang.tr: 'Maaş aralığını söyleyebilir misiniz?'},
        ),
        Phrase(
          id: 'hi_exp_interview_5',
          target: 'आपको कब तक किसी को शुरू करना है?',
          gloss: {UiLang.tr: 'Ne zamana kadar birinin başlaması gerekiyor?'},
        ),
      ],
      turns: const [
        SpeakTurn(
          prompt: 'आप हमारे यहाँ क्यों काम करना चाहते हैं?',
          expected: 'ग्राहक के प्रति आपका तरीका मेरी ताकत से मेल खाता है।',
        ),
        SpeakTurn(
          prompt: 'तनाव वाले रिलीज़ हफ्ते को कैसे संभालते हैं?',
          expected:
              'पहले प्राथमिकता तय करता हूँ, फिर जोखिम लिखित रूप में बताता हूँ।',
        ),
        SpeakTurn(
          prompt: 'आपका कोई सवाल है?',
          expected: 'हाँ, मुझे कब से शुरू करना होगा?',
        ),
      ],
      grammarNote: GrammarNote(
        rule: {
          UiLang.tr:
              'İş görüşmelerinde "आप" hitabı kullanılır; तू/तुम kaba kaçar.',
        },
        goodExample: 'क्या वेतन सीमा बता सकते हैं?',
        badExample: 'सैलरी बता।',
      ),
    ),
    Scenario(
      id: 'hi_exp_team_meeting',
      lang: LearnLang.hi,
      cefr: Cefr.b1,
      minutes: 8,
      titles: {UiLang.tr: 'Ekip toplantısı', UiLang.en: 'Team meeting'},
      clipLine: 'सीधे एजेंडे पर चलते हैं।',
      phrases: [
        Phrase(
          id: 'hi_exp_meeting_0',
          target: 'सीधे एजेंडे पर चलते हैं।',
          gloss: {UiLang.tr: 'Doğrudan gündeme geçelim.'},
        ),
        Phrase(
          id: 'hi_exp_meeting_1',
          target: 'मेरी तरफ़ एपीआई ब्लॉकर है; कल तारीख दूँगा/दूँगी।',
          gloss: {
            UiLang.tr: 'Benim tarafımda API engeli var; yarın tarih vereceğim.',
          },
        ),
        Phrase(
          id: 'hi_exp_meeting_2',
          target: 'इस बिंदु को अंत में रख सकते हैं?',
          gloss: {UiLang.tr: 'Bu maddeyi sona bırakabilir miyiz?'},
        ),
        Phrase(
          id: 'hi_exp_meeting_3',
          target: 'फ़ैसला नोट कर रहा/रही हूँ: गुरुवार चार बजे।',
          gloss: {UiLang.tr: 'Kararı not ediyorum: perşembe saat dört.'},
        ),
        Phrase(
          id: 'hi_exp_meeting_4',
          target: 'आपत्ति नहीं, लेकिन जोखिम लिख लें।',
          gloss: {UiLang.tr: 'İtirazım yok ama riski yazalım.'},
        ),
        Phrase(
          id: 'hi_exp_meeting_5',
          target: 'पाँच मिनट बढ़ाना होगा क्या?',
          gloss: {UiLang.tr: 'Beş dakika uzatmamız gerekiyor mu?'},
        ),
      ],
      turns: const [
        SpeakTurn(
          prompt: 'किसी का ब्लॉकर है?',
          expected: 'डिज़ाइन मंज़ूरी का इंतज़ार है; कल याद दिलाऊँगा/दिलाऊँगी।',
        ),
        SpeakTurn(
          prompt: 'तो यह काम आपके पास रहता है।',
          expected: 'ठीक है, शुक्रवार तक टीम को बताऊँगा/बताऊँगी।',
        ),
        SpeakTurn(prompt: 'कोई और मुद्दा है?', expected: 'नहीं, आज इतना ही।'),
      ],
      grammarNote: GrammarNote(
        rule: {
          UiLang.tr:
              '"इंतज़ार" + "का" kullanılır: मंज़ूरी का इंतज़ार; "इंतज़ार मंज़ूरी" yanlıştır.',
        },
        goodExample: 'डिज़ाइन मंज़ूरी का इंतज़ार है।',
        badExample: 'इंतज़ार डिज़ाइन।',
      ),
    ),
    Scenario(
      id: 'hi_exp_bank',
      lang: LearnLang.hi,
      cefr: Cefr.a2,
      minutes: 7,
      titles: {UiLang.tr: 'Bankada hesap', UiLang.en: 'Bank account'},
      clipLine: 'मैं बचत खाता खोलना चाहता/चाहती हूँ।',
      phrases: [
        Phrase(
          id: 'hi_exp_bank_0',
          target: 'मैं बचत खाता खोलना चाहता/चाहती हूँ।',
          gloss: {UiLang.tr: 'Bir hesap açmak istiyorum.'},
        ),
        Phrase(
          id: 'hi_exp_bank_1',
          target: 'पहचान पत्र और पते का प्रमाण साथ है।',
          gloss: {UiLang.tr: 'Kimliğim ve ikametgah belgem yanımda.'},
        ),
        Phrase(
          id: 'hi_exp_bank_2',
          target: 'कार्ड का वार्षिक शुल्क कितना है?',
          gloss: {UiLang.tr: 'Kartın yıllık ücreti ne kadar?'},
        ),
        Phrase(
          id: 'hi_exp_bank_3',
          target: 'नेट बैंकिंग भी चालू कर दीजिए।',
          gloss: {UiLang.tr: 'İnternet bankacılığını da açar mısınız.'},
        ),
        Phrase(
          id: 'hi_exp_bank_4',
          target: 'दैनिक ट्रांसफ़र सीमा क्या है?',
          gloss: {UiLang.tr: 'Günlük transfer limiti nedir?'},
        ),
        Phrase(
          id: 'hi_exp_bank_5',
          target: 'रसीद ईमेल पर मिल सकती है?',
          gloss: {UiLang.tr: 'Dekont e-posta ile gelebilir mi?'},
        ),
      ],
      turns: const [
        SpeakTurn(
          prompt: 'वेतन के लिए व्यक्तिगत खाता?',
          expected: 'हाँ, सैलरी आने के लिए।',
        ),
        SpeakTurn(
          prompt: 'यहाँ हस्ताक्षर कर दीजिए।',
          expected: 'ठीक है, अभी करता/करती हूँ।',
        ),
        SpeakTurn(
          prompt: 'क्या आपको डेबिट कार्ड भी चाहिए?',
          expected: 'हाँ, वो भी चाहिए।',
        ),
      ],
      grammarNote: GrammarNote(
        rule: {
          UiLang.tr:
              'Nazik talep "चाहता/चाहती हूँ" ile cinsiyet uyumuna dikkat edilir; emir kipi kullanılmaz.',
        },
        goodExample: 'खाता खोलना चाहता हूँ।',
        badExample: 'खाता खोल।',
      ),
    ),
    Scenario(
      id: 'hi_exp_apartment',
      lang: LearnLang.hi,
      cefr: Cefr.a2,
      minutes: 7,
      titles: {UiLang.tr: 'Ev bakma', UiLang.en: 'Apartment viewing'},
      clipLine: 'विज्ञापन देखकर आई हूँ; फ़्लैट अभी खाली है?',
      phrases: [
        Phrase(
          id: 'hi_exp_apartment_0',
          target: 'विज्ञापन देखकर आई हूँ; फ़्लैट अभी खाली है?',
          gloss: {UiLang.tr: 'İlanı görüp geldim; daire hâlâ boş mu?'},
        ),
        Phrase(
          id: 'hi_exp_apartment_1',
          target: 'मेंटेनेंस में हीटिंग शामिल है?',
          gloss: {UiLang.tr: 'Aidata ısınma dahil mi?'},
        ),
        Phrase(
          id: 'hi_exp_apartment_2',
          target: 'सिक्योरिटी कितने महीने का किराया है?',
          gloss: {UiLang.tr: 'Depozito kaç aylık kiraya denk geliyor?'},
        ),
        Phrase(
          id: 'hi_exp_apartment_3',
          target: 'कॉन्ट्रैक्ट एक साल का है या कम हो सकता है?',
          gloss: {UiLang.tr: 'Sözleşme bir yıllık mı, daha kısa olabilir mi?'},
        ),
        Phrase(
          id: 'hi_exp_apartment_4',
          target: 'घर से काम करता/करती हूँ, शांति चाहिए।',
          gloss: {UiLang.tr: 'Evden çalışıyorum, sessizliğe ihtiyacım var.'},
        ),
        Phrase(
          id: 'hi_exp_apartment_5',
          target: 'कल जवाब दूँगा/दूँगी।',
          gloss: {UiLang.tr: 'Yarın cevap vereceğim.'},
        ),
      ],
      turns: const [
        SpeakTurn(
          prompt: 'कब शिफ़्ट करना है?',
          expected: 'महीने की शुरुआत में; सामान कम है।',
        ),
        SpeakTurn(
          prompt: 'मालिक पालतू जानवर नहीं चाहते।',
          expected: 'ठीक है, मेरे पास कोई पालतू नहीं है।',
        ),
        SpeakTurn(
          prompt: 'और कोई सवाल?',
          expected: 'हाँ, कब देख सकता/सकती हूँ?',
        ),
      ],
      grammarNote: GrammarNote(
        rule: {
          UiLang.tr: 'Hâlâ boş olup olmadığını sormak için "अभी" kullanılır.',
        },
        goodExample: 'फ़्लैट अभी खाली है?',
        badExample: 'हमेशा अभी खाली?',
      ),
    ),
    Scenario(
      id: 'hi_exp_doctor',
      lang: LearnLang.hi,
      cefr: Cefr.a2,
      minutes: 7,
      titles: {UiLang.tr: 'Doktorda', UiLang.en: "At the doctor's"},
      clipLine: 'तीन दिन से बुखार है, रात को खाँसी होती है।',
      phrases: [
        Phrase(
          id: 'hi_exp_doctor_0',
          target: 'तीन दिन से बुखार है, रात को खाँसी होती है।',
          gloss: {UiLang.tr: 'Üç gündür ateşim var, geceleri öksürüyorum.'},
        ),
        Phrase(
          id: 'hi_exp_doctor_1',
          target: 'पेंसिलिन से एलर्जी नहीं है।',
          gloss: {UiLang.tr: 'Penisiline alerjim yok.'},
        ),
        Phrase(
          id: 'hi_exp_doctor_2',
          target: 'यह दवाई नींद लाती है क्या?',
          gloss: {UiLang.tr: 'Bu ilaç uyku hâli yapar mı?'},
        ),
        Phrase(
          id: 'hi_exp_doctor_3',
          target: 'ऑफ़िस के लिए मेडिकल सर्टिफ़िकेट चाहिए?',
          gloss: {UiLang.tr: 'İş için rapora ihtiyacım var mı?'},
        ),
        Phrase(
          id: 'hi_exp_doctor_4',
          target: 'फ़ॉलो-अप कब आऊँ?',
          gloss: {UiLang.tr: 'Kontrol için ne zaman geleyim?'},
        ),
        Phrase(
          id: 'hi_exp_doctor_5',
          target: 'फ़ार्मेसी बिल्डिंग के बाहर है?',
          gloss: {UiLang.tr: 'Eczane bina dışında mı?'},
        ),
      ],
      turns: const [
        SpeakTurn(
          prompt: 'दर्द कहाँ है? अचानक शुरू हुआ?',
          expected: 'सीने के दाईं तरफ़, कल शाम से।',
        ),
        SpeakTurn(
          prompt: 'खून की जाँच करवाएँगे।',
          expected: 'ठीक है, कहाँ जाना होगा?',
        ),
        SpeakTurn(
          prompt: 'कोई दवा अभी ले रहे हैं?',
          expected: 'नहीं, कोई दवा नहीं ले रहा/रही हूँ।',
        ),
      ],
      grammarNote: GrammarNote(
        rule: {
          UiLang.tr:
              'Devam eden süre için "से + süre" kullanılır; kendi kendine teşhis koymayın.',
        },
        goodExample: 'तीन दिन से बुखार है।',
        badExample: 'मुझे निमोनिया है शायद।',
      ),
    ),
    Scenario(
      id: 'hi_exp_business_lunch',
      lang: LearnLang.hi,
      cefr: Cefr.b1,
      minutes: 9,
      titles: {UiLang.tr: 'İş yemeği', UiLang.en: 'Business lunch'},
      clipLine: 'आपकी सलाह से जगह चुनी।',
      phrases: [
        Phrase(
          id: 'hi_exp_lunch_0',
          target: 'आपकी सलाह से जगह चुनी।',
          gloss: {UiLang.tr: 'Mekanı sizin önerinizle seçtim.'},
        ),
        Phrase(
          id: 'hi_exp_lunch_1',
          target: 'कोई एलर्जी या पसंद?',
          gloss: {UiLang.tr: 'Alerjiniz veya tercihiniz var mı?'},
        ),
        Phrase(
          id: 'hi_exp_lunch_2',
          target: 'ऑर्डर से पहले मुख्य बातें पक्की करें?',
          gloss: {
            UiLang.tr: 'Sipariş vermeden önce ana noktaları netleştirelim mi?',
          },
        ),
        Phrase(
          id: 'hi_exp_lunch_3',
          target: 'टेबल पर आंकड़े नहीं; बाद में मेल करूँगा/करूँगी।',
          gloss: {
            UiLang.tr: 'Masada rakamlara girmeyelim; sonra mail atacağım.',
          },
        ),
        Phrase(
          id: 'hi_exp_lunch_4',
          target: 'इस बार बिल हमारा है।',
          gloss: {UiLang.tr: 'Bu sefer hesap bizden.'},
        ),
        Phrase(
          id: 'hi_exp_lunch_5',
          target: 'मुलाकात उपयोगी रही, धन्यवाद।',
          gloss: {UiLang.tr: 'Görüşme verimliydi, teşekkürler.'},
        ),
      ],
      turns: const [
        SpeakTurn(
          prompt: 'कीमत अभी भी ज़्यादा लगती है।',
          expected: 'प्रोजेक्ट दो चरणों में बाँट सकते हैं।',
        ),
        SpeakTurn(
          prompt: 'सोचेंगे।',
          expected: 'ठीक है, शुक्रवार को कॉल करूँगा/करूँगी।',
        ),
        SpeakTurn(
          prompt: 'कोई और सवाल है?',
          expected: 'नहीं, समय देने के लिए धन्यवाद।',
        ),
      ],
      grammarNote: GrammarNote(
        rule: {
          UiLang.tr: 'Hesabı üstlenmek: बिल हमारा है; "आप दो" kaba kaçar.',
        },
        goodExample: 'इस बार बिल हमारा है।',
        badExample: 'आप पूरा दो।',
      ),
    ),
    Scenario(
      id: 'hi_exp_complaint',
      lang: LearnLang.hi,
      cefr: Cefr.b1,
      minutes: 8,
      titles: {UiLang.tr: 'Şikâyet', UiLang.en: 'Complaint'},
      clipLine: 'ऑर्डर नंबर 1842 अभी तक नहीं आया।',
      phrases: [
        Phrase(
          id: 'hi_exp_complaint_0',
          target: 'ऑर्डर नंबर 1842 अभी तक नहीं आया।',
          gloss: {UiLang.tr: '1842 numaralı sipariş hâlâ gelmedi.'},
        ),
        Phrase(
          id: 'hi_exp_complaint_1',
          target: 'वादा की तारीख कल थी।',
          gloss: {UiLang.tr: 'Söz verilen tarih dündü.'},
        ),
        Phrase(
          id: 'hi_exp_complaint_2',
          target: 'हल के तौर पर शिपिंग वापस चाहिए।',
          gloss: {
            UiLang.tr: 'Çözüm olarak kargo ücretinin iadesini istiyorum.',
          },
        ),
        Phrase(
          id: 'hi_exp_complaint_3',
          target: 'सुपरवाइज़र से बात करूँ या आप निपटा सकते हैं?',
          gloss: {
            UiLang.tr:
                'Bir yöneticiyle mi konuşmalıyım, yoksa siz çözebilir misiniz?',
          },
        ),
        Phrase(
          id: 'hi_exp_complaint_4',
          target: 'लिखित पुष्टि मिल सकती है?',
          gloss: {UiLang.tr: 'Yazılı bir teyit alabilir miyim?'},
        ),
        Phrase(
          id: 'hi_exp_complaint_5',
          target: 'सब्र है, लेकिन आज पक्का समय चाहिए।',
          gloss: {UiLang.tr: 'Sabırlıyım ama bugün net bir saat lazım.'},
        ),
      ],
      turns: const [
        SpeakTurn(
          prompt: 'असुविधा के लिए माफ़ी; चेक कर रहा हूँ।',
          expected: 'धन्यवाद। कॉल का समय भी नोट करें।',
        ),
        SpeakTurn(
          prompt: 'कल दो बजे तक डिलीवरी।',
          expected: 'ठीक है, इंतज़ार करूँगा/करूँगी।',
        ),
        SpeakTurn(
          prompt: 'क्या मैं इसकी पुष्टि मेल से भेज दूँ?',
          expected: 'हाँ, कृपया भेज दें।',
        ),
      ],
      grammarNote: GrammarNote(
        rule: {
          UiLang.tr:
              'Kanıt için "लिखित" kullanılır; sadece mesaj yeterli değildir.',
        },
        goodExample: 'लिखित पुष्टि चाहिए।',
        badExample: 'सिर्फ़ व्हाट्सऐप लिखो।',
      ),
    ),
    Scenario(
      id: 'hi_exp_business_trip',
      lang: LearnLang.hi,
      cefr: Cefr.a2,
      minutes: 7,
      titles: {UiLang.tr: 'İş seyahati', UiLang.en: 'Business trip'},
      clipLine: 'मेरा पीएनआर यह है; बोर्डिंग पास दीजिए।',
      phrases: [
        Phrase(
          id: 'hi_exp_trip_0',
          target: 'मेरा पीएनआर यह है; बोर्डिंग पास दीजिए।',
          gloss: {UiLang.tr: 'İşte rezervasyon kodum; biniş kartı lütfen.'},
        ),
        Phrase(
          id: 'hi_exp_trip_1',
          target: 'कैबिन बैग माप में है?',
          gloss: {UiLang.tr: 'El bagajı ölçülere uyuyor mu?'},
        ),
        Phrase(
          id: 'hi_exp_trip_2',
          target: 'देरी से कनेक्शन छूट जाएगा क्या?',
          gloss: {UiLang.tr: 'Gecikme nedeniyle aktarmayı kaçırır mıyım?'},
        ),
        Phrase(
          id: 'hi_exp_trip_3',
          target: 'बिल कंपनी के नाम पर काटें।',
          gloss: {UiLang.tr: 'Fatura şirket adına kesilsin.'},
        ),
        Phrase(
          id: 'hi_exp_trip_4',
          target: 'लाउंज का गेट कहाँ है?',
          gloss: {UiLang.tr: 'Lounge girişi nerede?'},
        ),
        Phrase(
          id: 'hi_exp_trip_5',
          target: 'टैक्सी रसीद खर्च के लिए रखनी है।',
          gloss: {UiLang.tr: 'Masraf için taksi fişini saklamam gerekiyor.'},
        ),
      ],
      turns: const [
        SpeakTurn(
          prompt: 'खिड़की या गलियारा?',
          expected: 'गलियारा, निकास के पास हो तो अच्छा।',
        ),
        SpeakTurn(
          prompt: 'गेट 12, लगभग चालीस मिनट में।',
          expected: 'धन्यवाद, अभी जाता/जाती हूँ।',
        ),
        SpeakTurn(
          prompt: 'कोई चेक-इन बैग है?',
          expected: 'नहीं, सिर्फ़ कैबिन बैग है।',
        ),
      ],
      grammarNote: GrammarNote(
        rule: {
          UiLang.tr: 'Aktarmayı kaçırmak için "कनेक्शन छूटना" kullanılır.',
        },
        goodExample: 'कनेक्शन छूट जाएगा क्या?',
        badExample: 'एयरपोर्ट छूट जाएगा?',
      ),
    ),
    Scenario(
      id: 'hi_exp_client_call',
      lang: LearnLang.hi,
      cefr: Cefr.b1,
      minutes: 8,
      titles: {UiLang.tr: 'Müşteri telefonu', UiLang.en: 'Client phone call'},
      clipLine: 'अभी पाँच मिनट हैं?',
      phrases: [
        Phrase(
          id: 'hi_exp_call_0',
          target: 'अभी पाँच मिनट हैं?',
          gloss: {UiLang.tr: 'Şu an beş dakikanız var mı?'},
        ),
        Phrase(
          id: 'hi_exp_call_1',
          target: 'कल के मेल का तीसरा बिंदु साफ़ नहीं।',
          gloss: {UiLang.tr: 'Dünkü mailin üçüncü maddesi net değil.'},
        ),
        Phrase(
          id: 'hi_exp_call_2',
          target: 'यह एक्स्ट्रा है या मौजूदा दायरे में?',
          gloss: {UiLang.tr: 'Bu ek iş mi yoksa mevcut kapsamda mı?'},
        ),
        Phrase(
          id: 'hi_exp_call_3',
          target: 'अगर मैंने गलत समझा हो तो सुधारिए।',
          gloss: {UiLang.tr: 'Yanlış anladıysam lütfen düzeltin.'},
        ),
        Phrase(
          id: 'hi_exp_call_4',
          target: 'संक्षेप: शुक्रवार ड्राफ़्ट, सोमवार कमेंट।',
          gloss: {UiLang.tr: 'Özetle: cuma taslak, pazartesi yorum.'},
        ),
        Phrase(
          id: 'hi_exp_call_5',
          target: 'अभी पुष्टि मेल भेजता/भेजती हूँ।',
          gloss: {UiLang.tr: 'Şimdi bir teyit maili gönderiyorum.'},
        ),
      ],
      turns: const [
        SpeakTurn(
          prompt: 'इस फ़ीचर के बिना लाइव नहीं जा सकते।',
          expected: 'तो कुछ और टालें, इसे आगे लाएँ।',
        ),
        SpeakTurn(
          prompt: 'ठीक है, लिख दीजिए।',
          expected: 'अभी लिखित रूप में भेजता/भेजती हूँ।',
        ),
        SpeakTurn(
          prompt: 'फ़ाइनल वर्ज़न कब तक तैयार होगा?',
          expected: 'शुक्रवार तक तैयार हो जाएगा।',
        ),
      ],
      grammarNote: GrammarNote(
        rule: {
          UiLang.tr:
              'Yanlış anlamayı teyit etmek için "अगर … हो तो" kullanılır.',
        },
        goodExample: 'अगर मैंने गलत समझा हो तो सुधारिए।',
        badExample: 'अगर मैं गलत समझूँगा था…',
      ),
    ),
    Scenario(
      id: 'hi_exp_hr_salary',
      lang: LearnLang.hi,
      cefr: Cefr.b2,
      minutes: 10,
      titles: {UiLang.tr: 'Maaş görüşmesi', UiLang.en: 'Salary conversation'},
      clipLine: 'प्रदर्शन और बाज़ार स्तर पर बात करनी है।',
      phrases: [
        Phrase(
          id: 'hi_exp_salary_0',
          target: 'प्रदर्शन और बाज़ार स्तर पर बात करनी है।',
          gloss: {
            UiLang.tr:
                'Performansım ve piyasa seviyesi hakkında konuşmak istiyorum.',
          },
        ),
        Phrase(
          id: 'hi_exp_salary_1',
          target: 'छह महीने में तीन प्रोजेक्ट समय पर दिए।',
          gloss: {UiLang.tr: 'Altı ayda üç projeyi zamanında teslim ettim.'},
        ),
        Phrase(
          id: 'hi_exp_salary_2',
          target: 'पंद्रह प्रतिशत की उम्मीद है; आधार दिखा सकता/सकती हूँ।',
          gloss: {
            UiLang.tr: 'Yüzde on beş bekliyorum; kanıtımı gösterebilirim.',
          },
        ),
        Phrase(
          id: 'hi_exp_salary_3',
          target: 'मौजूदा पदनाम ज़िम्मेदारी नहीं दिखाता।',
          gloss: {UiLang.tr: 'Mevcut unvan sorumluluğu yansıtmıyor.'},
        ),
        Phrase(
          id: 'hi_exp_salary_4',
          target: 'अगर बजट नहीं, तारीख तय कर लें।',
          gloss: {UiLang.tr: 'Bütçe yoksa bir tarih belirleyelim.'},
        ),
        Phrase(
          id: 'hi_exp_salary_5',
          target: 'फ़ैसला लिखित चाहिए।',
          gloss: {UiLang.tr: 'Kararı yazılı istiyorum.'},
        ),
      ],
      turns: const [
        SpeakTurn(
          prompt: 'इस साल बजट तंग है।',
          expected: 'समझ गया/गई। बोनस या लेवल हो सकता है?',
        ),
        SpeakTurn(
          prompt: 'मार्च में फिर देखेंगे।',
          expected: 'ठीक है, मार्च में फिर बात करते हैं।',
        ),
        SpeakTurn(
          prompt: 'और कोई सवाल है?',
          expected: 'हाँ, ट्रेनिंग बजट के बारे में भी।',
        ),
      ],
      grammarNote: GrammarNote(
        rule: {
          UiLang.tr: '"उम्मीद है" beklentiyi yumuşak sunar; talep değildir.',
        },
        goodExample: 'पंद्रह प्रतिशत की उम्मीद है।',
        badExample: 'अभी पंद्रह दो।',
      ),
    ),
    Scenario(
      id: 'hi_exp_daily_errands',
      lang: LearnLang.hi,
      cefr: Cefr.a2,
      minutes: 6,
      titles: {
        UiLang.tr: 'Market ve kargo',
        UiLang.en: 'Errands and deliveries',
      },
      clipLine: 'यह ब्रेड दो और बिल, कृपया।',
      phrases: [
        Phrase(
          id: 'hi_exp_errands_0',
          target: 'यह ब्रेड दो और बिल, कृपया।',
          gloss: {UiLang.tr: 'Bu ekmekten iki tane ve fiş lütfen.'},
        ),
        Phrase(
          id: 'hi_exp_errands_1',
          target: 'ग्लूटेन-फ़्री रैक कहाँ है?',
          gloss: {UiLang.tr: 'Glütensiz reyon nerede?'},
        ),
        Phrase(
          id: 'hi_exp_errands_2',
          target: 'पड़ोसियों के पास न छोड़ें; दरवाज़े पर नोट लगाएँ।',
          gloss: {UiLang.tr: 'Komşuya bırakmayın; kapıya not bırakın.'},
        ),
        Phrase(
          id: 'hi_exp_errands_3',
          target: 'नकद नहीं है; कार्ड चलेगा?',
          gloss: {UiLang.tr: 'Nakit param yok; kart geçer mi?'},
        ),
        Phrase(
          id: 'hi_exp_errands_4',
          target: 'वापसी चौदह दिन में है न?',
          gloss: {UiLang.tr: 'İade on dört gün içinde, değil mi?'},
        ),
        Phrase(
          id: 'hi_exp_errands_5',
          target: 'थैला नहीं चाहिए, अपना बैग है।',
          gloss: {UiLang.tr: 'Poşete gerek yok, kendi çantam var.'},
        ),
      ],
      turns: const [
        SpeakTurn(
          prompt: 'मेंबरशिप कार्ड है?',
          expected: 'इस बार नहीं, धन्यवाद।',
        ),
        SpeakTurn(
          prompt: 'ख़ुर्दा नहीं, कार्ड से काटूँ?',
          expected: 'हाँ, कार्ड से कर दीजिए।',
        ),
        SpeakTurn(prompt: 'कुछ और चाहिए?', expected: 'नहीं, इतना ही काफ़ी है।'),
      ],
      grammarNote: GrammarNote(
        rule: {
          UiLang.tr:
              'Hizmet ricalarında "कृपया" kullanılır, emir çıplak bırakılmaz.',
        },
        goodExample: 'बिल, कृपया।',
        badExample: 'बिल दे।',
      ),
    ),
    Scenario(
      id: 'hi_exp_networking',
      lang: LearnLang.hi,
      cefr: Cefr.b1,
      minutes: 8,
      titles: {UiLang.tr: 'Networking', UiLang.en: 'Networking'},
      clipLine: 'मैं अनन्या हूँ, फ़िनटेक में प्रोडक्ट मैनेजर।',
      phrases: [
        Phrase(
          id: 'hi_exp_networking_0',
          target: 'मैं अनन्या हूँ, फ़िनटेक में प्रोडक्ट मैनेजर।',
          gloss: {
            UiLang.tr:
                'Benim adım Ananya, fintech alanında ürün yöneticisiyim.',
          },
        ),
        Phrase(
          id: 'hi_exp_networking_1',
          target: 'पेमेंट वाला उदाहरण बहुत साफ़ था।',
          gloss: {UiLang.tr: 'Ödemeler hakkındaki örneğiniz çok netti.'},
        ),
        Phrase(
          id: 'hi_exp_networking_2',
          target: 'आपके यहाँ भी ऐसी दिक्कत है?',
          gloss: {UiLang.tr: 'Sizde de böyle sorunlar oluyor mu?'},
        ),
        Phrase(
          id: 'hi_exp_networking_3',
          target: 'विज़िटिंग कार्ड खत्म; लिंक्डइन पर लिखूँ?',
          gloss: {
            UiLang.tr: 'Kartvizitlerim bitti; LinkedIn’den yazabilir miyim?',
          },
        ),
        Phrase(
          id: 'hi_exp_networking_4',
          target: 'दो मिनट हैं? संक्षेप में पूछूँगी/पूछूँगा।',
          gloss: {UiLang.tr: 'İki dakikanız var mı? Kısa keseceğim.'},
        ),
        Phrase(
          id: 'hi_exp_networking_5',
          target: 'किसी संबंधित व्यक्ति से मिलवा सकती/सकता हूँ।',
          gloss: {UiLang.tr: 'İlgili birisiyle tanıştırabilirim.'},
        ),
      ],
      turns: const [
        SpeakTurn(
          prompt: 'ऐप असल में क्या सुलझाता है?',
          expected: 'छोटे व्यापार के बिल और वसूली आसान करते हैं।',
        ),
        SpeakTurn(
          prompt: 'दिलचस्प, मेल भेजिए।',
          expected: 'ज़रूर, कल भेज दूँगा/दूँगी।',
        ),
        SpeakTurn(
          prompt: 'आप किस बाज़ार में सक्रिय हैं?',
          expected: 'मुख्य रूप से दक्षिण एशिया में।',
        ),
      ],
      grammarNote: GrammarNote(
        rule: {UiLang.tr: 'Kimlik tanıtımı: मैं … हूँ + पद.'},
        goodExample: 'मैं प्रोडक्ट मैनेजर हूँ।',
        badExample: 'मैं प्रोडक्ट वाला काम वगैरह करती हूँ।',
      ),
    ),
  ];
}
