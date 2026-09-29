#!/usr/bin/env python3
"""docs/content_tasks/REQUESTS.json → projedeki doğru dosyalar.

    python3 tools/apply_config.py            # uygula
    python3 tools/apply_config.py --check    # yalnızca doğrula, dosyaya yazma

Boş bırakılan alanlar atlanır (dosyadaki mevcut değer kalır). Biçimi yanlış
bir değer varsa hiçbir dosyaya yazılmaz. API anahtarları bu dosyadan
okunmaz — build komutunda ortam değişkeni olarak verilir.
"""

import json
import re
import subprocess
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
REQ = ROOT / 'docs/content_tasks/REQUESTS.json'

FORMATS = {
    ('sirket', 'kvk_numarasi'): r'\d{8}',
    ('sirket', 'btw_numarasi'): r'NL\d{9}B\d{2}',
    ('sirket', 'telefon'): r'\+\d{8,15}',
    ('sirket', 'destek_eposta'): r'[^@\s]+@[^@\s]+\.[a-z]{2,}',
    ('sirket', 'gizlilik_eposta'): r'[^@\s]+@[^@\s]+\.[a-z]{2,}',
    ('sirket', 'alan_adi'): r'(?:[a-z0-9-]+\.)+[a-z]{2,}',
    ('admob', 'yayinci_kimligi'): r'pub-\d{16}',
    ('admob', 'android_app_id'): r'ca-app-pub-\d{16}~\d{10}',
    ('admob', 'ios_app_id'): r'ca-app-pub-\d{16}~\d{10}',
    ('admob', 'odullu_android'): r'ca-app-pub-\d{16}/\d{10}',
    ('admob', 'odullu_ios'): r'ca-app-pub-\d{16}/\d{10}',
    ('admob', 'gecis_android'): r'ca-app-pub-\d{16}/\d{10}',
    ('admob', 'gecis_ios'): r'ca-app-pub-\d{16}/\d{10}',
    ('apple', 'team_id'): r'[A-Z0-9]{10}',
    ('supabase', 'proje_url'): r'https://[a-z0-9]+\.supabase\.co',
}
PLACEHOLDERS = {'', 'pub-', 'ca-app-pub-'}


def values():
    data = json.loads(REQ.read_text(encoding='utf-8'))['girdiler']
    out, errors, missing = {}, [], []
    for (grp, key), pattern in FORMATS.items():
        v = str(data.get(grp, {}).get(key, '')).strip()
        if v in PLACEHOLDERS:
            missing.append(f'{grp}.{key}')
            continue
        if not re.fullmatch(pattern, v):
            errors.append(f'{grp}.{key} = {v!r} biçimi yanlış')
            continue
        out[(grp, key)] = v
    for key in ('hukuki_unvan', 'adres'):
        val = str(data.get('sirket', {}).get(key, '')).strip()
        if val:
            out[('sirket', key)] = val
        else:
            missing.append(f'sirket.{key}')
    return out, errors, missing


def sub_file(rel, pattern, repl, count=1):
    path = ROOT / rel
    s = path.read_text(encoding='utf-8')
    new, n = re.subn(pattern, repl, s, count=count, flags=re.M)
    if n == 0:
        raise SystemExit(f'{rel}: beklenen satır bulunamadı ({pattern})')
    if new != s:
        path.write_text(new, encoding='utf-8')
        print(f'  güncellendi: {rel}')


