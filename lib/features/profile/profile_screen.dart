import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../data/ads/ad_service.dart';
import '../../core/l10n/i18n_store.dart';
import '../../core/l10n/i18n_ui.dart';
import '../../core/theme/tokens.dart';
import '../../data/models/models.dart';
import '../../data/supabase/supa_service.dart';
import '../../state/session.dart';
import '../../ui/widgets.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final i18n = ref.watch(i18nProvider);
    final p = ref.watch(sessionProvider);
    final email = ref.watch(authEmailProvider);
    final cloudOn = Supa.enabled;

    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.fromLTRB(22, 16, 22, 28),
        children: [
          Text(i18n.you, style: Theme.of(context).textTheme.displayMedium),
          const SizedBox(height: 16),
          VoxelithCard(
            color: Voxelith.forest,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  p.isPlus ? 'VOXELITH Plus' : 'VOXELITH Free',
                  style: const TextStyle(
                    color: Voxelith.cream,
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  p.isPlus ? i18n.profilePlusSubtitle : i18n.freeMinute,
                  style: const TextStyle(color: Color(0xFFB8C8C0)),
                ),
                const SizedBox(height: 14),
                if (!p.isPlus)
                  FilledButton(
                    style: FilledButton.styleFrom(
                      backgroundColor: Voxelith.terr,
                    ),
                    onPressed: () => context.push('/paywall'),
                    child: Text(i18n.plusCta),
                  ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          VoxelithCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const IconChip(VoxelithIcon.fire),
                    const SizedBox(width: 10),
                    Text(
                      '${p.totalXp} XP',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      i18n.xpRankLabel(p.xpRank),
                      style: const TextStyle(
                        color: Voxelith.mintDark,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                LinearProgressIndicator(value: p.rankProgress),
                const SizedBox(height: 7),
                Text(
                  p.nextXpRank == null
                      ? i18n.profileMaxRank
                      : i18n.profileXpToNext(
                          i18n.xpRankLabel(p.nextXpRank!),
                          p.nextXpRank!.minimumXp - p.totalXp,
                        ),
                  style: const TextStyle(color: Voxelith.muted, fontSize: 12),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          VoxelithCard(
            onTap: () => context.push('/family'),
            child: Row(
              children: [
                const IconChip(VoxelithIcon.family),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    '${i18n.profileLabel} · ${i18n.profileDisplayName(p.profileName)}',
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                ),
                const Icon(Icons.swap_horiz, color: Voxelith.soft),
              ],
            ),
          ),
          const SizedBox(height: 10),
          VoxelithCard(
            onTap: () => context.push('/achievements'),
            child: Row(
              children: [
                const IconChip(VoxelithIcon.medal),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    '${i18n.achievementsTitle} · ${p.achievements.length} / 10',
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                ),
                const Icon(Icons.chevron_right, color: Voxelith.soft),
              ],
            ),
          ),
          const SizedBox(height: 18),
          if (cloudOn) ...[
            Eyebrow(i18n.accountSection),
            const SizedBox(height: 8),
            if (email == null)
              VoxelithCard(
                onTap: () => context.push('/auth'),
                child: Row(
                  children: [
                    const IconChip(VoxelithIcon.cloud),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        i18n.signInOrCreate,
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ),
                    const Icon(Icons.chevron_right, color: Voxelith.soft),
                  ],
                ),
              )
            else
              VoxelithCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const IconChip(VoxelithIcon.cloud),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            email,
                            style: const TextStyle(fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Text(
                      i18n.cloudBackupNote,
                      style: const TextStyle(
                        color: Voxelith.muted,
                        fontSize: 13,
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextButton(
                      onPressed: () =>
                          ref.read(authEmailProvider.notifier).logout(),
                      child: Text(i18n.signOut),
                    ),
                  ],
                ),
              ),
            const SizedBox(height: 16),
          ],
          Eyebrow(i18n.learningLanguageSection),
          const SizedBox(height: 8),
          for (final l in LearnLang.values)
            ChoiceTile(
              leading: Text(l.flag(), style: const TextStyle(fontSize: 20)),
              title: l.label(p.uiLang),
              selected: p.learnLang == l,
              onTap: () => ref.read(sessionProvider.notifier).setLearn(l),
            ),
          // Telaffuz rehberi içeriği yalnızca Türkçe yazılmış
          // (lib/data/content/language_guides.dart); diğer arayüz
          // dillerinde giriş noktası gizlenir.
          if (p.uiLang == UiLang.tr) ...[
            const SizedBox(height: 8),
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
                      i18n.spellingGuide,
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ),
                  const Icon(Icons.chevron_right, color: Voxelith.soft),
                ],
              ),
            ),
          ],
          const SizedBox(height: 16),
          Eyebrow(i18n.uiLanguageSection),
          const SizedBox(height: 8),
          for (final u in UiLang.values)
            ChoiceTile(
              title: u.nativeName(),
              selected: p.uiLang == u,
              onTap: () => ref.read(sessionProvider.notifier).setUi(u),
            ),
          const SizedBox(height: 16),
          Eyebrow(i18n.appearanceSection),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              for (final option in [
                (
                  value: AppThemePreference.system,
                  icon: Icons.brightness_auto_outlined,
                  label: i18n.themeSystem,
                ),
                (
                  value: AppThemePreference.light,
                  icon: Icons.light_mode_outlined,
                  label: i18n.themeLight,
                ),
                (
                  value: AppThemePreference.dark,
                  icon: Icons.dark_mode_outlined,
                  label: i18n.themeDark,
                ),
                (
                  value: AppThemePreference.amber,
                  icon: Icons.wb_twilight_outlined,
                  label: i18n.themeAmber,
                ),
                (
                  value: AppThemePreference.legendary,
                  icon: Icons.auto_awesome,
                  label: i18n.themeLegendary,
                ),
                (
                  value: AppThemePreference.legendaryLight,
                  icon: Icons.auto_awesome_outlined,
                  label: i18n.themeLegendaryLight,
                ),
              ])
                ChoiceChip(
                  selected: p.themePreference == option.value,
                  avatar: Icon(option.icon, size: 18),
                  label: Text(option.label),
                  onSelected: (_) => ref
                      .read(sessionProvider.notifier)
                      .setThemePreference(option.value),
                ),
            ],
          ),
          const SizedBox(height: 16),
          Eyebrow(i18n.studyMethodSection),
          const SizedBox(height: 6),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              for (final option in [
                (
                  value: LearningStyle.balanced,
                  icon: Icons.balance_outlined,
                  label: i18n.styleBalanced,
                ),
                (
                  value: LearningStyle.speakingFirst,
                  icon: Icons.record_voice_over_outlined,
                  label: i18n.styleSpeakingFirst,
                ),
                (
                  value: LearningStyle.listeningHeavy,
                  icon: Icons.hearing_outlined,
                  label: i18n.styleListeningHeavy,
                ),
              ])
                ChoiceChip(
                  selected: p.learningStyle == option.value,
                  avatar: Icon(option.icon, size: 18),
                  label: Text(option.label),
                  onSelected: (_) => ref
                      .read(sessionProvider.notifier)
                      .setLearningStyle(option.value),
                ),
            ],
          ),
          const SizedBox(height: 16),
          Eyebrow(i18n.remindersSection),
          const SizedBox(height: 6),
          SwitchListTile(
            contentPadding: EdgeInsets.zero,
            title: Text(i18n.dailyPracticeNotification),
            subtitle: Text(i18n.onceADay),
            value: p.notificationsEnabled,
            activeThumbColor: Voxelith.mintDark,
            onChanged: (value) => ref
                .read(sessionProvider.notifier)
                .setNotificationsEnabled(value),
          ),
          if (p.notificationsEnabled) ...[
            const SizedBox(height: 4),
            SizedBox(
              width: double.infinity,
              child: SegmentedButton<int>(
                segments: [
                  ButtonSegment(
                    value: 10,
                    label: Text(i18n.reminderMorning10),
                    icon: const Icon(Icons.light_mode_outlined),
                  ),
                  ButtonSegment(
                    value: 19,
                    label: Text(i18n.reminderEvening19),
                    icon: const Icon(Icons.nightlight_outlined),
                  ),
                ],
                selected: {p.reminderHour},
                onSelectionChanged: (hours) => ref
                    .read(sessionProvider.notifier)
                    .setReminderHour(hours.first),
              ),
            ),
          ],
          const SizedBox(height: 16),
          // Yalnızca geliştirme derlemesinde: yayında Plus yalnızca mağaza
          // satın alımıyla açılır (PlusController / RevenueCat).
          if (kDebugMode)
            SwitchListTile(
              title: Text(i18n.devPlusToggle),
              subtitle: Text(i18n.devPlusToggleSubtitle),
              value: p.isPlus,
              activeThumbColor: Voxelith.forest,
              onChanged: (v) => ref.read(sessionProvider.notifier).setPlus(v),
            ),
          ListTile(
            title: Text(i18n.privacyPolicy),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => context.push('/privacy'),
          ),
          if (AdService.supported)
            ListTile(
              title: Text(i18n.privacyChoices),
              trailing: const Icon(Icons.chevron_right),
              onTap: AdService.showPrivacyOptions,
            ),
          ListTile(
            title: Text(
              i18n.deleteAccount,
              style: const TextStyle(color: Voxelith.terr),
            ),
            subtitle: Text(
              email != null
                  ? i18n.deleteAccountSubtitleCloud
                  : i18n.deleteAccountSubtitleLocal,
            ),
            onTap: () async {
              final ok = await showDialog<bool>(
                context: context,
                builder: (c) => AlertDialog(
                  title: Text(i18n.deleteAccountQuestion),
                  content: Text(
                    email != null
                        ? i18n.deleteAccountBodyCloud
                        : i18n.deleteAccountBodyLocal,
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(c, false),
                      child: Text(i18n.cancelCta),
                    ),
                    TextButton(
                      onPressed: () => Navigator.pop(c, true),
                      child: Text(i18n.commonDelete),
                    ),
                  ],
                ),
              );
              if (ok == true) {
                // Giriş yapılmışsa önce sunucudaki hesabı sil.
                if (email != null) {
                  try {
                    await Supa.deleteAccount();
                  } catch (_) {
                    // Sunucuya ulaşılamadıysa yereli yine de temizle.
                  }
                }
                await ref.read(sessionProvider.notifier).wipeAccount();
                if (context.mounted) context.go('/onboarding');
              }
            },
          ),
          const SizedBox(height: 8),
          Text(
            cloudOn ? i18n.profileFooterCloud : i18n.profileFooterLocal,
            style: const TextStyle(
              color: Voxelith.muted,
              fontSize: 13,
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }
}
