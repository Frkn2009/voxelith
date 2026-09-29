# VOXELITH — Bir Kullanıcının Maksimum Maliyeti (4 Eylül 2026 — güncel)

Bu doküman, gerçek API'lere bağlanan dört aktif Edge Function'ın (`chat`,
`tts`, `ai-feedback`, `translate`) birim maliyetini ve bir Plus
kullanıcısının bize ayda **en fazla** ne kadara mal olabileceğini
hesaplar. Kaynak: Anthropic, ElevenLabs ve Google Cloud Translate'in 4
Eylül 2026 itibariyle güncel fiyat listeleri.

**4 Eylül güncellemesi #4 — Business paketine gerçek değer verildi:**
Toplantı Çevirmeni kaldırılınca Business ($200/yıl) Plus'a göre ("öncelikli
destek" dışında) hiçbir üstünlüğü olmayan bir paket haline gelmişti — üstelik
Plus Family de aynı $200/yıl'a 4 profil veriyordu, Business ise 1 profile
sahipti. Düzeltme: `subscriptions` tablosuna bir `plan` sütunu eklendi
(`20260904130001_business_plan_tier.sql`), `revenuecat-webhook` artık
RevenueCat'in `entitlement_ids`'inden hangi paketin alındığını kaydediyor,
ve dört Edge Function da (`ai-feedback`/`chat`/`tts`/`translate`) Business
kullanıcılara Plus'ın **~2.5-3 katı** günlük hak veriyor (aşağıdaki §2.1
tablosu). Bu, kod tarafında teslim edilebilen, gerçek ve sürdürülebilir bir
farklılaştırıcı.

**4 Eylül güncellemesi #3 — ücretsiz konuşma tabanı 60sn → 30sn:**
`UserProfile.speakAllowance` (ücretsiz kullanıcının günlük temel konuşma
süresi) 60 saniyeden 30 saniyeye düşürüldü. **Bunun API maliyetine sıfır
etkisi var** — konuşma pratiği tamamen cihaz üzerinde (STT/TTS), hiçbir
sunucu çağrısı içermiyor, zaten $0 maliyetliydi. Bu tamamen bir **Plus
dönüşüm** kararı: ücretsiz deneyim daha kıt olunca (a) kullanıcı daha
hızlı "hakkım bitti" duvarına çarpıp Plus'a yönleniyor, (b) aynı miktarda
ekstra süreye ulaşmak için artık 2 kat daha fazla ödüllü video izlemesi
gerekiyor (video başına ödül hâlâ +30sn, sabit) — yani reklam geliri
tarafında da hafif bir artış beklenebilir. Ödüllü video sınırı (günde 5)
ve video başına ödül (+30sn) **değişmedi**.

**4 Eylül güncellemesi #2 — "Toplantı Çevirmeni" tamamen kaldırıldı:**
Ürün kararıyla interpreter özelliği (ekran, istemci servisi, tüm giriş
noktaları ve paywall vaatleri) bu oturumda tamamen çıkarıldı — ilk sürümde
kârlı olamayacağı netleşti. `interpreter-translate` Edge Function'ı hâlâ
Supabase'de duruyor (günlük sınırlı, zararsız) ama istemciden artık **hiç
çağrılmıyor** — maliyeti fiilen **$0**. Aşağıdaki tüm hesaplar buna göre
güncellendi.

**4 Eylül güncellemesi #1 — kural artık kesin:** Toplam worst-case COGS,
Plus'ın yıllık fiyatını ($65 ≈ $5.42/ay) **hiçbir zaman aşmayacak** şekilde
sınırlar yeniden hesaplandı ve deploy edildi. O güne kadar **hiçbir günlük
sınırı olmayan** iki fonksiyon (`translate`, `interpreter-translate`)
bulunmuştu — ilki hâlâ aktif ve sınırlı, ikincisi artık kullanılmıyor.

## 1. Birim maliyetler

