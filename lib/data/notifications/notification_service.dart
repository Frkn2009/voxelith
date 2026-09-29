import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../core/l10n/i18n.dart';
import '../../core/l10n/i18n_store.dart';
import '../models/models.dart';

class NotificationService {
  static bool _initialized = false;
  static const _firstReminderId = 7100;
  static const _reminderCount = 7;
  static const _channelKey = 'daily_practice';

  /// [ui] yalnızca Android bildirim kanalının (sistem ayarlarında görünen)
  /// adı içindir; kanal bir kez oluşturulur.
  static Future<void> initialize({UiLang ui = UiLang.en}) async {
    if (_initialized || kIsWeb) return;
    final i18n = I18n(ui);
    await AwesomeNotifications().initialize(null, [
      NotificationChannel(
        channelKey: _channelKey,
        channelName: i18n.notifChannelName,
        channelDescription: i18n.notifChannelDescription,
        defaultColor: const Color(0xFF0D5955),
        ledColor: const Color(0xFFFFFFFF),
        importance: NotificationImportance.Default,
        playSound: true,
        enableVibration: true,
      ),
    ]);
    _initialized = true;
  }

  /// Cihazın yerel saatini kullanarak önümüzdeki yedi gün için günde yalnızca
  /// bir bildirim planlar. Uygulama her açıldığında kayan pencere yenilenir.
  static Future<void> sync(UserProfile profile) async {
    if (kIsWeb) return;
    await initialize(ui: profile.uiLang);
    for (var offset = 0; offset < _reminderCount; offset++) {
      await AwesomeNotifications().cancelSchedule(_firstReminderId + offset);
    }
    if (!profile.notificationsEnabled) return;
    final allowed =
        await AwesomeNotifications().isNotificationAllowed() ||
        await AwesomeNotifications().requestPermissionToSendNotifications();
    if (!allowed) return;

    final now = DateTime.now();
    var first = DateTime(now.year, now.month, now.day, profile.reminderHour);
    if (!first.isAfter(now)) first = first.add(const Duration(days: 1));

    for (var offset = 0; offset < _reminderCount; offset++) {
      final content = contentFor(profile, offset);
      await AwesomeNotifications().createNotification(
        content: NotificationContent(
          id: _firstReminderId + offset,
          channelKey: _channelKey,
          title: content.$1,
          body: content.$2,
          category: NotificationCategory.Reminder,
          payload: const {'route': '/app'},
        ),
        schedule: NotificationCalendar.fromDate(
          date: first.add(Duration(days: offset)),
          allowWhileIdle: true,
          preciseAlarm: false,
        ),
      );
    }
  }

  /// Saf içerik seçimi test edilebilir ve bildirimler öğretmen tonunda kalır.
  static (String, String) contentFor(UserProfile profile, int dayOffset) {
    final i18n = I18n(profile.uiLang);
    if (profile.isPlus && dayOffset % 4 == 0) {
      return ('VOXELITH Plus', i18n.notifPlusBody);
    }
    if (profile.streak >= 2 && dayOffset % 3 == 1) {
      return (i18n.notifStreakTitle, i18n.notifStreakBody(profile.streak));
    }
    if (dayOffset % 3 == 2) {
      return (i18n.notifGameTitle, i18n.notifGameBody);
    }
    return (i18n.notifPracticeTitle, i18n.notifPracticeBody);
  }
}
