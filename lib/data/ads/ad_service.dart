import 'dart:async';
import 'package:app_tracking_transparency/app_tracking_transparency.dart';
import 'package:flutter/foundation.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdService {
  static bool _initialized = false;
  static bool _canRequestAds = false;

  static const _rewardedAndroid = String.fromEnvironment(
    'VOXELITH_ADMOB_REWARDED_ANDROID',
    defaultValue: 'ca-app-pub-3940256099942544/5224354917',
  );
  static const _rewardedIos = String.fromEnvironment(
    'VOXELITH_ADMOB_REWARDED_IOS',
    defaultValue: 'ca-app-pub-3940256099942544/1712485313',
  );
  static const _interstitialAndroid = String.fromEnvironment(
    'VOXELITH_ADMOB_INTERSTITIAL_ANDROID',
    defaultValue: 'ca-app-pub-3940256099942544/1033173712',
  );
  static const _interstitialIos = String.fromEnvironment(
    'VOXELITH_ADMOB_INTERSTITIAL_IOS',
    defaultValue: 'ca-app-pub-3940256099942544/4411468910',
  );

  static bool get supported =>
      !kIsWeb &&
      (defaultTargetPlatform == TargetPlatform.android ||
          defaultTargetPlatform == TargetPlatform.iOS);

  static Future<void> initialize() async {
    if (_initialized || !supported) return;
    final consentUpdate = Completer<void>();
    ConsentInformation.instance.requestConsentInfoUpdate(
      ConsentRequestParameters(),
      () => consentUpdate.complete(),
      (_) => consentUpdate.complete(),
    );
    await consentUpdate.future;
    final consentForm = Completer<void>();
    ConsentForm.loadAndShowConsentFormIfRequired((_) => consentForm.complete());
    await consentForm.future;
    _canRequestAds = await ConsentInformation.instance.canRequestAds();
    if (_canRequestAds) {
      await _requestTrackingAuthorization();
      await MobileAds.instance.updateRequestConfiguration(
        RequestConfiguration(maxAdContentRating: MaxAdContentRating.pg),
      );
      await MobileAds.instance.initialize();
    }
    _initialized = true;
  }

  /// iOS App Tracking Transparency (App Store Kural 5.1.2): reklam kimliği
  /// (IDFA) yalnızca kullanıcı izin verirse kullanılır. Google'ın önerdiği
  /// sıra: önce UMP izin formu, sonra ATT penceresi. Reddedilirse AdMob
  /// kişiselleştirilmemiş reklam gösterir; uygulama normal çalışmaya devam
  /// eder. Metin: ios/Runner/*.lproj/InfoPlist.strings.
  static Future<void> _requestTrackingAuthorization() async {
    if (defaultTargetPlatform != TargetPlatform.iOS) return;
    try {
      final status = await AppTrackingTransparency.trackingAuthorizationStatus;
      if (status == TrackingStatus.notDetermined) {
        await AppTrackingTransparency.requestTrackingAuthorization();
      }
    } catch (_) {
      // ATT desteklenmeyen eski iOS sürümleri — reklam akışını bozma.
    }
  }

  static String get _rewardedUnit => defaultTargetPlatform == TargetPlatform.iOS
      ? _rewardedIos
      : _rewardedAndroid;
  static String get _interstitialUnit =>
      defaultTargetPlatform == TargetPlatform.iOS
      ? _interstitialIos
      : _interstitialAndroid;

  static Future<bool> showRewarded() async {
    if (!supported) return false;
    await initialize();
    if (!_canRequestAds) return false;
    final result = Completer<bool>();
    await RewardedAd.load(
      adUnitId: _rewardedUnit,
      request: const AdRequest(),
      rewardedAdLoadCallback: RewardedAdLoadCallback(
        onAdFailedToLoad: (_) => result.complete(false),
        onAdLoaded: (ad) {
          var earned = false;
          ad.fullScreenContentCallback = FullScreenContentCallback(
            onAdDismissedFullScreenContent: (shownAd) {
              shownAd.dispose();
              if (!result.isCompleted) result.complete(earned);
            },
            onAdFailedToShowFullScreenContent: (shownAd, _) {
              shownAd.dispose();
              if (!result.isCompleted) result.complete(false);
            },
          );
          ad.show(onUserEarnedReward: (_, _) => earned = true);
        },
      ),
    );
    return result.future.timeout(
      const Duration(seconds: 45),
      onTimeout: () => false,
    );
  }

  static Future<bool> showInterstitial() async {
    if (!supported) return false;
    await initialize();
    if (!_canRequestAds) return false;
    final result = Completer<bool>();
    await InterstitialAd.load(
      adUnitId: _interstitialUnit,
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdFailedToLoad: (_) => result.complete(false),
        onAdLoaded: (ad) {
          ad.fullScreenContentCallback = FullScreenContentCallback(
            onAdDismissedFullScreenContent: (shownAd) {
              shownAd.dispose();
              if (!result.isCompleted) result.complete(true);
            },
            onAdFailedToShowFullScreenContent: (shownAd, _) {
              shownAd.dispose();
              if (!result.isCompleted) result.complete(false);
            },
          );
          ad.show();
        },
      ),
    );
    return result.future.timeout(
      const Duration(seconds: 30),
      onTimeout: () => false,
    );
  }
}