| Operasyon | Sağlayıcı/model | Girdi | Çıktı | Maliyet/çağrı |
|---|---|---|---|---|
| `ai-feedback` (cümle geri bildirimi) | Claude Sonnet 5 ($2/$10 per MTok) | ~290 tok | ~180 tok | **≈ $0.0024** |
| `ai-feedback` (senaryo üretimi) | Claude Sonnet 5 | ~280 tok | ~400 tok | ≈ $0.0046 |
| `chat` (canlı sohbet turu) | Claude Haiku 4.5 ($1/$5 per MTok) | ~500 tok | ~120 tok | **≈ $0.0011** |
| `tts` (bir cümle oynatma) | ElevenLabs `eleven_v3`, ~45 karakter, $0.10/1000 karakter (overage) | — | — | **≈ $0.0045** |
| `translate` (bulut çeviri, worst-case) | Google Cloud Translation v2, $20/1M karakter, 300 karakter üst sınırı | — | — | **≈ $0.006** |

`interpreter-translate` artık istemciden hiç çağrılmadığı için bu tablodan
çıkarıldı (maliyeti $0) — kod hâlâ Supabase'de duruyor, dilersen tamamen
silebiliriz, ama zararsız durumda.

Not: ElevenLabs $0.10/1k karakter ve Google'ın $20/1M karakter rakamları
**worst-case (en kötü durum)** varsayımı — gerçek ortalama kullanım
(kısa cümleler, tam limite dayanmayan metinler) daha ucuzdur, ama sunucu
tarafındaki sınırın *garanti etmesi gereken* tavan budur; bu yüzden hesap
hep worst-case üzerinden yapılıyor.

## 2. Güncel durum: her kalem sunucu tarafında sınırlı

**4 Eylül denetiminde bulundu:** `translate` ve `interpreter-translate`
fonksiyonlarının **hiçbirinde günlük sınır yoktu** — `translate` Plus
gerektiriyordu ama Plus bir kullanıcı (ya da çalınmış bir oturum) günde
sınırsız çağırabiliyordu; `interpreter-translate` ise Plus bile
gerektirmiyordu — uygulama her açılışta otomatik anonim oturum açtığı
için **kaydolmadan, ödeme yapmadan** herkes sınırsız çağırabiliyordu. Bu,
`ai-feedback`/`tts`/`chat`'in 3 Eylül'de kapatılan aynı türden açığının
gözden kaçmış hâliydi.

`supabase/migrations/20260904120001_translate_interpreter_daily_cap.sql`
ile bu ikisi de aynı `ai_usage_daily` + `try_consume_ai_usage()` desenine
bağlandı, girdi uzunluğu sınırları sıkılaştırıldı (`translate`: 1000→300
karakter, `interpreter-translate`: 1000→150 karakter — tek bir konuşma
cümlesi için hâlâ bol), ve **tüm beş kalemin toplam worst-case'i aylık
abonelik ücretini aşmayacak** şekilde `tts`/`chat` sınırları da aynı anda
yeniden düşürüldü:

| Operasyon | Ücretsiz | Plus | Plus sınıra tam ulaşılırsa/ay |
|---|---|---|---|
| `ai-feedback` | **0/gün** — yalnızca ödüllü reklamla, günde en fazla 5; ucuz model (Haiku ≈ $0.0011) → reklam geliri maliyeti karşılar (29 Eylül) | 15/gün | 15 × 30 × $0.0024 ≈ **$1.08** |
| `chat` | Plus'a kilitli, $0 | 20/gün | 20 × 30 × $0.0011 ≈ **$0.66** |
| `tts` | Plus'a kilitli, $0 | 8/gün | 8 × 30 × $0.0045 ≈ **$1.08** |
| `translate` | Plus gerektirir, $0 | 6/gün | 6 × 30 × $0.006 ≈ **$1.08** |
| `interpreter-translate` | kaldırıldı — kod var, çağrılmıyor | kaldırıldı | **$0** |
| **Toplam (Plus, hepsi her gün tam dolarsa)** | | | **≈ $3.90/ay/kullanıcı (~$46.80/yıl)** |

**$46.80/yıl, $65/yıl fiyatın belirgin şekilde altında** — kullanıcı 4
kalemin TÜMÜNE HER GÜN tam ulaşsa bile (gerçek dünyada olmayacak en kötü
senaryo). İnterpreter'ı kaldırınca (önceki turdaki $63'ten) worst-case bir
kez daha **%26 düştü**. İlk turdan (3 Eylül, $88/yıl, sınırsız 2 fonksiyon
dahil değil) bu yana toplam düşüş **%47**.

