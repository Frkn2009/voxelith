import 'dart:convert';
import 'dart:ui' show PlatformDispatcher;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'app.dart';
import 'core/supabase_config.dart';
import 'data/content/content_store.dart';
import 'data/models/models.dart';
import 'data/notifications/notification_service.dart';
import 'features/plus/data/revenuecat_billing_service.dart';
import 'state/session.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Anahtarlar girildiyse bulut senkronu açılır.
  // Girilmediyse uygulama eskisi gibi tamamen yerel çalışır.
  if (SupaConfig.isSet) {
    await Supabase.initialize(
      url: SupaConfig.url,
      publishableKey: SupaConfig.publishableKey,
    );
    // Her kullanıcının (e-posta ile hiç kayıt olmasa bile) kararlı bir
    // Supabase auth uid'i olsun diye — bu uid, RevenueCat'in appUserID'si
    // olarak kullanılıyor (bkz. RevenueCatBillingService), böylece ödeme
    // webhook'u satın alımı doğru kullanıcıya yazabiliyor.
    if (Supabase.instance.client.auth.currentSession == null) {
      try {
        await Supabase.instance.client.auth.signInAnonymously();
      } catch (_) {
        // Anonim giriş projede kapalıysa uygulama yerel modda çalışmaya devam eder.
      }
    }
  }

  // VOXELO_REVENUECAT_API_KEY dart-define'ı girilmediyse hiçbir şey yapmaz —
  // PlusController o zaman FakeBillingService kullanmaya devam eder.
  await RevenueCatBillingService.configureIfNeeded();

  final prefs = await SharedPreferences.getInstance();
  final ui = _initialUiLang(prefs);

  try {
    await NotificationService.initialize(ui: ui);
  } catch (_) {
    // Bildirim desteği olmayan platformlarda uygulama açılışını engelleme.
  }

  await ContentStore.init(ui);
  runApp(
    ProviderScope(
      overrides: [prefsProvider.overrideWithValue(prefs)],
      child: const VoxelithApp(),
    ),
  );
}

/// İçerik çevirilerini ilk kareden önce yükleyebilmek için arayüz dilini
/// kayıtlı profilden (yoksa cihaz dilinden) okur.
UiLang _initialUiLang(SharedPreferences prefs) {
  final names = UiLang.values.asNameMap();
  try {
    final raw = prefs.getString('voxelith.profile.v1');
    if (raw != null) {
      final ui = names[(jsonDecode(raw) as Map<String, dynamic>)['uiLang']];
      if (ui != null) return ui;
    }
  } catch (_) {}
  return names[PlatformDispatcher.instance.locale.languageCode] ?? UiLang.en;
}
