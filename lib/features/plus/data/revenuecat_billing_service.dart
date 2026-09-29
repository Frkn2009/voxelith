import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'billing_service.dart';
import '../domain/entitlement.dart';
import '../../../core/supabase_config.dart';

/// Gerçek RevenueCat entegrasyonu. `VOXELO_REVENUECAT_API_KEY` dart-define'ı
/// girilmediyse [isConfigured] false döner ve `PlusController`
/// [FakeBillingService]'i kullanmaya devam eder — anahtar yokken uygulama
/// hiç bozulmaz, sadece gerçek satın alma kapalı kalır.
class RevenueCatBillingService implements BillingService {
  static const _apiKey = String.fromEnvironment('VOXELO_REVENUECAT_API_KEY');

  /// RevenueCat panelinde tanımlı entitlement kimliği. Panelde farklı bir
  /// isim kullandıysan `--dart-define=VOXELO_REVENUECAT_ENTITLEMENT_ID=...`
  /// ile geçersiz kıl.
  static const _entitlementId = String.fromEnvironment(
    'VOXELO_REVENUECAT_ENTITLEMENT_ID',
    defaultValue: 'plus',
  );

  /// Business panelde ayrı bir entitlement olarak tanımlanır (Plus'ın
  /// üzerinde bir katman) — panelde farklı bir isim kullandıysan
  /// `--dart-define=VOXELO_REVENUECAT_BUSINESS_ENTITLEMENT_ID=...` ile
  /// geçersiz kıl.
  static const _businessEntitlementId = String.fromEnvironment(
    'VOXELO_REVENUECAT_BUSINESS_ENTITLEMENT_ID',
    defaultValue: 'business',
  );

  static bool get isConfigured => _apiKey.isNotEmpty;

  static Future<void> configureIfNeeded() async {
    if (!isConfigured) return;
    final configuration = PurchasesConfiguration(_apiKey);
    // RevenueCat'in appUserID'sini Supabase auth uid'iyle aynı tutuyoruz ki
    // ödeme webhook'u (supabase/functions/revenuecat-webhook) satın almayı
    // doğru kullanıcının subscriptions satırına yazabilsin. main.dart bu
    // noktaya gelmeden önce anonim girişi garanti ediyor.
    final supaUserId = SupaConfig.isSet
        ? Supabase.instance.client.auth.currentUser?.id
        : null;
    if (supaUserId != null) configuration.appUserID = supaUserId;
    await Purchases.configure(configuration);
  }

  final Map<String, Package> _packagesById = {};

  @override
  Future<List<BillingProduct>> fetchProducts() async {
    final offerings = await Purchases.getOfferings();
    final current = offerings.current;
    if (current == null) return const [];
    _packagesById
      ..clear()
      ..addEntries(
        current.availablePackages.map(
          (pkg) => MapEntry(pkg.storeProduct.identifier, pkg),
        ),
      );
    return current.availablePackages
        .map(
          (pkg) => BillingProduct(
            id: pkg.storeProduct.identifier,
            title: pkg.storeProduct.title,
            description: pkg.storeProduct.description,
            priceString: pkg.storeProduct.priceString,
            freeTrialDays: _freeTrialDays(pkg.storeProduct.introductoryPrice),
          ),
        )
        .toList(growable: false);
  }

  static int? _freeTrialDays(IntroductoryPrice? intro) {
    if (intro == null || intro.price != 0) return null;
    final unitDays = switch (intro.periodUnit) {
      PeriodUnit.day => 1,
      PeriodUnit.week => 7,
      PeriodUnit.month => 30,
      PeriodUnit.year => 365,
      PeriodUnit.unknown => 0,
    };
    final days = unitDays * intro.periodNumberOfUnits * intro.cycles;
    return days > 0 ? days : null;
  }

  @override
  Future<VoxelithEntitlement> currentEntitlement() async {
    final info = await Purchases.getCustomerInfo();
    final active = info.entitlements.active;
    if (active.containsKey(_businessEntitlementId)) {
      return VoxelithEntitlement.business;
    }
    if (active.containsKey(_entitlementId)) return VoxelithEntitlement.plus;
    return VoxelithEntitlement.free;
  }

  @override
  Future<void> purchase(BillingProduct product) async {
    // PaywallScreen sabit BillingProduct sabitlerini kullanıyor, önce
    // fetchProducts() çağırmıyor — paket haritası boşsa burada dolduruyoruz.
    var pkg = _packagesById[product.id];
    if (pkg == null) {
      await fetchProducts();
      pkg = _packagesById[product.id];
    }
    if (pkg == null) {
      throw StateError(
        'RevenueCat panelinde "${product.id}" ürün kimliğiyle eşleşen bir paket bulunamadı. '
        'Store (App Store Connect / Play Console) ürün kimliğinin bu değerle aynı olduğundan emin ol.',
      );
    }
    await Purchases.purchase(PurchaseParams.package(pkg));
  }

  @override
  Future<void> restorePurchases() async {
    await Purchases.restorePurchases();
  }

  @override
  void dispose() {}
}
