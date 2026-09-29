"""Arayüz (UI) metinleri: lib/core/l10n/i18n*.dart içindeki `t({...})` haritaları.

tools/content_ai.py tarafından kullanılır. Görevleri:
- Üç dosyadaki her `t({...})` bloğunu bulur, her dil değerini çözümler.
- Dart string interpolasyonlarını (`$days`, `${LegalInfo.privacyEmail}`)
  `{days}` / `{LegalInfo.privacyEmail}` yer tutucularına çevirir.
- Kapsama raporu verir (30/30 dolu, eksik dil, boş, yer tutucu uyumsuz,
  İngilizcenin aynısı).
- Doğrulanmış çeviriyi doğru bloğa, doğru dil anahtarıyla Dart kaynağına
  yazar (dosyayı atomik olarak değiştirir; var olan değere dokunmaz).
"""

import re
from dataclasses import dataclass, field
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
UI_FILES = [
    'lib/core/l10n/i18n.dart',
    'lib/core/l10n/i18n_ui.dart',
    'lib/core/l10n/i18n_store.dart',
]
LANG_ORDER = ('tr en es de fr nl ar pt it ru zh ja ko pl sv da no fi el cs '
              'ro hu hi th vi id uk he fa sw').split()

_IDENT = re.compile(r'[A-Za-z_][A-Za-z0-9_]*')
_MEMBER = re.compile(
    r'^  (?:static\s+)?(?:[\w<>?,\[\] ]+?\s+)?(?:get\s+)?([A-Za-z_]\w*)\s*'
    r'(?:\([^)]*\))?\s*(?:=>|\{)', re.M)


@dataclass
class Value:
    lang: str
    start: int          # entry start offset (key quote)
    end: int            # offset after the trailing comma (or value end)
    text: str | None    # decoded text with {placeholders}; None = dynamic expr
    raw: str


@dataclass
class Block:
    file: str
    key: str            # stable id: <file stem>:<member>#<n>
    member: str
    open_: int          # offset of '{' after t(
    close: int          # offset of matching '}'
    indent: str
    placeholders: dict = field(default_factory=dict)  # token -> dart expr
    values: dict = field(default_factory=dict)        # lang -> Value

    def text(self, lang):
        v = self.values.get(lang)
        return v.text if v else None

    @property
    def source(self):
        return self.text('en') or self.text('tr')


# ------------------------------------------------------------------ parsing

def _skip_ws_comments(s, i):
    n = len(s)
    while i < n:
        if s[i].isspace():
            i += 1
        elif s.startswith('//', i):
            j = s.find('\n', i)
            i = n if j < 0 else j + 1
        elif s.startswith('/*', i):
            j = s.find('*/', i)
            i = n if j < 0 else j + 2
        else:
            break
    return i


def _parse_string(s, i, placeholders):
    """Parses one Dart string literal at s[i]; returns (text, end)."""
    q = s[i]
    assert q in '\'"', f'string bekleniyordu: {s[i:i + 20]!r}'
    i += 1
    out = []
    while True:
        c = s[i]
        if c == q:
            return ''.join(out), i + 1
        if c == '\n':
            raise ValueError('satır sonu string içinde')
        if c == '\\':
            nxt = s[i + 1]
            out.append({'n': '\n', 't': '\t', 'r': '\r'}.get(nxt, nxt))
            i += 2
            continue
        if c == '$':
            if s[i + 1] == '{':
                depth, j = 1, i + 2
                while depth:
                    if s[j] == '{':
                        depth += 1
                    elif s[j] == '}':
                        depth -= 1
                    j += 1
                expr = s[i + 2:j - 1].strip()
                placeholders[expr] = '${' + expr + '}'
                out.append('{' + expr + '}')
                i = j
                continue
            m = _IDENT.match(s, i + 1)
            if m:
                placeholders[m.group(0)] = '$' + m.group(0)
                out.append('{' + m.group(0) + '}')
                i = m.end()
                continue
        out.append(c)
        i += 1


def _parse_expr(s, i, placeholders):
    """Adjacent string literals → (text, end). Anything else → (None, end)."""
    start = i
    parts = []
    while True:
        i = _skip_ws_comments(s, i)
        if i < len(s) and s[i] in '\'"':
            text, i = _parse_string(s, i, placeholders)
            parts.append(text)
            continue
        break
    if parts and s[i] in ',}':
        return ''.join(parts), i
    # dinamik ifade (ör. koşullu): bir sonraki üst düzey virgüle kadar atla
    depth, j = 0, start
    while j < len(s):
        c = s[j]
        if c in '\'"':
            _, j = _parse_string(s, j, {})
            continue
        if c in '([{':
            depth += 1
        elif c in ')]}':
            if depth == 0:
                break
            depth -= 1
        elif c == ',' and depth == 0:
            break
        j += 1
    return None, j