def main():
    check = '--check' in sys.argv
    v, errors, missing = values()
    for e in errors:
        print('HATA:', e)
    if errors:
        raise SystemExit('Hiçbir dosyaya yazılmadı.')
    if missing:
        print('Boş (atlandı):', ', '.join(missing))
    if check:
        print('Doğrulama tamam.')
        return

    s = lambda k: v.get(k)
    legal = {
        'companyLegalName': s(('sirket', 'hukuki_unvan')),
        'companyAddress': s(('sirket', 'adres')),
        'kvkNumber': s(('sirket', 'kvk_numarasi')),
        'vatNumber': s(('sirket', 'btw_numarasi')),
        'supportEmail': s(('sirket', 'destek_eposta')),
        'privacyEmail': s(('sirket', 'gizlilik_eposta')),
    }
    markers = {
        'companyLegalName': '[LEGAL_COMPANY_NAME]', 'companyAddress': '[REGISTERED_ADDRESS]',
        'kvkNumber': '[KVK_NUMBER]', 'vatNumber': '[VAT_NUMBER]',
        'supportEmail': '[SUPPORT_EMAIL]', 'privacyEmail': '[PRIVACY_EMAIL]',
    }
    for const, val in legal.items():
        if not val:
            continue
        safe = val.replace('\\', '\\\\').replace("'", "\\'").replace('$', '\\$')
        sub_file('lib/core/legal_info.dart',
                 rf"static const {const} =\s*'[^']*';",
                 lambda m, safe=safe, const=const: f"static const {const} = '{safe}';")
        for rel in ('site/index.html', 'site/delete-account.html'):
            p = ROOT / rel
            p.write_text(p.read_text(encoding='utf-8').replace(markers[const], val),
                         encoding='utf-8')
    if s(('sirket', 'alan_adi')):
        sub_file('lib/core/legal_info.dart', r"static const websiteUrl = '[^']*';",
                 f"static const websiteUrl = 'https://{s(('sirket', 'alan_adi'))}';")
    if s(('admob', 'android_app_id')):
        sub_file('android/app/src/main/AndroidManifest.xml',
                 r'(android:name="com\.google\.android\.gms\.ads\.APPLICATION_ID"\s*android:value=")[^"]*',
                 lambda m: m.group(1) + s(('admob', 'android_app_id')))
    if s(('admob', 'ios_app_id')):
        sub_file('ios/Runner/Info.plist',
                 r'(<key>GADApplicationIdentifier</key>\s*<string>)[^<]*',
                 lambda m: m.group(1) + s(('admob', 'ios_app_id')))
    if s(('admob', 'yayinci_kimligi')):
        (ROOT / 'site/app-ads.txt').write_text(
            f"google.com, {s(('admob', 'yayinci_kimligi'))}, DIRECT, f08c47fec0942fa0\n",
            encoding='utf-8')
        print('  yazıldı: site/app-ads.txt')
    if s(('apple', 'team_id')):
        sub_file('ios/Runner.xcodeproj/project.pbxproj',
                 r'(PRODUCT_BUNDLE_IDENTIFIER = com\.voxelith\.voxelith[^;]*;)(?! DEVELOPMENT_TEAM)',
                 lambda m: f"{m.group(1)} DEVELOPMENT_TEAM = {s(('apple', 'team_id'))};", count=0)

    subprocess.run([sys.executable, str(ROOT / 'tools/gen_legal_html.py')], check=True)

    defines = []
    for key, name in ((('admob', 'odullu_android'), 'VOXELITH_ADMOB_REWARDED_ANDROID'),
                      (('admob', 'gecis_android'), 'VOXELITH_ADMOB_INTERSTITIAL_ANDROID'),
                      (('admob', 'odullu_ios'), 'VOXELITH_ADMOB_REWARDED_IOS'),
                      (('admob', 'gecis_ios'), 'VOXELITH_ADMOB_INTERSTITIAL_IOS'),
                      (('supabase', 'proje_url'), 'SUPABASE_URL')):
        if s(key):
            defines.append(f'--dart-define={name}={s(key)}')
    defines += ['--dart-define=VOXELO_REVENUECAT_API_KEY=$REVENUECAT_PUBLIC_KEY',
                '--dart-define=VOXELO_REVENUECAT_ENTITLEMENT_ID=plus']
    if s(('supabase', 'proje_url')):
        defines.append('--dart-define=SUPABASE_PUBLISHABLE_KEY=$SUPABASE_PUBLISHABLE_KEY')
    print('\nBuild komutu (anahtarları ortam değişkeni olarak ver):')
    print('  flutter build appbundle --release ' + ' '.join(defines))
    print('  flutter build ipa --release ' + ' '.join(defines))


if __name__ == '__main__':
    main()
