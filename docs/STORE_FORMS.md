# VOXELITH — Mağaza Formları (kopyala-yapıştır cevaplar)

Bu cevaplar koddaki gerçek veri akışına göre hazırlandı (29 Eylül 2026).
Uygulama içi gizlilik metni (`lib/core/l10n/i18n_store.dart` → `privacyBody`),
`site/privacy.html` ve `ios/Runner/PrivacyInfo.xcprivacy` ile **birebir aynı**
kalmalı. Yeni bir SDK / veri akışı eklenirse dördünü birlikte güncelle.

Yer tutucular (yayından önce doldur): şirket adı, `voxelith.app` alan adı,
`destek@` / `gizlilik@` adresleri → hepsi `lib/core/legal_info.dart` +
`python3 tools/gen_legal_html.py`.

---

## Linkler (her iki mağaza)

| Alan | Değer |
|---|---|
| Gizlilik politikası URL | `https://voxelith.app/privacy.html` |
| Kullanım koşulları (EULA) URL | `https://voxelith.app/terms.html` |
| Hesap silme URL (Play zorunlu) | `https://voxelith.app/delete-account.html` |
| Destek URL / e-posta | `https://voxelith.app` · `destek@voxelith.app` |
| app-ads.txt | `https://voxelith.app/app-ads.txt` (AdMob yayıncı kimliği gelince eklenecek) |

`site/` klasörünün tamamı alan adının köküne yayınlanmalı.

---

## Google Play Console

### Uygulama içeriği → Gizlilik politikası
URL: yukarıdaki.

### Uygulama erişimi
"Tüm işlevler özel erişim olmadan kullanılabilir" — hesap zorunlu değil.
(Plus özellikleri için test kullanıcısı gerekmez; Play'in lisans test
hesapları satın almayı ücretsiz dener.)

### Reklamlar
**Evet, uygulamada reklam var** (Google AdMob; ödüllü video + geçiş reklamı).

### İçerik derecelendirmesi (IARC anketi)
- Kategori: **Referans, Haber veya Eğitim**
- Şiddet / korku / cinsellik / küfür / uyuşturucu / kumar: **Hayır**
- Kullanıcılar birbiriyle etkileşim kurabilir mi / içerik paylaşabilir mi:
  **Evet** (klan sohbeti, klan adı, liderlik tablosunda görünen ad)
- Kullanıcının konumunu paylaşıyor mu: **Hayır**
- Dijital ürün satın alma: **Evet** (abonelik)
- Beklenen sonuç: PEGI 3 / ESRB Everyone + "Kullanıcılar Etkileşimde
  Bulunur", "Uygulama İçi Satın Alma" etiketleri.

### Hedef kitle ve içerik
- Hedef yaş grupları: **13-15, 16-17, 18+** (13 yaş altını **seçme** —
  seçilirse Aileler politikası ve çocuklara yönelik reklam kuralları
  devreye girer; gizlilik politikası "13 yaş altına yönelik değil" diyor).
- Uygulama çocukların ilgisini çekebilir mi: **Hayır** (yetişkin/genç dil
  öğrenenlere yönelik).

### Veri güvenliği (Data Safety)
Genel sorular:
- Veri topluyor veya paylaşıyor mu: **Evet**
- Aktarımda şifreleniyor mu: **Evet** (HTTPS)
- Kullanıcı veri silinmesini isteyebilir mi: **Evet** (uygulama içi +
  `delete-account.html`)

