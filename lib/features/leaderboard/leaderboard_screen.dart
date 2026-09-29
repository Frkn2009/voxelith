import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../core/l10n/i18n.dart';
import '../../core/l10n/i18n_ui.dart';
import '../../core/theme/tokens.dart';
import '../../data/models/achievements.dart';
import '../../data/models/leaderboard.dart';
import '../../data/supabase/supa_service.dart';
import '../../state/session.dart';
import '../../ui/widgets.dart';

class LeaderboardScreen extends ConsumerStatefulWidget {
  const LeaderboardScreen({super.key});

  @override
  ConsumerState<LeaderboardScreen> createState() => _LeaderboardScreenState();
}

class _LeaderboardScreenState extends ConsumerState<LeaderboardScreen> {
  I18n get _i18n => ref.read(i18nProvider);

  Future<List<LeaderboardEntry>>? request;

  @override
  void initState() {
    super.initState();
    if (Supa.currentEmail != null) request = _load();
  }

  Future<List<LeaderboardEntry>> _load() async {
    final entries = await Supa.weeklyLeaderboard();
    if (mounted && entries.any((entry) => entry.isMe && entry.rank == 1)) {
      await ref
          .read(sessionProvider.notifier)
          .unlockAchievement(Achievement.weeklyChampion);
    }
    return entries;
  }

  void _reload() => setState(() => request = _load());

  @override
  Widget build(BuildContext context) {
    final email = ref.watch(authEmailProvider);
    final profile = ref.watch(sessionProvider);
    return Scaffold(
      appBar: VoxelithAppBar(pageTitle: Text(_i18n.homeWeeklyLeaderboard)),
      body: SafeArea(
        child: email == null
            ? _signedOut(context, profile.dailyXp)
            : FutureBuilder<List<LeaderboardEntry>>(
                future: request ??= _load(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasError) return _error();
                  return _board(snapshot.data ?? const []);
                },
              ),
      ),
    );
  }

  Widget _signedOut(BuildContext context, int localXp) => Center(
    child: Padding(
      padding: const EdgeInsets.all(28),
      child: VoxelithCard(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.leaderboard_outlined,
              size: 44,
              color: Voxelith.mintDark,
            ),
            const SizedBox(height: 14),
            Text(
              _i18n.joinLeaderboard,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 8),
            Text(
              _i18n.leaderboardSignedOutBody(localXp),
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
                height: 1.45,
              ),
            ),
            const SizedBox(height: 18),
            FilledButton(
              onPressed: () => context.push('/auth'),
              child: Text(_i18n.commonSignIn),
            ),
          ],
        ),
      ),
    ),
  );

  Widget _error() => Center(
    child: Padding(
      padding: const EdgeInsets.all(28),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            _i18n.leaderboardLoadFailed,
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 12),
          OutlinedButton(onPressed: _reload, child: Text(_i18n.retryCta)),
        ],
      ),
    ),
  );

  Widget _board(List<LeaderboardEntry> entries) {
    final top = entries.where((entry) => entry.rank <= 10).toList();
    final ownOutside = entries
        .where((entry) => entry.isMe && entry.rank > 10)
        .firstOrNull;
    return RefreshIndicator(
      onRefresh: () async {
        final next = await _load();
        if (mounted) setState(() => request = Future.value(next));
      },
      child: ListView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.fromLTRB(22, 16, 22, 30),
        children: [
          Text(
            _i18n.thisWeek,
            style: Theme.of(context).textTheme.displayMedium,
          ),
          const SizedBox(height: 5),
          Text(
            _i18n.leaderboardResets,
            style: TextStyle(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 14),
          VoxelithCard(
            onTap: () => context.push('/clan'),
            child: Row(
              children: [
                const Icon(Icons.groups_outlined, color: Voxelith.mintDark),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    _i18n.teamRankingInvite,
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
          const SizedBox(height: 18),
          if (top.isEmpty)
            VoxelithCard(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 24),
                child: Column(
                  children: [
                    const Icon(
                      Icons.flag_outlined,
                      color: Voxelith.mintDark,
                      size: 36,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      _i18n.takeFirstPlace,
                      style: const TextStyle(fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      _i18n.leaderboardEmptyBody,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
            )
          else
            VoxelithCard(
              padding: EdgeInsets.zero,
              child: Column(
                children: [
                  for (var index = 0; index < top.length; index++) ...[
                    _row(top[index]),
                    if (index != top.length - 1) const Divider(height: 1),
                  ],
                ],
              ),
            ),
          if (ownOutside != null) ...[
            const SizedBox(height: 22),
            Eyebrow(_i18n.yourRank),
            const SizedBox(height: 8),
            VoxelithCard(
              color: Voxelith.mintLight,
              padding: EdgeInsets.zero,
              child: _row(ownOutside),
            ),
          ],
        ],
      ),
    );
  }

  Widget _row(LeaderboardEntry entry) {
    final rankColor = switch (entry.rank) {
      1 => Voxelith.sunflower,
      2 => Theme.of(context).colorScheme.outline,
      3 => Voxelith.coral,
      _ => Voxelith.mintDark,
    };
    return Container(
      color: entry.isMe
          ? Voxelith.mintLight.withValues(alpha: .55)
          : Colors.transparent,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      child: Row(
        children: [
          Container(
            width: 34,
            height: 34,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: rankColor.withValues(alpha: .12),
              shape: BoxShape.circle,
            ),
            child: Text(
              '${entry.rank}',
              style: TextStyle(color: rankColor, fontWeight: FontWeight.w700),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              entry.isMe
                  ? '${_i18n.playerDisplayName(entry.playerName)} · ${_i18n.you}'
                  : _i18n.playerDisplayName(entry.playerName),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontWeight: entry.isMe ? FontWeight.w700 : FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(width: 8),
          Text(
            '${entry.xp} XP',
            style: const TextStyle(
              color: Voxelith.mintDark,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}

extension<T> on Iterable<T> {
  T? get firstOrNull {
    final iterator = this.iterator;
    return iterator.moveNext() ? iterator.current : null;
  }
}
