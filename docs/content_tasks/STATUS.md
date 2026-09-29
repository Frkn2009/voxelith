# İçerik durumu

_Bu dosya `python3 tools/content_ai.py status` ile üretilir; elle düzenleme._

## 1. Arayüz (UI) metinleri — lib/core/l10n/i18n*.dart

Bir anahtar "tam" sayılır: 30 dilin hepsinde değer var, boş değil ve
yer tutucuları İngilizce kaynakla birebir aynı. Eksik diller çalışma
anında İngilizceye düşer (güvenlik ağı).

| Dosya | Toplam | 30/30 tam | Eksik | Boş | Yer tutucu hatası | İngilizceye düşecek değer |
|---|---|---|---|---|---|---|
| `i18n.dart` | 145 | 145 | 0 | 0 | 0 | 0 |
| `i18n_ui.dart` | 334 | 221 | 113 | 0 | 0 | 2871 |
| `i18n_store.dart` | 44 | 31 | 13 | 0 | 0 | 354 |

**Toplam eksik UI çevirisi (anahtar × dil): 3225**

| Dil | Eksik UI anahtarı |
|---|---|
| es | 53 |
| de | 53 |
| fr | 53 |
| nl | 126 |
| ar | 126 |
| pt | 53 |
| it | 115 |
| ru | 126 |
| zh | 126 |
| ja | 126 |
| ko | 126 |
| pl | 126 |
| sv | 126 |
| da | 126 |
| no | 126 |
| fi | 126 |
| el | 126 |
| cs | 126 |
| ro | 126 |
| hu | 126 |
| hi | 126 |
| th | 126 |
| vi | 126 |
| id | 126 |
| uk | 126 |
| he | 126 |
| fa | 126 |
| sw | 126 |

## 2. Ders içeriği — senaryolar ve hikâyeler

Hedef (her öğrenilen dil): senaryo {'a1': 24, 'a2': 16, 'b1': 12, 'b2': 8}, hikâye {'a1': 4, 'a2': 4, 'b1': 3, 'b2': 3}.
Kaynak: Dart içerik dosyaları (docs/content_tasks/source) + assets/content/packs.

| Dil | A1 | A2 | B1 | B2 | Hikâye A1/A2/B1/B2 | Hedefe eksik senaryo |
|---|---|---|---|---|---|---|
| tr | 19 | 5 | 6 | 1 | 3/0/0/0 | 29 |
| en | 19 | 1 | 4 | 3 | 3/0/0/0 | 33 |
| es | 21 | 1 | 4 | 3 | 3/0/0/0 | 31 |
| de | 19 | 1 | 4 | 3 | 3/0/0/0 | 33 |
| fr | 19 | 1 | 4 | 3 | 3/0/0/0 | 33 |
| nl | 19 | 1 | 4 | 3 | 3/0/0/0 | 33 |
| ar | 19 | 1 | 4 | 3 | 3/0/0/0 | 33 |
| pt | 19 | 5 | 6 | 1 | 3/0/0/0 | 29 |
| it | 19 | 5 | 6 | 1 | 3/0/0/0 | 29 |
| ru | 19 | 0 | 0 | 0 | 3/0/0/0 | 41 |
| zh | 19 | 0 | 0 | 0 | 3/0/0/0 | 41 |
| ja | 19 | 5 | 6 | 1 | 3/0/0/0 | 29 |
| ko | 19 | 0 | 0 | 0 | 3/0/0/0 | 41 |
| pl | 19 | 5 | 6 | 1 | 3/0/0/0 | 29 |
| sv | 19 | 5 | 6 | 1 | 3/0/0/0 | 29 |
| da | 19 | 5 | 6 | 1 | 3/0/0/0 | 29 |
| no | 19 | 5 | 6 | 1 | 3/0/0/0 | 29 |
| fi | 19 | 5 | 6 | 1 | 3/0/0/0 | 29 |
| el | 19 | 5 | 6 | 1 | 3/0/0/0 | 29 |
| cs | 19 | 5 | 6 | 1 | 3/0/0/0 | 29 |
| ro | 19 | 5 | 6 | 1 | 3/0/0/0 | 29 |
| hu | 19 | 5 | 6 | 1 | 3/0/0/0 | 29 |
| hi | 19 | 5 | 6 | 1 | 3/0/0/0 | 29 |
| th | 19 | 5 | 6 | 1 | 3/0/0/0 | 29 |
| vi | 19 | 0 | 0 | 0 | 3/0/0/0 | 41 |
| id | 19 | 0 | 0 | 0 | 3/0/0/0 | 41 |
| uk | 19 | 0 | 0 | 0 | 3/0/0/0 | 41 |
| he | 19 | 0 | 0 | 0 | 3/0/0/0 | 41 |
| fa | 19 | 0 | 0 | 0 | 3/0/0/0 | 41 |
| sw | 19 | 0 | 0 | 0 | 3/0/0/0 | 41 |

