// UI çeviri kapsamı: lib/core/l10n/i18n*.dart içindeki her `t({...})` bloğu
// 30 dilin hepsinde dolu, boş değil ve yer tutucuları İngilizceyle aynı
// olmalı. Sayılar sabit değil — dosyalardan hesaplanır.
//
// Eksik çeviri varsa: python3 tools/content_ai.py translate-ui
// (bkz. docs/AI_ICERIK_PROMPTLARI.md).
import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:voxelith/core/l10n/i18n.dart';
import 'package:voxelith/data/content/content_store.dart';
import 'package:voxelith/data/models/models.dart';

const _files = [
  'lib/core/l10n/i18n.dart',
  'lib/core/l10n/i18n_ui.dart',
  'lib/core/l10n/i18n_store.dart',
];

class _Block {
  _Block(this.where);
  final String where;
  final Map<String, String?> values = {}; // null = dinamik ifade
}

class _Parser {
  _Parser(this.s);
  final String s;
  int i = 0;

  void skipWs() {
    while (i < s.length) {
      if (s[i].trim().isEmpty) {
        i++;
      } else if (s.startsWith('//', i)) {
        final j = s.indexOf('\n', i);
        i = j < 0 ? s.length : j + 1;
      } else {
        break;
      }
    }
  }

  String string() {
    final q = s[i++];
    final out = StringBuffer();
    while (s[i] != q) {
      final c = s[i];
      if (c == '\\') {
        final n = s[i + 1];
        out.write(switch (n) {
          'n' => '\n',
          't' => '\t',
          _ => n,
        });
        i += 2;
      } else if (c == r'$' && s[i + 1] == '{') {
        var depth = 1;
        var j = i + 2;
        while (depth > 0) {
          if (s[j] == '{') depth++;
          if (s[j] == '}') depth--;
          j++;
        }
        out.write('{${s.substring(i + 2, j - 1).trim()}}');
        i = j;
      } else if (c == r'$' && RegExp(r'[A-Za-z_]').hasMatch(s[i + 1])) {
        final m = RegExp(r'[A-Za-z_][A-Za-z0-9_]*').matchAsPrefix(s, i + 1)!;
        out.write('{${m[0]}}');
        i = m.end;
      } else {
        out.write(c);
        i++;
      }
    }
    i++;
    return out.toString();
  }

  String? expr() {
    final start = i;
    final parts = <String>[];
    while (true) {
      skipWs();
      if (i < s.length && (s[i] == "'" || s[i] == '"')) {
        parts.add(string());
      } else {
        break;
      }
    }
    if (parts.isNotEmpty && (s[i] == ',' || s[i] == '}')) return parts.join();
    // dinamik ifade: üst düzey virgüle kadar atla
    i = start;
    var depth = 0;
    while (i < s.length) {
      final c = s[i];
      if (c == "'" || c == '"') {
        string();
        continue;
      }
      if ('([{'.contains(c)) depth++;
      if (')]}'.contains(c)) {
        if (depth == 0) break;
        depth--;
      }
      if (c == ',' && depth == 0) break;
      i++;
    }
    return null;
  }
}

List<_Block> _parse(String path) {
  final src = File(path).readAsStringSync();
  final blocks = <_Block>[];
  for (final m in RegExp(r'\bt\(\{').allMatches(src)) {
    final line = '\n'.allMatches(src.substring(0, m.start)).length + 1;
    final b = _Block('$path:$line');
    final p = _Parser(src)..i = m.end;
    while (true) {
      p.skipWs();
      if (src[p.i] == '}') break;
      final key = RegExp(r"'([a-z]{2})'\s*:").matchAsPrefix(src, p.i);
      if (key == null) fail('${b.where}: çözümlenemedi');
      p.i = key.end;
      b.values[key[1]!] = p.expr();
      p.skipWs();
      if (src[p.i] == ',') p.i++;
    }
    blocks.add(b);
  }
  return blocks;
}

List<String> _tokens(String text) =>
    RegExp(r'\{[^{}\s]+\}').allMatches(text).map((m) => m[0]!).toList()..sort();

void main() {
  final langs = UiLang.values.map((l) => l.name).toList();
  final blocks = [for (final f in _files) ..._parse(f)];

  test('UI metin dosyaları çözümlenebiliyor', () {
    expect(blocks.length, greaterThan(100));
    expect(langs.length, 30);
  });

  test('her UI anahtarı 30 dilin hepsinde dolu', () {
    final missing = <String>[];
    for (final b in blocks) {
      final absent = langs.where((l) => !b.values.containsKey(l)).toList();
      if (absent.isNotEmpty) missing.add('${b.where} → ${absent.join(',')}');
    }
    expect(
      missing,
      isEmpty,
      reason:
          '${missing.length} UI anahtarında eksik dil var. '
          'Çalıştır: python3 tools/content_ai.py translate-ui\n'
          '${missing.take(15).join('\n')}',
    );
  });

  test('UI değerleri boş değil', () {
    final empty = [
      for (final b in blocks)
        for (final e in b.values.entries)
          if (e.value != null && e.value!.trim().isEmpty) '${b.where}/${e.key}',
    ];
    expect(empty, isEmpty);
  });

  test('yer tutucular her dilde İngilizceyle birebir aynı', () {
    final bad = <String>[];
    for (final b in blocks) {
      final en = b.values['en'];
      if (en == null) continue;
      for (final e in b.values.entries) {
        if (e.value == null) continue;
        if (_tokens(e.value!).join() != _tokens(en).join()) {
          bad.add('${b.where}/${e.key}: ${_tokens(e.value!)} ≠ ${_tokens(en)}');
        }
      }
    }
    expect(bad, isEmpty, reason: bad.take(15).join('\n'));
  });

  test('içerik çeviri ve paket dosyaları geçerli JSON', () {
    for (final dir in ['assets/content/i18n', 'assets/content/packs']) {
      for (final f in Directory(dir).listSync().whereType<File>()) {
        if (!f.path.endsWith('.json')) continue;
        final data = jsonDecode(f.readAsStringSync());
        expect(data, isA<Map<String, dynamic>>(), reason: f.path);
        if (dir.endsWith('i18n')) {
          for (final v in (data as Map).values) {
            expect(v, isA<String>(), reason: f.path);
            expect((v as String).trim(), isNotEmpty, reason: f.path);
          }
        } else {
          expect((data as Map).keys, containsAll(['scenarios', 'stories']));
        }
      }
    }
  });

  test('eksik çeviri çökme yerine güvenli yedeğe düşer', () async {
    expect(I18n(UiLang.ja).t({'en': 'Hello', 'tr': 'Merhaba'}), 'Hello');
    expect(I18n(UiLang.ja).t({'tr': 'Merhaba'}), 'Merhaba');
    const phrase = Phrase(id: 'nope', target: 'Hola', gloss: {});
    expect(phrase.glossFor(UiLang.ko), 'Hola');
    TestWidgetsFlutterBinding.ensureInitialized();
    // Var olmayan dil dosyası / bozuk varlık uygulamayı düşürmemeli.
    await ContentStore.ensureLanguage(UiLang.sw, bundle: _EmptyBundle());
    expect(ContentStore.text('p.nope', UiLang.sw), isNull);
  });
}

class _EmptyBundle extends CachingAssetBundle {
  @override
  Future<ByteData> load(String key) => Future.error(StateError('yok: $key'));
}
