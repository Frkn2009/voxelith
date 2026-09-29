/// Mağaza/hukuk metinlerinde geçen iletişim bilgilerinin tek kaynağı.
///
/// YER TUTUCU: şirket alan adı ve e-postaları kesinleşince yalnızca burayı
/// (ve `site/privacy.html`, `site/terms.html`) güncelle. Mağazaya
/// göndermeden önce bu adreslerin gerçekten e-posta aldığından emin ol —
/// Google Play destek e-postasını doğrular.
class LegalInfo {
  static const supportEmail = 'destek@voxelith.app';
  static const privacyEmail = 'gizlilik@voxelith.app';
  static const websiteUrl = 'https://voxelith.app';
  static const privacyUrl = '$websiteUrl/privacy.html';
  static const termsUrl = '$websiteUrl/terms.html';
  static const deleteAccountUrl = '$websiteUrl/delete-account.html';
}