def parse_file(rel):
    return parse_text((ROOT / rel).read_text(encoding='utf-8'), rel)


def parse_text(s, rel):
    blocks, counter = [], {}
    stem = Path(rel).stem
    for m in re.finditer(r'\bt\(\{', s):
        open_ = m.end() - 1
        before = s[:m.start()]
        members = list(_MEMBER.finditer(before))
        member = members[-1].group(1) if members else '?'
        n = counter.get(member, 0)
        counter[member] = n + 1
        b = Block(rel, f'{stem}:{member}#{n}', member, open_, -1, '    ')
        i = open_ + 1
        while True:
            i = _skip_ws_comments(s, i)
            if s[i] == '}':
                b.close = i
                break
            km = re.match(r"'([a-z]{2})'\s*:", s[i:])
            if not km:
                raise ValueError(f'{rel}:{b.key}: beklenmeyen içerik {s[i:i + 40]!r}')
            line_start = s.rfind('\n', 0, i) + 1
            b.indent = s[line_start:i]
            lang, vstart = km.group(1), i
            text, j = _parse_expr(s, i + km.end(), b.placeholders)
            j = _skip_ws_comments(s, j)
            if s[j] == ',':
                j += 1
            b.values[lang] = Value(lang, vstart, j, text, s[vstart:j])
            i = j
        blocks.append(b)
    return blocks


def all_blocks():
    out = []
    for rel in UI_FILES:
        out.extend(parse_file(rel))
    return out


# --------------------------------------------------------------- validation

_TOKEN = re.compile(r'\{[^{}\s]+\}')
_PRINTF = re.compile(r'%(?:\d+\$)?[sdif@]')
_SPECIAL = '•→←✓✗·…<>*_`#@|'
_URL = re.compile(r'(?:https?://\S+|[\w.+-]+@[\w-]+\.[\w.]+)')
_NON_LATIN = {
    'ar': r'[؀-ۿ]', 'fa': r'[؀-ۿ]', 'he': r'[֐-׿]',
    'ru': r'[Ѐ-ӿ]', 'uk': r'[Ѐ-ӿ]', 'el': r'[Ͱ-Ͽ]',
    'hi': r'[ऀ-ॿ]', 'th': r'[฀-๿]', 'zh': r'[一-鿿]',
    'ja': r'[぀-ヿ一-鿿]', 'ko': r'[가-힯]',
}
# Kısa, marka ya da evrensel ifadeler İngilizceyle aynı kalabilir.
_SAME_OK = re.compile(r'^(?:VOXELITH|Voxelith|Plus|Business|Premium|XP|OK|FSRS|CEFR|'
                      r'A1|A2|B1|B2|Pinyin|Hiragana|LinkedIn|Google|Apple|AI)$')


def tokens(text):
    return sorted(_TOKEN.findall(text or ''))


def _letters(text):
    return re.sub(r'\{[^{}]*\}|' + _URL.pattern, ' ', text or '')


def is_short_or_universal(src):
    words = re.findall(r'\w+', _letters(src))
    return len(src) <= 12 or len(words) <= 2 or all(_SAME_OK.match(w) for w in words)


def check_translation(src, text, lang, other_sources=()):
    """Returns None if OK, else a short reason (Türkçe)."""
    if not isinstance(text, str) or not text.strip():
        return 'boş değer'
    if text != text.strip() and src == src.strip():
        text = text.strip()
    if tokens(src) != tokens(text):
        return f'yer tutucu uyumsuz {tokens(src)} ≠ {tokens(text)}'
    if sorted(_PRINTF.findall(src)) != sorted(_PRINTF.findall(text)):
        return 'printf biçimi uyumsuz'
    if src.count('\n') != text.count('\n'):
        return f'satır sonu sayısı farklı ({src.count(chr(10))} ≠ {text.count(chr(10))})'
    for ch in _SPECIAL:
        if src.count(ch) != text.count(ch) and ch not in '·…':
            return f'biçim karakteri bozuldu: {ch!r}'
    for u in _URL.findall(src):
        if u not in text:
            return f'e-posta/URL değişti: {u}'
    norm = lambda x: re.sub(r'\s+', ' ', x).strip().casefold()
    if lang != 'en' and norm(text) == norm(src) and not is_short_or_universal(src):
        return 'kaynak metnin aynısı (çevrilmemiş)'
    for other in other_sources:
        if other and norm(text) == norm(other) and norm(other) != norm(src):
            return 'başka bir anahtarın metni'
    script = _NON_LATIN.get(lang)
    if script and not is_short_or_universal(src) and re.search(r'[A-Za-z]{3,}', _letters(text)) and not re.search(script, text):
        return f'{lang} alfabesi yok (kaynak dilde kalmış)'
    return None