| Veri türü | Toplanıyor | Paylaşılıyor | İsteğe bağlı? | Amaç |
|---|---|---|---|---|
| Kişisel bilgi → E-posta adresi | Evet | Hayır | İsteğe bağlı (hesap açarsa) | Uygulama işlevselliği, hesap yönetimi |
| Kişisel bilgi → Kullanıcı kimlikleri | Evet | Hayır | İsteğe bağlı | Uygulama işlevselliği, hesap yönetimi |
| Kişisel bilgi → Ad (görünen ad) | Evet | Hayır | İsteğe bağlı | Uygulama işlevselliği |
| Mesajlar → Diğer uygulama içi mesajlar (klan sohbeti) | Evet | Hayır | İsteğe bağlı | Uygulama işlevselliği |
| Ses → Ses kayıtları | **Hayır** (\*) | — | — | — |
| Uygulama etkinliği → Uygulama etkileşimleri (XP, seri, ilerleme) | Evet | Hayır | İsteğe bağlı | Uygulama işlevselliği |
| Finansal bilgi → Satın alma geçmişi | Evet | Hayır | İsteğe bağlı | Uygulama işlevselliği |
| Cihaz veya diğer kimlikler → Reklam kimliği | Evet | **Evet** (Google AdMob) | Zorunlu değil (ücretsiz sürümde) | Reklam veya pazarlama |
| Konum → Yaklaşık konum | Evet (AdMob, IP'den) | **Evet** (Google AdMob) | — | Reklam veya pazarlama |
| Uygulama bilgileri ve performans → Tanılama | Evet (AdMob SDK) | **Evet** (Google AdMob) | — | Reklam, analiz |

(\*) Konuşma tanıma cihazın kendi servisiyle (Android'de Google) yapılır;
VOXELITH ses kaydını toplamaz, saklamaz veya sunucusuna göndermez. Google
Play'in rehberine göre işletim sistemi hizmetinin işlediği veri geliştirici
tarafından "toplanan" sayılmaz. Ücretli AI/çeviri/ses servisleri kapalı
(lib/core/features.dart) — hiçbir metin bir yapay zekâ veya çeviri
sağlayıcısına gönderilmez.

### İzinler (Play inceleme notu gerekirse)
- `RECORD_AUDIO`: konuşma alıştırmasında telaffuz kontrolü.
- `POST_NOTIFICATIONS`, `RECEIVE_BOOT_COMPLETED`, `WAKE_LOCK`, `VIBRATE`:
  günlük hatırlatıcı bildirimleri (tam zamanlı alarm izni **kullanılmıyor**).
- `com.google.android.gms.permission.AD_ID`: AdMob SDK'sı ekler.

### Yapay zeka ile üretilen içerik
**Hayır.** AI geri bildirim ve canlı sohbet kapalı (sıfır maliyet kararı).
İleride açılırsa (`VOXELITH_PAID_APIS=true`) bu cevap "Evet" olmalı.

### Kullanıcı tarafından oluşturulan içerik (UGC)
- Kullanım koşullarında sıfır tolerans maddesi: var (`terms.html`).
- Uygulama içi bildirme: var (klan sohbeti mesajına uzun bas → Bildir).
- Kullanıcı engelleme: var (klan sohbeti → Engelle).
- Bildirimlere 24 saat içinde yanıt verme taahhüdü koşullarda yazıyor —
  **destek e-postasını gerçekten takip et.**

### Finans / sağlık / hükümet / haber beyanları
Hepsi **Hayır**.

---

## App Store Connect

### App Privacy ("Uygulama Gizliliği") — Veri Türleri

"Takip için kullanılan veriler" (**Tracking**):
- Tanımlayıcılar → **Cihaz Kimliği** (IDFA, yalnızca ATT izni verilirse) —
  Üçüncü taraf reklamcılık
- Kullanım Verileri → **Reklam Verileri** — Üçüncü taraf reklamcılık
- Konum → **Yaklaşık Konum** — Üçüncü taraf reklamcılık

"Size bağlı veriler" (**Linked to you**, takip için değil):
- İletişim Bilgileri → **E-posta Adresi** — Uygulama İşlevselliği
- Tanımlayıcılar → **Kullanıcı Kimliği** — Uygulama İşlevselliği
- Kullanıcı İçeriği → **Diğer Kullanıcı İçeriği** (klan sohbeti) — Uygulama İşlevselliği
- Kullanıcı İçeriği → **Oyun İçeriği** (XP, seri, ilerleme) — Uygulama
  İşlevselliği
- Satın Almalar → **Satın Alma Geçmişi** — Uygulama İşlevselliği

"Ses verisi": **Toplanmıyor** (konuşma tanıma Apple'ın `SFSpeechRecognizer`
servisiyle yapılır; ses VOXELITH sunucularına gitmez ve saklanmaz).

Bu liste `ios/Runner/PrivacyInfo.xcprivacy` ile aynıdır.

### Yaş derecelendirmesi
- Tüm içerik soruları (şiddet, korku, cinsellik vb.): **Yok**
- Kullanıcı tarafından oluşturulan içerik / kullanıcılar arası iletişim:
  **Evet**
- Sınırsız web erişimi: **Hayır**
- AI sohbet botu: **Hayır**
- Beklenen sonuç: **13+**

### Şifreleme (Export Compliance)
`Info.plist` → `ITSAppUsesNonExemptEncryption = NO` ayarlandı (yalnızca
standart HTTPS). Yükleme sırasında soru sorulmaz.

### Abonelikler
- Abonelik grubu: "VOXELITH Plus" — ürün kimlikleri koddakiyle **aynı**
  olmalı: `voxelo_plus_monthly`, `voxelo_plus_yearly`, `voxelo_plus_family`,
  (Business planı kapalı — `voxelo_business_*` ürünlerini oluşturma)
  (`lib/features/plus/domain/entitlement.dart`). Aynı kimlikleri Play
  Console'da ve RevenueCat'te de kullan.
- Her ürün için görünen ad + açıklama + inceleme ekran görüntüsü (abonelik
  ekranının görüntüsü) gerekir.
- App Store açıklamasının sonuna şu satırları ekle (Apple 3.1.2):
  `Terms of Use (EULA): https://voxelith.app/terms.html`
  `Privacy Policy: https://voxelith.app/privacy.html`

### App Review notu (kopyala-yapıştır, İngilizce)
```
VOXELITH works without an account. All core features (speaking practice,
alphabet, library, games, review) are available immediately after the
short onboarding.

Speaking practice uses the microphone and Apple speech recognition only
while the user is practising. The free tier includes 30 seconds of
speaking per day; a rewarded ad adds 30 seconds (max 5 per day).

VOXELITH Plus subscriptions are auto-renewable subscriptions purchased via
StoreKit (RevenueCat). Prices shown in the app come from StoreKit.
"Restore purchases", Terms of Use and Privacy Policy links are on the
subscription screen.

Account deletion: You tab → Delete account (deletes server account).
User-generated content (clan chat): long-press a message to Report or
Block. The app does not use generative AI; pronunciation scoring,
translation and text-to-speech run on the device.

Ads: Google AdMob, shown only to free users, after the UMP consent form
and the App Tracking Transparency prompt.
```

---

## Mağaza görselleri

Eski NURA görselleri silindi. Güncel görseller `store/screenshots/`
(uygulamanın gerçek ekranlarından) ve `store/feature_graphic_1024x500.png`.

| Mağaza | Gereken | Klasör |
|---|---|---|
| App Store iPhone 6.9" | 1290×2796 | `store/screenshots/ios_6.9/` |
| Google Play telefon | 1080×1920 | `store/screenshots/play_phone/` |
| Google Play öne çıkan görsel | 1024×500 | `store/feature_graphic_1024x500.png` |
| Uygulama ikonu | 1024×1024 (App Store), 512×512 (Play) | `store/icon.png`, `store/icon_512.png` |
