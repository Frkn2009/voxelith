import '../models/models.dart';

/// İkinci AI turundan uyarlanmış, Portekizce (você hitabı, PT-BR) için 12 ek
/// B1/B2 profesyonel/gerçek hayat senaryosu.
class ExpandedCatalogPt {
  static List<Scenario> build(LearnLang language) =>
      language == LearnLang.pt ? _scenarios : const [];

  static final List<Scenario> _scenarios = [
    Scenario(
      id: 'pt_exp_job_interview',
      lang: LearnLang.pt,
      cefr: Cefr.b1,
      minutes: 10,
      titles: {UiLang.tr: 'İş görüşmesi', UiLang.en: 'Job interview'},
      clipLine: 'Obrigado pelo convite para a entrevista.',
      phrases: [
        Phrase(
          id: 'pt_exp_interview_0',
          target: 'Obrigado pelo convite para a entrevista.',
          gloss: {UiLang.tr: 'Görüşme davetiniz için teşekkür ederim.'},
        ),
        Phrase(
          id: 'pt_exp_interview_1',
          target:
              'Trabalho com produto há cinco anos, em times interdisciplinares.',
          gloss: {
            UiLang.tr:
                'Beş yıldır çok disiplinli ekiplerde ürün üzerine çalışıyorum.',
          },
        ),
        Phrase(
          id: 'pt_exp_interview_2',
          target: 'O que mais me atrai é esclarecer o problema do cliente.',
          gloss: {
            UiLang.tr:
                'Beni en çok çeken şey müşterinin sorununu netleştirmek.',
          },
        ),
        Phrase(
          id: 'pt_exp_interview_3',
          target:
              'Meu ponto fraco é perder tempo no detalhe; uso um checklist.',
          gloss: {
            UiLang.tr:
                'Zayıf yönüm ayrıntıda vakit kaybetmem; kontrol listesi kullanıyorum.',
          },
        ),
        Phrase(
          id: 'pt_exp_interview_4',
          target: 'A partir de quando vocês precisam de alguém?',
          gloss: {UiLang.tr: 'Ne zamandan itibaren birine ihtiyacınız var?'},
        ),
        Phrase(
          id: 'pt_exp_interview_5',
          target: 'Vocês podem compartilhar a faixa salarial?',
          gloss: {UiLang.tr: 'Maaş aralığını paylaşabilir misiniz?'},
        ),
      ],
      turns: const [
        SpeakTurn(
          prompt: 'Por que esta empresa?',
          expected:
              'A forma como vocês tratam o cliente combina com o que eu faço bem.',
        ),
        SpeakTurn(
          prompt: 'Como você lida com uma semana de entrega difícil?',
          expected: 'Reduzo o escopo e deixo os riscos por escrito.',
        ),
      ],
      grammarNote: GrammarNote(
        rule: {
          UiLang.tr:
              'Resmi ricada "vocês podem + mastar fiil" kullanılır; emir kipi ("fala") kullanılmaz.',
        },
        goodExample: 'Vocês podem compartilhar a faixa salarial?',
        badExample: 'Fala o salário.',
      ),
    ),
    Scenario(
      id: 'pt_exp_team_meeting',
      lang: LearnLang.pt,
      cefr: Cefr.b1,
      minutes: 9,
      titles: {UiLang.tr: 'Ekip toplantısı', UiLang.en: 'Team meeting'},
      clipLine: 'Vamos direto à pauta.',
      phrases: [
        Phrase(
          id: 'pt_exp_meeting_0',
          target: 'Vamos direto à pauta.',
          gloss: {UiLang.tr: 'Doğrudan gündeme geçelim.'},
        ),
        Phrase(
          id: 'pt_exp_meeting_1',
          target: 'Do meu lado há atraso na API; amanhã passo uma data.',
          gloss: {
            UiLang.tr:
                'Benim tarafımda API gecikmesi var; yarın bir tarih vereceğim.',
          },
        ),
        Phrase(
          id: 'pt_exp_meeting_2',
          target: 'Podemos deixar este item por último?',
          gloss: {UiLang.tr: 'Bu maddeyi en sona bırakabilir miyiz?'},
        ),
        Phrase(
          id: 'pt_exp_meeting_3',
          target: 'Anoto a decisão: quinta, 16h.',
          gloss: {UiLang.tr: 'Kararı not alıyorum: perşembe, 16.00.'},
        ),
        Phrase(
          id: 'pt_exp_meeting_4',
          target: 'Não tenho objeção, mas vamos registrar o risco.',
          gloss: {UiLang.tr: 'İtirazım yok, ama riski kaydedelim.'},
        ),
        Phrase(
          id: 'pt_exp_meeting_5',
          target: 'Precisamos esticar cinco minutos?',
          gloss: {UiLang.tr: 'Beş dakika uzatmamız gerekiyor mu?'},
        ),
      ],
      turns: const [
        SpeakTurn(
          prompt: 'Alguém com bloqueio?',
          expected: 'Estou esperando o ok do design; amanhã cobro.',
        ),
        SpeakTurn(
          prompt: 'Então a dona do tema é você.',
          expected: 'Combinado, aviso o time até sexta.',
        ),
      ],
      grammarNote: GrammarNote(
        rule: {
          UiLang.tr:
              'Süren iş için estar + gerúndio: "estou esperando". "Espero" belirsiz/gelecek anlamı taşır.',
        },
        goodExample: 'Estou esperando o ok do design.',
        badExample: 'Espero o ok do design.',
      ),
    ),
    Scenario(
      id: 'pt_exp_bank',
      lang: LearnLang.pt,
      cefr: Cefr.a2,
      minutes: 8,
      titles: {UiLang.tr: 'Bankada hesap', UiLang.en: 'Bank account'},
      clipLine: 'Queria abrir uma conta corrente.',
      phrases: [
        Phrase(
          id: 'pt_exp_bank_0',
          target: 'Queria abrir uma conta corrente.',
          gloss: {UiLang.tr: 'Vadesiz hesap açmak istiyorum.'},
        ),
        Phrase(
          id: 'pt_exp_bank_1',
          target: 'Trouxe RG e comprovante de endereço.',
          gloss: {UiLang.tr: 'Kimlik ve adres belgemi getirdim.'},
        ),
        Phrase(
          id: 'pt_exp_bank_2',
          target: 'Qual é a anuidade do cartão?',
          gloss: {UiLang.tr: 'Kartın yıllık ücreti nedir?'},
        ),
        Phrase(
          id: 'pt_exp_bank_3',
          target: 'Quero o internet banking também, por favor.',
          gloss: {UiLang.tr: 'İnternet bankacılığını da istiyorum lütfen.'},
        ),
        Phrase(
          id: 'pt_exp_bank_4',
          target: 'Qual o limite de TED/PIX?',
          gloss: {UiLang.tr: 'Havale/anlık transfer limiti nedir?'},
        ),
        Phrase(
          id: 'pt_exp_bank_5',
          target: 'Dá para receber o comprovante por e-mail?',
          gloss: {UiLang.tr: 'Dekontu e-posta ile alabilir miyim?'},
        ),
      ],
      turns: const [
        SpeakTurn(
          prompt: 'Conta para pessoa física?',
          expected: 'Sim, para receber salário.',
        ),
        SpeakTurn(
          prompt: 'Sua assinatura aqui, por favor.',
          expected: 'Claro, aqui está.',
        ),
      ],
      grammarNote: GrammarNote(
        rule: {
          UiLang.tr:
              '"Queria" (istek geçmiş zamanı), "quero"dan daha nazik durur, gişe dilinde tercih edilir.',
        },
        goodExample: 'Queria abrir uma conta corrente.',
        badExample: 'Abre uma conta agora.',
      ),
    ),
    Scenario(
      id: 'pt_exp_apartment',
      lang: LearnLang.pt,
      cefr: Cefr.a2,
      minutes: 8,
      titles: {UiLang.tr: 'Ev bakma', UiLang.en: 'Apartment viewing'},
      clipLine: 'Vi o anúncio; o apartamento ainda está livre?',
      phrases: [
        Phrase(
          id: 'pt_exp_apartment_0',
          target: 'Vi o anúncio; o apartamento ainda está livre?',
          gloss: {UiLang.tr: 'İlanı gördüm; daire hâlâ boş mu?'},
        ),
        Phrase(
          id: 'pt_exp_apartment_1',
          target: 'O condomínio inclui aquecimento?',
          gloss: {UiLang.tr: 'Aidat ısıtmayı kapsıyor mu?'},
        ),
        Phrase(
          id: 'pt_exp_apartment_2',
          target: 'A caução é de quantos aluguéis?',
          gloss: {UiLang.tr: 'Depozito kaç kira?'},
        ),
        Phrase(
          id: 'pt_exp_apartment_3',
          target: 'O contrato é de um ano? Tem prazo menor?',
          gloss: {UiLang.tr: 'Sözleşme bir yıllık mı? Daha kısası var mı?'},
        ),
        Phrase(
          id: 'pt_exp_apartment_4',
          target: 'Trabalho de casa; o prédio é silencioso?',
          gloss: {UiLang.tr: 'Evden çalışıyorum; bina sessiz mi?'},
        ),
        Phrase(
          id: 'pt_exp_apartment_5',
          target: 'Te respondo amanhã.',
          gloss: {UiLang.tr: 'Sana yarın cevap veririm.'},
        ),
      ],
      turns: const [
        SpeakTurn(
          prompt: 'Para quando você precisa se mudar?',
          expected: 'Início do mês. Pouca mudança.',
        ),
        SpeakTurn(
          prompt: 'O dono não aceita animal.',
          expected: 'Sem problema, não tenho animal.',
        ),
      ],
      grammarNote: GrammarNote(
        rule: {
          UiLang.tr:
              'Durum sorusu: "ainda está livre?" — "é livre" kalıcı özellik gibi durur, uygun değil.',
        },
        goodExample: 'Ainda está livre?',
        badExample: 'Ainda é livre o apto?',
      ),
    ),
    Scenario(
      id: 'pt_exp_doctor',
      lang: LearnLang.pt,
      cefr: Cefr.a2,
      minutes: 8,
      titles: {UiLang.tr: 'Doktorda', UiLang.en: "At the doctor's"},
      clipLine: 'Estou com febre há três dias e tosse à noite.',
      phrases: [
        Phrase(
          id: 'pt_exp_doctor_0',
          target: 'Estou com febre há três dias e tosse à noite.',
          gloss: {UiLang.tr: 'Üç gündür ateşim var ve gece öksürüyorum.'},
        ),
        Phrase(
          id: 'pt_exp_doctor_1',
          target: 'Não tenho alergia a penicilina.',
          gloss: {UiLang.tr: 'Penisiline alerjim yok.'},
        ),
        Phrase(
          id: 'pt_exp_doctor_2',
          target: 'Este remédio dá sono?',
          gloss: {UiLang.tr: 'Bu ilaç uyku yapar mı?'},
        ),
        Phrase(
          id: 'pt_exp_doctor_3',
          target: 'Vou precisar de atestado?',
          gloss: {UiLang.tr: 'Rapora ihtiyacım olacak mı?'},
        ),
        Phrase(
          id: 'pt_exp_doctor_4',
          target: 'Quando volto para reavaliação?',
          gloss: {UiLang.tr: 'Kontrole ne zaman döneyim?'},
        ),
        Phrase(
          id: 'pt_exp_doctor_5',
          target: 'A farmácia fica fora do prédio?',
          gloss: {UiLang.tr: 'Eczane bina dışında mı?'},
        ),
      ],
      turns: const [
        SpeakTurn(
          prompt: 'A dor é onde? Começou de repente?',
          expected: 'Do lado direito do peito, ontem à noite.',
        ),
        SpeakTurn(
          prompt: 'Vou pedir exame de sangue.',
          expected: 'Tudo bem, para onde eu vou?',
        ),
      ],
      grammarNote: GrammarNote(
        rule: {
          UiLang.tr:
              'Şikâyet: "estar com" + belirti (estou com febre/dor). "Tenho pneumonia" teşhis koymak olur.',
        },
        goodExample: 'Estou com febre há três dias.',
        badExample: 'Tenho pneumonia, acho.',
      ),
    ),
    Scenario(
      id: 'pt_exp_business_lunch',
      lang: LearnLang.pt,
      cefr: Cefr.b1,
      minutes: 10,
      titles: {UiLang.tr: 'İş yemeği', UiLang.en: 'Business lunch'},
      clipLine: 'Escolhi o restaurante a partir da sua dica.',
      phrases: [
        Phrase(
          id: 'pt_exp_lunch_0',
          target: 'Escolhi o restaurante a partir da sua dica.',
          gloss: {UiLang.tr: 'Restoranı sizin önerinizle seçtim.'},
        ),
        Phrase(
          id: 'pt_exp_lunch_1',
          target: 'Alguma alergia ou preferência?',
          gloss: {UiLang.tr: 'Alerjiniz ya da tercihiniz var mı?'},
        ),
        Phrase(
          id: 'pt_exp_lunch_2',
          target: 'Antes do pedido, alinhamos a pauta?',
          gloss: {UiLang.tr: 'Sipariş vermeden önce gündemi netleştirelim mi?'},
        ),
        Phrase(
          id: 'pt_exp_lunch_3',
          target: 'Não vamos detalhar número à mesa; depois eu escrevo.',
          gloss: {UiLang.tr: 'Masada rakamlara girmeyelim; sonra yazarım.'},
        ),
        Phrase(
          id: 'pt_exp_lunch_4',
          target: 'A conta fica por nossa conta desta vez.',
          gloss: {UiLang.tr: 'Bu sefer hesap bizden.'},
        ),
        Phrase(
          id: 'pt_exp_lunch_5',
          target: 'Foi produtivo, obrigado.',
          gloss: {UiLang.tr: 'Verimliydi, teşekkür ederim.'},
        ),
      ],
      turns: const [
        SpeakTurn(
          prompt: 'O preço ainda parece alto.',
          expected: 'Podemos dividir em duas fases.',
        ),
        SpeakTurn(
          prompt: 'Vamos pensar.',
          expected: 'Claro, posso ligar na sexta?',
        ),
      ],
      grammarNote: GrammarNote(
        rule: {
          UiLang.tr:
              'Hesabı üstlenme: "a conta fica por nossa conta". "Você paga" kaba kaçar.',
        },
        goodExample: 'A conta fica por nossa conta.',
        badExample: 'Você paga tudo.',
      ),
    ),
    Scenario(
      id: 'pt_exp_complaint',
      lang: LearnLang.pt,
      cefr: Cefr.b1,
      minutes: 9,
      titles: {UiLang.tr: 'Şikâyet', UiLang.en: 'Complaint'},
      clipLine: 'O pedido é o 1842 e ainda não chegou.',
      phrases: [
        Phrase(
          id: 'pt_exp_complaint_0',
          target: 'O pedido é o 1842 e ainda não chegou.',
          gloss: {UiLang.tr: 'Sipariş 1842 ve hâlâ gelmedi.'},
        ),
        Phrase(
          id: 'pt_exp_complaint_1',
          target: 'A data combinada era ontem.',
          gloss: {UiLang.tr: 'Kararlaştırılan tarih dündü.'},
        ),
        Phrase(
          id: 'pt_exp_complaint_2',
          target: 'Quero o reembolso do frete como solução.',
          gloss: {
            UiLang.tr: 'Çözüm olarak kargo ücretinin iadesini istiyorum.',
          },
        ),
        Phrase(
          id: 'pt_exp_complaint_3',
          target: 'Preciso falar com um supervisor ou você resolve?',
          gloss: {
            UiLang.tr:
                'Bir sorumluyla mı konuşmalıyım, yoksa siz çözer misiniz?',
          },
        ),
        Phrase(
          id: 'pt_exp_complaint_4',
          target: 'Pode me mandar a confirmação por escrito?',
          gloss: {UiLang.tr: 'Bana yazılı onay gönderebilir misiniz?'},
        ),
        Phrase(
          id: 'pt_exp_complaint_5',
          target: 'Tenho paciência, mas preciso de um horário hoje.',
          gloss: {UiLang.tr: 'Sabırlıyım ama bugün bir saat lazım.'},
        ),
      ],
      turns: const [
        SpeakTurn(
          prompt: 'Pedimos desculpas; vou verificar.',
          expected: 'Obrigado. Anote também o horário.',
        ),
        SpeakTurn(
          prompt: 'Entrega até amanhã às 14h.',
          expected: 'Combinado, vou aguardar.',
        ),
      ],
      grammarNote: GrammarNote(
        rule: {
          UiLang.tr:
              'Söz geçmişini kanıt gibi pretérito ile anlatın: "a data combinada era ontem".',
        },
        goodExample: 'A data combinada era ontem.',
        badExample: 'Vocês sempre atrasam.',
      ),
    ),
    Scenario(
      id: 'pt_exp_business_trip',
      lang: LearnLang.pt,
      cefr: Cefr.a2,
      minutes: 8,
      titles: {UiLang.tr: 'İş seyahati', UiLang.en: 'Business trip'},
      clipLine: 'Meu localizador é este; o cartão de embarque, por favor.',
      phrases: [
        Phrase(
          id: 'pt_exp_trip_0',
          target: 'Meu localizador é este; o cartão de embarque, por favor.',
          gloss: {UiLang.tr: 'Rezervasyon kodum bu; biniş kartı lütfen.'},
        ),
        Phrase(
          id: 'pt_exp_trip_1',
          target: 'A mala de mão passa na medida?',
          gloss: {UiLang.tr: 'El bagajı ölçüye uyuyor mu?'},
        ),
        Phrase(
          id: 'pt_exp_trip_2',
          target: 'Com o atraso, perco a conexão?',
          gloss: {UiLang.tr: 'Gecikme yüzünden bağlantıyı kaçırır mıyım?'},
        ),
        Phrase(
          id: 'pt_exp_trip_3',
          target: 'A nota fiscal no CNPJ da empresa, por favor.',
          gloss: {UiLang.tr: 'Fatura şirket vergi numarasına lütfen.'},
        ),
        Phrase(
          id: 'pt_exp_trip_4',
          target: 'Onde fica a entrada do lounge?',
          gloss: {UiLang.tr: 'Lounge girişi nerede?'},
        ),
        Phrase(
          id: 'pt_exp_trip_5',
          target: 'Preciso guardar o recibo do táxi.',
          gloss: {UiLang.tr: 'Taksi fişini saklamam gerekiyor.'},
        ),
      ],
      turns: const [
        SpeakTurn(
          prompt: 'Janela ou corredor?',
          expected: 'Corredor, perto da saída se der.',
        ),
        SpeakTurn(
          prompt: 'Portão 12, em 40 minutos.',
          expected: 'Obrigado, já estou indo.',
        ),
      ],
      grammarNote: GrammarNote(
        rule: {
          UiLang.tr:
              'Aktarmayı kaçırmak: "perder a conexão". "Perder o voo" farklı bir uçuşu ifade eder.',
        },
        goodExample: 'Vou perder a conexão?',
        badExample: 'Vou perder o aeroporto?',
      ),
    ),
    Scenario(
      id: 'pt_exp_client_call',
      lang: LearnLang.pt,
      cefr: Cefr.b1,
      minutes: 9,
      titles: {UiLang.tr: 'Müşteri telefonu', UiLang.en: 'Client phone call'},
      clipLine: 'Você tem cinco minutos agora?',
      phrases: [
        Phrase(
          id: 'pt_exp_call_0',
          target: 'Você tem cinco minutos agora?',
          gloss: {UiLang.tr: 'Şimdi beş dakikanız var mı?'},
        ),
        Phrase(
          id: 'pt_exp_call_1',
          target: 'O item 3 do e-mail de ontem não está claro.',
          gloss: {UiLang.tr: 'Dünkü mailin 3. maddesi net değil.'},
        ),
        Phrase(
          id: 'pt_exp_call_2',
          target: 'Isso entra como extra ou no escopo atual?',
          gloss: {UiLang.tr: 'Bu ek iş mi yoksa mevcut kapsamda mı?'},
        ),
        Phrase(
          id: 'pt_exp_call_3',
          target: 'Se eu entendi errado, me corrija.',
          gloss: {UiLang.tr: 'Yanlış anladıysam düzeltin.'},
        ),
        Phrase(
          id: 'pt_exp_call_4',
          target: 'Resumo: rascunho sexta, comentários segunda.',
          gloss: {UiLang.tr: 'Özet: taslak cuma, yorumlarınız pazartesi.'},
        ),
        Phrase(
          id: 'pt_exp_call_5',
          target: 'Vou registrar por e-mail agora.',
          gloss: {UiLang.tr: 'Şimdi kayıt için mail atıyorum.'},
        ),
      ],
      turns: const [
        SpeakTurn(
          prompt: 'Sem essa função não vamos ao ar.',
          expected: 'Então atrasamos outra parte e puxamos esta.',
        ),
        SpeakTurn(
          prompt: 'Ok, escreve.',
          expected: 'Perfeito, envio em seguida.',
        ),
      ],
      grammarNote: GrammarNote(
        rule: {
          UiLang.tr:
              'Telefon teyidi: "se eu entendi errado" — gerçek koşul + geçmiş algı bildirir.',
        },
        goodExample: 'Se eu entendi errado, me corrija.',
        badExample: 'Si eu entender mal…',
      ),
    ),
    Scenario(
      id: 'pt_exp_hr_salary',
      lang: LearnLang.pt,
      cefr: Cefr.b2,
      minutes: 11,
      titles: {UiLang.tr: 'Maaş görüşmesi', UiLang.en: 'Salary conversation'},
      clipLine: 'Queria falar de desempenho e de mercado.',
      phrases: [
        Phrase(
          id: 'pt_exp_salary_0',
          target: 'Queria falar de desempenho e de mercado.',
          gloss: {
            UiLang.tr: 'Performans ve piyasa hakkında konuşmak istiyorum.',
          },
        ),
        Phrase(
          id: 'pt_exp_salary_1',
          target: 'Nos últimos seis meses entreguei três projetos no prazo.',
          gloss: {
            UiLang.tr: 'Son altı ayda üç projeyi zamanında teslim ettim.',
          },
        ),
        Phrase(
          id: 'pt_exp_salary_2',
          target: 'Minha expectativa é 15%; posso mostrar a base.',
          gloss: {UiLang.tr: 'Beklentim yüzde 15; gerekçesini gösterebilirim.'},
        ),
        Phrase(
          id: 'pt_exp_salary_3',
          target: 'O cargo hoje não reflete o trabalho.',
          gloss: {UiLang.tr: 'Unvan şu an işi yansıtmıyor.'},
        ),
        Phrase(
          id: 'pt_exp_salary_4',
          target: 'Se não houver verba, vamos marcar uma data para o reajuste.',
          gloss: {UiLang.tr: 'Bütçe yoksa zam tarihini netleştirelim.'},
        ),
        Phrase(
          id: 'pt_exp_salary_5',
          target: 'Prefiro a decisão por escrito.',
          gloss: {UiLang.tr: 'Kararın yazılı olmasını tercih ederim.'},
        ),
      ],
      turns: const [
        SpeakTurn(
          prompt: 'Este ano o orçamento está apertado.',
          expected:
              'Entendo. Dá para falar de cargo ou de uma data no meio do ano?',
        ),
        SpeakTurn(
          prompt: 'Revisitamos em março.',
          expected: 'Então marcamos março e alinhamos os critérios hoje.',
        ),
      ],
      grammarNote: GrammarNote(
        rule: {
          UiLang.tr:
              'Resmi tercih: "prefiro a decisão por escrito". "Me manda no Zap só" çok gevşek kaçar.',
        },
        goodExample: 'Prefiro a decisão por escrito.',
        badExample: 'Me manda no Zap só.',
      ),
    ),
    Scenario(
      id: 'pt_exp_daily_errands',
      lang: LearnLang.pt,
      cefr: Cefr.a2,
      minutes: 7,
      titles: {
        UiLang.tr: 'Market ve kargo',
        UiLang.en: 'Errands and deliveries',
      },
      clipLine: 'Duas unidades deste pão e a notinha, por favor.',
      phrases: [
        Phrase(
          id: 'pt_exp_errands_0',
          target: 'Duas unidades deste pão e a notinha, por favor.',
          gloss: {UiLang.tr: 'Bu ekmekten iki tane ve fiş lütfen.'},
        ),
        Phrase(
          id: 'pt_exp_errands_1',
          target: 'Onde fica a prateleira sem glúten?',
          gloss: {UiLang.tr: 'Glütensiz reyon nerede?'},
        ),
        Phrase(
          id: 'pt_exp_errands_2',
          target: 'Não deixem com o vizinho; coloquem um aviso na porta.',
          gloss: {UiLang.tr: 'Komşuya bırakmayın; kapıya not bırakın.'},
        ),
        Phrase(
          id: 'pt_exp_errands_3',
          target: 'Não tenho dinheiro vivo; cartão vale?',
          gloss: {UiLang.tr: 'Nakdim yok; kart geçerli mi?'},
        ),
        Phrase(
          id: 'pt_exp_errands_4',
          target: 'A troca é em 14 dias, certo?',
          gloss: {UiLang.tr: 'İade 14 gün içinde, değil mi?'},
        ),
        Phrase(
          id: 'pt_exp_errands_5',
          target: 'Não preciso de sacola, trouxe bolsa.',
          gloss: {UiLang.tr: 'Poşete gerek yok, çantam var.'},
        ),
      ],
      turns: const [
        SpeakTurn(
          prompt: 'Tem cartão fidelidade?',
          expected: 'Não, desta vez não.',
        ),
        SpeakTurn(
          prompt: 'Não tenho troco, passo no cartão.',
          expected: 'Sem problema, pode passar.',
        ),
      ],
      grammarNote: GrammarNote(
        rule: {
          UiLang.tr:
              'Hizmet cümlesi sonunda "por favor" — çıplak emir kullanılmaz.',
        },
        goodExample: 'A notinha, por favor.',
        badExample: 'Me dá a nota.',
      ),
    ),
    Scenario(
      id: 'pt_exp_networking',
      lang: LearnLang.pt,
      cefr: Cefr.b1,
      minutes: 9,
      titles: {UiLang.tr: 'Networking', UiLang.en: 'Networking'},
      clipLine: 'Sou a Ana, gerente de produto em fintech.',
      phrases: [
        Phrase(
          id: 'pt_exp_networking_0',
          target: 'Sou a Ana, gerente de produto em fintech.',
          gloss: {UiLang.tr: 'Ben Ana, fintech\'te ürün müdürüyüm.'},
        ),
        Phrase(
          id: 'pt_exp_networking_1',
          target: 'O exemplo de pagamento na sua fala ficou muito claro.',
          gloss: {UiLang.tr: 'Konuşmanızdaki ödeme örneği çok netti.'},
        ),
        Phrase(
          id: 'pt_exp_networking_2',
          target: 'Vocês também enfrentam esse tipo de atrito?',
          gloss: {UiLang.tr: 'Sizde de benzer bir sürtüşme var mı?'},
        ),
        Phrase(
          id: 'pt_exp_networking_3',
          target: 'Acabaram os cartões; posso te chamar no LinkedIn?',
          gloss: {
            UiLang.tr: 'Kartvizitim bitti; LinkedIn\'den ulaşabilir miyim?',
          },
        ),
        Phrase(
          id: 'pt_exp_networking_4',
          target: 'Você tem dois minutos? Sou breve.',
          gloss: {UiLang.tr: 'İki dakikanız var mı? Kısa keseceğim.'},
        ),
        Phrase(
          id: 'pt_exp_networking_5',
          target: 'Posso te apresentar a alguém que talvez ajude.',
          gloss: {UiLang.tr: 'Belki yardımcı olacak birini tanıştırabilirim.'},
        ),
      ],
      turns: const [
        SpeakTurn(
          prompt: 'No que você trabalha?',
          expected: 'Cobrança de faturas para pequenos negócios.',
        ),
        SpeakTurn(
          prompt: 'Legal, me escreve.',
          expected: 'Escrevo sim, foi um prazer.',
        ),
      ],
      grammarNote: GrammarNote(
        rule: {
          UiLang.tr:
              'Kimlik cümlesi: "sou gerente". "Estou gerente" geçici bir durum gibi görünür, zayıf kaçar.',
        },
        goodExample: 'Sou gerente de produto.',
        badExample: 'Estou gerente de produto.',
      ),
    ),
  ];
}
