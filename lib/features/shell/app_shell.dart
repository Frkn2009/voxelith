import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../core/features.dart';
import '../../core/l10n/i18n.dart';
import '../../core/theme/tokens.dart';
import '../../state/session.dart';
import '../../ui/widgets.dart';

/// Tablet/büyük ekran eşiği (Material large-screen breakpoint'i, 600dp).
const _wideBreakpoint = 600.0;

/// İçeriğin geniş ekranlarda kenardan kenara gerilmemesi için üst sınır.
const _contentMaxWidth = 900.0;

class AppShell extends ConsumerWidget {
  const AppShell({super.key, required this.child});
  final Widget child;

  // Canlı sohbet ücretli AI'a dayanır; kapalıyken sekmesi gösterilmez.
  static const _paths = [
    '/app',
    '/app/speak',
    '/app/games',
    if (Features.paidCloudApis) '/app/chat',
    '/app/translate',
    '/app/you',
  ];

  int _indexFor(String location) {
    for (var i = _paths.length - 1; i > 0; i--) {
      if (location.startsWith(_paths[i])) return i;
    }
    return 0;
  }

  List<({IconData icon, IconData selected, Color color, String label})>
  _destinations(I18n i18n) => [
    (
      icon: Icons.home_outlined,
      selected: Icons.home,
      color: Voxelith.mint,
      label: i18n.home,
    ),
    (
      icon: Icons.mic_none,
      selected: Icons.mic,
      color: Voxelith.mint,
      label: i18n.speak,
    ),
    (
      icon: Icons.sports_esports_outlined,
      selected: Icons.sports_esports,
      color: Voxelith.coral,
      label: i18n.navGames,
    ),
    if (Features.paidCloudApis)
      (
        icon: Icons.forum_outlined,
        selected: Icons.forum,
        color: Voxelith.coral,
        label: i18n.navChat,
      ),
    (
      icon: Icons.translate_outlined,
      selected: Icons.translate,
      color: Voxelith.mint,
      label: i18n.translate,
    ),
    (
      icon: Icons.person_outline,
      selected: Icons.person,
      color: Voxelith.mint,
      label: i18n.you,
    ),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final i18n = ref.watch(i18nProvider);
    final index = _indexFor(GoRouterState.of(context).uri.path);
    final destinations = _destinations(i18n);
    final wide = MediaQuery.sizeOf(context).width >= _wideBreakpoint;

    final content = Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: _contentMaxWidth),
        child: child,
      ),
    );

    if (!wide) {
      return Scaffold(
        appBar: VoxelithAppBar(),
        body: Padding(
          padding: const EdgeInsets.only(bottom: 88),
          child: content,
        ),
        extendBody: true,
        bottomNavigationBar: SafeArea(
          minimum: const EdgeInsets.fromLTRB(16, 0, 16, 12),
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              borderRadius: BorderRadius.circular(Voxelith.radiusPill),
              boxShadow: Voxelith.softShadow,
            ),
            clipBehavior: Clip.antiAlias,
            child: NavigationBar(
              selectedIndex: index,
              backgroundColor: Colors.transparent,
              indicatorColor: Theme.of(
                context,
              ).navigationBarTheme.indicatorColor,
              labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
              onDestinationSelected: (i) => context.go(_paths[i]),
              destinations: [
                for (final d in destinations)
                  NavigationDestination(
                    icon: Icon(d.icon),
                    selectedIcon: Icon(d.selected, color: d.color),
                    label: d.label,
                  ),
              ],
            ),
          ),
        ),
      );
    }

    // Tablet/geniş ekran: alt bar yerine yan NavigationRail (Material
    // large-screen kılavuzu) + içerik ortalanıp gereksiz gerilmiyor.
    return Scaffold(
      appBar: VoxelithAppBar(),
      body: Row(
        children: [
          NavigationRail(
            selectedIndex: index,
            labelType: NavigationRailLabelType.all,
            backgroundColor: Theme.of(
              context,
            ).navigationBarTheme.backgroundColor,
            onDestinationSelected: (i) => context.go(_paths[i]),
            destinations: [
              for (final d in destinations)
                NavigationRailDestination(
                  icon: Icon(d.icon),
                  selectedIcon: Icon(d.selected, color: d.color),
                  label: Text(d.label),
                ),
            ],
          ),
          const VerticalDivider(width: 1),
          Expanded(child: content),
        ],
      ),
    );
  }
}
