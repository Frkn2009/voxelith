#!/usr/bin/env python3
"""VOXELITH içerik hattı: başka bir yapay zekâ ile çeviri + yeni içerik üretimi.

OpenAI uyumlu her API ile çalışır (OpenAI, DeepSeek, Gemini'nin OpenAI uyumlu
ucu, OpenRouter, Groq, yerel LM Studio/Ollama …). Ayar ortam değişkenleriyle:

    export AI_BASE_URL=https://api.deepseek.com/v1     # örnek
    export AI_API_KEY=sk-...
    export AI_MODEL=deepseek-chat

Komutlar (ayrıntı: docs/AI_ICERIK_PROMPTLARI.md):

    python3 tools/content_ai.py status                 # ne eksik, yüzde kaç dolu
    python3 tools/content_ai.py fill-all               # hedeflere kadar yeni senaryo+hikâye üret
    python3 tools/content_ai.py fill --lang ru         # tek dil
    python3 tools/content_ai.py translate --ui es      # bir arayüz dilinin eksik çevirileri
    python3 tools/content_ai.py translate-all          # 30 arayüz dilinin tamamı
    python3 tools/content_ai.py prompt translate --ui es --lang ru > p.txt   # elle kullanım
    python3 tools/content_ai.py import cevap.json --ui es                    # elle cevabı yerleştir
    python3 tools/content_ai.py import cevap.json --pack ru                  # elle senaryo/hikâye cevabı

Her adım dosyaya hemen yazar; yarıda kesilirse aynı komut kaldığı yerden devam
eder. Yeni senaryolar assets/content/packs/<lang>.json'a, çeviriler
assets/content/i18n/<ui>.json'a yazılır. Kaynak listesi Dart içeriği değişirse
`flutter test tools/export_content_test.dart` ile yenilenir.
"""

import argparse
import json
import os
import re
import sys
import time
import urllib.error
import urllib.request
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
import ui_i18n  # noqa: E402

ROOT = Path(__file__).resolve().parent.parent
SOURCE = ROOT / 'docs/content_tasks/source'
I18N = ROOT / 'assets/content/i18n'
LOGS = ROOT / '.content_ai'
PACKS = ROOT / 'assets/content/packs'

LANGS = {
    'tr': 'Turkish', 'en': 'English', 'es': 'Spanish', 'de': 'German',
    'fr': 'French', 'nl': 'Dutch', 'ar': 'Arabic (Modern Standard)',
    'pt': 'Portuguese (Brazilian)', 'it': 'Italian', 'ru': 'Russian',
    'zh': 'Chinese (Simplified, Mandarin)', 'ja': 'Japanese', 'ko': 'Korean',
    'pl': 'Polish', 'sv': 'Swedish', 'da': 'Danish', 'no': 'Norwegian (Bokmål)',
    'fi': 'Finnish', 'el': 'Greek', 'cs': 'Czech', 'ro': 'Romanian',
    'hu': 'Hungarian', 'hi': 'Hindi', 'th': 'Thai', 'vi': 'Vietnamese',
    'id': 'Indonesian', 'uk': 'Ukrainian', 'he': 'Hebrew', 'fa': 'Persian (Farsi)',
    'sw': 'Swahili',
}
LEVELS = ['a1', 'a2', 'b1', 'b2']
# "Dolu dolu" hedefi — her öğrenilen dil için senaryo / hikâye sayısı.
TARGET_SCENARIOS = {'a1': 24, 'a2': 16, 'b1': 12, 'b2': 8}
TARGET_STORIES = {'a1': 4, 'a2': 4, 'b1': 3, 'b2': 3}

TOPICS = {
    'a1': 'greetings, family, food and café, shopping, directions, transport, '
          'hotel, time and dates, weather, hobbies, home, body and health basics, '
          'numbers and prices, daily routine, phone calls, emergencies',
    'a2': 'doctor appointment, pharmacy, bank account, renting a flat, '
          'parcel/delivery problems, returning a product, making plans with '
          'friends, past weekend story, job search, public offices, gym, '
          'restaurant complaint, travel problems, neighbours, school/courses',
    'b1': 'job interview, complaint call, giving opinions in a meeting, '
          'negotiating rent, explaining a problem to IT support, health '
          'insurance, describing experiences, planning a trip with changes, '
          'news and current events, relationships and conflicts, studying abroad',
    'b2': 'salary negotiation, presenting a proposal, handling a difficult '
          'client, debating pros and cons, legal/contract questions, '
          'giving feedback to a colleague, media and technology debate, '
          'environment and society, persuasive argument, formal apology',
}

RULES = """Rules:
- The app's voice is FEMALE. In languages where the speaker's gender changes
  the words (Thai ฉัน/ค่ะ, Hindi आई हूँ, Hebrew, Arabic, Russian, Ukrainian,
  Polish, Czech, Romanian, Portuguese, Spanish, Italian, French, Greek …) always
  use the female first-person form. Never write two forms with "/".
- Natural, everyday, adult language a native speaker would really say.
  No textbook-stiff or machine-translated phrasing.
- Respond with ONE valid JSON object only. No markdown, no comments."""


# ----------------------------------------------------------------- helpers

def load_json(path, default):
    try:
        return json.loads(Path(path).read_text(encoding='utf-8'))
    except FileNotFoundError:
        return default


def save_json(path, data):
    path = Path(path)
    path.parent.mkdir(parents=True, exist_ok=True)
    tmp = path.with_suffix('.tmp')
    tmp.write_text(json.dumps(data, ensure_ascii=False, indent=1) + '\n', encoding='utf-8')
    tmp.replace(path)


def pack(lang):
    return load_json(PACKS / f'{lang}.json', {'scenarios': [], 'stories': []})


def source(lang):
    return load_json(SOURCE / f'{lang}.json', {'scenarios': [], 'stories': [], 'items': []})


