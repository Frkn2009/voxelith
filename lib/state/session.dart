import 'dart:async';
import 'dart:convert';
import 'dart:ui' show PlatformDispatcher;

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

import '../core/l10n/i18n.dart';
import '../data/content/catalog.dart';
import '../data/content/content_store.dart';
import '../data/events/analytics_events.dart';
import '../data/events/weekly_event.dart';
import '../data/models/achievements.dart';
import '../data/models/models.dart';
import '../data/supabase/supa_service.dart';
import 'streak_rules.dart';

final prefsProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError('prefs override in main');
});

final sessionProvider = NotifierProvider<SessionController, UserProfile>(
  SessionController.new,
);

final i18nProvider = Provider<I18n>(
  (ref) => I18n(ref.watch(sessionProvider).uiLang),
);

class SessionController extends Notifier<UserProfile> {
  static const _key = 'voxelith.profile.v1';
  static const _profilePrefix = 'voxelith.family.profile.';
  static const _activeProfileKey = 'voxelith.family.active';

  SharedPreferences get _prefs => ref.read(prefsProvider);

  @override
  UserProfile build() {
    final activeId = _prefs.getString(_activeProfileKey) ?? 'main';
    final raw =
        _prefs.getString('$_profilePrefix$activeId') ?? _prefs.getString(_key);
    var profile = raw == null
        ? UserProfile.empty.copyWith(uiLang: _deviceUiLang())
        : UserProfile.fromJson(jsonDecode(raw) as Map<String, dynamic>);
    if (profile.profileId != activeId) {
      profile = profile.copyWith(profileId: activeId);
    }
    return _withAchievements(_rollDay(profile));
  }

  /// İlk kurulumda (kayıtlı profil yokken) arayüz dilini cihazın kendi
  /// dilinden tahmin eder — böylece onboarding her ülkede varsayılan
  /// olarak Türkçe değil, kullanıcının kendi dilinde açılır. Kullanıcı
  /// onboarding'in ilk adımında (`Ana dilin hangisi?`) istediği zaman
  /// bunu değiştirebilir; bu sadece başlangıç tahmini.
  UiLang _deviceUiLang() {
    final code = PlatformDispatcher.instance.locale.languageCode;
    for (final lang in UiLang.values) {
      if (lang.name == code) return lang;
    }
    return UiLang.en;
  }

  String _today() {
    final now = DateTime.now();
    String two(int value) => value.toString().padLeft(2, '0');
    return '${now.year}-${two(now.month)}-${two(now.day)}';
  }

  UserProfile _rollDay(UserProfile p) {
    final today = _today();
    var rolled = p;
    if (rolled.speakDayKey != today) {
      rolled = rolled.copyWith(
        speakSecondsUsed: 0,
        speakDayKey: today,
        bonusSpeakSeconds: 0,
        adsWatchedToday: 0,
      );
      if (rolled.onboarded &&
          rolled.onboardedDayKey.isNotEmpty &&
          rolled.onboardedDayKey != today &&
          !rolled.day1ReturnLogged) {
        AnalyticsEvents.log(AnalyticsEvents.day1Return);
        rolled = rolled.copyWith(day1ReturnLogged: true);
      }
    }
    if (rolled.interpreterDayKey != today) {
      rolled = rolled.copyWith(
        interpreterSecondsUsed: 0,
        interpreterDayKey: today,
        bonusInterpreterSeconds: 0,
      );
    }
    if (rolled.xpDayKey != today) {
      rolled = rolled.copyWith(dailyXp: 0, xpDayKey: today);
    }
    final refill = StreakRules.refillForPlus(
      isPlus: rolled.isPlus,
      freezes: rolled.streakFreezes,
      lastRefillWeekKey: rolled.freezeRefillWeekKey,
      today: DateTime.now(),
    );
    if (refill.weekKey != rolled.freezeRefillWeekKey) {
      rolled = rolled.copyWith(
        streakFreezes: refill.freezes,
        freezeRefillWeekKey: refill.weekKey,
      );
    }
    if (rolled.lastAdEpoch == 0) {
      rolled = rolled.copyWith(
        lastAdEpoch: DateTime.now().millisecondsSinceEpoch ~/ 1000,
      );
    }
    return rolled;
  }

