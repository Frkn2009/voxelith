# VOXELITH — Başka yapay zekâ ile içerik doldurma

> **Başlangıç noktası:** `docs/content_tasks/REQUESTS.json` — senden
> gereken bilgiler (doldur → `python3 tools/apply_config.py`) ve sırayla
> çalıştırılacak yapay zekâ işleri. Mağaza metni: `python3 tools/content_ai.py store`
> (28 dil, İngilizce kaynaktan; karakter sınırı ve "AI / premium ses" vaadi
> kontrol edilir, uymayan dil yazılmaz).

Hedef: 30 öğrenilen dilin hepsi **dolu dolu** (A1 24, A2 16, B1 12, B2 8
senaryo + seviye başına 3–4 okuma hikâyesi) ve tüm içerik **30 arayüz
dilinin hepsinde** çevrili. Güncel doluluk: `docs/content_tasks/STATUS.md`
(`python3 tools/content_ai.py status` ile yenilenir).

Ölçek: bugün 30 dilde **9.466** çevrilecek metin var; hedeflere ulaşınca
yaklaşık 25.000. Bunun 29 dile çevirisi ≈ 700.000 çeviri demek. Sohbet
penceresine elle yapıştırarak bitmez. Bu yüzden iki yol var:

## Yol A — Otomatik (önerilen)

`tools/content_ai.py` OpenAI uyumlu **her** servisle çalışır. Ucuz bir
model seç, anahtarını ver, çalıştır. Script her adımı doğrular (bozuk JSON,
eksik çeviri, A1 tekrarı, yanlış id → reddeder), dosyaya hemen yazar ve
yarıda kalırsa aynı komutla kaldığı yerden devam eder.

```bash
# 1) Servis seç (örnekler — birini kullan)
export AI_BASE_URL=https://api.deepseek.com/v1          AI_MODEL=deepseek-chat
export AI_BASE_URL=https://generativelanguage.googleapis.com/v1beta/openai  AI_MODEL=<gemini flash model adı>
export AI_BASE_URL=https://openrouter.ai/api/v1         AI_MODEL=<openrouter model adı>
export AI_BASE_URL=https://api.openai.com/v1            AI_MODEL=<ucuz openai modeli>
export AI_API_KEY=<anahtarın>

# 2) Önce yeni içerik (senaryo + hikâye), hedeflere kadar — tüm diller
python3 tools/content_ai.py fill-all            # önce --dry-run ile ne yapacağını gör

# 3) Sonra çeviriler — önce UI, sonra ders içeriği; önce en, tr, sonra kalan 28 dil
python3 tools/content_ai.py translate-all

# 4) Durumu gör, sonra Claude Code'a "içerik hazır, kontrol et" de
python3 tools/content_ai.py status
```

- Sırası önemli: önce `fill-all`, sonra `translate-all` — böylece yeni
  eklenen içerik de çevrilir.
- Kalite için öneri: üretim (`fill-all`) için daha güçlü bir model,
  çeviri (`translate-all`) için ucuz/hızlı bir model kullan. `AI_MODEL`'i
  komut öncesi değiştirmen yeterli.
- Tek dil / tek arayüz dili: `fill --lang ru`, `translate --ui es`,
  `translate --ui es --lang ru`.
- Model JSON modunu desteklemiyorsa `export AI_JSON_MODE=0`.
- Maliyet kabaca (modele göre çok değişir): ucuz "flash/mini" sınıfı bir
  modelle tamamı onlarca dolar mertebesinde; güçlü modelle katları.
  Önce tek bir dilde (`fill --lang sw`, `translate --ui es --lang sw`)
  deneyip faturaya bak.

## Arayüz (UI) metinleri — 30 dilin hepsi

Buton, başlık, abonelik, gizlilik/koşullar ve bildirim metinleri
`lib/core/l10n/i18n.dart`, `i18n_ui.dart`, `i18n_store.dart` içindeki
`t({...})` haritalarındadır. Script eksik dilleri **doğrudan bu Dart
dosyalarına** yazar; uygulama normal kullanımda hiçbir dilde İngilizce
yedeğe düşmez (yedek yalnızca güvenlik ağı olarak kalır).

