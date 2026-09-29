import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../core/l10n/i18n.dart';
import '../../core/l10n/i18n_ui.dart';
import '../../core/theme/tokens.dart';
import '../../data/models/models.dart';
import '../../state/session.dart';
import '../../ui/widgets.dart';

class FamilyProfilesScreen extends ConsumerWidget {
  const FamilyProfilesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final active = ref.watch(sessionProvider);
    final i18n = ref.watch(i18nProvider);
    final controller = ref.read(sessionProvider.notifier);
    final profiles = controller.familyProfiles();
    return Scaffold(
      appBar: VoxelithAppBar(pageTitle: Text(i18n.familyProfilesTitle)),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(22, 16, 22, 30),
          children: [
            Text(
              i18n.whoseTurn,
              style: Theme.of(context).textTheme.displayMedium,
            ),
            const SizedBox(height: 7),
            Text(
              i18n.familyIntro,
              style: const TextStyle(color: Voxelith.muted, height: 1.4),
            ),
            const SizedBox(height: 20),
            for (final profile in profiles) ...[
              _profileCard(
                context,
                ref,
                i18n,
                profile,
                active.profileId == profile.profileId,
              ),
              const SizedBox(height: 10),
            ],
            if (profiles.length < 4) ...[
              const SizedBox(height: 6),
              OutlinedButton.icon(
                onPressed: active.isPlus
                    ? () => _addProfile(context, ref, i18n)
                    : () => context.push('/paywall'),
                icon: Icon(
                  active.isPlus
                      ? Icons.person_add_alt_1_outlined
                      : Icons.lock_outline,
                ),
                label: Text(
                  active.isPlus
                      ? i18n.addProfile
                      : '${i18n.familyProfilesTitle} · Plus',
                ),
              ),
            ],
            const SizedBox(height: 12),
            Text(
              i18n.profileCount(profiles.length),
              textAlign: TextAlign.center,
              style: const TextStyle(color: Voxelith.muted, fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }

  Widget _profileCard(
    BuildContext context,
    WidgetRef ref,
    I18n i18n,
    UserProfile profile,
    bool selected,
  ) => VoxelithCard(
    color: selected ? Voxelith.mintLight : null,
    onTap: selected
        ? null
        : () => ref
              .read(sessionProvider.notifier)
              .switchFamilyProfile(profile.profileId),
    child: Row(
      children: [
        CircleAvatar(
          radius: 24,
          backgroundColor: selected ? Voxelith.mintDark : Voxelith.cloud,
          child: Text(
            i18n
                .profileDisplayName(profile.profileName)
                .characters
                .first
                .toUpperCase(),
            style: TextStyle(
              color: selected ? Colors.white : Voxelith.ink,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        const SizedBox(width: 13),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                i18n.profileDisplayName(profile.profileName),
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 3),
              Text(
                '${profile.learnLang.flag()} ${profile.totalXp} XP · ${i18n.dayCount(profile.streak)}',
                style: const TextStyle(color: Voxelith.muted, fontSize: 12),
              ),
            ],
          ),
        ),
        if (selected)
          const Icon(Icons.check_circle, color: Voxelith.mintDark)
        else if (profile.profileId != 'main')
          IconButton(
            tooltip: i18n.deleteProfileTooltip,
            onPressed: () => ref
                .read(sessionProvider.notifier)
                .deleteFamilyProfile(profile.profileId),
            icon: const Icon(Icons.delete_outline, color: Voxelith.soft),
          ),
      ],
    ),
  );

  Future<void> _addProfile(
    BuildContext context,
    WidgetRef ref,
    I18n i18n,
  ) async {
    final text = TextEditingController();
    final name = await showDialog<String>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text(i18n.newFamilyProfile),
        content: TextField(
          controller: text,
          autofocus: true,
          maxLength: 24,
          decoration: InputDecoration(labelText: i18n.profileNameLabel),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: Text(i18n.cancelCta),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(dialogContext, text.text),
            child: Text(i18n.commonAdd),
          ),
        ],
      ),
    );
    text.dispose();
    if (name == null || name.trim().isEmpty) return;
    await ref.read(sessionProvider.notifier).addFamilyProfile(name);
  }
}