def pack_items(lang):
    """Pakete sonradan eklenen içerikten çevrilecek öğeler (export'u beklemeden)."""
    p = pack(lang)
    items = []
    for s in p['scenarios']:
        items.append({'key': f"s.{s['id']}", 'kind': 'scenario_title',
                      'tr': s['titles'].get('tr'), 'en': s['titles'].get('en'),
                      'have': list(s['titles'])})
        g = s.get('grammarNote')
        if g:
            items.append({'key': f"g.{s['id']}", 'kind': 'grammar_rule',
                          'tr': g['rule'].get('tr'), 'en': g['rule'].get('en'),
                          'context': f"{g['goodExample']} / ✗ {g['badExample']}",
                          'have': list(g['rule'])})
        for i, t in enumerate(s['turns']):
            items.append({'key': f"tp.{s['id']}.{i}", 'kind': 'speaking_prompt',
                          'en': t['prompt'], 'context': t['expected'], 'have': []})
        for ph in s['phrases']:
            items.append({'key': f"p.{ph['id']}", 'kind': 'phrase', 'target': ph['target'],
                          'tr': ph['gloss'].get('tr'), 'en': ph['gloss'].get('en'),
                          'have': list(ph['gloss'])})
    for st in p['stories']:
        items.append({'key': f"st.{st['id']}", 'kind': 'story_title', 'target': st['title'],
                      'tr': st['titles'].get('tr'), 'en': st['titles'].get('en'), 'have': ['tr']})
        for i, se in enumerate(st['sentences']):
            items.append({'key': f"ss.{st['id']}.{i}", 'kind': 'story_sentence',
                          'target': se['target'], 'tr': se['gloss'].get('tr'),
                          'en': se['gloss'].get('en'), 'have': ['tr']})
    return items


def all_items(lang):
    seen, out = set(), []
    for it in source(lang)['items'] + pack_items(lang):
        if it['key'] not in seen:
            seen.add(it['key'])
            out.append(it)
    return out


def missing(ui, lang, i18n):
    out = []
    for it in all_items(lang):
        if ui in it.get('have', []) or i18n.get(it['key']):
            continue
        if it['kind'] == 'speaking_prompt' and ui == 'en':
            continue  # yönerge zaten İngilizce
        if not (it.get('en') or it.get('tr')):
            continue
        out.append(it)
    return out


# --------------------------------------------------------------------- AI

def ask(prompt, retries=3):
    base = os.environ.get('AI_BASE_URL', 'https://api.openai.com/v1').rstrip('/')
    key = os.environ.get('AI_API_KEY')
    model = os.environ.get('AI_MODEL', 'gpt-4o-mini')
    if not key:
        sys.exit(BLOCKED_NO_KEY)
    body = {'model': model, 'temperature': 0.3,
            'messages': [{'role': 'system', 'content': 'You are a meticulous native-level '
                          'language teacher and translator. You output only valid JSON.'},
                         {'role': 'user', 'content': prompt}]}
    if os.environ.get('AI_JSON_MODE', '1') == '1':
        body['response_format'] = {'type': 'json_object'}
    last = None
    for attempt in range(retries):
        try:
            req = urllib.request.Request(
                f'{base}/chat/completions', data=json.dumps(body).encode(),
                headers={'Authorization': f'Bearer {key}', 'Content-Type': 'application/json'})
            with urllib.request.urlopen(req, timeout=300) as r:
                text = json.load(r)['choices'][0]['message']['content']
            return parse_json(text)
        except urllib.error.HTTPError as e:
            last = f'HTTP {e.code}: {e.read()[:300]!r}'
            if e.code == 400 and 'response_format' in body:
                body.pop('response_format')  # JSON modu desteklenmiyorsa
        except Exception as e:  # ağ hatası, bozuk JSON …
            last = repr(e)
        time.sleep(2 ** attempt * 2)
    raise RuntimeError(f'AI isteği başarısız: {last}')


def parse_json(text):
    text = text.strip()
    text = re.sub(r'^```(?:json)?\s*|\s*```$', '', text)
    start, end = text.find('{'), text.rfind('}')
    return json.loads(text[start:end + 1])


# ------------------------------------------------------------ translation

TRANSLATION_RULES = """Strict rules — any violation makes the whole answer unusable:
1. Output ONLY {lang_name}. Do not mix in English or any other language
   (brand names like VOXELITH, Plus, Business stay as they are).
2. Return EVERY key listed below, exactly once, spelled exactly as given.
   Do not add, rename or skip keys.
3. Keep every placeholder in curly braces EXACTLY as written — {{days}},
   {{price}}, {{LegalInfo.privacyEmail}} … Do not translate, rename, add,
   drop or reorder-away any of them. Keep %s / %d style markers too.
4. Keep line breaks ("\\n") exactly: same number of line breaks and
   paragraphs as the source. Keep bullets (•), arrows (→), ✓ ✗, e-mail
   addresses and URLs unchanged.
5. Do not shorten, summarise, explain or comment. Translate the full text.
6. Legal / subscription / payment / privacy texts (kind "legal"): translate
   faithfully and completely. Do not add, remove, soften or reinterpret any
   obligation, right, time limit, price or condition.
7. Use natural {lang_name} suitable for a mobile app interface (short,
   friendly, clear; the informal "you" where the language allows it).
8. Output ONE valid JSON object: {{"<key>": "<{lang_name} text>", ...}}.
   No markdown, no code fences, no explanations."""


def _rules(ui):
    return TRANSLATION_RULES.format(lang_name=LANGS[ui])


