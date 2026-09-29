import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/l10n/i18n_store.dart';
import '../../core/theme/tokens.dart';
import '../../state/session.dart';
import '../../ui/widgets.dart';

/// Uygulama içi gizlilik politikası. İçerik `site/privacy.html` ile ve
/// mağazadaki Data Safety / App Privacy beyanlarıyla birebir aynı
/// kalmalı (bkz. docs/STORE_FORMS.md).
class PrivacyScreen extends ConsumerWidget {
  const PrivacyScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final i18n = ref.watch(i18nProvider);
    return Scaffold(
      appBar: VoxelithAppBar(pageTitle: Text(i18n.privacyTitle)),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(22, 12, 22, 32),
        children: [
          Text(
            'VOXELITH · ${i18n.privacyTitle}',
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 12),
          Text(
            i18n.privacyBody(),
            style: const TextStyle(
              height: 1.5,
              color: Voxelith.ink,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}
