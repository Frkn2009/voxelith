#!/usr/bin/env python3
"""site/privacy.html ve site/terms.html'i uygulama içi metinlerden üretir.

Kaynak: lib/core/l10n/i18n_store.dart (privacyBody / termsBody, 'tr' ve
'en') ve lib/core/legal_info.dart. Uygulama içi metin ile web sayfası
birebir aynı kalsın diye elle düzenleme yapma; Dart metnini değiştirip
şunu çalıştır:

    python3 tools/gen_legal_html.py
"""

import html
import re
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
DART = (ROOT / 'lib/core/l10n/i18n_store.dart').read_text(encoding='utf-8')
INFO = (ROOT / 'lib/core/legal_info.dart').read_text(encoding='utf-8')

CONSTS = dict(re.findall(r"static const (\w+) =\s*'([^']*)';", INFO))


def _dart_literal(body: str) -> str:
    """Yan yana yazılmış Dart string literal'lerini tek metne çevirir."""
    out = []
    for m in re.finditer(r"'((?:[^'\\]|\\.)*)'|\"((?:[^\"\\]|\\.)*)\"", body):
        s = m.group(1) if m.group(1) is not None else m.group(2)
        s = s.replace("\\'", "'").replace('\\"', '"').replace('\\n', '\n')
        out.append(s)
    text = ''.join(out)
    return re.sub(
        r'\$\{LegalInfo\.(\w+)\}', lambda m: CONSTS[m.group(1)], text
    )


def extract(getter: str, lang: str) -> str:
    start = DART.index(f'String {getter}() => t({{')
    end = DART.index('\n  });', start)
    block = DART[start:end]
    m = re.search(
        rf"\n    '{lang}':\n(.*?)(?=\n    '[a-z]{{2}}':|\Z)", block, re.S
    )
    return _dart_literal(m.group(1))


STYLE = """  @font-face { font-family: 'Sora'; src: url('fonts/Sora.ttf') format('truetype'); font-weight: 400 800; font-display: swap; }
  @font-face { font-family: 'Manrope'; src: url('fonts/Manrope.ttf') format('truetype'); font-weight: 400 800; font-display: swap; }
  :root{ --ink:#3C3C3C; --muted:#6B6B6B; --bg:#F7F7F7; --primary-dark:#46A302; }
  body{
    font-family:'Manrope',system-ui,-apple-system,Segoe UI,Roboto,sans-serif;
    max-width:680px; margin:48px auto; padding:0 20px 60px; line-height:1.65;
    color:var(--ink); background:var(--bg);
  }
  h1{ font-family:'Sora',system-ui,sans-serif; font-size:28px; margin-bottom:4px; }
  h2{ font-family:'Sora',system-ui,sans-serif; font-size:18px; margin:28px 0 4px; }
  .muted{ color:var(--muted); font-size:14px; }
  a{ color:var(--primary-dark); font-weight:700; text-decoration:none; }
  .back{ display:inline-block; margin-bottom:24px; font-weight:700; }
  .lang{ margin-bottom:24px; }
  hr{ border:none; border-top:1px solid #ddd; margin:48px 0; }"""


def _section(text: str, lang: str, title: str) -> str:
    paras = [p.strip() for p in text.split('\n\n') if p.strip()]
    out = [f'<section id="{lang}" lang="{lang}">', f'<h1>{html.escape(title)}</h1>']
    first, rest = paras[0], paras[1:]
    out.append(f'<p class="muted">{html.escape(first)}</p>')
    for p in rest:
        lines = p.split('\n')
        if len(lines) > 1 and re.match(r'^\d+\. ', lines[0]):
            out.append(f'<h2>{html.escape(lines[0])}</h2>')
            p = '\n'.join(lines[1:])
        esc = html.escape(p).replace('\n', '<br/>')
        for key in ('privacyEmail', 'supportEmail'):
            mail = CONSTS[key]
            esc = esc.replace(mail, f'<a href="mailto:{mail}">{mail}</a>')
        out.append(f'<p>{esc}</p>')
    out.append('</section>')
    return '\n'.join(out)


def page(getter: str, filename: str, titles: dict) -> None:
    body = '\n<hr/>\n'.join(
        _section(extract(getter, lang), lang, titles[lang]) for lang in ('en', 'tr')
    )
    doc = f"""<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8"/>
<meta name="viewport" content="width=device-width, initial-scale=1"/>
<link rel="canonical" href="{CONSTS['websiteUrl']}/{filename}"/>
<title>VOXELITH · {html.escape(titles['en'])}</title>
<!-- Bu dosya tools/gen_legal_html.py ile üretilir; elle düzenleme. -->
<style>
{STYLE}
</style>
</head>
<body>
<a class="back" href="index.html">← VOXELITH</a>
<p class="lang"><a href="#en">English</a> · <a href="#tr">Türkçe</a></p>
{body}
</body>
</html>
"""
    (ROOT / 'site' / filename).write_text(doc, encoding='utf-8')
    print('wrote site/' + filename)


page('privacyBody', 'privacy.html',
     {'en': 'VOXELITH Privacy Policy', 'tr': 'VOXELITH Gizlilik Politikası'})
page('termsBody', 'terms.html',
     {'en': 'VOXELITH Terms of Use', 'tr': 'VOXELITH Kullanım Koşulları'})
