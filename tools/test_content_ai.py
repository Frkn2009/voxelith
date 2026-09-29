"""tools/content_ai.py ve tools/ui_i18n.py testleri.

    python3 -m unittest discover -s tools -p 'test_*.py'

Gerçek repo dosyalarına dokunmaz: UI Dart dosyalarının kopyasıyla geçici bir
kökte çalışır, yapay zekâ çağrısı sahte bir fonksiyonla değiştirilir.
"""

import json
import re
import shutil
import sys
import tempfile
import unittest
from pathlib import Path

HERE = Path(__file__).resolve().parent
sys.path.insert(0, str(HERE))

import content_ai  # noqa: E402
import ui_i18n  # noqa: E402

REAL_ROOT = ui_i18n.ROOT


def fake_translation(src, lang):
    """Geçerli sahte çeviri: yer tutucular, satır sonları ve özel karakterler korunur."""
    prefix = {'ja': '日本語', 'ru': 'Перевод', 'ar': 'ترجمة', 'zh': '翻译',
              'ko': '번역', 'el': 'Μετάφραση', 'he': 'תרגום', 'hi': 'अनुवाद',
              'th': 'แปล', 'uk': 'Переклад', 'fa': 'ترجمه'}.get(lang, 'Traduzione')
    return re.sub(r'(^|\n)', lambda m: m.group(1) + prefix + ' ', src)


class UiPipelineTest(unittest.TestCase):
    def setUp(self):
        self.tmp = Path(tempfile.mkdtemp())
        for rel in ui_i18n.UI_FILES:
            dst = self.tmp / rel
            dst.parent.mkdir(parents=True, exist_ok=True)
            shutil.copy(REAL_ROOT / rel, dst)
        ui_i18n.ROOT = self.tmp
        content_ai.LOGS = self.tmp / '.content_ai'
        self._fmt = content_ai._dart_format
        content_ai._dart_format = lambda files: None
        self._ask = content_ai.ask

    def tearDown(self):
        ui_i18n.ROOT = REAL_ROOT
        content_ai._dart_format = self._fmt
        content_ai.ask = self._ask
        shutil.rmtree(self.tmp)

    def _args(self, ui):
        class A:
            dry_run = False
            max_chars = 4000
        a = A()
        a.ui = ui
        return a

    def test_detects_missing_ui_strings(self):
        missing = content_ai.ui_missing('ja')
        cov = ui_i18n.coverage()
        expected = sum(r['missing_by_lang'].get('ja', 0) for r in cov.values())
        self.assertEqual(len(missing), expected)
        self.assertTrue(all(it['en'] or it['tr'] for it in missing))

    def test_full_run_fills_language_and_is_idempotent(self):
        def ask(prompt):
            rows = json.loads(prompt.split('Keys and source rows:\n', 1)[1])
            return {r['key']: fake_translation(r['en'] or r['tr'], 'ja') for r in rows}
        content_ai.ask = ask
        content_ai.cmd_translate_ui(self._args('ja'), uis=['ja'])
        self.assertEqual(content_ai.ui_missing('ja'), [])
        # Yer tutucular Dart interpolasyonu olarak geri yazıldı ve dosya çözümlenebiliyor.
        for b in ui_i18n.all_blocks():
            if 'ja' in b.values and b.values['ja'].text is not None and b.source:
                self.assertEqual(ui_i18n.tokens(b.values['ja'].text), ui_i18n.tokens(b.source), b.key)
        before = {rel: (self.tmp / rel).read_text() for rel in ui_i18n.UI_FILES}
        calls = []
        content_ai.ask = lambda p: calls.append(p) or {}
        content_ai.cmd_translate_ui(self._args('ja'), uis=['ja'])
        self.assertEqual(calls, [], 'tamamlanmış dil için yeniden istek atılmamalı')
        after = {rel: (self.tmp / rel).read_text() for rel in ui_i18n.UI_FILES}
        self.assertEqual(before, after)

    def test_rejects_bad_answers_and_writes_nothing_for_them(self):
        todo = content_ai.ui_missing('ru')
        with_ph = next(it for it in todo if it['placeholders'])
        plain = [it for it in todo if not it['placeholders'] and len(it['en'] or '') > 30][:4]
        batch = [with_ph] + plain
        good = fake_translation(plain[3]['en'], 'ru')
        answer = {
            with_ph['key']: re.sub(r'\{[^}]+\}', '', fake_translation(with_ph['en'], 'ru')),  # yer tutucu kaybı
            plain[0]['key']: '   ',                      # boş
            plain[1]['key']: plain[1]['en'],             # İngilizcenin aynısı / Kiril yok
            plain[2]['key']: plain[3]['en'],             # başka anahtarın metni
            plain[3]['key']: good,                       # geçerli
            'bilinmeyen:anahtar#0': 'x',                 # fazladan anahtar
        }
        ok, bad = content_ai.validate_ui_answer('ru', batch, answer)
        self.assertEqual(set(ok), {plain[3]['key']})
        self.assertIn('yer tutucu', bad[with_ph['key']])
        self.assertEqual(bad[plain[0]['key']], 'boş değer')
        self.assertIn(plain[1]['key'], bad)
        self.assertIn(plain[2]['key'], bad)
        ok2, bad2 = content_ai.validate_ui_answer('ru', batch, ['not', 'a', 'dict'])
        self.assertEqual(ok2, {})
        self.assertEqual(set(bad2), {it['key'] for it in batch})
        # Yalnızca geçerli olan yazılır; reddedilenler eksik kalır (tekrar denenebilir).
        content_ai.write_ui('ru', ok)
        still = {it['key'] for it in content_ai.ui_missing('ru')}
        self.assertNotIn(plain[3]['key'], still)
        self.assertTrue({with_ph['key'], plain[0]['key'], plain[1]['key']} <= still)

    def test_rejects_line_break_and_format_changes(self):
        src = 'First paragraph • one\n\nSecond → two. Contact: destek@voxelith.app'
        self.assertIsNone(ui_i18n.check_translation(src, fake_translation(src, 'de'), 'de'))
        self.assertIn('satır sonu', ui_i18n.check_translation(src, 'Tek paragraf • bir → iki destek@voxelith.app', 'tr'))
        self.assertIn('biçim', ui_i18n.check_translation(src, 'Birinci\n\nİkinci → iki destek@voxelith.app', 'tr'))
        self.assertIn('e-posta', ui_i18n.check_translation(src, 'Birinci • bir\n\nİkinci → iki destek@example.com', 'tr'))
        self.assertIn('printf', ui_i18n.check_translation('%d items left', 'noch Artikel', 'de'))
        # Kısa marka/evrensel ifadeler İngilizceyle aynı kalabilir.
        self.assertIsNone(ui_i18n.check_translation('VOXELITH Plus', 'VOXELITH Plus', 'ja'))
        self.assertIsNone(ui_i18n.check_translation('Email', 'Email', 'el'))

    def test_dart_literal_roundtrip_escapes(self):
        rel = 'lib/core/l10n/i18n_store.dart'
        b = next(b for b in ui_i18n.parse_file(rel) if 'days' in b.placeholders and 'ja' not in b.values) \
            if any('days' in b.placeholders and 'ja' not in b.values for b in ui_i18n.parse_file(rel)) else None
        if b is None:
            self.skipTest('uygun blok yok (tüm diller dolu)')
        text = "{days} gün — l'essai coûte $5 \\ 'quote'"
        ui_i18n.write_translations(rel, 'ja', {b.key: text})
        again = {x.key: x for x in ui_i18n.parse_file(rel)}[b.key]
        self.assertEqual(again.values['ja'].text, text)


