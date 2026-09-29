import 'dart:convert';

import 'package:flutter/services.dart';

import '../models/models.dart';
import 'library.dart';

/// Dart kaynağına dokunmadan eklenen içerik: çeviriler, yeni senaryolar ve
/// kitaplık hikâyeleri. Dosyalar `tools/merge_content.py` ile üretilir
/// (bkz. docs/AI_ICERIK_PROMPTLARI.md).
///
/// - `assets/content/i18n/<ui>.json`   → `{"p.<phraseId>": "...", ...}`
/// - `assets/content/packs/<lang>.json` → `{"scenarios": [...], "stories": [...]}`
///
/// Dosya yoksa ya da bozuksa sessizce atlanır; uygulama Dart'taki içerikle
/// çalışmaya devam eder.
class ContentStore {
  static final Map<UiLang, Map<String, String>> _i18n = {};
  static final Map<LearnLang, List<Scenario>> _scenarios = {};
  static final Map<LearnLang, List<LibraryStory>> _stories = {};
  static bool _packsLoaded = false;

  static List<Scenario> scenariosFor(LearnLang lang) =>
      _scenarios[lang] ?? const [];
  static List<LibraryStory> storiesFor(LearnLang lang) =>
      _stories[lang] ?? const [];

  static String? text(String key, UiLang ui) => _i18n[ui]?[key];

  /// Açılışta bir kez: tüm dil paketleri + İngilizce ve verilen arayüz dili.
  static Future<void> init(UiLang ui, {AssetBundle? bundle}) async {
    ContentOverlay.resolver = text;
    await Future.wait([
      _loadPacks(bundle ?? rootBundle),
      ensureLanguage(UiLang.en, bundle: bundle),
      ensureLanguage(ui, bundle: bundle),
    ]);
  }

  /// Arayüz dili değişince çağrılır; zaten yüklüyse hiçbir şey yapmaz.
  static Future<void> ensureLanguage(UiLang ui, {AssetBundle? bundle}) async {
    if (_i18n.containsKey(ui)) return;
    final raw = await _read(
      bundle ?? rootBundle,
      'assets/content/i18n/${ui.name}.json',
    );
    if (raw == null) {
      _i18n[ui] = const {};
      return;
    }
    try {
      final map = jsonDecode(raw) as Map<String, dynamic>;
      _i18n[ui] = {
        for (final e in map.entries)
          if (e.value is String) e.key: e.value as String,
      };
    } catch (_) {
      _i18n[ui] = const {};
    }
  }

  static Future<void> _loadPacks(AssetBundle bundle) async {
    if (_packsLoaded) return;
    _packsLoaded = true;
    await Future.wait([
      for (final lang in LearnLang.values) _loadPack(bundle, lang),
    ]);
  }

  static Future<void> _loadPack(AssetBundle bundle, LearnLang lang) async {
    final raw = await _read(bundle, 'assets/content/packs/${lang.name}.json');
    if (raw == null) return;
    try {
      final json = jsonDecode(raw) as Map<String, dynamic>;
      _scenarios[lang] = [
        for (final s in (json['scenarios'] as List? ?? const []))
          _scenario(lang, s as Map<String, dynamic>),
      ];
      _stories[lang] = [
        for (final s in (json['stories'] as List? ?? const []))
          _story(lang, s as Map<String, dynamic>),
      ];
    } catch (_) {
      _scenarios.remove(lang);
      _stories.remove(lang);
    }
  }

  static Future<String?> _read(AssetBundle bundle, String path) async {
    try {
      return await bundle.loadString(path, cache: false);
    } catch (_) {
      return null;
    }
  }

  static Map<UiLang, String> _langMap(Object? json) {
    final out = <UiLang, String>{};
    if (json is! Map) return out;
    for (final e in json.entries) {
      final ui = UiLang.values.asNameMap()[e.key];
      if (ui != null && e.value is String && (e.value as String).isNotEmpty) {
        out[ui] = e.value as String;
      }
    }
    return out;
  }

  static Scenario _scenario(LearnLang lang, Map<String, dynamic> j) {
    final grammar = j['grammarNote'] as Map<String, dynamic>?;
    return Scenario(
      id: j['id'] as String,
      lang: lang,
      cefr: Cefr.values.byName(j['cefr'] as String),
      minutes: (j['minutes'] as num?)?.toInt() ?? 7,
      titles: _langMap(j['titles']),
      clipLine: j['clipLine'] as String,
      grammarNote: grammar == null
          ? null
          : GrammarNote(
              rule: _langMap(grammar['rule']),
              goodExample: grammar['goodExample'] as String,
              badExample: grammar['badExample'] as String,
            ),
      phrases: [
        for (final p in j['phrases'] as List)
          Phrase(
            id: (p as Map<String, dynamic>)['id'] as String,
            target: p['target'] as String,
            gloss: _langMap(p['gloss']),
            ipa: p['ipa'] as String?,
            hint: p['hint'] as String?,
          ),
      ],
      turns: [
        for (final t in j['turns'] as List)
          SpeakTurn(
            prompt: (t as Map<String, dynamic>)['prompt'] as String,
            expected: t['expected'] as String,
            scaffold: t['scaffold'] as String?,
          ),
      ],
    );
  }

  static LibraryStory _story(LearnLang lang, Map<String, dynamic> j) {
    final titles = _langMap(j['titles']);
    return LibraryStory(
      id: j['id'] as String,
      lang: lang,
      level: Cefr.values.byName(j['level'] as String),
      title: j['title'] as String,
      titleTr: titles[UiLang.tr] ?? j['title'] as String,
      sentences: [
        for (final s in j['sentences'] as List)
          LibrarySentence(
            target: (s as Map<String, dynamic>)['target'] as String,
            glossTr: _langMap(s['gloss'])[UiLang.tr] ?? '',
          ),
      ],
    );
  }
}