  UserProfile _withAchievements(UserProfile profile) {
    final unlocked = {...profile.achievements};
    if (profile.completedScenes > 0) unlocked.add(Achievement.firstStep);
    if (profile.streak >= 3) unlocked.add(Achievement.fireStarted);
    if (profile.phrasesKnown >= 10) unlocked.add(Achievement.tenPhrases);
    if (profile.gamesCompleted > 0) unlocked.add(Achievement.gamer);
    if (profile.completedLanguages.length >= 3) {
      unlocked.add(Achievement.traveler);
    }
    if (profile.isPlus) unlocked.add(Achievement.plus);
    if (profile.dailyXp >= UserProfile.dailyXpGoal) {
      unlocked.add(Achievement.dailyHundred);
    }
    if (profile.streak >= 7) unlocked.add(Achievement.sevenDayStreak);
    return profile.copyWith(achievements: unlocked);
  }

  Future<void> _save(UserProfile p) async {
    p = _withAchievements(p);
    state = p;
    final encoded = jsonEncode(p.toJson());
    await _prefs.setString(_activeProfileKey, p.profileId);
    await _prefs.setString('$_profilePrefix${p.profileId}', encoded);
    await _prefs.setString(_key, encoded);
    // Giriş yapılmışsa ve anahtarlar girilmişse buluta da yaz.
    // Hata olsa bile akışı kesme; veri yerelde zaten duruyor.
    if (Supa.enabled) {
      unawaited(Supa.pushProfile(p).catchError((_) {}));
      if (p.isPlus) {
        unawaited(Supa.pushFamilyProfile(p).catchError((_) {}));
      }
    }
  }

  Future<void> setUi(UiLang ui) async {
    // Yeni dilin içerik çevirileri (assets/content/i18n) ekran yenilenmeden
    // önce hazır olsun.
    await ContentStore.ensureLanguage(ui);
    await _save(state.copyWith(uiLang: ui));
  }

  Future<void> setLearn(LearnLang l) => _save(state.copyWith(learnLang: l));
  Future<void> setMotive(Motive m) => _save(state.copyWith(motive: m));
  Future<void> setCefr(Cefr c) => _save(state.copyWith(cefr: c));
  Future<void> setLearningStyle(LearningStyle s) =>
      _save(state.copyWith(learningStyle: s));
  Future<void> setStrugglePoint(StrugglePoint s) =>
      _save(state.copyWith(strugglePoint: s));

  /// Plan önizlemesinde de değiştirilebilir olduğu için 5/10/15 dışına
  /// düşerse en yakın geçerli değere yuvarlar.
  Future<void> setDailyGoalMin(int minutes) {
    final clamped = [
      5,
      10,
      15,
    ].reduce((a, b) => (minutes - a).abs() <= (minutes - b).abs() ? a : b);
    return _save(state.copyWith(dailyGoalMin: clamped));
  }

  Future<void> setPracticeDays(Set<Weekday> days) =>
      _save(state.copyWith(practiceDays: days));

  /// Zaman dilimini mevcut hatırlatma-saati sistemine eşler
  /// (bkz. `NotificationService`).
  Future<void> setPracticeTimeOfDay(PracticeTimeOfDay timeOfDay) {
    final hour = switch (timeOfDay) {
      PracticeTimeOfDay.morning => 9,
      PracticeTimeOfDay.afternoon => 14,
      PracticeTimeOfDay.evening => 19,
    };
    return _save(
      state.copyWith(
        practiceTimeOfDay: timeOfDay,
        reminderHour: hour,
        notificationsEnabled: true,
      ),
    );
  }

  Future<void> finishOnboarding() => _save(
    state.copyWith(onboarded: true, streak: 1, onboardedDayKey: _today()),
  );
  Future<void> setPlus(bool v) => _save(state.copyWith(isPlus: v));

  Future<void> setBusiness(bool v) => _save(state.copyWith(isBusiness: v));
  Future<void> setNotificationsEnabled(bool value) =>
      _save(state.copyWith(notificationsEnabled: value));
  Future<void> setReminderHour(int hour) =>
      _save(state.copyWith(reminderHour: hour == 10 ? 10 : 19));
  Future<void> setThemePreference(AppThemePreference value) =>
      _save(state.copyWith(themePreference: value));

