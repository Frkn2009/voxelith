import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/l10n/i18n_store.dart';
import '../../core/theme/tokens.dart';
import '../../state/session.dart';
import '../../ui/widgets.dart';

/// Apple'ın otomatik yenilenen abonelik satan uygulamalar için zorunlu
/// tuttuğu Kullanım Koşulları (EULA) ekranı — App Store Kural 3.1.2.
/// Kullanıcı içeriği (klan sohbeti) için sıfır tolerans maddesi de burada —
/// App Store Kural 1.2.
class TermsScreen extends ConsumerWidget {
  const TermsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final i18n = ref.watch(i18nProvider);
    return Scaffold(
      appBar: VoxelithAppBar(pageTitle: Text(i18n.termsTitle)),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(22, 12, 22, 32),
        children: [
          Text(
            'VOXELITH · ${i18n.termsTitle}',
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 12),
          Text(
            i18n.termsBody(),
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
