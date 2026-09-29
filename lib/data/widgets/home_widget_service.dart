import 'package:flutter/foundation.dart';
import 'package:home_widget/home_widget.dart';

import '../../core/l10n/i18n.dart';
import '../../core/l10n/i18n_store.dart';
import '../content/catalog.dart';
import '../models/models.dart';

class VoxelithHomeWidgetService {
  static const appGroupId = 'group.com.voxelith.voxelith';

  static Future<void> sync(UserProfile profile) async {
    if (kIsWeb) return;
    await HomeWidget.setAppGroupId(appGroupId);
    final i18n = I18n(profile.uiLang);
    final scenarios = Catalog.forLang(profile.learnLang);
    final scenario = scenarios.isEmpty
        ? null
        : scenarios[DateTime.now().day % scenarios.length];
    await Future.wait([
      HomeWidget.saveWidgetData(
        'language',
        profile.learnLang.label(profile.uiLang),
      ),
      HomeWidget.saveWidgetData('daily_xp', profile.dailyXp),
      HomeWidget.saveWidgetData('total_xp', profile.totalXp),
      HomeWidget.saveWidgetData('streak', profile.streak),
      HomeWidget.saveWidgetData(
        'streak_text',
        i18n.widgetStreakDays(profile.streak),
      ),
      HomeWidget.saveWidgetData(
        'lesson',
        scenario?.title(profile.uiLang) ?? i18n.widgetTodayPractice,
      ),
      HomeWidget.saveWidgetData('goal', UserProfile.dailyXpGoal),
    ]);
    await HomeWidget.updateWidget(
      name: 'VoxelithHomeWidgetProvider',
      iOSName: 'VoxelithHomeWidget',
    );
  }
}
