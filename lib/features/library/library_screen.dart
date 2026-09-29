import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../core/l10n/i18n_ui.dart';
import '../../core/theme/tokens.dart';
import '../../data/content/library.dart';
import '../../data/models/models.dart';
import '../../state/session.dart';
import '../../ui/widgets.dart';

class LibraryScreen extends ConsumerWidget {
  const LibraryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final p = ref.watch(sessionProvider);
    final i18n = ref.watch(i18nProvider);
    final stories = VoxelithLibrary.forLang(p.learnLang);
    // Kitaplık içeriğinde yalnızca Türkçe başlık/çeviri var; diğer arayüz
    // dillerinde hedef dildeki başlık gösterilir.

    return Scaffold(
      appBar: VoxelithAppBar(pageTitle: Text(i18n.libraryTitle)),
      body: SafeArea(
        child: stories.isEmpty
            ? Center(
                child: Padding(
                  padding: const EdgeInsets.all(28),
                  child: Text(
                    i18n.libraryComingSoon(p.learnLang.label(p.uiLang)),
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Voxelith.muted),
                  ),
                ),
              )
            : ListView(
                padding: const EdgeInsets.fromLTRB(22, 16, 22, 28),
                children: [
                  Text(
                    '${p.learnLang.flag()} ${p.learnLang.label(p.uiLang)} · ${i18n.libraryShortReads}',
                    style: const TextStyle(color: Voxelith.muted),
                  ),
                  const SizedBox(height: 16),
                  for (final story in stories) ...[
                    VoxelithCard(
                      onTap: () => context.push('/library/${story.id}'),
                      child: Row(
                        children: [
                          Container(
                            width: 44,
                            height: 44,
                            decoration: BoxDecoration(
                              color: Voxelith.mintLight,
                              borderRadius: BorderRadius.circular(
                                Voxelith.radius,
                              ),
                            ),
                            child: const Icon(
                              Icons.menu_book_outlined,
                              color: Voxelith.mintDark,
                            ),
                          ),
                          const SizedBox(width: 13),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  story.displayTitle(p.uiLang),
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                  '${story.level.name.toUpperCase()} · ${i18n.sentenceCount(story.sentences.length)}',
                                  style: const TextStyle(
                                    color: Voxelith.muted,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Icon(Icons.chevron_right, color: Voxelith.soft),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                  ],
                ],
              ),
      ),
    );
  }
}