## 3. Ders içeriği çevirileri (arayüz diline göre)

Cümle anlamları, senaryo başlıkları, konuşma yönergeleri, gramer kuralları,
hikâye başlık ve cümleleri. Dart'taki değer veya assets/content/i18n/<dil>.json.

| Arayüz dili | Doluluk |
|---|---|
| tr | %73 (8975/12226) |
| en | %55 (4948/8975) |
| es | %0 (8/12226) |
| de | %0 (8/12226) |
| fr | %0 (8/12226) |
| nl | %0 (8/12226) |
| ar | %0 (8/12226) |
| pt | %0 (0/12226) |
| it | %0 (0/12226) |
| ru | %0 (0/12226) |
| zh | %0 (0/12226) |
| ja | %0 (0/12226) |
| ko | %0 (0/12226) |
| pl | %0 (0/12226) |
| sv | %0 (0/12226) |
| da | %0 (0/12226) |
| no | %0 (0/12226) |
| fi | %0 (0/12226) |
| el | %0 (0/12226) |
| cs | %0 (0/12226) |
| ro | %0 (0/12226) |
| hu | %0 (0/12226) |
| hi | %0 (0/12226) |
| th | %0 (0/12226) |
| vi | %0 (0/12226) |
| id | %0 (0/12226) |
| uk | %0 (0/12226) |
| he | %0 (0/12226) |
| fa | %0 (0/12226) |
| sw | %0 (0/12226) |

## 4. Yasal bilgiler (AB/GDPR) — lib/core/legal_info.dart

Hollanda şirketi. `[İŞARET]` duran alan henüz girilmemiş demektir;
bunlar dururken uygulama ve site yayınlanmamalı.

- **LEGAL_COMPANY_NAME** eksik (`companyLegalName`)
- **REGISTERED_ADDRESS** eksik (`companyAddress`)
- **KVK_NUMBER** eksik (`kvkNumber`)
- **VAT_NUMBER** eksik (`vatNumber`)
- **SUPPORT_EMAIL** eksik (`supportEmail`)
- **PRIVACY_EMAIL** eksik (`privacyEmail`)

## 5. Mağaza metinleri — docs/STORE_METADATA_*.md

Her dilin bölümü var mı ve kapalı (ücretli) özellik vaadi — AI, sohbet botu,
premium ses — içeriyor mu. Karakter sınırları `store` komutunda denetlenir.

| Dil | Durum | Bulunan ifade |
|---|---|---|
| tr | tamam |  |
| en | tamam |  |
| es | kapalı özellik vaadi | IA |
| de | kapalı özellik vaadi | KI |
| fr | kapalı özellik vaadi | IA |
| nl | kapalı özellik vaadi | AI |
| ar | kapalı özellik vaadi | الذكاء الاصطناعي |
| pt | kapalı özellik vaadi | IA |
| it | kapalı özellik vaadi | IA |
| ru | kapalı özellik vaadi | ИИ |
| zh | kapalı özellik vaadi | AI |
| ja | kapalı özellik vaadi | AI |
| ko | kapalı özellik vaadi | AI |
| pl | kapalı özellik vaadi | AI |
| sv | kapalı özellik vaadi | AI |
| da | kapalı özellik vaadi | AI |
| no | kapalı özellik vaadi | AI |
| fi | kapalı özellik vaadi | Tekoäly |
| el | kapalı özellik vaadi | premium |
| cs | kapalı özellik vaadi | AI |
| ro | kapalı özellik vaadi | IA |
| hu | kapalı özellik vaadi | AI |
| hi | kapalı özellik vaadi | AI |
| th | kapalı özellik vaadi | AI |
| vi | kapalı özellik vaadi | AI |
| id | kapalı özellik vaadi | AI |
| uk | kapalı özellik vaadi | ШІ |
| he | kapalı özellik vaadi | פרימיום |
| fa | kapalı özellik vaadi | هوش مصنوعی |
| sw | kapalı özellik vaadi | AI |

**Mağaza metni temiz dil: 2/30**

## Bekleyen (kod dışı) işler

- Crashlytics: Firebase projesi ve `google-services.json` / `GoogleService-Info.plist` gelene kadar eklenmedi.