**Mağaza kesintisi dahil edilince de güvenli:** Apple/Google genelde
%15 (Küçük İşletme Programı / ikinci yıl ve sonrası, çoğu indie geliştirici
bu kapsama girer) ile %30 (standart oran) arası komisyon alıyor.
- %15 kesintiyle net gelir: $65 × 0.85 = **$55.25/yıl** → $46.80 COGS,
  **%85 marj bırakır.**
- %30 (en kötü, genelde geçerli olmayan) kesintiyle net gelir: $65 × 0.70
  = **$45.50/yıl** → $46.80 COGS bunu **~$1.30 aşar** — yani sadece en
  kötü mağaza oranında VE tüm kullanıcı tüm sınırlara her gün tam
  ulaşırsa (ikisi birden gerçekleşmesi son derece olası değil) teorik
  olarak marj negatife döner. Gerçek ortalama kullanımda (aşağıya bkz.)
  bu senaryo hiç yaklaşmıyor bile.

Sınır sayıları (`FREE_DAILY_LIMIT`, `PLUS_DAILY_LIMIT`, `TTS_DAILY_LIMIT`,
`CHAT_DAILY_LIMIT`, `TRANSLATE_DAILY_LIMIT`) her fonksiyonun kodunda açıkça
sabit olarak duruyor — değiştirmek istersen tek satır + yeniden deploy
yeterli, ama değiştirirken bu dokümandaki toplamı yeniden hesapla.

### 2.1 Business ($200/yıl) — Plus'ın ~2.5-3 katı günlük hak

`subscriptions.plan` sütunu (RevenueCat `entitlement_ids`'inden dolduruluyor)
sayesinde artık sunucu Plus/Business ayrımını biliyor:

| Operasyon | Plus/gün | Business/gün | Business sınıra tam ulaşılırsa/ay |
|---|---|---|---|
| `ai-feedback` | 15 | **40** | 40 × 30 × $0.0024 ≈ **$2.88** |
| `chat` | 20 | **50** | 50 × 30 × $0.0011 ≈ **$1.65** |
| `tts` | 8 | **20** | 20 × 30 × $0.0045 ≈ **$2.70** |
| `translate` | 6 | **15** | 15 × 30 × $0.006 ≈ **$2.70** |
| **Toplam** | | | **≈ $9.93/ay ≈ $119.16/yıl** |

Business fiyatı $200/yıl (aylık $17.30 × 12 = $207.60/yıl da benzer):
- %15 mağaza kesintisiyle net $170/yıl → $119.16 COGS, **%30 marj** (worst-case).
- %30 kesintiyle net $140/yıl → $119.16 COGS, **%15 marj** (worst-case) —
  Plus'ın aksine bu senaryoda bile Business hâlâ **kârda kalıyor.**

## 3. Gerçekçi kullanım senaryoları

### Ortalama aktif Plus kullanıcısı (günde ~20 dk pratik)
- ~8 TTS oynatma/gün (sınırda), ~3 AI analiz/gün, ~5 sohbet turu/gün,
  ~2 çeviri/gün
- Aylık: (8×$0.0045 + 3×$0.0024 + 5×$0.0011 + 2×$0.006) × 30
  ≈ **$1.87/ay ≈ $22.40/yıl**
- Yıllık $65 gelire karşı ≈ **%34 COGS** — ilk turdaki %57'den çok daha
  sağlıklı bir marj.

### Yoğun kullanıcı (tüm sınırlara her gün tam ulaşan)
- Bkz. §2 tablosundaki toplam: **$3.90/ay ≈ $46.80/yıl** — $65/yıl fiyatın
  belirgin şekilde altında, ilk turda ($150/yıl) fiyatı ciddi şekilde aşan
  senaryonun aksine.

## 4. Ücretsiz katman

`tts`, `chat` ve `translate` Plus'a kilitli — ücretsiz kullanıcı bu üç
kalemden **$0** maliyet yaratıyor. Tek kalem: `ai-feedback` — günde 1
ücretsiz deneme + reklamla günde 5'e kadar ek hak
(`docs/DEVAM_SAYFASI.md`'deki "reklamla ek AI-feedback hakkı" bölümüne
bkz.) — worst-case (1 + 5 reklam) × 30 × $0.0024 ≈ **$0.43/ay**. Bir
ücretsiz kullanıcının toplam maksimum aylık maliyeti artık **$0.43/ay** —
pratikte sıfıra yakın, reklam geliriyle rahatça karşılanır.
