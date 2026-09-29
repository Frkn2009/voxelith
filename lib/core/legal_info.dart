/// Mağaza/hukuk metinlerinde geçen şirket ve iletişim bilgilerinin tek kaynağı.
///
/// Şirket Hollanda'da kayıtlı; metinler AB (GDPR/AVG) ve Hollanda hukukuna
/// göre yazılır. `[KÖŞELİ_PARANTEZ]` değerler henüz girilmemiş bilgidir —
/// `docs/content_tasks/REQUESTS.json` doldurulup `python3 tools/apply_config.py`
/// çalıştırılınca buraya ve `site/` sayfalarına yazılır. Bu işaretler
/// dururken uygulama yayınlanmamalı (bkz. [isComplete]).
class LegalInfo {
  // --- Veri sorumlusu (GDPR md. 13/1-a) ---
  static const companyLegalName = '[LEGAL_COMPANY_NAME]';
  static const companyAddress = '[REGISTERED_ADDRESS]';
  static const kvkNumber = '[KVK_NUMBER]';
  static const vatNumber = '[VAT_NUMBER]';

  // --- İletişim ---
  static const supportEmail = '[SUPPORT_EMAIL]';
  static const privacyEmail = '[PRIVACY_EMAIL]';

  // --- Web ---
  static const websiteUrl = 'https://voxelith.app';
  static const privacyUrl = '$websiteUrl/privacy.html';
  static const termsUrl = '$websiteUrl/terms.html';
  static const deleteAccountUrl = '$websiteUrl/delete-account.html';

  /// Hollanda veri koruma denetim kurumu (şikâyet hakkı, GDPR md. 77).
  static const supervisoryAuthority =
      'Autoriteit Persoonsgegevens (autoriteitpersoonsgegevens.nl)';

  /// Tüm yasal alanlar gerçek değerle dolu mu?
  static bool get isComplete => ![
    companyLegalName,
    companyAddress,
    kvkNumber,
    supportEmail,
    privacyEmail,
  ].any((v) => v.startsWith('['));
}