def translate_prompt(ui, lang, batch):
    rows = []
    for it in batch:
        row = {'key': it['key'], 'kind': it['kind']}
        for f in ('target', 'en', 'tr', 'context'):
            if it.get(f):
                row[f] = it[f]
        rows.append(row)
    return f"""Translate app content of a language-learning app into {LANGS[ui]}.
The learner is studying {LANGS[lang]}. Each row has:
- "target": the {LANGS[lang]} sentence being learned (when present) — translate ITS meaning,
- "en"/"tr": an English/Turkish version to confirm the meaning,
- "kind": phrase | story_sentence | story_title (translate the meaning of "target"),
  scenario_title (short lesson title), grammar_rule (a grammar tip — keep the
  {LANGS[lang]} words/examples exactly as they are, explain in {LANGS[ui]}),
  speaking_prompt (a short stage direction shown during a role-play; "context" is
  the line the learner will say — do NOT translate or reveal it),
  alphabet_letter_name (the name of the letter in "target", e.g. "Long A"),
  alphabet_example (translate the meaning of the example word in "target"),
  alphabet_sound (a pronunciation hint written for Turkish speakers in "tr";
  rewrite it so a {LANGS[ui]} speaker knows how to say the letter "target",
  e.g. "like 'sh' in ship"; keep letters in quotes as they are).
  pronunciation_heard / pronunciation_respelling ("tr" is how the {LANGS[lang]}
  spelling in "target" sounds, written with Turkish spelling; write the same
  sound hint / respelling using {LANGS[ui]} spelling habits).

{RULES.split(chr(10) + '- Respond')[0]}

{_rules(ui)}

Keys and source rows:
{json.dumps(rows, ensure_ascii=False, indent=0)}"""


def _content_source(it):
    return it.get('en') or it.get('tr') or ''


def validate_content_answer(ui, batch, res):
    """(accepted {key: text}, rejected {key: reason}) for lesson content."""
    if not isinstance(res, dict):
        return {}, {it['key']: 'bozuk cevap (JSON nesnesi değil)' for it in batch}
    ok, bad = {}, {}
    others = [_content_source(it) for it in batch]
    for it in batch:
        k = it['key']
        text = res.get(k)
        src = _content_source(it)
        reason = ui_i18n.check_translation(
            src, text.strip() if isinstance(text, str) else text, ui,
            other_sources=[o for o in others if o != src])
        if reason is None and it.get('target') and ui != it.get('lang') and \
                re.sub(r'\s+', ' ', text).strip() == it['target'].strip() and \
                not ui_i18n.is_short_or_universal(it['target']):
            reason = 'öğrenilen dildeki cümle çevrilmeden kopyalanmış'
        if reason:
            bad[k] = reason
        else:
            ok[k] = text.strip()
    for k in res:
        if k not in {it['key'] for it in batch}:
            bad.setdefault(k, 'istenmeyen anahtar (yok sayıldı)')
    return ok, bad


def log_rejected(ui, rejected):
    if not rejected:
        return
    path = LOGS / f'rejected_{ui}.json'
    data = load_json(path, {})
    data.update(rejected)
    save_json(path, data)
    for k, r in list(rejected.items())[:5]:
        print(f'  reddedildi {k}: {r}')
    if len(rejected) > 5:
        print(f'  … toplam {len(rejected)} red → {path.relative_to(ROOT)}')


def _translate_batch(ui, lang, batch, prompt_fn, validate_fn):
    """Ask, validate, retry rejected items once. Returns accepted dict."""
    accepted = {}
    todo = batch
    for attempt in range(2):
        try:
            res = ask(prompt_fn(ui, lang, todo))
        except RuntimeError as e:
            print('  istek başarısız:', e)
            log_rejected(ui, {it['key']: 'istek başarısız' for it in todo})
            return accepted
        ok, bad = validate_fn(ui, todo, res)
        accepted.update(ok)
        todo = [it for it in todo if it['key'] in bad]
        if not todo:
            break
        if attempt == 1:
            log_rejected(ui, {it['key']: bad[it['key']] for it in todo})
    return accepted


def cmd_translate(args, uis=None):
    uis = uis or [args.ui]
    langs = [args.lang] if getattr(args, 'lang', None) else list(LANGS)
    for ui in uis:
        path = I18N / f'{ui}.json'
        for lang in langs:
            i18n = load_json(path, {})
            todo = [dict(it, lang=lang) for it in missing(ui, lang, i18n)]
            for n in range(0, len(todo), args.batch):
                batch = todo[n:n + args.batch]
                print(f'[{ui}] ders/{lang}: {n + len(batch)}/{len(todo)}', flush=True)
                if args.dry_run:
                    continue
                ok = _translate_batch(ui, lang, batch, translate_prompt, validate_content_answer)
                i18n = load_json(path, {})
                i18n.update({k: v for k, v in ok.items() if not i18n.get(k)})
                save_json(path, dict(sorted(i18n.items())))


# ------------------------------------------------------- UI (Dart) strings

LEGAL_MEMBERS = re.compile(r'privacy|terms|autoRenew|trial|subscri|price|purchase|'
                           r'restore|delete|billing|refund|legal', re.I)


def ui_missing(ui):
    out = []
    for b in ui_i18n.all_blocks():
        if ui in b.values or not b.source:
            continue
        legal = b.file.endswith('i18n_store.dart') or LEGAL_MEMBERS.search(b.member)
        out.append({'key': b.key, 'file': b.file, 'kind': 'legal' if legal else 'ui',
                    'en': b.text('en'), 'tr': b.text('tr'),
                    'placeholders': sorted(b.placeholders)})
    return out


def ui_translate_prompt(ui, _lang, batch):
    rows = [{k: it[k] for k in ('key', 'kind', 'en', 'tr', 'placeholders') if it.get(k)}
            for it in batch]
    return f"""Translate user-interface text of a language-learning mobile app into {LANGS[ui]}.
Each row gives the English source ("en") and the Turkish version ("tr") of the
same UI string. Translate the meaning of "en" (use "tr" only to double-check).
"placeholders" lists the {{…}} tokens that MUST appear unchanged in your text.

{_rules(ui)}

Keys and source rows:
{json.dumps(rows, ensure_ascii=False, indent=0)}"""


