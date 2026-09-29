import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../core/l10n/i18n.dart';
import '../../core/l10n/i18n_ui.dart';
import '../../core/theme/tokens.dart';
import '../../data/models/clan.dart';
import '../../data/supabase/supa_service.dart';
import '../../state/session.dart';
import '../../ui/widgets.dart';
import 'clan_chat_screen.dart';

class ClanScreen extends ConsumerStatefulWidget {
  const ClanScreen({super.key});

  @override
  ConsumerState<ClanScreen> createState() => _ClanScreenState();
}

class _ClanScreenState extends ConsumerState<ClanScreen> {
  Future<List<ClanMemberEntry>>? request;
  String? error;

  @override
  void initState() {
    super.initState();
    if (Supa.currentEmail != null) request = Supa.myClan();
  }

  void reload() => setState(() {
    error = null;
    request = Supa.myClan();
  });

  @override
  Widget build(BuildContext context) {
    final i18n = ref.watch(i18nProvider);
    final email = ref.watch(authEmailProvider);
    return Scaffold(
      appBar: VoxelithAppBar(pageTitle: Text(i18n.clanTitle)),
      body: SafeArea(
        child: email == null
            ? _login(context, i18n)
            : FutureBuilder<List<ClanMemberEntry>>(
                future: request ??= Supa.myClan(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasError) return _failed(i18n);
                  final members = snapshot.data ?? const [];
                  return members.isEmpty ? _empty(i18n) : _team(members, i18n);
                },
              ),
      ),
    );
  }

  Widget _login(BuildContext context, I18n i18n) => Center(
    child: Padding(
      padding: const EdgeInsets.all(28),
      child: VoxelithCard(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.groups_outlined,
              size: 48,
              color: Voxelith.mintDark,
            ),
            const SizedBox(height: 12),
            Text(
              i18n.clanLoginPrompt,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 19, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 16),
            FilledButton(
              onPressed: () => context.push('/auth'),
              child: Text(i18n.clanLoginCta),
            ),
          ],
        ),
      ),
    ),
  );

  Widget _empty(I18n i18n) => ListView(
    padding: const EdgeInsets.fromLTRB(22, 24, 22, 30),
    children: [
      const VoxelithMascot(size: 110, mood: MascotMood.wave),
      const SizedBox(height: 16),
      Text(
        i18n.clanEmptyTitle,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.displayMedium,
      ),
      const SizedBox(height: 8),
      Text(
        i18n.clanEmptyBody,
        textAlign: TextAlign.center,
        style: const TextStyle(color: Voxelith.muted, height: 1.45),
      ),
      const SizedBox(height: 24),
      FilledButton.icon(
        onPressed: _create,
        icon: const Icon(Icons.add),
        label: Text(i18n.clanCreateCta),
      ),
      const SizedBox(height: 10),
      OutlinedButton.icon(
        onPressed: _join,
        icon: const Icon(Icons.login),
        label: Text(i18n.clanJoinCta),
      ),
      if (error != null) ...[
        const SizedBox(height: 14),
        Text(
          error!,
          textAlign: TextAlign.center,
          style: const TextStyle(color: Voxelith.coral),
        ),
      ],
    ],
  );

  Widget _team(List<ClanMemberEntry> members, I18n i18n) {
    final clan = members.first;
    final me = members.where((member) => member.isMe).first;
    return ListView(
      padding: const EdgeInsets.fromLTRB(22, 16, 22, 30),
      children: [
        Text(clan.clanName, style: Theme.of(context).textTheme.displayMedium),
        const SizedBox(height: 4),
        Text(
          i18n.clanWeeklyContestNote,
          style: const TextStyle(color: Voxelith.muted, fontSize: 12),
        ),
        const SizedBox(height: 10),
        InkWell(
          onTap: () async {
            await Clipboard.setData(ClipboardData(text: clan.joinCode));
            if (mounted) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(i18n.clanCodeCopied)));
            }
          },
          child: Row(
            children: [
              Text(
                i18n.clanInviteCodeLabel,
                style: const TextStyle(color: Voxelith.muted),
              ),
              Text(
                clan.joinCode,
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1.5,
                ),
              ),
              const SizedBox(width: 6),
              const Icon(Icons.copy, size: 16, color: Voxelith.mintDark),
            ],
          ),
        ),
        const SizedBox(height: 18),
        VoxelithCard(
          padding: EdgeInsets.zero,
          child: Column(
            children: [
              for (var index = 0; index < members.length; index++) ...[
                _member(members[index], i18n),
                if (index < members.length - 1) const Divider(height: 1),
              ],
            ],
          ),
        ),
        const SizedBox(height: 10),
        OutlinedButton.icon(
          onPressed: () => Navigator.of(
            context,
          ).push(MaterialPageRoute(builder: (_) => const ClanChatScreen())),
          icon: const Icon(Icons.chat_bubble_outline),
          label: Text(i18n.clanChatCta),
        ),
        const SizedBox(height: 10),
        VoxelithCard(
          onTap: () => context.push('/clan/corrections'),
          child: Row(
            children: [
              const Icon(Icons.spellcheck, color: Voxelith.mintDark),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      i18n.peerCorrectionCta,
                      style: const TextStyle(fontWeight: FontWeight.w700),
                    ),
                    Text(
                      i18n.peerCorrectionCardSubtitle,
                      style: const TextStyle(
                        color: Voxelith.muted,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.chevron_right, color: Voxelith.muted),
            ],
          ),
        ),
        const SizedBox(height: 10),
        OutlinedButton(
          onPressed: () => _leave(me.isOwner, members.length),
          child: Text(
            me.isOwner && members.length > 1
                ? i18n.clanOwnerCannotLeave
                : i18n.clanLeaveCta,
          ),
        ),
      ],
    );
  }

  Widget _member(ClanMemberEntry member, I18n i18n) => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
    child: Row(
      children: [
        SizedBox(
          width: 32,
          child: member.rank == 1
              ? const Icon(
                  Icons.emoji_events,
                  color: Voxelith.sunflower,
                  size: 20,
                )
              : Text(
                  '${member.rank}',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Voxelith.mintDark,
                    fontWeight: FontWeight.w700,
                  ),
                ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            '${i18n.playerDisplayName(member.playerName)}${member.isMe ? ' · ${i18n.you}' : ''}',
            style: TextStyle(
              fontWeight: member.isMe ? FontWeight.w700 : FontWeight.w500,
            ),
          ),
        ),
        if (member.isOwner)
          const Padding(
            padding: EdgeInsets.only(right: 8),
            child: Icon(
              Icons.shield_outlined,
              size: 18,
              color: Voxelith.sunflower,
            ),
          ),
        Text(
          '${member.xp} XP',
          style: const TextStyle(
            color: Voxelith.mintDark,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    ),
  );

  Widget _failed(I18n i18n) => Center(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(i18n.clanLoadFailed),
        const SizedBox(height: 10),
        OutlinedButton(onPressed: reload, child: Text(i18n.retryCta)),
      ],
    ),
  );

  Future<void> _create() async {
    final i18n = ref.read(i18nProvider);
    final name = await _input(i18n.clanCreateCta, i18n.clanNameLabel, i18n);
    if (name == null) return;
    try {
      await Supa.createClan(name);
      reload();
    } catch (exception) {
      setState(() => error = _message(i18n, exception));
    }
  }

  Future<void> _join() async {
    final i18n = ref.read(i18nProvider);
    final code = await _input(
      i18n.clanJoinDialogTitle,
      i18n.clanInviteCodeHint,
      i18n,
    );
    if (code == null) return;
    try {
      await Supa.joinClan(code);
      reload();
    } catch (exception) {
      setState(() => error = _message(i18n, exception));
    }
  }

  Future<void> _leave(bool owner, int memberCount) async {
    if (owner && memberCount > 1) return;
    await Supa.leaveClan();
    reload();
  }

  Future<String?> _input(String title, String label, I18n i18n) async {
    final controller = TextEditingController();
    final value = await showDialog<String>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text(title),
        content: TextField(
          controller: controller,
          autofocus: true,
          maxLength: 32,
          decoration: InputDecoration(labelText: label),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: Text(i18n.cancelCta),
          ),
          FilledButton(
            onPressed: () =>
                Navigator.pop(dialogContext, controller.text.trim()),
            child: Text(i18n.continueCta),
          ),
        ],
      ),
    );
    controller.dispose();
    return value == null || value.isEmpty ? null : value;
  }

  String _message(I18n i18n, Object error) {
    final text = error.toString();
    if (text.contains('already_in_clan')) return i18n.clanAlreadyInClan;
    if (text.contains('clan_not_found')) {
      return i18n.clanCodeNotFound;
    }
    return i18n.clanActionFailed;
  }
}
