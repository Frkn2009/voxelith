// İçerik dışa aktarma aracı — normal `flutter test` çalıştırmasına dahil
// değildir (test/ dışında). Çalıştırma:
//
//   flutter test tools/export_content_test.dart
//
// Çıktı: docs/content_tasks/source/<learnLang>.json — çevrilecek her metin
// (anahtar, hedef dildeki metin, tr/en karşılığı, Dart'ta zaten var olan
// arayüz dilleri). tools/content_ai.py bu dosyaları okur.
import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:voxelith/data/content/catalog.dart';
import 'package:voxelith/data/content/content_store.dart';
import 'package:voxelith/data/content/language_guides.dart';
import 'package:voxelith/data/content/library.dart';
import 'package:voxelith/data/models/models.dart';
import 'package:voxelith/features/alphabet/alphabet_engine.dart';

List<String> _have(Map<UiLang, String> m) => [
  for (final e in m.entries)
    if (e.value.trim().isNotEmpty) e.key.name,
];

void main() {
  test('export content sources', () async {
    TestWidgetsFlutterBinding.ensureInitialized();
    // assets/content/packs içindeki senaryolar da dışa aktarılsın.
    await ContentStore.init(UiLang.en);
    final outDir = Directory('docs/content_tasks/source')
      ..createSync(recursive: true);
    for (final lang in LearnLang.values) {
      final items = <Map<String, Object?>>[];
      final seen = <String>{};
      void add(Map<String, Object?> item) {
        if (seen.add(item['key']! as String)) items.add(item);
      }

      for (final s in Catalog.forLang(lang)) {
        add({
          'key': 's.${s.id}',
          'kind': 'scenario_title',
          'tr': s.titles[UiLang.tr],
          'en': s.titles[UiLang.en],
          'have': _have(s.titles),
        });
        final g = s.grammarNote;
        if (g != null) {
          add({
            'key': 'g.${s.id}',
            'kind': 'grammar_rule',
            'tr': g.rule[UiLang.tr],
            'en': g.rule[UiLang.en],
            'context': '${g.goodExample} / ✗ ${g.badExample}',
            'have': _have(g.rule),
          });
        }
        for (var i = 0; i < s.turns.length; i++) {
          add({
            'key': 'tp.${s.id}.$i',
            'kind': 'speaking_prompt',
            'en': s.turns[i].prompt,
            'context': s.turns[i].expected,
            'have': const <String>[],
          });
        }
        for (final p in s.phrases) {
          add({
            'key': 'p.${p.id}',
            'kind': 'phrase',
            'target': p.target,
            'tr': p.gloss[UiLang.tr],
            'en': p.gloss[UiLang.en],
            'have': _have(p.gloss),
          });
        }
      }
      for (final st in VoxelithLibrary.forLang(lang)) {
        add({
          'key': 'st.${st.id}',
          'kind': 'story_title',
          'target': st.title,
          'tr': st.titleTr,
          'have': const ['tr'],
        });
        for (var i = 0; i < st.sentences.length; i++) {
          add({
            'key': 'ss.${st.id}.$i',
            'kind': 'story_sentence',
            'target': st.sentences[i].target,
            'tr': st.sentences[i].glossTr,
            'have': const ['tr'],
          });
        }
      }
      final alphabet = AlphabetEngine.getAlphabet(lang.name);
      for (final l in alphabet.letters) {
        final base = 'al.${lang.name}.${l.character}';
        add({
          'key': '$base.n',
          'kind': 'alphabet_letter_name',
          'target': l.character,
          'tr': l.nameTr,
          'en': l.nameEn,
          'have': const ['tr', 'en'],
        });
        if (l.sound.trim().isNotEmpty) {
          add({
            'key': '$base.s',
            'kind': 'alphabet_sound',
            'target': l.character,
            'tr': l.sound,
            'context': l.exampleWord,
            'have': const ['tr'],
          });
        }
        if (l.exampleMeaning.trim().isNotEmpty) {
          add({
            'key': '$base.m',
            'kind': 'alphabet_example',
            'target': l.exampleWord,
            'tr': l.exampleMeaning,
            'have': const ['tr'],
          });
        }
      }
      final rules = LanguageGuide.of(lang).rules;
      for (var i = 0; i < rules.length; i++) {
        final r = rules[i];
        add({
          'key': 'gd.${lang.name}.$i.h',
          'kind': 'pronunciation_heard',
          'target': r.written,
          'tr': r.heard,
          'context': r.why,
          'have': const ['tr'],
        });
        add({
          'key': 'gd.${lang.name}.$i.x',
          'kind': 'pronunciation_respelling',
          'target': r.example,
          'tr': r.exampleSaid,
          'have': const ['tr'],
        });
      }
      final existing = [
        for (final s in Catalog.forLang(lang))
          {
            'id': s.id,
            'cefr': s.cefr.name,
            'title': s.titles[UiLang.en] ?? s.titles[UiLang.tr],
          },
      ];
      File('${outDir.path}/${lang.name}.json').writeAsStringSync(
        const JsonEncoder.withIndent(' ').convert({
          'lang': lang.name,
          'scenarios': existing,
          'stories': [
            for (final st in VoxelithLibrary.forLang(lang))
              {'id': st.id, 'level': st.level.name, 'title': st.title},
          ],
          'items': items,
        }),
      );
    }
  });
}