def validate_ui_answer(ui, batch, res):
    if not isinstance(res, dict):
        return {}, {it['key']: 'bozuk cevap (JSON nesnesi değil)' for it in batch}
    ok, bad = {}, {}
    sources = [it['en'] or it['tr'] for it in batch]
    for it in batch:
        k, src = it['key'], it['en'] or it['tr']
        text = res.get(k)
        reason = ui_i18n.check_translation(
            src, text, ui, other_sources=[o for o in sources if o != src])
        if reason:
            bad[k] = reason
        else:
            ok[k] = text if text == text.strip() or src != src.strip() else text.strip()
    return ok, bad


def _ui_batches(todo, max_chars):
    batch, size = [], 0
    for it in todo:
        n = len(it['en'] or '') + len(it['tr'] or '')
        if batch and size + n > max_chars:
            yield batch
            batch, size = [], 0
        batch.append(it)
        size += n
    if batch:
        yield batch


def cmd_translate_ui(args, uis=None):
    uis = uis or [args.ui]
    for ui in uis:
        todo = ui_missing(ui)
        if not todo:
            print(f'[{ui}] UI: eksik yok')
            continue
        done = 0
        for batch in _ui_batches(todo, args.max_chars):
            done += len(batch)
            print(f'[{ui}] UI: {done}/{len(todo)}', flush=True)
            if args.dry_run:
                continue
            ok = _translate_batch(ui, None, batch, ui_translate_prompt, validate_ui_answer)
            write_ui(ui, ok)


def write_ui(ui, accepted):
    by_file = {}
    for b in ui_i18n.all_blocks():
        if b.key in accepted:
            by_file.setdefault(b.file, {})[b.key] = accepted[b.key]
    for rel, values in by_file.items():
        n = ui_i18n.write_translations(rel, ui, values)
        if n:
            print(f'  {n} değer → {rel}')
    if by_file:
        _dart_format([rel for rel in by_file])


def _dart_format(files):
    import shutil
    import subprocess
    dart = shutil.which('dart')
    if dart:
        subprocess.run([dart, 'format', *files], cwd=ROOT, capture_output=True)


# ------------------------------------------------------ new content packs

SCENARIO_SCHEMA = """{"scenarios": [{
  "id": "<lang>_<level>_<topic_slug>",            // lowercase, unique
  "cefr": "<level>",
  "minutes": 8,
  "titles": {"tr": "<Turkish title>", "en": "<English title>"},
  "clipLine": "<the most memorable line, copied from phrases>",
  "grammarNote": {
    "rule": {"tr": "<one concrete rule, in Turkish>", "en": "<same rule in English>"},
    "goodExample": "<correct sentence in the target language>",
    "badExample": "<a sentence that is REALLY wrong — a typical learner error>"
  },
  "phrases": [ // 6-8 items
    {"id": "<scenario id>_0", "target": "<target-language sentence>",
     "gloss": {"tr": "<Turkish>", "en": "<English>"}, "hint": "<optional: when to use it>"}
  ],
  "turns": [ // 4-6 items, a real dialogue; "expected" MUST be one of the phrase targets
    {"prompt": "<short English stage direction, e.g. 'The pharmacist asks what you need.'>",
     "expected": "<one phrase target>"}
  ]
}]}"""

STORY_SCHEMA = """{"stories": [{
  "id": "<lang>_story_<level>_<slug>",
  "level": "<level>",
  "title": "<title in the target language>",
  "titles": {"tr": "<Turkish title>", "en": "<English title>"},
  "sentences": [ // 6-10 sentences that form one short connected story
    {"target": "<target-language sentence>", "gloss": {"tr": "<Turkish>", "en": "<English>"}}
  ]
}]}"""

LEVEL_GUIDE = {
    'a1': 'A1: very short sentences (3-7 words), present tense, high-frequency words.',
    'a2': 'A2: 6-12 words, past and future, simple connectors (because, then, but), polite requests.',
    'b1': 'B1: 8-16 words, opinions and reasons, conditionals, describing experiences, problem solving.',
    'b2': 'B2: 10-22 words, nuanced/formal register, hedging, persuasion, complex clauses.',
}


def existing_titles(lang):
    s, p = source(lang), pack(lang)
    return [x['title'] for x in s['scenarios']] + [x['titles'].get('en', '') for x in p['scenarios']]


def generate_prompt(lang, level, count):
    return f"""Create {count} NEW speaking lessons for learners of {LANGS[lang]} at CEFR {level.upper()}.
{LEVEL_GUIDE[level]}
Pick topics from: {TOPICS[level]}.
Do NOT repeat these existing lessons: {json.dumps(existing_titles(lang), ensure_ascii=False)}
Every lesson must teach NEW sentences (not reuse beginner phrases like "thank you",
"I don't understand"). Glosses must be accurate. The grammarNote.badExample must be
genuinely ungrammatical, not an acceptable alternative.
Use "{lang}" as <lang> and "{level}" as <level> in ids.

{RULES}

Output exactly this JSON shape:
{SCENARIO_SCHEMA}"""


def stories_prompt(lang, level, count):
    have = [x['title'] for x in source(lang)['stories']] + [x['title'] for x in pack(lang)['stories']]
    return f"""Write {count} NEW short reading stories for learners of {LANGS[lang]} at CEFR {level.upper()}.
{LEVEL_GUIDE[level]}
Everyday adult topics, a little humour or warmth, a clear beginning and end.
Do NOT repeat: {json.dumps(have, ensure_ascii=False)}
Use "{lang}" as <lang> and "{level}" as <level> in ids.

{RULES}

Output exactly this JSON shape:
{STORY_SCHEMA}"""


