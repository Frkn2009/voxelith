/// Ürün özellik bayrakları.
///
/// Sıfır maliyet kararı (29 Eylül 2026): kullanım başına ücret doğuran bulut
/// servisleri (Anthropic AI geri bildirim + canlı sohbet, ElevenLabs premium
/// ses, Google bulut çeviri) ve bunlara dayanan Business planı kapalı.
/// Uygulama cihaz içi karşılıklarla çalışır: cihaz TTS'i, çevrimdışı sözlük,
/// yerel telaffuz puanı. Kod silinmedi; ileride açmak için derlemeye
/// `--dart-define=VOXELITH_PAID_APIS=true` verilir ve sunucu fonksiyonlarına
/// `VOXELITH_PAID_APIS=true` ortam değişkeni eklenir.
class Features {
  static const paidCloudApis = bool.fromEnvironment('VOXELITH_PAID_APIS');

  /// Business planı yalnızca ücretli AI/ses/çeviri haklarını artırıyordu.
  static const businessPlan = paidCloudApis;
}
