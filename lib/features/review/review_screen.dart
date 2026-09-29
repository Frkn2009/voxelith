import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/l10n/i18n_ui.dart';
import '../../core/theme/tokens.dart';
import '../../data/content/catalog.dart';
import '../../data/models/models.dart';
import '../../state/session.dart';
import '../../ui/widgets.dart';

/// [Phrase] doesn't carry its own language (a phrase id can come from any
/// [LearnLang] scenario, e.g. after switching learn language or family
/// profiles), so we look up which scenario it belongs to to know whether
/// the target text needs RTL rendering.
bool _isRtlPhrase(String phraseId) {
  for (final language in LearnLang.values) {
    for (final scenario in Catalog.forLang(language)) {
      if (scenario.phrases.any((phrase) => phrase.id == phraseId)) {
        return scenario.lang.isRtl;
      }
    }
  }
  return false;
}

class ReviewScreen extends ConsumerStatefulWidget {
  const ReviewScreen({super.key});

  @override
  ConsumerState<ReviewScreen> createState() => _ReviewScreenState();
}

class _ReviewScreenState extends ConsumerState<ReviewScreen> {
  int i = 0;
  bool revealed = false;

  @override
  Widget build(BuildContext context) {
    final i18n = ref.watch(i18nProvider);
    final p = ref.watch(sessionProvider);
    final due = ref.read(sessionProvider.notifier).duePhrases();

    return Scaffold(
      appBar: VoxelithAppBar(pageTitle: Text(i18n.review)),
      body: SafeArea(
        child: due.isEmpty
            ? Center(
                child: Padding(
                  padding: const EdgeInsets.all(32),
                  child: Text(
                    i18n.reviewEmpty,
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Voxelith.muted, fontSize: 16),
                  ),
                ),
              )
            : Padding(
                padding: const EdgeInsets.fromLTRB(22, 12, 22, 24),
                child: Column(
                  children: [
                    Text(
                      '${i + 1} / ${due.length}',
                      style: const TextStyle(color: Voxelith.muted),
                    ),
                    const SizedBox(height: 18),
                    Expanded(
                      child: VoxelithCard(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              due[i.clamp(0, due.length - 1)].glossFor(
                                p.uiLang,
                              ),
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 18,
                                color: Voxelith.muted,
                              ),
                            ),
                            const SizedBox(height: 22),
                            if (revealed)
                              Directionality(
                                textDirection:
                                    _isRtlPhrase(
                                      due[i.clamp(0, due.length - 1)].id,
                                    )
                                    ? TextDirection.rtl
                                    : TextDirection.ltr,
                                child: Text(
                                  due[i.clamp(0, due.length - 1)].target,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontSize: 28,
                                    fontWeight: FontWeight.w600,
                                    color: Voxelith.forest,
                                  ),
                                ),
                              )
                            else
                              Text(
                                i18n.reviewSayThenReveal,
                                style: const TextStyle(color: Voxelith.soft),
                              ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    if (!revealed)
                      ForestButton(
                        label: i18n.showAnswer,
                        onPressed: () => setState(() => revealed = true),
                      )
                    else
                      Row(
                        children: [
                          Expanded(
                            child: OutlinedButton(
                              onPressed: () => _grade(due, 0),
                              child: Text(i18n.gradeAgain),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: OutlinedButton(
                              onPressed: () => _grade(due, 3),
                              child: Text(i18n.gradeGood),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: FilledButton(
                              onPressed: () => _grade(due, 5),
                              child: Text(i18n.gradeEasy),
                            ),
                          ),
                        ],
                      ),
                  ],
                ),
              ),
      ),
    );
  }

  Future<void> _grade(List<Phrase> due, int q) async {
    final phrase = due[i.clamp(0, due.length - 1)];
    await ref.read(sessionProvider.notifier).grade(phrase.id, q);
    final next = ref.read(sessionProvider.notifier).duePhrases();
    setState(() {
      revealed = false;
      if (next.isEmpty) {
        i = 0;
      } else {
        i = i >= next.length ? 0 : i;
      }
    });
  }
}
