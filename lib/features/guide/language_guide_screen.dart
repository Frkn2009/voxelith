import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/l10n/i18n_ui.dart';
import '../../core/theme/tokens.dart';
import '../../data/content/language_guides.dart';
import '../../data/models/models.dart';
import '../../state/session.dart';
import '../../ui/widgets.dart';

class LanguageGuideScreen extends ConsumerWidget {
  const LanguageGuideScreen({super.key, this.lang, this.onboarding = false});

  final LearnLang? lang;
  final bool onboarding;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final p = ref.watch(sessionProvider);
    final i18n = ref.watch(i18nProvider);
    final g = LanguageGuide.of(lang ?? p.learnLang);

    return Scaffold(
      appBar: VoxelithAppBar(
        pageTitle: Text('${g.lang.flag()}  ${g.lang.label(p.uiLang)}'),
        automaticallyImplyLeading: !onboarding,
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(22, 8, 22, 32),
        children: [
          Text(g.headline, style: Theme.of(context).textTheme.displayMedium),
          const SizedBox(height: 10),
          Text(
            g.intro,
            style: TextStyle(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
              height: 1.45,
              fontSize: 15,
            ),
          ),
          const SizedBox(height: 18),
          VoxelithCard(
            color: Voxelith.forest,
            child: Text(
              g.firstWeek,
              style: const TextStyle(
                color: Voxelith.cream,
                height: 1.4,
                fontSize: 15,
              ),
            ),
          ),
          const SizedBox(height: 22),
          Eyebrow(i18n.writtenHeard),
          const SizedBox(height: 10),
          for (final r in g.rules)
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: VoxelithCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Directionality(
                          textDirection: g.lang.isRtl
                              ? TextDirection.rtl
                              : TextDirection.ltr,
                          child: _pill(
                            r.written,
                            Voxelith.forest,
                            Voxelith.cream,
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          child: Icon(
                            Icons.arrow_forward,
                            size: 16,
                            color: Voxelith.terr,
                          ),
                        ),
                        Flexible(
                          child: Text(
                            r.heard,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Theme.of(context).colorScheme.onSurface,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Directionality(
                      textDirection: g.lang.isRtl
                          ? TextDirection.rtl
                          : TextDirection.ltr,
                      child: Text(
                        r.example,
                        style: const TextStyle(
                          color: Voxelith.forest,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Text(
                      '≈  ${r.exampleSaid}',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      r.why,
                      style: TextStyle(
                        height: 1.4,
                        color: Theme.of(context).colorScheme.onSurface,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          const SizedBox(height: 8),
          Eyebrow(i18n.watchOutInLanguage),
          const SizedBox(height: 10),
          for (final t in g.traps)
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: VoxelithCard(
                color: Voxelith.pale,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      t.title,
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Voxelith.forest,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(t.body, style: const TextStyle(height: 1.4)),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _pill(String s, Color bg, Color fg) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        s,
        style: TextStyle(color: fg, fontWeight: FontWeight.w700, fontSize: 13),
      ),
    );
  }
}

/// Onboarding içine gömülü, app bar’sız.
class LanguageGuideBody extends ConsumerWidget {
  const LanguageGuideBody({super.key, required this.lang});
  final LearnLang lang;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final i18n = ref.watch(i18nProvider);
    final g = LanguageGuide.of(lang);
    return ListView(
      children: [
        Text(g.headline, style: Theme.of(context).textTheme.displayMedium),
        const SizedBox(height: 8),
        Text(
          i18n.guideTwoMinutes,
          style: TextStyle(
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
        ),
        const SizedBox(height: 14),
        VoxelithCard(
          color: Voxelith.forest,
          child: Text(
            g.firstWeek,
            style: const TextStyle(color: Voxelith.cream, height: 1.4),
          ),
        ),
        const SizedBox(height: 14),
        for (final r in g.rules.take(4))
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: VoxelithCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${r.written}  →  ${r.heard}',
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Voxelith.forest,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${r.example}   ≈   ${r.exampleSaid}',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                      fontSize: 13,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    r.why,
                    style: const TextStyle(height: 1.35, fontSize: 13),
                  ),
                ],
              ),
            ),
          ),
        Text(
          i18n.guideMoreInApp,
          style: TextStyle(
            color: Theme.of(context).colorScheme.outline,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
