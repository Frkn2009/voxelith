import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/l10n/i18n_ui.dart';
import '../../core/theme/tokens.dart';
import '../../data/ads/ad_service.dart';
import '../../data/events/weekly_event.dart';
import '../../data/models/models.dart';
import '../../state/session.dart';
import '../../ui/widgets.dart';

class WeeklyEventScreen extends ConsumerStatefulWidget {
  const WeeklyEventScreen({super.key});

  @override
  ConsumerState<WeeklyEventScreen> createState() => _WeeklyEventScreenState();
}

class _WeeklyEventScreenState extends ConsumerState<WeeklyEventScreen> {
  bool busy = false;
  String? error;

  Future<void> _join() async {
    final profile = ref.read(sessionProvider);
    final event = WeeklyEvent.current();
    if (event.isJoined(profile)) return;
    setState(() {
      busy = true;
      error = null;
    });

    var watched = false;
    if (!profile.isPlus) watched = await AdService.showRewarded();
    if (!mounted) return;
    if (!profile.isPlus && !watched) {
      final i18n = ref.read(i18nProvider);
      setState(() {
        busy = false;
        error = AdService.supported
            ? i18n.eventAdNotCompleted
            : i18n.eventAdsMobileOnly;
      });
      return;
    }
    await ref
        .read(sessionProvider.notifier)
        .joinWeeklyEvent(event.id, countAd: !profile.isPlus);
    if (mounted) setState(() => busy = false);
  }

  @override
  Widget build(BuildContext context) {
    final profile = ref.watch(sessionProvider);
    final i18n = ref.watch(i18nProvider);
    final event = WeeklyEvent.current();
    final joined = event.isJoined(profile);
    final eventLang = event.language.label(profile.uiLang);
    return Scaffold(
      appBar: VoxelithAppBar(pageTitle: Text(i18n.weeklyEventScreenTitle)),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(22, 18, 22, 30),
          children: [
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF5A273D), Color(0xFFB95443)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(Voxelith.radiusLg),
              ),
              child: Column(
                children: [
                  const VoxelithMascot(size: 100, mood: MascotMood.celebrate),
                  const SizedBox(height: 12),
                  Text(
                    i18n.weeklyEventName(eventLang),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 27,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    i18n.weeklyEventDesc(eventLang),
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.white70, height: 1.45),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 18),
            VoxelithCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Eyebrow(i18n.howItWorks),
                  const SizedBox(height: 10),
                  _line(
                    Icons.play_circle_outline,
                    profile.isPlus
                        ? i18n.eventPlusNoAds
                        : i18n.eventWatchOneVideo,
                  ),
                  _line(
                    Icons.language_outlined,
                    i18n.eventPickLanguage(eventLang),
                  ),
                  _line(Icons.bolt_outlined, i18n.eventDoubleXp),
                  const SizedBox(height: 8),
                  Text(
                    i18n.eventWeek(WeeklyEvent.weekKey()),
                    style: const TextStyle(color: Voxelith.muted, fontSize: 12),
                  ),
                ],
              ),
            ),
            if (error != null) ...[
              const SizedBox(height: 12),
              Text(
                error!,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Voxelith.coral),
              ),
            ],
            const SizedBox(height: 20),
            FilledButton.icon(
              onPressed: joined || busy ? null : _join,
              icon: Icon(
                joined ? Icons.check_circle_outline : Icons.play_arrow_rounded,
              ),
              label: Text(
                joined
                    ? i18n.eventJoined
                    : busy
                    ? i18n.videoPreparing
                    : (profile.isPlus
                          ? i18n.eventJoinNoAds
                          : i18n.eventWatchAndJoin),
              ),
            ),
            if (joined && profile.learnLang != event.language) ...[
              const SizedBox(height: 10),
              Text(
                i18n.eventSwitchLanguageHint(eventLang),
                textAlign: TextAlign.center,
                style: const TextStyle(color: Voxelith.muted),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _line(IconData icon, String text) => Padding(
    padding: const EdgeInsets.only(bottom: 10),
    child: Row(
      children: [
        Icon(icon, size: 20, color: Voxelith.mintDark),
        const SizedBox(width: 10),
        Expanded(child: Text(text)),
      ],
    ),
  );
}