```bash
python3 tools/content_ai.py translate-ui              # 30 dilin tüm eksikleri
python3 tools/content_ai.py translate-ui --ui ja      # yalnızca Japonca
python3 tools/content_ai.py translate-ui --ui ja --dry-run   # ne yapacağını göster
python3 tools/content_ai.py translate-all             # önce UI, sonra ders içeriği
python3 tools/content_ai.py status                    # kapsama raporu (STATUS.md)
```

**Doğrulama** — her cevap yazılmadan önce kontrol edilir; bir öğe şu
durumlarda reddedilir ve dosyaya **yazılmaz**:
eksik anahtar · boş/yalnız boşluk · bozuk JSON · başka anahtarın metni ·
`{days}`, `{price}`, `{LegalInfo.privacyEmail}` gibi yer tutucuların
kaybı/eklenmesi/değişmesi · `%s`/`%d` uyumsuzluğu · satır sonu sayısının
değişmesi · `• → ✓ ✗ < > * _ # @ |` gibi biçim karakterlerinin bozulması ·
e-posta/URL değişmesi · İngilizce kaynağın aynen kopyalanması · Latin
dışı alfabeli dillerde (ja, zh, ko, ru, uk, ar, fa, he, hi, th, el) o
alfabenin hiç kullanılmaması. Kısa marka/evrensel ifadeler (VOXELITH, Plus,
XP, A1–B2, "Email" …) İngilizceyle aynı kalabilir.

Hukuk/abonelik metinleri (`i18n_store.dart`, gizlilik, koşullar, deneme,
fiyat, geri yükleme) `legal` olarak işaretlenir; prompt anlam eklemeyi,
çıkarmayı ve özetlemeyi açıkça yasaklar.