def validate_scenarios(lang, data):
    p = pack(lang)
    ids = {x['id'] for x in source(lang)['scenarios']} | {x['id'] for x in p['scenarios']}
    a1_targets = {it['target'] for it in source(lang)['items'] if it['kind'] == 'phrase'}
    ok, errors = [], []
    for s in data.get('scenarios', []):
        try:
            sid = s['id']
            assert re.fullmatch(rf'{lang}_[a-z0-9_]+', sid), f'id biçimi: {sid}'
            assert sid not in ids, f'tekrar eden id: {sid}'
            assert s['cefr'] in LEVELS
            assert s['titles'].get('tr') and s['titles'].get('en')
            ph = s['phrases']
            assert 5 <= len(ph) <= 10, 'cümle sayısı'
            for i, x in enumerate(ph):
                x['id'] = f'{sid}_{i}'
                assert x['target'].strip() and '/' not in x['target'], 'hedef cümle'
                assert x['gloss'].get('tr') and x['gloss'].get('en'), 'tr/en çeviri'
            targets = {x['target'] for x in ph}
            s['turns'] = [t for t in s['turns'] if t.get('expected') in targets and t.get('prompt')]
            assert len(s['turns']) >= 3, 'turns'
            if s['cefr'] != 'a1':
                assert sum(t in a1_targets for t in targets) <= len(targets) // 2, 'A1 tekrarı'
            g = s.get('grammarNote')
            if g:
                assert g['rule'].get('tr') and g['rule'].get('en')
                assert g['goodExample'].strip() != g['badExample'].strip()
            if s.get('clipLine') not in targets:
                s['clipLine'] = ph[0]['target']
            s.setdefault('minutes', 8)
            ids.add(sid)
            ok.append(s)
        except (AssertionError, KeyError, TypeError, AttributeError) as e:
            errors.append(f"{s.get('id', '?')}: {e}")
    return ok, errors


def validate_stories(lang, data):
    have = {x['id'] for x in source(lang)['stories']} | {x['id'] for x in pack(lang)['stories']}
    ok, errors = [], []
    for st in data.get('stories', []):
        try:
            assert re.fullmatch(rf'{lang}_[a-z0-9_]+', st['id']) and st['id'] not in have
            assert st['level'] in LEVELS and st['title'].strip()
            assert st['titles'].get('tr') and st['titles'].get('en')
            assert 4 <= len(st['sentences']) <= 14
            for se in st['sentences']:
                assert se['target'].strip() and se['gloss'].get('tr') and se['gloss'].get('en')
            have.add(st['id'])
            ok.append(st)
        except (AssertionError, KeyError, TypeError, AttributeError) as e:
            errors.append(f"{st.get('id', '?')}: {e}")
    return ok, errors


def store_pack(lang, scenarios=(), stories=()):
    p = pack(lang)
    p['scenarios'].extend(scenarios)
    p['stories'].extend(stories)
    save_json(PACKS / f'{lang}.json', p)
    # Hikâye başlık/cümle İngilizceleri çeviri dosyasına (pakette yalnız tr okunur).
    en = load_json(I18N / 'en.json', {})
    for st in stories:
        en[f"st.{st['id']}"] = st['titles']['en']
        for i, se in enumerate(st['sentences']):
            en[f"ss.{st['id']}.{i}"] = se['gloss']['en']
    save_json(I18N / 'en.json', dict(sorted(en.items())))


def counts(lang):
    sc = {lv: 0 for lv in LEVELS}
    st = {lv: 0 for lv in LEVELS}
    scen = {x['id']: x['cefr'] for x in source(lang)['scenarios']}
    scen.update({x['id']: x['cefr'] for x in pack(lang)['scenarios']})
    stories = {x['id']: x['level'] for x in source(lang)['stories']}
    stories.update({x['id']: x['level'] for x in pack(lang)['stories']})
    for lv in scen.values():
        sc[lv] += 1
    for lv in stories.values():
        st[lv] += 1
    return sc, st


def cmd_fill(args, langs=None):
    for lang in langs or [args.lang]:
        for lv in LEVELS:
            for _ in range(8):  # güvenlik sınırı
                sc, _st = counts(lang)
                need = TARGET_SCENARIOS[lv] - sc[lv]
                if need <= 0:
                    break
                n = min(need, 3)
                print(f'[{lang}] {lv} senaryo +{n} (şu an {sc[lv]}/{TARGET_SCENARIOS[lv]})', flush=True)
                if args.dry_run:
                    break
                try:
                    ok, err = validate_scenarios(lang, ask(generate_prompt(lang, lv, n)))
                except RuntimeError as e:
                    print('  hata:', e)
                    continue
                for e in err:
                    print('  reddedildi:', e)
                store_pack(lang, scenarios=ok)
            for _ in range(6):
                _sc, st = counts(lang)
                need = TARGET_STORIES[lv] - st[lv]
                if need <= 0:
                    break
                n = min(need, 2)
                print(f'[{lang}] {lv} hikâye +{n} (şu an {st[lv]}/{TARGET_STORIES[lv]})', flush=True)
                if args.dry_run:
                    break
                try:
                    ok, err = validate_stories(lang, ask(stories_prompt(lang, lv, n)))
                except RuntimeError as e:
                    print('  hata:', e)
                    continue
                for e in err:
                    print('  reddedildi:', e)
                store_pack(lang, stories=ok)


# ------------------------------------------------------------- manual use