class ContentValidationTest(unittest.TestCase):
    def test_content_answer_validation(self):
        batch = [{'key': 'p.ru_x_0', 'kind': 'phrase', 'lang': 'ru',
                  'target': 'Я ищу квартиру в центре города.', 'en': 'I am looking for a flat in the city centre.',
                  'tr': 'Şehir merkezinde daire arıyorum.'},
                 {'key': 'p.ru_x_1', 'kind': 'phrase', 'lang': 'ru',
                  'target': 'Сколько стоит аренда в месяц?', 'en': 'How much is the rent per month?',
                  'tr': 'Aylık kira ne kadar?'}]
        ok, bad = content_ai.validate_content_answer('de', batch, {
            'p.ru_x_0': 'Я ищу квартиру в центре города.',  # hedef cümle kopyası
            'p.ru_x_1': 'Wie hoch ist die Miete pro Monat?'})
        self.assertEqual(set(ok), {'p.ru_x_1'})
        self.assertIn('p.ru_x_0', bad)

    def test_scenario_validation_still_guards_quality(self):
        a1 = 'Kopi satu, tolong.'
        orig_source = content_ai.source
        content_ai.source = lambda lang: {'scenarios': [], 'stories': [],
                                          'items': [{'key': 'p.x', 'kind': 'phrase', 'target': a1}]}
        orig_pack = content_ai.pack
        content_ai.pack = lambda lang: {'scenarios': [], 'stories': []}
        try:
            base = {'cefr': 'a2', 'titles': {'tr': 't', 'en': 'e'}, 'clipLine': a1,
                    'turns': [{'prompt': 'p', 'expected': a1}] * 3}
            recycled = dict(base, id='id_a2_x', phrases=[
                {'target': a1, 'gloss': {'tr': 't', 'en': 'e'}}] * 6)
            slash = dict(base, id='id_a2_y', phrases=[
                {'target': 'Saya datang/pergi.', 'gloss': {'tr': 't', 'en': 'e'}}] * 6)
            ok, err = content_ai.validate_scenarios('id', {'scenarios': [recycled, slash]})
            self.assertEqual(ok, [])
            self.assertTrue(any('A1' in e for e in err))
            self.assertTrue(any('hedef' in e for e in err))
            ok, err = content_ai.validate_scenarios('id', {'broken': True})
            self.assertEqual(ok, [])
        finally:
            content_ai.source = orig_source
            content_ai.pack = orig_pack

    def test_store_metadata_validation(self):
        good = {k: 'Habla todos los días' for k in content_ai.STORE_LIMITS}
        ok, bad = content_ai.validate_store({
            'es': good,
            'de': dict(good, play_short='Lernen mit KI-Tutor'),   # kapalı özellik vaadi
            'fr': dict(good, play_title='x' * 31),               # karakter sınırı
            'en': good,                                           # kaynak dil yazılamaz
        })
        self.assertEqual(set(ok), {'es'})
        self.assertEqual(set(bad), {'de', 'fr', 'en'})

    def test_parse_json_rejects_garbage(self):
        with self.assertRaises(Exception):
            content_ai.parse_json('bu bir JSON değil')
        self.assertEqual(content_ai.parse_json('```json\n{"a": "b"}\n```'), {'a': 'b'})


if __name__ == '__main__':
    unittest.main()