  List<UserProfile> familyProfiles() {
    final profiles = <String, UserProfile>{state.profileId: state};
    for (final key in _prefs.getKeys().where(
      (key) => key.startsWith(_profilePrefix),
    )) {
      final raw = _prefs.getString(key);
      if (raw == null) continue;
      try {
        final profile = UserProfile.fromJson(
          jsonDecode(raw) as Map<String, dynamic>,
        );
        profiles[profile.profileId] = profile;
      } catch (_) {}
    }
    final list = profiles.values.toList()
      ..sort((a, b) {
        if (a.profileId == 'main') return -1;
        if (b.profileId == 'main') return 1;
        return a.profileName.compareTo(b.profileName);
      });
    return list;
  }

  Future<bool> addFamilyProfile(String name) async {
    if (!state.isPlus || familyProfiles().length >= 4) return false;
    await _prefs.setString(
      '$_profilePrefix${state.profileId}',
      jsonEncode(state.toJson()),
    );
    final id = const Uuid().v4();
    final profile = UserProfile.empty.copyWith(
      profileId: id,
      profileName: name.trim().isEmpty ? 'Aile Profili' : name.trim(),
      uiLang: state.uiLang,
      learnLang: state.learnLang,
      isPlus: true,
      onboarded: true,
      themePreference: state.themePreference,
      notificationsEnabled: false,
    );
    await _save(profile);
    return true;
  }

  Future<bool> switchFamilyProfile(String profileId) async {
    final raw = _prefs.getString('$_profilePrefix$profileId');
    if (raw == null) return false;
    final profile = UserProfile.fromJson(
      jsonDecode(raw) as Map<String, dynamic>,
    );
    await _save(_rollDay(profile));
    return true;
  }

  Future<void> renameFamilyProfile(String name) async {
    final clean = name.trim();
    if (clean.isEmpty) return;
    await _save(state.copyWith(profileName: clean));
  }

  Future<bool> deleteFamilyProfile(String profileId) async {
    if (profileId == 'main' || profileId == state.profileId) return false;
    final removed = await _prefs.remove('$_profilePrefix$profileId');
    if (removed) state = state.copyWith();
    return removed;
  }

  Future<void> consumeSpeak(int seconds) async {
    var p = _rollDay(state);
    if (p.isPlus) {
      await _save(p);
      return;
    }
    await _save(p.copyWith(speakSecondsUsed: p.speakSecondsUsed + seconds));
  }

  /// Plus/Business'ta da gerçek günlük tavan var (2sa/8sa) — [consumeSpeak]
  /// gibi üst katmanı atlamıyor, sadece [UserProfile.interpreterAllowance]
  /// katmana göre büyüyor.
  Future<void> consumeInterpreter(int seconds) async {
    final p = _rollDay(state);
    await _save(
      p.copyWith(interpreterSecondsUsed: p.interpreterSecondsUsed + seconds),
    );
  }

  Future<void> learnPhrase(String id) async {
    final ids = {...state.learnedIds, id};
    final due = {...state.srs, id: _epochDay() + 1};
    await _save(
      state.copyWith(learnedIds: ids, phrasesKnown: ids.length, srs: due),
    );
  }

  Future<int> awardXp(int amount, {String source = 'correct'}) async {
    if (amount <= 0) return 0;
    final profile = _rollDay(state);
    final effectiveAmount =
        WeeklyEvent.current().applies(profile) && source != 'ad'
        ? amount * WeeklyEvent.current().multiplier
        : amount;
    final today = _today();
    // Kaçırılan günler seri koruma hakkıyla kapatılır (bkz. StreakRules).
    final next = StreakRules.onPractice(
      streak: profile.streak,
      lastDayKey: profile.lastPracticeDayKey,
      freezes: profile.streakFreezes,
      today: DateTime.now(),
    );
    await _save(
      profile.copyWith(
        totalXp: profile.totalXp + effectiveAmount,
        dailyXp: profile.dailyXp + effectiveAmount,
        streak: next.streak,
        streakFreezes: next.freezes,
        lastPracticeDayKey: today,
      ),
    );
    if (Supa.enabled) {
      unawaited(Supa.recordXp(effectiveAmount, source).catchError((_) {}));
    }
    return effectiveAmount;
  }

  /// Doğru cevap XP'si (+10) ve performans oyun bonusu (+20…100).
  static int gameXpFor(int correct, int total) {
    final safeTotal = total <= 0 ? 1 : total;
    final safeCorrect = correct.clamp(0, safeTotal).toInt();
    final performanceBonus = 20 + (80 * safeCorrect / safeTotal).round();
    return safeCorrect * 10 + performanceBonus;
  }