def cmd_prompt(args):
    if args.what == 'translate':
        todo = missing(args.ui, args.lang, load_json(I18N / f'{args.ui}.json', {}))
        print(translate_prompt(args.ui, args.lang, todo[:args.batch]))
    elif args.what == 'translate-ui':
        todo = next(_ui_batches(ui_missing(args.ui), args.max_chars), [])
        if not todo:
            sys.exit(f'{args.ui}: eksik UI çevirisi yok.')
        print(ui_translate_prompt(args.ui, None, todo))
    elif args.what == 'store':
        print(store_prompt([args.lang] if args.lang else
                           [l for l in LANGS if l not in ('en', 'tr')]))
    elif args.what == 'generate':
        print(generate_prompt(args.lang, args.level, args.count))
    else:
        print(stories_prompt(args.lang, args.level, args.count))


def cmd_import(args):
    try:
        data = parse_json(Path(args.file).read_text(encoding='utf-8'))
    except (ValueError, json.JSONDecodeError) as e:
        sys.exit(f'Bozuk JSON, hiçbir şey yazılmadı: {e}')
    if getattr(args, 'store', False):
        ok, bad = validate_store(data)
        for l, r in bad.items():
            print(f'reddedildi {l}: {r}')
        write_store(ok)
        print(f'{len(ok)} dilin mağaza metni yazıldı → docs/STORE_METADATA_ALL.md')
    elif args.ui:
        ui = args.ui
        # 1) UI (Dart) anahtarları: <dosya>:<üye>#<n>
        ui_todo = [it for it in ui_missing(ui) if it['key'] in data]
        ok, bad = validate_ui_answer(ui, ui_todo, data) if ui_todo else ({}, {})
        write_ui(ui, ok)
        # 2) Ders içeriği anahtarları: p./s./g./tp./st./ss.
        path = I18N / f'{ui}.json'
        i18n = load_json(path, {})
        content_todo = [dict(it, lang=lang) for lang in LANGS
                        for it in missing(ui, lang, i18n) if it['key'] in data]
        cok, cbad = validate_content_answer(ui, content_todo, data) if content_todo else ({}, {})
        i18n.update(cok)
        save_json(path, dict(sorted(i18n.items())))
        known = {it['key'] for it in ui_todo + content_todo}
        skipped = [k for k in data if k not in known]
        log_rejected(ui, {**bad, **cbad})
        print(f'UI: {len(ok)} eklendi, {len(bad)} reddedildi · ders: {len(cok)} eklendi, '
              f'{len(cbad)} reddedildi · {len(skipped)} anahtar zaten dolu/bilinmiyor (atlandı)')
    else:
        ok, err = validate_scenarios(args.pack, data)
        sok, serr = validate_stories(args.pack, data)
        for e in err + serr:
            print('reddedildi:', e)
        store_pack(args.pack, scenarios=ok, stories=sok)
        print(f'{len(ok)} senaryo, {len(sok)} hikâye eklendi → assets/content/packs/{args.pack}.json')



# ------------------------------------------------------- store metadata

STORE_LIMITS = {'play_title': 30, 'play_short': 80, 'play_long': 4000,
                'appstore_title': 30, 'appstore_subtitle': 30,
                'appstore_keywords': 100, 'appstore_description': 4000}
STORE_SRC = ROOT / 'docs/content_tasks/store_metadata_en.json'
STORE_DOC = ROOT / 'docs/STORE_METADATA_ALL.md'
# Kapalı (ücretli) özellikleri vaat eden ifadeler mağaza metninde olmamalı.
STORE_BANNED = re.compile(
    r'(?-i:(?<![A-Za-z])(?:AI|A\.I\.|KI|IA|ИИ|ШІ|SI|MI|TN)(?![A-Za-z]))|chat ?bot|ElevenLabs|Claude|premium|'
    r'conversation partner|yapay zek|artificial intelligence|intelligence artificielle|'
    r'inteligencia artificial|inteligência artificial|intelligenza artificiale|'
    r'künstliche intelligenz|kunstmatige intelligentie|sztuczn\w* inteligencj|'
    r'umělá inteligence|inteligență artificială|mesterséges intelligencia|tekoäly|'
    r'kunstig intelligens|artificiell intelligens|τεχνητή νοημοσύνη|искусственн\w* интеллект|'
    r'штучн\w* інтелект|премиум|преміум|الذكاء الاصطناعي|هوش مصنوعی|בינה מלאכותית|'
    r'कृत्रिम बुद्धि|एआई|ปัญญาประดิษฐ์|เอไอ|인공지능|프리미엄|人工智能|人工知能|プレミアム|高级语音|'
    r'trí tuệ nhân tạo|kecerdasan buatan|akili bandia|پریمیوم|פרימיום|प्रीमियम|พรีเมียม',
    re.I)


def store_prompt(langs):
    src = load_json(STORE_SRC, {})
    return f"""Translate and localise this mobile app store listing from English into
each of these languages: {', '.join(f'{l} ({LANGS[l]})' for l in langs)}.
Write natural, persuasive store copy a native speaker would use — not a literal
translation — but keep every fact exactly (features, numbers, "30 seconds",
"30 languages"). Do NOT mention AI, chatbots or premium voices.
Hard character limits: {json.dumps(STORE_LIMITS)}. keywords = comma-separated,
no spaces after commas, localised search terms. Keep line breaks and "•" bullets
in the long texts.

Output ONE JSON object only: {{"<lang code>": {{{', '.join(f'"{k}": "..."' for k in STORE_LIMITS)}}}, ...}}

English source:
{json.dumps(src, ensure_ascii=False, indent=1)}"""


