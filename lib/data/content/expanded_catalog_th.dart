import '../models/models.dart';

/// Tayca (kadın konuşmacı kibarlık eki "ค่ะ/คะ" — TTS sesi Anna) için 12
/// B1/B2 gerçek-hayat senaryosu. `phrases`/`turns.expected`/`grammarNote`
/// örnekleri öğrencinin kendi söyleyeceği repliklerdir, bu yüzden kadın
/// eki kullanır; `turns.prompt` karşı taraftır (İK, doktor, ev sahibi vb.)
/// ve cinsiyeti sabitlenmemiştir.
class ExpandedCatalogTh {
  static List<Scenario> build(LearnLang language) =>
      language == LearnLang.th ? _scenarios : const [];

  static final List<Scenario> _scenarios = [
    Scenario(
      id: 'th_exp_job_interview',
      lang: LearnLang.th,
      cefr: Cefr.b1,
      minutes: 9,
      titles: {UiLang.tr: 'İş görüşmesi', UiLang.en: 'Job interview'},
      clipLine: 'ขอบคุณที่นัดสัมภาษณ์ค่ะ',
      phrases: [
        Phrase(
          id: 'th_exp_interview_0',
          target: 'ขอบคุณที่นัดสัมภาษณ์ค่ะ',
          gloss: {UiLang.tr: 'Görüşmeye davet için teşekkürler.'},
        ),
        Phrase(
          id: 'th_exp_interview_1',
          target: 'ทำงานในทีมผลิตภัณฑ์มาประมาณห้าปีค่ะ',
          gloss: {UiLang.tr: 'Yaklaşık beş yıldır ürün ekibinde çalışıyorum.'},
        ),
        Phrase(
          id: 'th_exp_interview_2',
          target: 'สิ่งที่ให้ความสำคัญคือการเข้าใจความต้องการลูกค้าค่ะ',
          gloss: {UiLang.tr: 'Önemsediğim şey müşteri ihtiyacını anlamaktır.'},
        ),
        Phrase(
          id: 'th_exp_interview_3',
          target: 'จุดอ่อนคือติดรายละเอียด เลยใช้เช็กลิสต์ค่ะ',
          gloss: {
            UiLang.tr:
                'Zayıf yönüm detaylara takılmam; bu yüzden kontrol listesi kullanıyorum.',
          },
        ),
        Phrase(
          id: 'th_exp_interview_4',
          target: 'ขอทราบช่วงเงินเดือนได้ไหมคะ',
          gloss: {UiLang.tr: 'Maaş aralığını öğrenebilir miyim?'},
        ),
        Phrase(
          id: 'th_exp_interview_5',
          target: 'ต้องการให้เริ่มงานเมื่อไหร่คะ',
          gloss: {UiLang.tr: 'İşe ne zaman başlamamı istersiniz?'},
        ),
      ],
      turns: const [
        SpeakTurn(
          prompt: 'ทำไมถึงอยากร่วมงานกับเราค่ะ/คะ',
          expected: 'แนวทางกับลูกค้าตรงกับจุดแข็งของฉันค่ะ',
        ),
        SpeakTurn(
          prompt: 'รับมือสัปดาห์ส่งงานกดดันอย่างไรค่ะ',
          expected: 'ฉันลดขอบเขตงานและบันทึกความเสี่ยงเป็นลายลักษณ์อักษรค่ะ',
        ),
        SpeakTurn(
          prompt: 'มีคำถามอะไรไหมคะ',
          expected: 'มีค่ะ ต้องเริ่มงานเมื่อไหร่',
        ),
      ],
      grammarNote: GrammarNote(
        rule: {
          UiLang.tr:
              'Rica için "...ได้ไหมคะ/ค่ะ" kullanılır; doğrudan emir kaba kaçar.',
        },
        goodExample: 'ขอทราบช่วงเงินเดือนได้ไหมคะ',
        badExample: 'บอกเงินเดือนมา',
      ),
    ),
    Scenario(
      id: 'th_exp_team_meeting',
      lang: LearnLang.th,
      cefr: Cefr.b1,
      minutes: 8,
      titles: {UiLang.tr: 'Ekip toplantısı', UiLang.en: 'Team meeting'},
      clipLine: 'เข้าวาระเลยนะคะ',
      phrases: [
        Phrase(
          id: 'th_exp_meeting_0',
          target: 'เข้าวาระเลยนะคะ',
          gloss: {UiLang.tr: 'Doğrudan gündeme geçelim.'},
        ),
        Phrase(
          id: 'th_exp_meeting_1',
          target: 'ฝั่งฉันติดบล็อก API พรุ่งนี้จะให้วันที่ค่ะ',
          gloss: {
            UiLang.tr: 'Benim tarafımda API engeli var; yarın tarih vereceğim.',
          },
        ),
        Phrase(
          id: 'th_exp_meeting_2',
          target: 'ข้อนี้เลื่อนไปท้ายได้ไหมคะ',
          gloss: {UiLang.tr: 'Bu maddeyi sona bırakabilir miyiz?'},
        ),
        Phrase(
          id: 'th_exp_meeting_3',
          target: 'จดมติ: พฤหัสสี่โมงค่ะ',
          gloss: {UiLang.tr: 'Kararı not ediyorum: perşembe saat dört.'},
        ),
        Phrase(
          id: 'th_exp_meeting_4',
          target: 'ไม่คัดค้าน แต่ขอลงความเสี่ยงด้วยค่ะ',
          gloss: {UiLang.tr: 'İtirazım yok ama riski de kaydedelim.'},
        ),
        Phrase(
          id: 'th_exp_meeting_5',
          target: 'ต้องต่ออีกห้านาทีไหมคะ',
          gloss: {UiLang.tr: 'Beş dakika daha uzatmamız gerekiyor mu?'},
        ),
      ],
      turns: const [
        SpeakTurn(
          prompt: 'มีใครติดบล็อกไหมคะ',
          expected: 'รออนุมัติดีไซน์ พรุ่งนี้จะเตือนค่ะ',
        ),
        SpeakTurn(
          prompt: 'งานนี้เป็นของคุณต่อนะค่ะ',
          expected: 'รับทราบค่ะ จะอัปเดตทีมวันศุกร์',
        ),
        SpeakTurn(
          prompt: 'มีวาระอื่นอีกไหมคะ',
          expected: 'ไม่มีแล้วค่ะ วันนี้ประชุมสั้น',
        ),
      ],
      grammarNote: GrammarNote(
        rule: {
          UiLang.tr: '"รอ" nesne alır: รออนุมัติ; "รอสำหรับ" doğru değildir.',
        },
        goodExample: 'รออนุมัติดีไซน์ค่ะ',
        badExample: 'รอสำหรับดีไซน์',
      ),
    ),
    Scenario(
      id: 'th_exp_bank',
      lang: LearnLang.th,
      cefr: Cefr.a2,
      minutes: 7,
      titles: {UiLang.tr: 'Bankada hesap', UiLang.en: 'Bank account'},
      clipLine: 'อยากเปิดบัญชีออมทรัพย์ค่ะ',
      phrases: [
        Phrase(
          id: 'th_exp_bank_0',
          target: 'อยากเปิดบัญชีออมทรัพย์ค่ะ',
          gloss: {UiLang.tr: 'Bir hesap açmak istiyorum.'},
        ),
        Phrase(
          id: 'th_exp_bank_1',
          target: 'มีบัตรประชาชนกับหลักฐานที่อยู่ค่ะ',
          gloss: {UiLang.tr: 'Kimliğim ve ikametgah belgem var.'},
        ),
        Phrase(
          id: 'th_exp_bank_2',
          target: 'ค่าธรรมเนียมรายปีของบัตรเท่าไหร่คะ',
          gloss: {UiLang.tr: 'Kartın yıllık ücreti ne kadar?'},
        ),
        Phrase(
          id: 'th_exp_bank_3',
          target: 'ขออินเทอร์เน็ตแบงก์ด้วยค่ะ',
          gloss: {UiLang.tr: 'İnternet bankacılığını da istiyorum.'},
        ),
        Phrase(
          id: 'th_exp_bank_4',
          target: 'วงเงินโอนต่อวันเท่าไหร่คะ',
          gloss: {UiLang.tr: 'Günlük transfer limiti nedir?'},
        ),
        Phrase(
          id: 'th_exp_bank_5',
          target: 'ขอใบเสร็จทางอีเมลได้ไหมคะ',
          gloss: {UiLang.tr: 'Dekontu e-posta ile alabilir miyim?'},
        ),
      ],
      turns: const [
        SpeakTurn(
          prompt: 'บัญชีรับเงินเดือนใช่ไหมคะ',
          expected: 'ใช่ค่ะ สำหรับเงินเดือน',
        ),
        SpeakTurn(prompt: 'เซ็นตรงนี้ค่ะ', expected: 'ได้ค่ะ เซ็นเลย'),
        SpeakTurn(
          prompt: 'ต้องการบัตรเดบิตด้วยไหมคะ',
          expected: 'ต้องการค่ะ ขอบัตรด้วย',
        ),
      ],
      grammarNote: GrammarNote(
        rule: {
          UiLang.tr:
              'Ricada "อยาก + fiil" kullanılır; "เลย" emir tonuna yaklaşır.',
        },
        goodExample: 'อยากเปิดบัญชีค่ะ',
        badExample: 'เปิดบัญชีเดี๋ยวนี้',
      ),
    ),
    Scenario(
      id: 'th_exp_apartment',
      lang: LearnLang.th,
      cefr: Cefr.a2,
      minutes: 7,
      titles: {UiLang.tr: 'Ev bakma', UiLang.en: 'Apartment viewing'},
      clipLine: 'เห็นประกาศมา ห้องยังว่างไหมคะ',
      phrases: [
        Phrase(
          id: 'th_exp_apartment_0',
          target: 'เห็นประกาศมา ห้องยังว่างไหมคะ',
          gloss: {UiLang.tr: 'İlanı gördüm, daire hâlâ boş mu?'},
        ),
        Phrase(
          id: 'th_exp_apartment_1',
          target: 'ค่าส่วนกลางรวมค่าไฟร้อนไหมคะ',
          gloss: {UiLang.tr: 'Aidat ısınmayı da kapsıyor mu?'},
        ),
        Phrase(
          id: 'th_exp_apartment_2',
          target: 'เงินประกันกี่เดือนคะ',
          gloss: {UiLang.tr: 'Depozito kaç aylık kiraya denk geliyor?'},
        ),
        Phrase(
          id: 'th_exp_apartment_3',
          target: 'สัญญาปีหนึ่ง หรือสั้นกว่าได้ไหมคะ',
          gloss: {UiLang.tr: 'Sözleşme bir yıllık mı, daha kısa olabilir mi?'},
        ),
        Phrase(
          id: 'th_exp_apartment_4',
          target: 'ทำงานที่บ้าน ต้องการความเงียบค่ะ',
          gloss: {UiLang.tr: 'Evden çalışıyorum, sessizliğe ihtiyacım var.'},
        ),
        Phrase(
          id: 'th_exp_apartment_5',
          target: 'จะตอบพรุ่งนี้นะคะ',
          gloss: {UiLang.tr: 'Yarın cevap vereceğim.'},
        ),
      ],
      turns: const [
        SpeakTurn(
          prompt: 'จะย้ายเข้าเมื่อไหร่คะ',
          expected: 'ต้นเดือน ของไม่มากค่ะ',
        ),
        SpeakTurn(
          prompt: 'เจ้าของไม่อนุญาตสัตว์เลี้ยงค่ะ',
          expected: 'เข้าใจค่ะ ไม่มีสัตว์เลี้ยงอยู่แล้ว',
        ),
        SpeakTurn(
          prompt: 'มีคำถามอื่นไหมคะ',
          expected: 'มีค่ะ ขอดูห้องตอนนี้ได้ไหม',
        ),
      ],
      grammarNote: GrammarNote(
        rule: {
          UiLang.tr:
              'Hâlâ boş olup olmadığını sormak için "ยัง...ไหม" kullanılır.',
        },
        goodExample: 'ห้องยังว่างไหมคะ',
        badExample: 'ว่างเสมอไหมยัง',
      ),
    ),
    Scenario(
      id: 'th_exp_doctor',
      lang: LearnLang.th,
      cefr: Cefr.a2,
      minutes: 7,
      titles: {UiLang.tr: 'Doktorda', UiLang.en: "At the doctor's"},
      clipLine: 'มีไข้สามวันแล้ว กลางคืนไอค่ะ',
      phrases: [
        Phrase(
          id: 'th_exp_doctor_0',
          target: 'มีไข้สามวันแล้ว กลางคืนไอค่ะ',
          gloss: {UiLang.tr: 'Üç gündür ateşim var, geceleri öksürüyorum.'},
        ),
        Phrase(
          id: 'th_exp_doctor_1',
          target: 'ไม่แพ้เพนิซิลินค่ะ',
          gloss: {UiLang.tr: 'Penisiline alerjim yok.'},
        ),
        Phrase(
          id: 'th_exp_doctor_2',
          target: 'ยานี้ทำให้ง่วงไหมคะ',
          gloss: {UiLang.tr: 'Bu ilaç uyku hâli yapar mı?'},
        ),
        Phrase(
          id: 'th_exp_doctor_3',
          target: 'ต้องมีใบรับรองแพทย์ไหมคะ',
          gloss: {UiLang.tr: 'Doktor raporuna ihtiyacım var mı?'},
        ),
        Phrase(
          id: 'th_exp_doctor_4',
          target: 'ควรมาตรวจซ้ำเมื่อไหร่คะ',
          gloss: {UiLang.tr: 'Kontrol için ne zaman gelmeliyim?'},
        ),
        Phrase(
          id: 'th_exp_doctor_5',
          target: 'ร้านยาอยู่นอกตึกไหมคะ',
          gloss: {UiLang.tr: 'Eczane bina dışında mı?'},
        ),
      ],
      turns: const [
        SpeakTurn(
          prompt: 'เจ็บตรงไหน เริ่มกะทันหันไหมคะ',
          expected: 'อกด้านขวา ตั้งแต่เมื่อคืนค่ะ',
        ),
        SpeakTurn(prompt: 'ขอเจาะเลือดนะค่ะ', expected: 'ได้ค่ะ ไปตรงไหน'),
        SpeakTurn(
          prompt: 'ตอนนี้กินยาอะไรอยู่ไหมคะ',
          expected: 'ไม่มีค่ะ ไม่ได้กินยาอะไร',
        ),
      ],
      grammarNote: GrammarNote(
        rule: {
          UiLang.tr:
              '"แล้ว" ile süre belirtilir: สามวันแล้ว; kendi kendine teşhis koymayın.',
        },
        goodExample: 'มีไข้สามวันแล้วค่ะ',
        badExample: 'ฉันเป็นปอดบวมค่ะ น่าจะ',
      ),
    ),
    Scenario(
      id: 'th_exp_business_lunch',
      lang: LearnLang.th,
      cefr: Cefr.b1,
      minutes: 9,
      titles: {UiLang.tr: 'İş yemeği', UiLang.en: 'Business lunch'},
      clipLine: 'จองร้านตามคำแนะนำของคุณค่ะ',
      phrases: [
        Phrase(
          id: 'th_exp_lunch_0',
          target: 'จองร้านตามคำแนะนำของคุณค่ะ',
          gloss: {UiLang.tr: 'Mekanı sizin önerinize göre ayarladım.'},
        ),
        Phrase(
          id: 'th_exp_lunch_1',
          target: 'แพ้อาหารหรือข้อห้ามอะไรไหมคะ',
          gloss: {UiLang.tr: 'Alerjiniz veya tercihiniz var mı?'},
        ),
        Phrase(
          id: 'th_exp_lunch_2',
          target: 'ก่อนสั่ง เคลียร์ประเด็นหลักก่อนไหมคะ',
          gloss: {
            UiLang.tr: 'Sipariş vermeden önce ana noktaları netleştirelim mi?',
          },
        ),
        Phrase(
          id: 'th_exp_lunch_3',
          target: 'ไม่คุยตัวเลขบนโต๊ะ ส่งทีหลังค่ะ',
          gloss: {
            UiLang.tr: 'Masada rakamlara girmeyelim; sonra göndereceğim.',
          },
        ),
        Phrase(
          id: 'th_exp_lunch_4',
          target: 'รอบนี้ทางเราเลี้ยงค่ะ',
          gloss: {UiLang.tr: 'Bu sefer hesap bizden.'},
        ),
        Phrase(
          id: 'th_exp_lunch_5',
          target: 'คุยกันได้ประโยชน์ ขอบคุณค่ะ',
          gloss: {UiLang.tr: 'Verimli bir görüşme oldu, teşekkürler.'},
        ),
      ],
      turns: const [
        SpeakTurn(
          prompt: 'ราคายังสูงอยู่ค่ะ',
          expected: 'แบ่งเป็นสองเฟสได้ค่ะ',
        ),
        SpeakTurn(
          prompt: 'เดี๋ยวไปคิดดูก่อนค่ะ',
          expected: 'ได้ค่ะ จะโทรตามวันศุกร์',
        ),
        SpeakTurn(
          prompt: 'มีคำถามอื่นไหมคะ',
          expected: 'ไม่มีค่ะ ขอบคุณเวลาของคุณ',
        ),
      ],
      grammarNote: GrammarNote(
        rule: {
          UiLang.tr: 'Hesabı ikram etmek: ทางเราเลี้ยง; "คุณจ่าย" kaba kaçar.',
        },
        goodExample: 'รอบนี้ทางเราเลี้ยงค่ะ',
        badExample: 'คุณจ่ายทั้งหมด',
      ),
    ),
    Scenario(
      id: 'th_exp_complaint',
      lang: LearnLang.th,
      cefr: Cefr.b1,
      minutes: 8,
      titles: {UiLang.tr: 'Şikâyet', UiLang.en: 'Complaint'},
      clipLine: 'ออเดอร์ 1842 ยังไม่ถึงค่ะ',
      phrases: [
        Phrase(
          id: 'th_exp_complaint_0',
          target: 'ออเดอร์ 1842 ยังไม่ถึงค่ะ',
          gloss: {UiLang.tr: '1842 numaralı sipariş hâlâ gelmedi.'},
        ),
        Phrase(
          id: 'th_exp_complaint_1',
          target: 'วันที่นัดไว้คือเมื่อวานค่ะ',
          gloss: {UiLang.tr: 'Kararlaştırılan tarih dündü.'},
        ),
        Phrase(
          id: 'th_exp_complaint_2',
          target: 'ขอคืนค่าส่งเป็นทางออกค่ะ',
          gloss: {
            UiLang.tr: 'Çözüm olarak kargo ücretinin iadesini istiyorum.',
          },
        ),
        Phrase(
          id: 'th_exp_complaint_3',
          target: 'ต้องคุยหัวหน้า หรือคุณแก้ได้คะ',
          gloss: {
            UiLang.tr:
                'Bir yöneticiyle mi konuşmalıyım, yoksa siz çözebilir misiniz?',
          },
        ),
        Phrase(
          id: 'th_exp_complaint_4',
          target: 'ขอหลักฐานเป็นลายลักษณ์อักษรได้ไหมคะ',
          gloss: {UiLang.tr: 'Yazılı bir teyit alabilir miyim?'},
        ),
        Phrase(
          id: 'th_exp_complaint_5',
          target: 'อดทนได้ แต่วันนี้ขอเวลาที่ชัดค่ะ',
          gloss: {UiLang.tr: 'Sabırlıyım ama bugün net bir saat lazım.'},
        ),
      ],
      turns: const [
        SpeakTurn(
          prompt: 'ขออภัย กำลังเช็คให้นะค่ะ',
          expected: 'ขอบคุณ ช่วยบันทึกเวลาสายด้วยค่ะ',
        ),
        SpeakTurn(prompt: 'ส่งถึงพรุ่งนี้สองโมงค่ะ', expected: 'ได้ค่ะ รอค่ะ'),
        SpeakTurn(
          prompt: 'ส่งอีเมลยืนยันให้ไหมคะ',
          expected: 'ได้ค่ะ ช่วยส่งด้วย',
        ),
      ],
      grammarNote: GrammarNote(
        rule: {
          UiLang.tr:
              'Yazılı kanıt için "ลายลักษณ์อักษร" kullanılır; sadece mesaj yeterli değildir.',
        },
        goodExample: 'ขอเป็นลายลักษณ์อักษรค่ะ',
        badExample: 'ทักไลน์อย่างเดียว',
      ),
    ),
    Scenario(
      id: 'th_exp_business_trip',
      lang: LearnLang.th,
      cefr: Cefr.a2,
      minutes: 7,
      titles: {UiLang.tr: 'İş seyahati', UiLang.en: 'Business trip'},
      clipLine: 'นี่รหัส PNR ขอ boarding pass ค่ะ',
      phrases: [
        Phrase(
          id: 'th_exp_trip_0',
          target: 'นี่รหัส PNR ขอ boarding pass ค่ะ',
          gloss: {UiLang.tr: 'İşte rezervasyon kodum; biniş kartı lütfen.'},
        ),
        Phrase(
          id: 'th_exp_trip_1',
          target: 'กระเป๋าถือเข้าขนาดไหมคะ',
          gloss: {UiLang.tr: 'El bagajı ölçülere uyuyor mu?'},
        ),
        Phrase(
          id: 'th_exp_trip_2',
          target: 'ดีเลย์แล้วจะทันต่อเครื่องไหมคะ',
          gloss: {UiLang.tr: 'Gecikirsek aktarmaya yetişir miyim?'},
        ),
        Phrase(
          id: 'th_exp_trip_3',
          target: 'ใบเสร็จออกชื่อบริษัทค่ะ',
          gloss: {UiLang.tr: 'Fatura şirket adına lütfen.'},
        ),
        Phrase(
          id: 'th_exp_trip_4',
          target: 'ทางเข้าเลานจ์อยู่ไหนคะ',
          gloss: {UiLang.tr: 'Lounge girişi nerede?'},
        ),
        Phrase(
          id: 'th_exp_trip_5',
          target: 'ต้องเก็บใบแท็กซี่เบิกค่ะ',
          gloss: {UiLang.tr: 'Masraf için taksi fişini saklamam gerekiyor.'},
        ),
      ],
      turns: const [
        SpeakTurn(
          prompt: 'ริมหน้าต่างหรือทางเดินค่ะ',
          expected: 'ทางเดิน ใกล้ทางออกถ้าได้ค่ะ',
        ),
        SpeakTurn(
          prompt: 'เกต 12 อีกประมาณสี่สิบนาทีค่ะ',
          expected: 'ขอบคุณค่ะ ไปเลย',
        ),
        SpeakTurn(
          prompt: 'มีกระเป๋าโหลดใต้เครื่องไหมคะ',
          expected: 'ไม่มีค่ะ มีแค่กระเป๋าถือ',
        ),
      ],
      grammarNote: GrammarNote(
        rule: {UiLang.tr: 'Yetişmek: "ทัน"; kaçırmak için "พลาด" kullanılır.'},
        goodExample: 'จะทันต่อเครื่องไหมคะ',
        badExample: 'จะพลาดสนามบินไหม',
      ),
    ),
    Scenario(
      id: 'th_exp_client_call',
      lang: LearnLang.th,
      cefr: Cefr.b1,
      minutes: 8,
      titles: {UiLang.tr: 'Müşteri telefonu', UiLang.en: 'Client phone call'},
      clipLine: 'ว่างห้านาทีไหมคะ',
      phrases: [
        Phrase(
          id: 'th_exp_call_0',
          target: 'ว่างห้านาทีไหมคะ',
          gloss: {UiLang.tr: 'Beş dakikanız var mı?'},
        ),
        Phrase(
          id: 'th_exp_call_1',
          target: 'ข้อสามในเมลเมื่อวานยังไม่ชัดค่ะ',
          gloss: {UiLang.tr: 'Dünkü mailin üçüncü maddesi net değil.'},
        ),
        Phrase(
          id: 'th_exp_call_2',
          target: 'นี่งานเพิ่ม หรืออยู่ในสโคปเดิมคะ',
          gloss: {UiLang.tr: 'Bu ek iş mi yoksa mevcut kapsamda mı?'},
        ),
        Phrase(
          id: 'th_exp_call_3',
          target: 'ถ้าเข้าใจผิด ช่วยแก้ด้วยค่ะ',
          gloss: {UiLang.tr: 'Yanlış anladıysam lütfen düzeltin.'},
        ),
        Phrase(
          id: 'th_exp_call_4',
          target: 'สรุป: ศุกร์ดราฟต์ จันทร์คอมเมนต์ค่ะ',
          gloss: {UiLang.tr: 'Özet: cuma taslak, pazartesi yorum.'},
        ),
        Phrase(
          id: 'th_exp_call_5',
          target: 'ส่งเมลยืนยันทันทีค่ะ',
          gloss: {UiLang.tr: 'Hemen bir teyit maili gönderiyorum.'},
        ),
      ],
      turns: const [
        SpeakTurn(
          prompt: 'ไม่มีฟีเจอร์นี้ขึ้นไลฟ์ไม่ได้ค่ะ',
          expected: 'งั้นเลื่อนอย่างอื่น ดึงอันนี้ขึ้นก่อนค่ะ',
        ),
        SpeakTurn(
          prompt: 'โอเค เขียนไว้ค่ะ',
          expected: 'ส่งเป็นลายลักษณ์อักษรตอนนี้เลยค่ะ',
        ),
        SpeakTurn(
          prompt: 'เวอร์ชันสุดท้ายเสร็จเมื่อไหร่คะ',
          expected: 'จะเสร็จภายในศุกร์นี้ค่ะ',
        ),
      ],
      grammarNote: GrammarNote(
        rule: {
          UiLang.tr:
              'Yanlış anlamayı teyit etmek için "ถ้าเข้าใจผิด" kullanılır.',
        },
        goodExample: 'ถ้าเข้าใจผิด ช่วยแก้ด้วยค่ะ',
        badExample: 'ถ้าจะเข้าใจผิดแล้ว…',
      ),
    ),
    Scenario(
      id: 'th_exp_hr_salary',
      lang: LearnLang.th,
      cefr: Cefr.b2,
      minutes: 10,
      titles: {UiLang.tr: 'Maaş görüşmesi', UiLang.en: 'Salary conversation'},
      clipLine: 'อยากคุยผลงานกับตลาดแรงงานค่ะ',
      phrases: [
        Phrase(
          id: 'th_exp_salary_0',
          target: 'อยากคุยผลงานกับตลาดแรงงานค่ะ',
          gloss: {
            UiLang.tr:
                'Performansım ve piyasa seviyesi hakkında konuşmak istiyorum.',
          },
        ),
        Phrase(
          id: 'th_exp_salary_1',
          target: 'หกเดือนส่งสามโปรเจกต์ตรงเวลาค่ะ',
          gloss: {UiLang.tr: 'Altı ayda üç projeyi zamanında teslim ettim.'},
        ),
        Phrase(
          id: 'th_exp_salary_2',
          target: 'คาดหวังสิบห้าเปอร์เซ็นต์ มีหลักฐานค่ะ',
          gloss: {UiLang.tr: 'Yüzde on beş bekliyorum, kanıtım var.'},
        ),
        Phrase(
          id: 'th_exp_salary_3',
          target: 'ตำแหน่งตอนนี้ไม่สะท้อนหน้าที่จริงค่ะ',
          gloss: {UiLang.tr: 'Mevcut unvan gerçek görevi yansıtmıyor.'},
        ),
        Phrase(
          id: 'th_exp_salary_4',
          target: 'ถ้างบไม่ถึง นัดวันทบทวนค่ะ',
          gloss: {
            UiLang.tr: 'Bütçe yetmezse bir değerlendirme tarihi belirleyelim.',
          },
        ),
        Phrase(
          id: 'th_exp_salary_5',
          target: 'ขอคำตัดสินเป็นลายลักษณ์อักษรค่ะ',
          gloss: {UiLang.tr: 'Kararı yazılı olarak istiyorum.'},
        ),
      ],
      turns: const [
        SpeakTurn(
          prompt: 'ปีนี้งบตึงค่ะ',
          expected: 'เข้าใจค่ะ โบนัสหรือระดับได้ไหมคะ',
        ),
        SpeakTurn(
          prompt: 'กลับมาดูมีนาคมค่ะ',
          expected: 'ได้ค่ะ คุยกันอีกทีมีนาคม',
        ),
        SpeakTurn(
          prompt: 'มีอะไรอยากคุยเพิ่มไหมคะ',
          expected: 'มีค่ะ เรื่องงบอบรมด้วย',
        ),
      ],
      grammarNote: GrammarNote(
        rule: {
          UiLang.tr:
              '"คาดหวัง" beklentiyi yumuşak sunar; "ต้องการเดี๋ยวนี้" talep dayatır.',
        },
        goodExample: 'คาดหวังสิบห้าเปอร์เซ็นต์ค่ะ',
        badExample: 'ขอสิบห้าเดี๋ยวนี้',
      ),
    ),
    Scenario(
      id: 'th_exp_daily_errands',
      lang: LearnLang.th,
      cefr: Cefr.a2,
      minutes: 6,
      titles: {
        UiLang.tr: 'Market ve kargo',
        UiLang.en: 'Errands and deliveries',
      },
      clipLine: 'ขนมปังนี้สองชิ้น กับใบเสร็จค่ะ',
      phrases: [
        Phrase(
          id: 'th_exp_errands_0',
          target: 'ขนมปังนี้สองชิ้น กับใบเสร็จค่ะ',
          gloss: {UiLang.tr: 'Bu ekmekten iki tane ve fiş lütfen.'},
        ),
        Phrase(
          id: 'th_exp_errands_1',
          target: 'ชั้นกลูเตนฟรีอยู่ไหนคะ',
          gloss: {UiLang.tr: 'Glütensiz reyon nerede?'},
        ),
        Phrase(
          id: 'th_exp_errands_2',
          target: 'อย่าฝากเพื่อนบ้าน ติดโน้ตที่ประตูค่ะ',
          gloss: {UiLang.tr: 'Komşuya bırakmayın; kapıya not bırakın.'},
        ),
        Phrase(
          id: 'th_exp_errands_3',
          target: 'ไม่มีเงินสด บัตรได้ไหมคะ',
          gloss: {UiLang.tr: 'Nakit param yok; kart geçer mi?'},
        ),
        Phrase(
          id: 'th_exp_errands_4',
          target: 'คืนของได้สิบสี่วันใช่ไหมคะ',
          gloss: {UiLang.tr: 'İade on dört gün içinde, değil mi?'},
        ),
        Phrase(
          id: 'th_exp_errands_5',
          target: 'ไม่เอาถุง มีถุงผ้าเองค่ะ',
          gloss: {UiLang.tr: 'Poşete gerek yok, kendi çantam var.'},
        ),
      ],
      turns: const [
        SpeakTurn(prompt: 'มีบัตรสมาชิกไหมคะ', expected: 'รอบนี้ไม่เอาค่ะ'),
        SpeakTurn(
          prompt: 'ไม่มีเงินทอน รูดบัตรนะค่ะ',
          expected: 'ได้ค่ะ รูดบัตรเลย',
        ),
        SpeakTurn(
          prompt: 'รับใบกำกับภาษีด้วยไหมคะ',
          expected: 'ไม่ต้องค่ะ ขอแค่ใบเสร็จ',
        ),
      ],
      grammarNote: GrammarNote(
        rule: {UiLang.tr: 'Nazik red: "ไม่เอา + isim" kullanılır.'},
        goodExample: 'ไม่เอาถุงค่ะ',
        badExample: 'อย่าให้ถุง!',
      ),
    ),
    Scenario(
      id: 'th_exp_networking',
      lang: LearnLang.th,
      cefr: Cefr.b1,
      minutes: 8,
      titles: {UiLang.tr: 'Networking', UiLang.en: 'Networking'},
      clipLine: 'ฉันชื่ออัน โปรดักต์แมเนเจอร์ด้านฟินเทคค่ะ',
      phrases: [
        Phrase(
          id: 'th_exp_networking_0',
          target: 'ฉันชื่ออัน โปรดักต์แมเนเจอร์ด้านฟินเทคค่ะ',
          gloss: {
            UiLang.tr: 'Benim adım An, fintech alanında ürün yöneticisiyim.',
          },
        ),
        Phrase(
          id: 'th_exp_networking_1',
          target: 'ตัวอย่างเรื่องเพย์เมนต์ชัดมากค่ะ',
          gloss: {UiLang.tr: 'Ödemeler hakkındaki örneğiniz çok netti.'},
        ),
        Phrase(
          id: 'th_exp_networking_2',
          target: 'ทางคุณก็เจอปัญหาแบบนี้ไหมคะ',
          gloss: {UiLang.tr: 'Sizde de böyle sorunlar oluyor mu?'},
        ),
        Phrase(
          id: 'th_exp_networking_3',
          target: 'นามบัตรหมด แอดลิงกด์อินได้ไหมคะ',
          gloss: {
            UiLang.tr: 'Kartvizitlerim bitti; LinkedIn’den ekleyebilir miyim?',
          },
        ),
        Phrase(
          id: 'th_exp_networking_4',
          target: 'ขอสองนาที สั้น ๆ ค่ะ',
          gloss: {UiLang.tr: 'İki dakika, kısa keseceğim.'},
        ),
        Phrase(
          id: 'th_exp_networking_5',
          target: 'ยินดีแนะนำคนในสายใกล้เคียงค่ะ',
          gloss: {
            UiLang.tr: 'İlgili birisini tanıştırmaktan memnuniyet duyarım.',
          },
        ),
      ],
      turns: const [
        SpeakTurn(
          prompt: 'แอปแก้ปัญหาอะไรชัด ๆ ค่ะ',
          expected: 'ทำบิลและเก็บเงินให้ง่ายสำหรับเอสเอ็มอีค่ะ',
        ),
        SpeakTurn(
          prompt: 'น่าสนใจ ส่งเมลมาได้ค่ะ',
          expected: 'ได้ค่ะ พรุ่งนี้ส่งไป',
        ),
        SpeakTurn(
          prompt: 'ตอนนี้เน้นตลาดไหนคะ',
          expected: 'ตอนนี้เน้นเอเชียตะวันออกเฉียงใต้ค่ะ',
        ),
      ],
      grammarNote: GrammarNote(
        rule: {UiLang.tr: 'Tanıtım: ฉันชื่อ… + อาชีพ, sonunda ค่ะ eklenir.'},
        goodExample: 'ฉันเป็นโปรดักต์แมเนเจอร์ค่ะ',
        badExample: 'ฉันทำพวกโปรดักต์อะไรสักอย่าง',
      ),
    ),
  ];
}
