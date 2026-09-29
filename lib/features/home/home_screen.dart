import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/features.dart';
import '../../core/l10n/i18n_ui.dart';
import '../../core/theme/tokens.dart';
import '../../data/content/catalog.dart';
import '../../data/events/weekly_event.dart';
import '../../data/models/models.dart';
import '../../state/session.dart';
import '../../ui/widgets.dart';
import '../onboarding/coach_tour.dart';

/// Uygulamayı ilk kez açan kullanıcıya bir kere gösterilen, gerçek ana
/// sayfa öğelerini işaret eden interaktif tanıtım turu.
const _tourSeenPrefsKey = 'home_tour_seen_v1';
const _reviewAskedPrefsKey = 'review_asked_at_streak_v1';

/// Sistemin kendi puan penceresi bu seri günlerinde (bir kez) istenir. Ön
/// "memnun musun?" sorusu yok — Apple 5.6.1 / Google Play buna izin vermez.
/// Sistem pencereyi yılda birkaç kezle sınırlar; çağırmak zararsızdır.
const _reviewStreakMilestones = [3, 14, 45];

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final _xpCardKey = GlobalKey();
  final _todaySpeakKey = GlobalKey();
  final _libraryKey = GlobalKey();
  final _reviewKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _maybeStartTour());
  }

  Future<void> _maybeAskForReview(SharedPreferences prefs) async {
    final streak = ref.read(sessionProvider).streak;
    final asked = prefs.getInt(_reviewAskedPrefsKey) ?? 0;
    final milestone = _reviewStreakMilestones.lastWhere(
      (m) => streak >= m,
      orElse: () => 0,
    );
    if (milestone == 0 || milestone <= asked) return;
    await prefs.setInt(_reviewAskedPrefsKey, milestone);
    try {
      final review = InAppReview.instance;
      if (await review.isAvailable()) await review.requestReview();
    } catch (_) {
      // Desteklenmeyen platform (web vb.) — sessizce geç.
    }
  }

  Future<void> _maybeStartTour() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.getBool(_tourSeenPrefsKey) == true) {
      await _maybeAskForReview(prefs);
      return;
    }
    if (!mounted) return;
    await prefs.setBool(_tourSeenPrefsKey, true);
    if (!mounted) return;
    final i18n = ref.read(i18nProvider);
    CoachTour.start(
      context,
      steps: [
        CoachStep(
          targetKey: _xpCardKey,
          title: i18n.homeTourXpTitle,
          body: i18n.homeTourXpBody,
        ),
        CoachStep(
          targetKey: _todaySpeakKey,
          title: i18n.homeTourSpeakTitle,
          body: i18n.homeTourSpeakBody,
        ),
        CoachStep(
          targetKey: _libraryKey,
          title: i18n.homeTourLibraryTitle,
          body: i18n.homeTourLibraryBody,
        ),
        CoachStep(
          targetKey: _reviewKey,
          title: i18n.homeTourReviewTitle,
          body: i18n.homeTourReviewBody,
        ),
      ],
    );
  }

  @override
  void dispose() {
    CoachTour.dismiss();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final i18n = ref.watch(i18nProvider);
    final p = ref.watch(sessionProvider);
    final scene = ref.read(sessionProvider.notifier).todayScenario();
    final remain = p.remainingSpeakSeconds();
    final list = Catalog.forLang(p.learnLang);
    final idx = list.indexWhere((s) => s.id == scene.id);

    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.fromLTRB(22, 16, 22, 28),
        children: [
          Text(
            i18n.goodGreeting,
            style: const TextStyle(
              color: Voxelith.forest,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              Expanded(
                child: Text(
                  '${i18n.homeDayNumber(p.streak.clamp(1, 999))} · ${i18n.minutesLeft((p.dailyGoalMin).clamp(1, 60))}',
                  style: Theme.of(context).textTheme.displayMedium,
                ),
              ),
              if (p.streak >= 2) ...[
                const VoxelithMascot(size: 48, mood: MascotMood.streak),
                const SizedBox(width: 6),
              ],
              SizedBox(
                width: 64,
                height: 64,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    CircularProgressIndicator(
                      value: p.isPlus
                          ? 1
                          : (p.speakAllowance == 0
                                ? 0
                                : remain / p.speakAllowance),
                      color: Voxelith.terr,
                      backgroundColor: Voxelith.line,
                      strokeWidth: 5,
                    ),
                    Text(
                      p.isPlus ? '∞' : '${remain}s',
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          VoxelithCard(
            key: _xpCardKey,
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  children: [
                    const IconChip(VoxelithIcon.fire),
                    const SizedBox(width: 8),
                    Text(
                      '${p.totalXp} XP',
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 17,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      i18n.xpRankLabel(p.xpRank),
                      style: const TextStyle(
                        color: Voxelith.mintDark,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                LinearProgressIndicator(value: p.dailyXpProgress),
                const SizedBox(height: 6),
                Row(
                  children: [
                    Text(
                      i18n.homeXpToday(p.dailyXp, UserProfile.dailyXpGoal),
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                        fontSize: 12,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      p.dailyXp >= UserProfile.dailyXpGoal
                          ? i18n.homeGoalCompleted
                          : i18n.homeXpRemaining(
                              UserProfile.dailyXpGoal - p.dailyXp,
                            ),
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          VoxelithCard(
            onTap: () => context.push('/event'),
            color: Voxelith.eventTint,
            child: Row(
              children: [
                const Icon(Icons.bolt_rounded, color: Voxelith.coral, size: 28),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        i18n.weeklyEventName(
                          WeeklyEvent.current().language.label(p.uiLang),
                        ),
                        style: const TextStyle(fontWeight: FontWeight.w700),
                      ),
                      Text(
                        WeeklyEvent.current().isJoined(p)
                            ? i18n.homeEventJoinedNote
                            : i18n.homeEventJoinCta,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                const Icon(Icons.chevron_right, color: Voxelith.coral),
              ],
            ),
          ),
          const SizedBox(height: 18),
          Container(
            key: _todaySpeakKey,
            padding: const EdgeInsets.all(22),
            decoration: BoxDecoration(
              color: Voxelith.forest,
              borderRadius: BorderRadius.circular(Voxelith.radiusLg),
              boxShadow: [
                BoxShadow(
                  color: Voxelith.forest.withValues(alpha: .35),
                  blurRadius: 24,
                  offset: const Offset(0, 12),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  i18n.todaySpeak,
                  style: const TextStyle(
                    color: Voxelith.cream,
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  i18n.homeSceneMinutes(scene.minutes, scene.title(p.uiLang)),
                  style: const TextStyle(
                    color: Color(0xFFB8C8C0),
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 18),
                Align(
                  alignment: Alignment.centerRight,
                  child: FilledButton(
                    style: FilledButton.styleFrom(
                      backgroundColor: Voxelith.terr,
                      foregroundColor: Voxelith.cream,
                      minimumSize: const Size(160, 44),
                    ),
                    onPressed: () => context.push('/session?id=${scene.id}'),
                    child: Text(i18n.startSpeak),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 22),
          SizedBox(
            height: 92,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: list.length,
              separatorBuilder: (_, _) => const SizedBox(width: 14),
              itemBuilder: (_, i) {
                final s = list[i];
                final current = s.id == scene.id;
                return Column(
                  children: [
                    CircleAvatar(
                      radius: 18,
                      backgroundColor: i < idx
                          ? Voxelith.forest
                          : current
                          ? Voxelith.terr
                          : Voxelith.line,
                      child: i < idx
                          ? const Icon(
                              Icons.check,
                              size: 16,
                              color: Voxelith.cream,
                            )
                          : Text(
                              '${i + 1}',
                              style: TextStyle(
                                color: current
                                    ? Voxelith.cream
                                    : Theme.of(context).colorScheme.onSurface,
                                fontSize: 12,
                              ),
                            ),
                    ),
                    const SizedBox(height: 8),
                    SizedBox(
                      width: 72,
                      child: Text(
                        s.title(p.uiLang),
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 11,
                          color: current
                              ? Voxelith.terr
                              : Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          const SizedBox(height: 8),
          Text(i18n.progress, style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 12),
          Row(
            children: [
              _stat(
                VoxelithIcon.fire,
                // 🧊 = kaçırılan bir günü kapatacak seri koruma hakkı.
                p.streakFreezes > 0
                    ? '${p.streak} · 🧊${p.streakFreezes}'
                    : '${p.streak}',
                i18n.streak,
                Voxelith.terr,
              ),
              _stat(
                VoxelithIcon.medal,
                p.cefr.name.toUpperCase(),
                'CEFR',
                Voxelith.forest,
              ),
              _stat(
                VoxelithIcon.book,
                '${p.phrasesKnown}',
                i18n.phrases,
                Voxelith.forest,
              ),
            ],
          ),
          const SizedBox(height: 16),
          VoxelithCard(
            onTap: () => context.push('/leaderboard'),
            child: Row(
              children: [
                const IconChip(VoxelithIcon.leaderboard),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    i18n.homeWeeklyLeaderboard,
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                ),
                Icon(
                  Icons.chevron_right,
                  color: Theme.of(context).colorScheme.outline,
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          VoxelithCard(
            onTap: () => context.push('/alphabet?lang=${p.learnLang.code}'),
            child: Row(
              children: [
                const IconChip(VoxelithIcon.guide),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    i18n.homeAlphabetCta(p.learnLang.flag()),
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                ),
                Icon(
                  Icons.chevron_right,
                  color: Theme.of(context).colorScheme.outline,
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          VoxelithCard(
            key: _libraryKey,
            onTap: () => context.push('/library'),
            child: Row(
              children: [
                const IconChip(VoxelithIcon.book),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    i18n.homeTourLibraryTitle,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                ),
                Icon(
                  Icons.chevron_right,
                  color: Theme.of(context).colorScheme.outline,
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          if (Features.paidCloudApis)
            VoxelithCard(
              onTap: () => context.go('/app/chat'),
              child: Row(
                children: [
                  const IconChip(VoxelithIcon.chat),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          i18n.homeFreeChatTitle,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                        ),
                        Text(
                          p.isPlus
                              ? i18n.homeFreeChatPlusNote
                              : i18n.homeFreeChatLockedNote,
                          style: TextStyle(
                            color: Theme.of(
                              context,
                            ).colorScheme.onSurfaceVariant,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (!p.isPlus)
                    Icon(
                      Icons.lock_outline,
                      size: 18,
                      color: Theme.of(context).colorScheme.outline,
                    )
                  else
                    Icon(
                      Icons.chevron_right,
                      color: Theme.of(context).colorScheme.outline,
                    ),
                ],
              ),
            ),
          // Telaffuz rehberi içeriği yalnızca Türkçe yazılmış
          // (lib/data/content/language_guides.dart); diğer arayüz
          // dillerinde giriş noktası gizlenir.
          if (p.uiLang == UiLang.tr) ...[
            const SizedBox(height: 10),
            VoxelithCard(
              onTap: () => context.push('/guide'),
              child: Row(
                children: [
                  Text(
                    p.learnLang.flag(),
                    style: const TextStyle(fontSize: 22),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      i18n.pronunciationGuide(p.learnLang.label(p.uiLang)),
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                    ),
                  ),
                  Icon(
                    Icons.chevron_right,
                    color: Theme.of(context).colorScheme.outline,
                  ),
                ],
              ),
            ),
          ],
          const SizedBox(height: 10),
          VoxelithCard(
            key: _reviewKey,
            onTap: () => context.push('/review'),
            child: Row(
              children: [
                const IconChip(VoxelithIcon.replay),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    '${i18n.review} · ${i18n.reviewReady(ref.read(sessionProvider.notifier).duePhrases().length)}',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                ),
                Icon(
                  Icons.chevron_right,
                  color: Theme.of(context).colorScheme.outline,
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          VoxelithCard(
            child: Row(
              children: [
                const Icon(Icons.campaign_outlined, color: Voxelith.terr),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    p.isPlus ? i18n.homePlusAdFreeNote : i18n.freeMinute,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _stat(VoxelithIcon ic, String v, String l, Color c) {
    return Expanded(
      child: VoxelithCard(
        child: Column(
          children: [
            IconChip(ic, size: 36),
            const SizedBox(height: 8),
            Text(
              v,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 20,
                color: c,
              ),
            ),
            Text(
              l,
              style: TextStyle(
                fontSize: 12,
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