**Hata ve devam:** reddedilen öğeler aynı istekte bir kez yeniden
denenir; yine olmazsa `.content_ai/rejected_<dil>.json` dosyasına
nedeniyle yazılır (git'e girmez) ve eksik kalır. Komutu yeniden
çalıştırmak yalnızca eksikleri ister; dolu çeviriler yeniden üretilmez,
dosya yapısı bozulmaz (yazmadan önce dosya yeniden çözümlenip mevcut
değerlerin değişmediği doğrulanır). Yarıda kesilirse aynı komutu tekrar
çalıştır.

**Elle:**
```bash
python3 tools/content_ai.py prompt translate-ui --ui ja > prompt.txt
python3 tools/content_ai.py import cevap.json --ui ja
```
`import --ui` hem UI anahtarlarını (`i18n_ui:alan#0` biçimi) hem ders
anahtarlarını (`p.` `s.` `g.` `tp.` `st.` `ss.` `al.` `gd.`) tanır, aynı
doğrulamadan geçirir.

Kapsama testi: `test/i18n_coverage_test.dart` 30 dilin hepsini ister;
eksik varsa hangi anahtar/dil olduğunu listeleyerek başarısız olur.
Script testleri: `python3 -m unittest discover -s tools -p 'test_*.py'`.

**Güvenlik:** API anahtarı yalnızca ortam değişkeninden (`AI_API_KEY`)
okunur, hiçbir dosyaya ya da loga yazılmaz. `.env`, `.content_ai/`
`.gitignore`'dadır.

## Yol B — Elle (sohbet penceresine yapıştırarak)

Script, verisi içine gömülü hazır prompt'u üretir; sen kopyalayıp istediğin
yapay zekâya yapıştırırsın, cevabı dosyaya kaydedip içe aktarırsın:

```bash
# Yeni senaryo prompt'u (örnek: Rusça A2, 3 ders)
python3 tools/content_ai.py prompt generate --lang ru --level a2 --count 3 > prompt.txt
#   → prompt.txt'yi yapay zekâya yapıştır, cevabı cevap.json olarak kaydet
python3 tools/content_ai.py import cevap.json --pack ru

# Okuma hikâyesi prompt'u
python3 tools/content_ai.py prompt stories --lang ru --level a2 --count 2 > prompt.txt
python3 tools/content_ai.py import cevap.json --pack ru

# Çeviri prompt'u (örnek: İspanyolca arayüz, Rusça dersleri, 60'ar metin)
python3 tools/content_ai.py prompt translate --ui es --lang ru > prompt.txt
python3 tools/content_ai.py import cevap.json --ui es
#   aynı komutu tekrarla — her seferinde sıradaki eksik 60 metni verir
```

## Prompt şablonları (scriptin gönderdiği metnin aynısı)

Script bunları otomatik doldurur; burada neyin istendiğini görmen için.

### 1. Yeni ders (senaryo) üretimi

```
Create {N} NEW speaking lessons for learners of {DİL} at CEFR {SEVİYE}.
{seviye kuralı — ör. A2: 6-12 words, past and future, simple connectors, polite requests}
Pick topics from: {seviyenin konu listesi}.
Do NOT repeat these existing lessons: {mevcut ders başlıkları}
Every lesson must teach NEW sentences (not reuse beginner phrases like "thank you",
"I don't understand"). Glosses must be accurate. The grammarNote.badExample must be
genuinely ungrammatical, not an acceptable alternative.

Rules:
- The app's voice is FEMALE. In languages where the speaker's gender changes the
  words always use the female first-person form. Never write two forms with "/".
- Natural, everyday, adult language a native speaker would really say.
- Respond with ONE valid JSON object only. No markdown, no comments.

Output exactly this JSON shape:
{"scenarios": [{ "id", "cefr", "minutes", "titles": {"tr","en"}, "clipLine",
  "grammarNote": {"rule": {"tr","en"}, "goodExample", "badExample"},
  "phrases": [6-8 × {"id", "target", "gloss": {"tr","en"}, "hint"}],
  "turns": [4-6 × {"prompt": "<English stage direction>", "expected": "<a phrase target>"}] }]}
```

### 2. Okuma hikâyesi üretimi

```
Write {N} NEW short reading stories for learners of {DİL} at CEFR {SEVİYE}.
Everyday adult topics, a little humour or warmth, a clear beginning and end.
Do NOT repeat: {mevcut hikâyeler}
{aynı kurallar}
Output: {"stories": [{ "id", "level", "title" (hedef dilde), "titles": {"tr","en"},
  "sentences": [6-10 × {"target", "gloss": {"tr","en"}}] }]}
```

### 3. Çeviri

```
Translate app content of a language-learning app into {ARAYÜZ DİLİ}.
The learner is studying {DİL}. Each row has "target" (the sentence being learned —
translate ITS meaning), "en"/"tr" (to confirm meaning) and "kind":
phrase | story_sentence | story_title | scenario_title | grammar_rule (keep the
target-language examples as they are) | speaking_prompt ("context" is the line the
learner will say — do NOT translate or reveal it).
{aynı kurallar}
Output: {"<key>": "<çeviri>", ...} with exactly the keys below.
[ {"key": "p.ru_cafe_0", "kind": "phrase", "target": "…", "en": "…", "tr": "…"}, … ]
```

### 4. Mağaza metni — alfabe maddesi (tek seferlik, elle)

```
Aşağıdaki İngilizce iki cümleyi şu dillere çevir: es, de, fr, nl, ar, pt, it, ru,
zh, ja, ko, pl, sv, da, no, fi, el, cs, ro, hu, hi, th, vi, id, uk, he, fa, sw.
Mağaza açıklamasında madde işareti olarak kullanılacak, doğal pazarlama dili olsun.
1) "Alphabet and pronunciation: Arabic, Hebrew, Russian, Korean, Hindi, Thai and
   more in their own scripts; Hiragana for Japanese, Pinyin for Chinese"
2) "Alphabet and pronunciation practice for 30 languages (Hiragana for Japanese,
   Pinyin for Chinese)."
Çıktı yalnızca JSON: {"<dil kodu>": {"play": "<1>", "appstore": "<2>"}}
```
Cevabı Claude Code'a ver; `docs/STORE_METADATA_ALL.md`'deki 28 dile yerleştirir.

### 5. Anadil kontrolü (tek seferlik, elle)

```
Aşağıdaki {DİL} cümlelerini anadili {DİL} olan bir öğretmen gibi kontrol et.
Kadın konuşmacı ağzından, doğal ve dilbilgisi olarak doğru olmalı.
Çıktı yalnızca JSON: {"<id>": {"ok": true}} veya {"<id>": {"fix": "<düzeltilmiş cümle>"}}
<cümleler>
```
Kontrol edilecekler: `grep -rn "TODO: native review" lib/data/content`
(özellikle Tayca).

## Geri getirince

Script dosyaları doğrudan yerine yazar (`assets/content/packs/`,
`assets/content/i18n/`). Kod değişikliği gerekmez; uygulama açılışta okur.
Bittiğinde Claude Code'a "içerik hazır" de: testleri çalıştırır, örnek
cümleleri denetler, commit/push eder.
