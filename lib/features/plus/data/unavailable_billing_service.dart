import 'package:voxelith/features/plus/data/billing_service.dart';
import 'package:voxelith/features/plus/domain/entitlement.dart';

/// Yayın derlemesinde RevenueCat anahtarı verilmediyse kullanılır: ürün
/// listelemez, satın almayı reddeder, kimseye Plus vermez. (Sahte
/// [FakeBillingService] yalnızca geliştirme derlemesinde kullanılır — yoksa
/// herkes "satın al"a basarak ücretsiz Plus alırdı.)
class UnavailableBillingService implements BillingService {
  @override
  Future<List<BillingProduct>> fetchProducts() async => const [];

  @override
  Future<VoxelithEntitlement> currentEntitlement() async =>
      VoxelithEntitlement.free;

  @override
  Future<void> purchase(BillingProduct product) async =>
      throw StateError('billing_not_configured');

  @override
  Future<void> restorePurchases() async {}

  @override
  void dispose() {}
}
