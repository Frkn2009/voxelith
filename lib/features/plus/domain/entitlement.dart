enum VoxelithEntitlement { free, plus, business }

class BillingProduct {
  const BillingProduct({
    required this.id,
    required this.title,
    required this.description,
    this.priceString,
    this.freeTrialDays,
  });
  final String id;
  final String title;
  final String description;

  /// Mağazanın kullanıcıya yerelleştirdiği fiyat (ör. "₺239,99"). Sabit
  /// ürün tanımlarında null'dır; ekranda gösterilecek fiyat her zaman
  /// `BillingService.fetchProducts()` sonucundan gelir (App Store 3.1.2).
  final String? priceString;

  /// Mağazada bu ürüne tanımlı ücretsiz deneme süresi (gün). null ise
  /// deneme yok — ekranda "ücretsiz dene" vaadi gösterilmez (App Store
  /// 3.1.2, Google Play abonelik politikası).
  final int? freeTrialDays;

  BillingProduct withPrice(String? price, {int? freeTrialDays}) =>
      BillingProduct(
        id: id,
        title: title,
        description: description,
        priceString: price,
        freeTrialDays: freeTrialDays,
      );
}

const voxelithPlusMonthly = BillingProduct(
  id: 'voxelo_plus_monthly',
  title: 'VOXELITH Plus Aylık',
  description: 'Sınırsız konuşma, reklamsız',
);
const voxelithPlusYearly = BillingProduct(
  id: 'voxelo_plus_yearly',
  title: 'VOXELITH Plus Yıllık',
  description: 'Sınırsız konuşma, reklamsız, 4 ay bedava',
);
const voxelithPlusFamily = BillingProduct(
  id: 'voxelo_plus_family',
  title: 'VOXELITH Plus Aile',
  description: '4 profil, sınırsız konuşma',
);

const voxelithBusinessMonthly = BillingProduct(
  id: 'voxelo_business_monthly',
  title: 'VOXELITH Business Aylık',
  description:
      'Tüm Plus özellikleri, ~3 kat daha yüksek AI/ses hakkı, öncelikli destek',
);
const voxelithBusinessYearly = BillingProduct(
  id: 'voxelo_business_yearly',
  title: 'VOXELITH Business Yıllık',
  description:
      'Tüm Plus özellikleri, ~3 kat daha yüksek AI/ses hakkı, öncelikli destek, 4 ay bedava',
);
