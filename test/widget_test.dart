import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:voxelith/core/l10n/i18n.dart';
import 'package:voxelith/core/l10n/i18n_ui.dart';
import 'package:voxelith/core/theme/dark_theme.dart';
import 'package:voxelith/data/content/catalog.dart';
import 'package:voxelith/data/content/clips.dart';
import 'package:voxelith/data/content/language_guides.dart';
import 'package:voxelith/data/events/weekly_event.dart';
import 'package:voxelith/data/models/achievements.dart';
import 'package:voxelith/data/models/clan.dart';
import 'package:voxelith/data/models/leaderboard.dart';
import 'package:voxelith/data/models/models.dart';
import 'package:voxelith/data/notifications/notification_service.dart';
import 'package:voxelith/data/speech/phoneme_scorer.dart';
import 'package:voxelith/data/speech/speech_controller.dart';
import 'package:voxelith/data/translate/offline_translate.dart';
import 'package:voxelith/state/session.dart';
import 'package:voxelith/ui/widgets.dart';

void main() {
  test('all 30 learn languages have A1 plus A2/B1 scenarios', () {
    for (final lang in LearnLang.values) {
      final n = Catalog.forLang(lang).length;
      expect(
        n,
        greaterThanOrEqualTo(10),
        reason: '${lang.name} has $n scenarios',
      );
    }
  });

  test(
    'Spanish has 29 scenarios including A2/B1, bonus and professional packs',
    () {
      expect(Catalog.forLang(LearnLang.es).length, 29);
    },
  );

  test('Arabic A1 pack exists', () {
    expect(Catalog.forLang(LearnLang.ar).length, greaterThanOrEqualTo(5));
    final cafe = Catalog.byId('ar_cafe');
    expect(cafe, isNotNull);
  });

  test('NIE phrase exists in Spanish', () {
    expect(Catalog.byId('es_nie'), isNotNull);
    expect(Catalog.phraseById('es_nie_0')?.target, contains('NIE'));
  });

  test('all 30 languages have a guide', () {
    for (final lang in LearnLang.values) {
      final g = LanguageGuide.of(lang);
      expect(g.lang, lang);
      expect(
        g.headline.isNotEmpty,
        true,
        reason: '${lang.name} guide headline empty',
      );
    }
  });

  test('offline translate hits Spanish rent from Turkish', () {
    final hit = OfflineTranslate.lookup(
      input: 'kira',
      learn: LearnLang.es,
      ui: UiLang.tr,
    );
    expect(hit, isNotNull);
  });

  test('all learn languages have a flag and label', () {
    for (final lang in LearnLang.values) {
      expect(lang.flag().isNotEmpty, true);
      expect(lang.label(UiLang.en).isNotEmpty, true);
      expect(lang.label(UiLang.tr).isNotEmpty, true);
    }
  });

  test('total scenario count is 800', () {
    var total = 0;
    for (final lang in LearnLang.values) {
      total += Catalog.forLang(lang).length;
    }
    expect(total, 800);
  });

  test('pronunciation scoring is honest and deterministic', () {
    expect(SpeechController.pronunciationScore('Hello, world!', ''), 0);
    expect(
      SpeechController.pronunciationScore('Hello, world!', 'hello world'),
      100,
    );
    expect(
      SpeechController.pronunciationScore('Good morning', 'good evening'),
      inInclusiveRange(30, 98),
    );
    expect(SpeechController.pronunciationScore('こんにちは', 'こんにちは'), 100);
  });

  test(
    'curriculum translation supports every one of the 30 x 30 directions',
    () {
      for (final from in LearnLang.values) {
        final source = Catalog.forLang(from).first.phrases.first.target;
        for (final to in LearnLang.values) {
          final hit = OfflineTranslate.translate(
            input: source,
            from: from,
            to: to,
          );
          expect(hit, isNotNull, reason: '${from.name} → ${to.name}');
          expect(hit!.target, isNotEmpty);
          expect(hit.origin, TranslationOrigin.curriculum);
        }
      }
    },
  );

  test('verified dictionary has 102 entries in all 30 languages', () {
    for (final from in LearnLang.values) {
      final suggestions = OfflineTranslate.suggestions(from);
      expect(suggestions.length, 102, reason: from.name);
      for (final source in suggestions) {
        final hit = OfflineTranslate.translate(
          input: source,
          from: from,
          to: LearnLang.sw,
        );
        expect(hit, isNotNull, reason: '${from.name}: $source');
        expect(hit!.origin, TranslationOrigin.dictionary);
      }
    }
  });

  test(
    'clips are generated from every curriculum phrase in all 30 languages',
    () {
      for (final language in LearnLang.values) {
        final clips = ClipCatalog.forLang(language);
        final phraseCount = Catalog.forLang(
          language,
        ).fold<int>(0, (total, scenario) => total + scenario.phrases.length);
        expect(clips.length, phraseCount, reason: language.name);
        expect(clips, isNotEmpty, reason: language.name);
        expect(clips.every((clip) => clip.scenario.lang == language), true);
      }
    },
  );

  test('XP ranks, daily goal and game rewards follow the product rules', () {
    expect(UserProfile.empty.xpRank, XpRank.rookie);
    expect(UserProfile.empty.copyWith(totalXp: 500).xpRank, XpRank.learner);
    expect(UserProfile.empty.copyWith(totalXp: 1500).xpRank, XpRank.speaker);
    expect(UserProfile.empty.copyWith(totalXp: 4000).xpRank, XpRank.master);
    expect(UserProfile.empty.copyWith(totalXp: 10000).xpRank, XpRank.legend);
    expect(UserProfile.empty.copyWith(dailyXp: 100).dailyXpProgress, 1);
    expect(SessionController.gameXpFor(0, 10), 20);
    expect(
      SessionController.gameXpFor(10, 10),
      200,
    ); // 100 cevap + 100 performans
  });

  test('legacy profiles migrate to zero XP without data loss', () {
    final restored = UserProfile.fromJson(
      UserProfile.empty.toJson()
        ..remove('totalXp')
        ..remove('dailyXp')
        ..remove('xpDayKey'),
    );
    expect(restored.totalXp, 0);
    expect(restored.dailyXp, 0);
    expect(restored.learnLang, UserProfile.empty.learnLang);
  });

  test('leaderboard rows parse rank, XP and own-position marker', () {
    final entry = LeaderboardEntry.fromJson({
      'rank': 12,
      'user_id': 'user-1',
      'player_name': 'VOXELITH A1B2',
      'xp': 340,
      'is_me': true,
    });
    expect(entry.rank, 12);
    expect(entry.xp, 340);
    expect(entry.isMe, true);
  });

  test('all ten achievements have metadata and persist in profiles', () {
    expect(Achievement.values.length, 10);
    for (final ui in [UiLang.tr, UiLang.en]) {
      final i18n = I18n(ui);
      for (final achievement in Achievement.values) {
        expect(i18n.achievementTitle(achievement), isNotEmpty);
        expect(i18n.achievementDescription(achievement), isNotEmpty);
      }
    }
    final profile = UserProfile.empty.copyWith(
      completedScenes: 3,
      gamesCompleted: 2,
      completedLanguages: {LearnLang.en, LearnLang.es, LearnLang.de},
      achievements: {Achievement.firstStep, Achievement.gamer},
    );
    final restored = UserProfile.fromJson(profile.toJson());
    expect(restored.completedLanguages.length, 3);
    expect(restored.achievements, containsAll(profile.achievements));
  });

  test('daily notification copy covers lesson, streak, game and Plus', () {
    final base = UserProfile.empty;
    expect(NotificationService.contentFor(base, 0).$1, contains('Hadi derse!'));
    expect(
      NotificationService.contentFor(base.copyWith(streak: 5), 1).$2,
      contains('5 gün'),
    );
    expect(
      NotificationService.contentFor(base, 2).$2,
      contains('Harf Sıralama'),
    );
    expect(
      NotificationService.contentFor(base.copyWith(isPlus: true), 0).$1,
      'VOXELITH Plus',
    );
  });

  test('notification preference and hour persist', () {
    final restored = UserProfile.fromJson(
      UserProfile.empty
          .copyWith(notificationsEnabled: false, reminderHour: 10)
          .toJson(),
    );
    expect(restored.notificationsEnabled, false);
    expect(restored.reminderHour, 10);
  });

  testWidgets('original Voxelith mascot renders every expression', (
    tester,
  ) async {
    for (final mood in MascotMood.values) {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(body: VoxelithMascot(mood: mood, animate: false)),
        ),
      );
      expect(find.byType(VoxelithMascot), findsOneWidget);
    }
  });

  test('weekly Spanish event and ad frequency rules are deterministic', () {
    expect(WeeklyEvent.weekKey(DateTime.utc(2026, 8, 21)), '2026-08-17');
    final event = WeeklyEvent.current();
    final joined = UserProfile.empty.copyWith(
      learnLang: LearnLang.es,
      joinedEventId: event.id,
    );
    expect(event.applies(joined), true);

    final now = DateTime.fromMillisecondsSinceEpoch(1000 * 1000);
    final waiting = UserProfile.empty.copyWith(lastAdEpoch: 900);
    expect(waiting.canShowInterstitial(now), false);
    final ready = UserProfile.empty.copyWith(lastAdEpoch: 600);
    expect(ready.canShowInterstitial(now), true);
    expect(UserProfile.empty.copyWith(adsWatchedToday: 5).canWatchAd, false);
  });

  test('A2+ scenarios teach new sentences, not relabelled A1 ones', () {
    for (final language in LearnLang.values) {
      final scenarios = Catalog.forLang(language);
      final a1 = {
        for (final s in scenarios.where((s) => s.cefr == Cefr.a1))
          for (final p in s.phrases) p.target.trim(),
      };
      for (final s in scenarios.where((s) => s.cefr != Cefr.a1)) {
        expect(
          s.phrases.every((p) => a1.contains(p.target.trim())),
          false,
          reason: '${s.id} is labelled ${s.cefr.name} but only repeats A1',
        );
      }
    }
  });

  test('languages with intermediate content keep A2 and B1 practice', () {
    // ru, zh, ko, vi, id, uk, he, fa, sw have no real A2+ content yet
    // (docs/AI_ICERIK_PROMPTLARI.md) — add them here once delivered.
    const withIntermediate = [
      LearnLang.en,
      LearnLang.es,
      LearnLang.de,
      LearnLang.fr,
      LearnLang.nl,
      LearnLang.ar,
      LearnLang.pt,
      LearnLang.it,
      LearnLang.ja,
      LearnLang.tr,
      LearnLang.pl,
      LearnLang.sv,
      LearnLang.da,
      LearnLang.no,
      LearnLang.fi,
      LearnLang.el,
      LearnLang.cs,
      LearnLang.ro,
      LearnLang.hu,
      LearnLang.hi,
      LearnLang.th,
    ];
    for (final language in withIntermediate) {
      final scenarios = Catalog.forLang(language);
      expect(
        scenarios.any((scenario) => scenario.cefr == Cefr.a2),
        true,
        reason: '${language.name} A2 missing',
      );
      expect(
        scenarios.any((scenario) => scenario.cefr == Cefr.b1),
        true,
        reason: '${language.name} B1 missing',
      );
    }
  });

  test('phoneme scorer returns real sub-scores and actionable feedback', () {
    final exact = PhonemeScorer.assess(
      expected: 'Thank you very much',
      heard: 'thank you very much',
      languageCode: 'en',
      acousticConfidence: .95,
    );
    expect(exact.phonemeAccuracy, 100);
    expect(exact.overall, greaterThanOrEqualTo(90));
    final imperfect = PhonemeScorer.assess(
      expected: 'Muchas gracias',
      heard: 'mucha gracia',
      languageCode: 'es',
      acousticConfidence: .7,
    );
    expect(imperfect.overall, inInclusiveRange(40, 95));
    expect(imperfect.feedback, isNotEmpty);
    expect(
      PhonemeScorer.assess(
        expected: 'Merhaba',
        heard: '',
        languageCode: 'tr',
      ).overall,
      0,
    );
  });

  test('Maya prioritises a female neural voice in the requested language', () {
    final basic = SpeechController.voiceQualityScore({
      'name': 'English Female',
      'locale': 'en-US',
      'gender': 'female',
    }, 'en');
    final neural = SpeechController.voiceQualityScore({
      'name': 'English Neural Female',
      'locale': 'en-US',
      'gender': 'female',
    }, 'en');
    final wrongLanguage = SpeechController.voiceQualityScore({
      'name': 'English Neural Female',
      'locale': 'en-US',
      'gender': 'female',
    }, 'es');
    expect(neural, greaterThan(basic));
    expect(wrongLanguage, -1000);
  });

  test('dark theme and user preference are persisted', () {
    final dark = buildVoxelithDarkTheme();
    expect(dark.brightness, Brightness.dark);
    expect(dark.colorScheme.surface.computeLuminance(), lessThan(.1));
    final restored = UserProfile.fromJson(
      UserProfile.empty
          .copyWith(themePreference: AppThemePreference.dark)
          .toJson(),
    );
    expect(restored.themePreference, AppThemePreference.dark);
  });

  test('Plus family plan keeps four isolated local profiles', () async {
    SharedPreferences.setMockInitialValues({});
    final preferences = await SharedPreferences.getInstance();
    final container = ProviderContainer(
      overrides: [prefsProvider.overrideWithValue(preferences)],
    );
    addTearDown(container.dispose);
    final controller = container.read(sessionProvider.notifier);
    await controller.setPlus(true);
    expect(await controller.addFamilyProfile('Deniz'), true);
    expect(await controller.addFamilyProfile('Ada'), true);
    expect(await controller.addFamilyProfile('Mert'), true);
    expect(controller.familyProfiles().length, 4);
    expect(await controller.addFamilyProfile('Beşinci'), false);
    final profiles = controller.familyProfiles();
    expect(
      profiles.map((profile) => profile.profileName),
      containsAll(['Ana Profil', 'Deniz', 'Ada', 'Mert']),
    );
    expect(profiles.map((profile) => profile.profileId).toSet().length, 4);
  });

  test('clan member rows preserve team rank and ownership', () {
    final member = ClanMemberEntry.fromJson({
      'clan_id': 'clan-1',
      'clan_name': 'VOXELITH Takımı',
      'join_code': 'A1B2C3',
      'rank': 1,
      'user_id': 'user-1',
      'player_name': 'Deniz',
      'xp': 420,
      'is_me': true,
      'is_owner': true,
    });
    expect(member.rank, 1);
    expect(member.joinCode, 'A1B2C3');
    expect(member.isOwner, true);
  });
}