  Future<int> completeGame(int correct, int total) async {
    final earned = gameXpFor(correct, total);
    final granted = await awardXp(earned, source: 'game');
    final unlocked = {...state.achievements};
    if (total > 0 && correct >= total) unlocked.add(Achievement.perfect);
    await _save(
      state.copyWith(
        gamesCompleted: state.gamesCompleted + 1,
        achievements: unlocked,
      ),
    );
    return granted;
  }

  Future<int> completeScene(LearnLang language, {String? sceneId}) async {
    final granted = await awardXp(50, source: 'scene');
    await _save(
      state.copyWith(
        completedScenes: state.completedScenes + 1,
        completedLanguages: {...state.completedLanguages, language},
        completedSceneIds: sceneId == null
            ? state.completedSceneIds
            : {...state.completedSceneIds, sceneId},
      ),
    );
    return granted;
  }

  Future<void> unlockAchievement(Achievement achievement) async {
    if (state.achievements.contains(achievement)) return;
    await _save(
      state.copyWith(achievements: {...state.achievements, achievement}),
    );
  }

  Future<void> redeemRewardedAd({required AdReward reward}) async {
    final profile = _rollDay(state);
    if (!profile.canWatchAd) return;
    final now = DateTime.now().millisecondsSinceEpoch ~/ 1000;
    await _save(
      profile.copyWith(
        bonusSpeakSeconds:
            profile.bonusSpeakSeconds + (reward == AdReward.speakTime ? 30 : 0),
        bonusInterpreterSeconds:
            profile.bonusInterpreterSeconds +
            (reward == AdReward.interpreterTime ? 120 : 0),
        adsWatchedToday: profile.adsWatchedToday + 1,
        lastAdEpoch: now,
      ),
    );
    if (reward == AdReward.xp) await awardXp(20, source: 'ad');
  }

  Future<void> recordInterstitial() async {
    final profile = _rollDay(state);
    if (!profile.canWatchAd) return;
    await _save(
      profile.copyWith(
        adsWatchedToday: profile.adsWatchedToday + 1,
        lastAdEpoch: DateTime.now().millisecondsSinceEpoch ~/ 1000,
      ),
    );
  }

  Future<void> joinWeeklyEvent(String eventId, {required bool countAd}) async {
    final profile = _rollDay(state);
    if (countAd && !profile.canWatchAd) return;
    await _save(
      profile.copyWith(
        joinedEventId: eventId,
        adsWatchedToday: profile.adsWatchedToday + (countAd ? 1 : 0),
        lastAdEpoch: countAd
            ? DateTime.now().millisecondsSinceEpoch ~/ 1000
            : profile.lastAdEpoch,
      ),
    );
  }

  List<Phrase> duePhrases() {
    final today = _epochDay();
    final out = <Phrase>[];
    for (final e in state.srs.entries) {
      if (e.value > today) continue;
      final p = Catalog.phraseById(e.key);
      if (p != null) out.add(p);
    }
    return out;
  }

  Future<void> grade(String id, int quality) async {
    // quality: 0 again, 3 good, 5 easy
    final add = switch (quality) {
      >= 5 => 7,
      >= 3 => 3,
      _ => 0,
    };
    final due = {...state.srs, id: _epochDay() + add};
    await _save(state.copyWith(srs: due));
  }

  int _epochDay() => DateTime.now().millisecondsSinceEpoch ~/ 86400000;

  /// Girişten sonra buluttan gelen profili kabul et.
  Future<void> importRemote(UserProfile remote) async {
    await _save(remote);
  }

  Future<void> importFamilyProfiles(List<UserProfile> profiles) async {
    for (final profile in profiles.take(4)) {
      await _prefs.setString(
        '$_profilePrefix${profile.profileId}',
        jsonEncode(profile.toJson()),
      );
    }
    state = state.copyWith();
  }

  /// Yerel profili buluta yaz (girişten hemen sonra, bulutta satır yoksa).
  Future<void> pushCurrent() async {
    await Supa.pushProfile(state);
  }

  Future<void> wipeAccount() async {
    for (final key in _prefs.getKeys().where(
      (key) => key.startsWith(_profilePrefix) || key == _activeProfileKey,
    )) {
      await _prefs.remove(key);
    }
    await _prefs.remove(_key);
    state = UserProfile.empty;
  }

  Scenario todayScenario() {
    final list = Catalog.forLang(state.learnLang);
    if (list.isEmpty) {
      return Catalog.forLang(LearnLang.en).first;
    }
    final idx = DateTime.now().day % list.length;
    return list[idx];
  }
}