def validate_store(data):
    ok, bad = {}, {}
    for lang, fields in (data or {}).items():
        if lang not in LANGS or lang in ('en', 'tr') or not isinstance(fields, dict):
            bad[lang] = 'bilinmeyen dil veya bozuk kayıt'
            continue
        errs = []
        for k, lim in STORE_LIMITS.items():
            v = fields.get(k)
            if not isinstance(v, str) or not v.strip():
                errs.append(f'{k} eksik')
            elif len(v) > lim:
                errs.append(f'{k} {len(v)}>{lim} karakter')
            elif STORE_BANNED.search(v):
                errs.append(f'{k}: kapalı özellik vaadi ({STORE_BANNED.search(v).group(0)})')
        if errs:
            bad[lang] = '; '.join(errs)
        else:
            ok[lang] = {k: fields[k].strip() for k in STORE_LIMITS}
    return ok, bad


def write_store(sections):
    doc = STORE_DOC.read_text(encoding='utf-8')
    for lang, f in sections.items():
        m = re.search(rf'^## [^\n]*\({lang}\)\n', doc, re.M)
        if not m:
            continue
        end = doc.find('\n## ', m.end())
        end = len(doc) if end < 0 else end + 1
        body = (f"{m.group(0)}\n**Google Play title:** `{f['play_title']}`\n"
                f"**Google Play short (80):** `{f['play_short']}`\n"
                f"**Google Play long:**\n```\n{f['play_long']}\n```\n\n"
                f"**App Store title:** `{f['appstore_title']}`\n"
                f"**App Store subtitle:** `{f['appstore_subtitle']}`\n"
                f"**App Store keywords (100):** `{f['appstore_keywords']}`\n"
                f"**App Store description:**\n```\n{f['appstore_description']}\n```\n\n---\n\n")
        doc = doc[:m.start()] + body + doc[end:]
    STORE_DOC.write_text(doc, encoding='utf-8')


def cmd_store(args):
    langs = [args.lang] if args.lang else [l for l in LANGS if l not in ('en', 'tr')]
    if args.dry_run:
        print(store_prompt(langs[:3]))
        return
    for n in range(0, len(langs), 4):
        chunk = langs[n:n + 4]
        print(f'[store] {", ".join(chunk)}', flush=True)
        try:
            ok, bad = validate_store(ask(store_prompt(chunk)))
        except RuntimeError as e:
            print('  istek başarısız:', e)
            continue
        for l, r in bad.items():
            print(f'  reddedildi {l}: {r}')
        write_store(ok)


# ------------------------------------------------------------------ status

BLOCKED_NO_KEY = 'BLOCKED: AI_PROVIDER_API_KEY_MISSING'


def require_ai(args):
    """AI çağrısı gereken komutlar anahtar yoksa hiçbir şey yazmadan durur."""
    if getattr(args, 'dry_run', False):
        return
    if not os.environ.get('AI_API_KEY'):
        print(BLOCKED_NO_KEY + '  (AI_BASE_URL, AI_API_KEY, AI_MODEL ortam değişkenleri; '
              'bkz. docs/AI_ICERIK_PROMPTLARI.md)')
        sys.exit(2)


def store_coverage():
    doc = STORE_DOC.read_text(encoding='utf-8') if STORE_DOC.exists() else ''
    rows = []
    for lang in LANGS:
        if lang == 'tr':
            src = (ROOT / 'docs/STORE_METADATA_TR.md')
            text = src.read_text(encoding='utf-8') if src.exists() else ''
        else:
            m = re.search(rf'^## [^\n]*\({lang}\)\n', doc, re.M)
            if not m:
                rows.append((lang, 'eksik', ''))
                continue
            end = doc.find('\n## ', m.end())
            text = doc[m.start():len(doc) if end < 0 else end]
        hit = STORE_BANNED.search(text)
        rows.append((lang, 'kapalı özellik vaadi' if hit else 'tamam',
                     hit.group(0) if hit else ''))
    return rows

def status_text():
    lines = ['# İçerik durumu', '',
             '_Bu dosya `python3 tools/content_ai.py status` ile üretilir; elle düzenleme._', '',
             '## 1. Arayüz (UI) metinleri — lib/core/l10n/i18n*.dart', '',
             'Bir anahtar "tam" sayılır: 30 dilin hepsinde değer var, boş değil ve',
             'yer tutucuları İngilizce kaynakla birebir aynı. Eksik diller çalışma',
             'anında İngilizceye düşer (güvenlik ağı).', '',
             '| Dosya | Toplam | 30/30 tam | Eksik | Boş | Yer tutucu hatası | İngilizceye düşecek değer |',
             '|---|---|---|---|---|---|---|']
    cov = ui_i18n.coverage()
    tot_missing = 0
    for rel, r in cov.items():
        tot_missing += r['fallback_values']
        lines.append(f"| `{Path(rel).name}` | {r['total']} | {r['full']} | {r['missing']} | "
                     f"{r['empty']} | {r['placeholder']} | {r['fallback_values']} |")
    lines += ['', f'**Toplam eksik UI çevirisi (anahtar × dil): {tot_missing}**', '']
    by_lang = {}
    for r in cov.values():
        for l, n in r['missing_by_lang'].items():
            by_lang[l] = by_lang.get(l, 0) + n
    if by_lang:
        lines += ['| Dil | Eksik UI anahtarı |', '|---|---|']
        lines += [f'| {l} | {by_lang[l]} |' for l in ui_i18n.LANG_ORDER if by_lang.get(l)]
        lines.append('')
    lines += ['## 2. Ders içeriği — senaryolar ve hikâyeler', '',
              f'Hedef (her öğrenilen dil): senaryo {TARGET_SCENARIOS}, hikâye {TARGET_STORIES}.',
              'Kaynak: Dart içerik dosyaları (docs/content_tasks/source) + assets/content/packs.', '',
              '| Dil | A1 | A2 | B1 | B2 | Hikâye A1/A2/B1/B2 | Hedefe eksik senaryo |',
              '|---|---|---|---|---|---|---|']
    for lang in LANGS:
        sc, st = counts(lang)
        gap = sum(max(0, TARGET_SCENARIOS[lv] - sc[lv]) for lv in LEVELS)
        lines.append(f"| {lang} | {sc['a1']} | {sc['a2']} | {sc['b1']} | {sc['b2']} | "
                     f"{st['a1']}/{st['a2']}/{st['b1']}/{st['b2']} | {gap} |")
    lines += ['', '## 3. Ders içeriği çevirileri (arayüz diline göre)', '',
              'Cümle anlamları, senaryo başlıkları, konuşma yönergeleri, gramer kuralları,',
              'hikâye başlık ve cümleleri. Dart\'taki değer veya assets/content/i18n/<dil>.json.', '',
              '| Arayüz dili | Doluluk |', '|---|---|']
    for ui in LANGS:
        i18n = load_json(I18N / f'{ui}.json', {})
        total = miss = 0
        for lang in LANGS:
            items = [it for it in all_items(lang) if not (it['kind'] == 'speaking_prompt' and ui == 'en')]
            total += len(items)
            miss += len(missing(ui, lang, i18n))
        lines.append(f'| {ui} | %{100 * (total - miss) // max(total, 1)} ({total - miss}/{total}) |')
    lines += ['', '## 4. Mağaza metinleri — docs/STORE_METADATA_*.md', '',
              'Her dilin bölümü var mı ve kapalı (ücretli) özellik vaadi — AI, sohbet botu,',
              'premium ses — içeriyor mu. Karakter sınırları `store` komutunda denetlenir.', '',
              '| Dil | Durum | Bulunan ifade |', '|---|---|---|']
    store_rows = store_coverage()
    lines += [f'| {l} | {st} | {w} |' for l, st, w in store_rows]
    clean = sum(1 for _, st, _ in store_rows if st == 'tamam')
    lines += ['', f'**Mağaza metni temiz dil: {clean}/{len(store_rows)}**', '',
              '## Bekleyen (kod dışı) işler', '',
              '- Crashlytics: Firebase projesi ve `google-services.json` / '
              '`GoogleService-Info.plist` gelene kadar eklenmedi.', '']
    return '\n'.join(lines)


