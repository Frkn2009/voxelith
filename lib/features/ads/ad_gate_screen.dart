import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../core/l10n/i18n_ui.dart';
import '../../core/theme/tokens.dart';
import '../../data/ads/ad_service.dart';
import '../../data/models/models.dart';
import '../../state/session.dart';
import '../../ui/widgets.dart';

class AdGateScreen extends ConsumerStatefulWidget {
  const AdGateScreen({super.key, this.defaultReward = AdReward.speakTime});

  final AdReward defaultReward;

  @override
  ConsumerState<AdGateScreen> createState() => _AdGateScreenState();
}

class _AdGateScreenState extends ConsumerState<AdGateScreen> {
  bool loading = false;
  late AdReward reward = widget.defaultReward;
  String? error;

  Future<void> _play() async {
    final profile = ref.read(sessionProvider);
    if (!profile.canWatchAd) {
      if (mounted) context.push('/paywall');
      return;
    }
    setState(() {
      loading = true;
      error = null;
    });
    final earned = await AdService.showRewarded();
    if (!mounted) return;
    if (!earned) {
      final i18n = ref.read(i18nProvider);
      setState(() {
        loading = false;
        error = AdService.supported
            ? i18n.adNotCompletedWatchToEnd
            : i18n.adsPhoneOnlyWebPlus;
      });
      return;
    }
    await ref.read(sessionProvider.notifier).redeemRewardedAd(reward: reward);
    if (mounted) context.pop();
  }

  @override
  Widget build(BuildContext context) {
    final i18n = ref.watch(i18nProvider);
    final profile = ref.watch(sessionProvider);
    return Scaffold(
      appBar: VoxelithAppBar(pageTitle: Text(i18n.rewardedVideo)),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(22, 18, 22, 28),
          children: [
            VoxelithCard(
              color: Voxelith.forest,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const VoxelithMascot(size: 56, mood: MascotMood.encourage),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          i18n.freeMinute,
                          style: const TextStyle(color: Voxelith.terrSoft),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          profile.speakSecondsUsed >= 30
                              ? i18n.adGateOutOfTime
                              : i18n.adGateIntro,
                          style: const TextStyle(
                            color: Voxelith.cream,
                            fontSize: 18,
                            height: 1.4,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 18),
            Text(
              profile.canWatchAd
                  ? i18n.videosLeftToday(
                      UserProfile.maxRewardedAdsPerDay -
                          profile.adsWatchedToday,
                      UserProfile.maxRewardedAdsPerDay,
                    )
                  : i18n.dailyVideoLimitReached,
              style: TextStyle(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 20),
            Eyebrow(i18n.chooseReward),
            const SizedBox(height: 8),
            SegmentedButton<AdReward>(
              segments: [
                ButtonSegment(
                  value: AdReward.speakTime,
                  icon: const Icon(Icons.mic_none),
                  label: Text(i18n.rewardSpeakSeconds),
                ),
                const ButtonSegment(
                  value: AdReward.xp,
                  icon: Icon(Icons.bolt),
                  label: Text('+20 XP'),
                ),
              ],
              selected: {reward},
              onSelectionChanged: loading
                  ? null
                  : (value) => setState(() => reward = value.first),
            ),
            if (error != null) ...[
              const SizedBox(height: 14),
              Text(
                error!,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Voxelith.coral),
              ),
            ],
            const SizedBox(height: 28),
            FilledButton.icon(
              onPressed: loading
                  ? null
                  : (profile.canWatchAd
                        ? _play
                        : () => context.push('/paywall')),
              icon: Icon(
                profile.canWatchAd
                    ? Icons.play_arrow_rounded
                    : Icons.diamond_outlined,
              ),
              label: Text(
                loading
                    ? i18n.videoPreparing
                    : (profile.canWatchAd ? i18n.watchVideo : i18n.goPlusCta),
              ),
            ),
            const SizedBox(height: 10),
            OutlinedButton(
              onPressed: () => context.push('/paywall'),
              child: Text(i18n.plusCta),
            ),
          ],
        ),
      ),
    );
  }
}
