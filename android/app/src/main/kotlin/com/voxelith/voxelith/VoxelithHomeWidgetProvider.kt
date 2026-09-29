package com.voxelith.voxelith

import android.appwidget.AppWidgetManager
import android.content.Context
import android.content.SharedPreferences
import android.widget.RemoteViews
import es.antonborri.home_widget.HomeWidgetLaunchIntent
import es.antonborri.home_widget.HomeWidgetProvider

class VoxelithHomeWidgetProvider : HomeWidgetProvider() {
    override fun onUpdate(
        context: Context,
        appWidgetManager: AppWidgetManager,
        appWidgetIds: IntArray,
        widgetData: SharedPreferences,
    ) {
        appWidgetIds.forEach { widgetId ->
            val dailyXp = widgetData.getInt("daily_xp", 0)
            val goal = widgetData.getInt("goal", 100)
            val streak = widgetData.getInt("streak", 0)
            val lesson = widgetData.getString("lesson", null) ?: "VOXELITH"
            val views = RemoteViews(context.packageName, R.layout.voxelith_home_widget).apply {
                setTextViewText(R.id.widget_lesson, lesson)
                setTextViewText(R.id.widget_xp, "$dailyXp / $goal XP")
                setTextViewText(R.id.widget_streak, widgetData.getString("streak_text", null) ?: "🔥 $streak")
                setOnClickPendingIntent(
                    R.id.widget_container,
                    HomeWidgetLaunchIntent.getActivity(context, MainActivity::class.java),
                )
            }
            appWidgetManager.updateAppWidget(widgetId, views)
        }
    }
}
