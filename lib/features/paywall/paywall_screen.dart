import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../core/l10n/i18n_store.dart';
import '../../core/features.dart';
import '../../state/session.dart';
import '../../ui/widgets.dart';
import '../plus/domain/entitlement.dart';
import '../plus/state/plus_controller.dart';

const _plusPlans = [
  voxelithPlusMonthly,
  voxelithPlusYearly,
  voxelithPlusFamily,
];
const _businessPlans = [voxelithBusinessMonthly, voxelithBusinessYearly];

class PaywallScreen extends ConsumerStatefulWidget {
  const PaywallScreen({super.key, this.business = false});

  final bool business;

  @override
  ConsumerState<PaywallScreen> createState() => _PaywallScreenState();
}

class _PaywallScreenState extends ConsumerState<PaywallScreen> {
  // Business yalnızca ücretli AI/ses haklarını artırıyordu; kapalıyken yok.
  late bool business = widget.business && Features.businessPlan;
  int plan = 1;
  int businessPlan = 0;
  bool _restoring = false;
  bool _purchasing = false;

  Future<void> _purchase(BillingProduct product) async {
    setState(() => _purchasing = true);
    try {
      await ref.read(plusControllerProvider.notifier).purchase(product);
      if (!mounted) return;
      context.pop();
    } catch (e) {
      if (!mounted) return;
      setState(() => _purchasing = false);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(ref.read(i18nProvider).purchaseFailed)),
      );
    }
  }

  // App Store Kural 3.1.5 (ve Google Play'in benzer beklentisi): otomatik
  // yenilenen abonelik satan uygulamalar arayüzde erişilebilir bir "satın
  // alımları geri yükle" eylemi sunmak zorunda. `PlusController.restore()`
  // zaten vardı ama hiçbir ekranda çağrılmıyordu.
  Future<void> _restorePurchases() async {
    setState(() => _restoring = true);
    await ref.read(plusControllerProvider.notifier).restore();
    if (!mounted) return;
    setState(() => _restoring = false);
    final entitlement = ref.read(plusControllerProvider);
    final restored =
        entitlement == VoxelithEntitlement.plus ||
        entitlement == VoxelithEntitlement.business;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          restored
              ? ref.read(i18nProvider).restoreSuccess
              : ref.read(i18nProvider).restoreNone,
        ),
      ),
    );
    if (restored && mounted) context.pop();
  }

  @override
  Widget build(BuildContext context) {
    final i18n = ref.watch(i18nProvider);
    final scheme = Theme.of(context).colorScheme;
    final products = ref.watch(storeProductsProvider);
    String price(BillingProduct p) => products.when(
      data: (m) => m[p.id]?.priceString ?? '—',
      loading: () => '…',
      error: (_, _) => '—',
    );
    // Deneme vaadi yalnızca mağaza ürününde gerçekten ücretsiz deneme
    // tanımlıysa gösterilir.
    int? trialDays(BillingProduct p) =>
        products.asData?.value[p.id]?.freeTrialDays;
    String cta(BillingProduct p) {
      final days = trialDays(p);
      return days == null ? i18n.subscribeCta : i18n.trialCta(days);
    }

    Widget trialNote(BillingProduct p) {
      final days = trialDays(p);
      if (days == null) return const SizedBox.shrink();
      return Padding(
        padding: const EdgeInsets.only(top: 8),
        child: Text(
          i18n.trialThenPrice(days, price(p)),
          textAlign: TextAlign.center,
          style: TextStyle(color: scheme.onSurfaceVariant, fontSize: 12),
        ),
      );
    }

    return Scaffold(
      appBar: VoxelithAppBar(
        leading: IconButton(
          icon: const Icon(Icons.close),
          tooltip: i18n.closeLabel,
          onPressed: () => context.pop(),
        ),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(22, 8, 22, 24),
          children: [
            Text(
              'VOXELITH',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: scheme.primary,
                fontWeight: FontWeight.w700,
                letterSpacing: 2,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              i18n.paywallTitle,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.displayMedium,
            ),
            const SizedBox(height: 8),
            Text(
              i18n.paywallSubtitle,
              textAlign: TextAlign.center,
              style: TextStyle(color: scheme.onSurfaceVariant),
            ),
            const SizedBox(height: 18),
            if (Features.businessPlan)
              SegmentedButton<bool>(
                segments: const [
                  ButtonSegment(value: false, label: Text('Plus')),
                  ButtonSegment(value: true, label: Text('Business')),
                ],
                selected: {business},
                onSelectionChanged: (v) => setState(() => business = v.first),
              ),
            const SizedBox(height: 16),
            if (!business) ...[
              _plan(
                0,
                i18n.planMonthly,
                price(voxelithPlusMonthly),
                i18n.billedMonthly,
              ),
              _plan(
                1,
                i18n.planYearlyBest,
                price(voxelithPlusYearly),
                i18n.billedYearly,
              ),
              _plan(
                2,
                i18n.planFamily,
                price(voxelithPlusFamily),
                i18n.familyProfilesYearly,
              ),
              const SizedBox(height: 12),
              for (final f in i18n.plusFeatures)
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Row(
                    children: [
                      Icon(Icons.check_circle, color: scheme.primary, size: 20),
                      const SizedBox(width: 8),
                      Expanded(child: Text(f)),
                    ],
                  ),
                ),
              const SizedBox(height: 12),
              FilledButton(
                onPressed: _purchasing
                    ? null
                    : () => _purchase(_plusPlans[plan]),
                child: _purchasing
                    ? const SizedBox(
                        width: 18,
                        height: 18,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Colors.white,
                        ),
                      )
                    : Text(cta(_plusPlans[plan])),
              ),
              trialNote(_plusPlans[plan]),
            ] else ...[
              _businessPlanCard(
                0,
                i18n.planMonthly,
                price(voxelithBusinessMonthly),
                i18n.billedMonthly,
              ),
              _businessPlanCard(
                1,
                i18n.planYearlyBest,
                price(voxelithBusinessYearly),
                i18n.singleProfileYearly,
              ),
              const SizedBox(height: 12),
              for (final f in i18n.businessFeatures)
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Row(
                    children: [
                      Icon(Icons.check_circle, color: scheme.primary, size: 20),
                      const SizedBox(width: 8),
                      Expanded(child: Text(f)),
                    ],
                  ),
                ),
              const SizedBox(height: 12),
              FilledButton(
                onPressed: _purchasing
                    ? null
                    : () => _purchase(_businessPlans[businessPlan]),
                child: _purchasing
                    ? const SizedBox(
                        width: 18,
                        height: 18,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Colors.white,
                        ),
                      )
                    : Text(cta(_businessPlans[businessPlan])),
              ),
              trialNote(_businessPlans[businessPlan]),
            ],
            const SizedBox(height: 10),
            Center(
              child: TextButton(
                onPressed: _restoring ? null : _restorePurchases,
                child: _restoring
                    ? const SizedBox(
                        width: 16,
                        height: 16,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : Text(i18n.restorePurchases),
              ),
            ),
            const SizedBox(height: 4),
            if (products.hasError ||
                (products.hasValue && products.requireValue.isEmpty))
              Padding(
                padding: const EdgeInsets.only(bottom: 6),
                child: Text(
                  i18n.priceUnavailable,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: scheme.error, fontSize: 12),
                ),
              ),
            Text(
              i18n.autoRenewDisclosure,
              textAlign: TextAlign.center,
              style: TextStyle(color: scheme.outline, fontSize: 12),
            ),
            const SizedBox(height: 6),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () => context.push('/terms'),
                  child: Text(
                    i18n.termsTitle,
                    style: const TextStyle(fontSize: 12),
                  ),
                ),
                Text('·', style: TextStyle(color: scheme.outline)),
                TextButton(
                  onPressed: () => context.push('/privacy'),
                  child: Text(
                    i18n.privacyTitle,
                    style: const TextStyle(fontSize: 12),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _businessPlanCard(int i, String t, String price, String sub) {
    final sel = businessPlan == i;
    final scheme = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: VoxelithCard(
        onTap: () => setState(() => businessPlan = i),
        color: sel ? scheme.primaryContainer : Theme.of(context).cardColor,
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    t,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: sel ? scheme.primary : scheme.onSurface,
                    ),
                  ),
                  Text(
                    sub,
                    style: TextStyle(
                      color: scheme.onSurfaceVariant,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            Text(
              price,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                color: scheme.onSurface,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _plan(int i, String t, String price, String sub) {
    final sel = plan == i;
    final scheme = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: VoxelithCard(
        onTap: () => setState(() => plan = i),
        color: sel ? scheme.primaryContainer : Theme.of(context).cardColor,
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    t,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: sel ? scheme.primary : scheme.onSurface,
                    ),
                  ),
                  Text(
                    sub,
                    style: TextStyle(
                      color: scheme.onSurfaceVariant,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            Text(
              price,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                color: scheme.onSurface,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