def cmd_status(_args):
    text = status_text()
    (ROOT / 'docs/content_tasks/STATUS.md').write_text(text, encoding='utf-8')
    print(text)


def main():
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    sub = ap.add_subparsers(dest='cmd', required=True)
    sub.add_parser('status')
    for name in ('fill', 'fill-all'):
        p = sub.add_parser(name)
        if name == 'fill':
            p.add_argument('--lang', required=True, choices=LANGS)
        p.add_argument('--dry-run', action='store_true')
    for name in ('translate', 'translate-all', 'translate-ui'):
        p = sub.add_parser(name)
        if name == 'translate':
            p.add_argument('--ui', required=True, choices=LANGS)
        if name == 'translate-ui':
            p.add_argument('--ui', choices=LANGS, help='boşsa 30 dilin hepsi')
        if name != 'translate-ui':
            p.add_argument('--lang', choices=LANGS)
        if name == 'translate-all':
            p.add_argument('--ui', choices=LANGS, help='boşsa 30 dilin hepsi')
        p.add_argument('--batch', type=int, default=60)
        p.add_argument('--max-chars', type=int, default=6000,
                       help='UI çevirisinde bir istekteki en fazla kaynak karakter')
        p.add_argument('--dry-run', action='store_true')
    p = sub.add_parser('prompt')
    p.add_argument('what', choices=['translate', 'translate-ui', 'generate', 'stories', 'store'])
    p.add_argument('--ui', choices=LANGS)
    p.add_argument('--lang', choices=LANGS)
    p.add_argument('--level', choices=LEVELS, default='a2')
    p.add_argument('--count', type=int, default=3)
    p.add_argument('--batch', type=int, default=60)
    p.add_argument('--max-chars', type=int, default=6000)
    p = sub.add_parser('import')
    p.add_argument('file')
    g = p.add_mutually_exclusive_group(required=True)
    g.add_argument('--ui', choices=LANGS)
    g.add_argument('--pack', choices=LANGS)
    g.add_argument('--store', action='store_true', help='mağaza metni cevabı')
    p = sub.add_parser('store', help='28 dilin mağaza metnini üret ve yerleştir')
    p.add_argument('--lang', choices=LANGS)
    p.add_argument('--dry-run', action='store_true')
    args = ap.parse_args()
    if args.cmd == 'prompt':
        need = {'translate': ('ui', 'lang'), 'translate-ui': ('ui',),
                'generate': ('lang',), 'stories': ('lang',), 'store': ()}[args.what]
        for f in need:
            if not getattr(args, f):
                ap.error(f'prompt {args.what} için --{f} gerekli')

    order = ['en', 'tr'] + [u for u in LANGS if u not in ('en', 'tr')]
    if args.cmd in ('fill', 'fill-all', 'translate', 'translate-ui', 'translate-all', 'store'):
        require_ai(args)
    if args.cmd == 'status':
        cmd_status(args)
    elif args.cmd == 'fill':
        cmd_fill(args)
    elif args.cmd == 'fill-all':
        cmd_fill(args, langs=list(LANGS))
    elif args.cmd == 'translate':
        cmd_translate(args)
    elif args.cmd == 'translate-ui':
        cmd_translate_ui(args, uis=[args.ui] if args.ui else order)
    elif args.cmd == 'translate-all':
        uis = [args.ui] if args.ui else order
        # Önce UI (az ve kritik), sonra ders içeriği; İngilizce en başta çünkü
        # diğer diller için en iyi kaynak metin o.
        cmd_translate_ui(args, uis=uis)
        cmd_translate(args, uis=uis)
    elif args.cmd == 'prompt':
        cmd_prompt(args)
    elif args.cmd == 'store':
        cmd_store(args)
    else:
        cmd_import(args)


if __name__ == '__main__':
    main()