# ----------------------------------------------------------------- coverage

def block_status(b):
    """lang -> problem (None = ok) for the 30 languages."""
    src = b.text('en')
    out = {}
    for lang in LANG_ORDER:
        v = b.values.get(lang)
        if v is None:
            out[lang] = 'eksik'
        elif v.text is None:
            out[lang] = None if v.raw.strip(' ,\n') else 'boş'
        elif not v.text.strip():
            out[lang] = 'boş'
        elif src is None or lang == 'en':
            out[lang] = None
        else:
            if tokens(src) != tokens(v.text):
                out[lang] = 'yer tutucu uyumsuz'
            else:
                out[lang] = None
    return out


def coverage():
    rep = {}
    for rel in UI_FILES:
        blocks = parse_file(rel)
        full, missing_by_lang, empty, ph, rows = 0, {}, 0, 0, []
        for b in blocks:
            st = block_status(b)
            bad = {l: p for l, p in st.items() if p}
            if not bad:
                full += 1
            for l, p in bad.items():
                missing_by_lang[l] = missing_by_lang.get(l, 0) + 1
                empty += p == 'boş'
                ph += p == 'yer tutucu uyumsuz'
            if bad:
                rows.append((b.key, sorted(bad)))
        rep[rel] = {'total': len(blocks), 'full': full, 'missing': len(blocks) - full,
                    'missing_by_lang': missing_by_lang, 'empty': empty,
                    'placeholder': ph, 'rows': rows,
                    'fallback_values': sum(missing_by_lang.values())}
    return rep


# ------------------------------------------------------------------ writing

def _dart_literal(text, placeholders):
    out = []
    i = 0
    while i < len(text):
        m = _TOKEN.match(text, i)
        if m and m.group(0)[1:-1] in placeholders:
            name = m.group(0)[1:-1]
            nxt = text[m.end():m.end() + 1]
            if _IDENT.fullmatch(name) and not re.match(r'[A-Za-z0-9_]', nxt):
                out.append('$' + name)
            else:
                out.append('${' + name + '}')
            i = m.end()
            continue
        c = text[i]
        out.append({'\\': '\\\\', "'": "\\'", '$': '\\$', '\n': '\\n',
                    '\t': '\\t', '\r': ''}.get(c, c))
        i += 1
    return "'" + ''.join(out) + "'"


def write_translations(rel, lang, values):
    """values: {block key: text}. Only adds missing languages; never overwrites."""
    path = ROOT / rel
    s = path.read_text(encoding='utf-8')
    blocks = {b.key: b for b in parse_file(rel)}
    inserts = []
    for key, text in values.items():
        b = blocks.get(key)
        if b is None or lang in b.values:
            continue
        entry = f"'{lang}': {_dart_literal(text, b.placeholders)},"
        line_start = s.rfind('\n', 0, b.close) + 1
        if s[line_start:b.close].strip():
            # tek satırlık blok: t({'tr': '…', 'en': '…'}) → kapanıştan hemen önce
            before = s[:b.close].rstrip()
            sep = ' ' if before.endswith(',') else ', '
            inserts.append((len(before), sep + entry))
        else:
            inserts.append((line_start, f'{b.indent}{entry}\n'))
    for pos, line in sorted(inserts, reverse=True):
        s = s[:pos] + line + s[pos:]
    # Sağlamlık: yazdıktan sonra dosya hâlâ çözümlenebilmeli ve değerler aynı olmalı.
    check = {b.key: b for b in parse_text(s, rel)}
    if len(check) != len(blocks):
        raise ValueError('blok sayısı değişti — yazma iptal')
    for key, b in blocks.items():
        for l, v in b.values.items():
            if check[key].values[l].text != v.text:
                raise ValueError(f'{key}/{l}: mevcut değer değişti — yazma iptal')
    for key, text in values.items():
        if key in blocks and lang not in blocks[key].values:
            got = check[key].values.get(lang)
            if got is None or got.text != text:
                raise ValueError(f'{key}: geri okuma farklı — yazma iptal')
    tmp = path.with_name(path.name + '.tmp')
    tmp.write_text(s, encoding='utf-8')
    tmp.replace(path)
    return len(inserts)
