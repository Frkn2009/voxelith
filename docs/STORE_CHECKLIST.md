# VOXELITH Store Release Checklist

Son güncelleme: 29 Eylül 2026. Form cevapları için bkz. `docs/STORE_FORMS.md`.

## Kodda tamam
- [x] Android paket adı `com.voxelith.voxelith`, iOS bundle ID `com.voxelith.voxelith` (widget: `.HomeWidget`, app group: `group.com.voxelith.voxelith`)
- [x] Sürüm `1.0.0+4`
- [x] App ikonu 1024×1024 + Android adaptive icon
- [x] iOS gizlilik bildirimi (`PrivacyInfo.xcprivacy`), izin metinleri (en + tr), ATT metni, `SKAdNetworkItems`, `ITSAppUsesNonExemptEncryption = NO`
- [x] iOS takip izni (ATT) penceresi — UMP izin formundan sonra
- [x] Abonelik ekranı: fiyat mağazadan, otomatik yenileme açıklaması, geri yükle, Koşullar/Gizlilik linkleri, deneme vaadi yalnızca mağazada deneme tanımlıysa
- [x] Uygulama içi hesap silme + web hesap silme sayfası (`site/delete-account.html`)
- [x] Gizlilik politikası ve Kullanım Koşulları (uygulama içi + `site/`), tüm dış servisler listeli
- [x] Klan sohbeti: bildir + engelle; koşullarda sıfır tolerans maddesi
- [x] Ücretli dış servisler kapalı (Anthropic, ElevenLabs, Google Translate) — `lib/core/features.dart` + sunucuda `VOXELITH_PAID_APIS`
- [x] Mağaza metinleri 30 dil (`docs/STORE_METADATA_ALL.md`), ücretsiz süre 30 sn olarak düzeltildi
- [x] Öne çıkan görsel 1024×500, ikon 512×512, gerçek ekran görüntüleri (`store/screenshots/`)
- [x] `flutter analyze` temiz; tüm testler geçiyor — tek istisna `i18n_coverage_test` (UI çevirileri `translate-ui` ile tamamlanınca geçer)

## Bekleyen (bilinçli olarak yapılmadı)
- [ ] Crashlytics: Firebase projesi + `google-services.json` / `GoogleService-Info.plist` gelmeden sahte/yarım entegrasyon yapılmadı.
- [ ] (Artık gerekmiyor) AdMob SSV: ücretli AI kapalı olduğu için reklam ödülü yalnızca konuşma süresi veriyor, maliyet yok.
- [ ] UI + ders içeriği çevirileri: `python3 tools/content_ai.py translate-all` (bkz. docs/AI_ICERIK_PROMPTLARI.md).

## Senin yapman gerekenler

> Tek dosya: `docs/content_tasks/REQUESTS.json` doldur → `python3 tools/apply_config.py`.

- [ ] Şirket adı, alan adı, destek/gizlilik e-postaları → `lib/core/legal_info.dart` + `python3 tools/gen_legal_html.py`
- [ ] `site/` klasörünü alan adında yayınla (privacy, terms, delete-account)
- [ ] AdMob: 2 App ID → `AndroidManifest.xml` + `Info.plist`; 4 reklam birimi → `--dart-define`; `site/app-ads.txt`
- [ ] App Store Connect + Play Console'da abonelik ürünleri (kimlikler `docs/STORE_FORMS.md`'de) ve RevenueCat bağlantısı
- [ ] Apple Developer'da bundle ID `com.voxelith.voxelith`, `com.voxelith.voxelith.HomeWidget` ve App Group `group.com.voxelith.voxelith` oluştur; Xcode'da Team seç
- [ ] keystore yedeği güvenli ortamda (`android/app/upload-keystore.jks` + `android/key.properties`, ikisi de gitignore'da)
- [ ] `flutter build appbundle --release` (ASCII yolda, bkz. CLAUDE.md) ve iOS için Mac'te `flutter build ipa`
- [ ] Data Safety, App Privacy, içerik derecelendirmesi, hedef kitle formları (`docs/STORE_FORMS.md`)
- [ ] Gerçek cihazda son test: mikrofon izni, ATT penceresi, satın alma (sandbox), geri yükleme, hesap silme
- [ ] Destek e-postasını takip et — koşullar bildirimlere 24 saatte yanıt veriyor diyor
