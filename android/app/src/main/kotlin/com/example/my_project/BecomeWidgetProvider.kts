package com.airok.quit

import android.app.AlarmManager
import android.app.PendingIntent
import android.appwidget.AppWidgetManager
import android.appwidget.AppWidgetProvider
import android.content.Context
import android.content.Intent
import es.antonborri.home_widget.HomeWidgetPlugin

class BecomeWidgetProvider : AppWidgetProvider() {

    companion object {
        const val ACTION_AUTO_UPDATE = "com.mycompany.become.AUTO_UPDATE"
        const val REQUEST_CODE = 1001
        const val UPDATE_INTERVAL = AlarmManager.INTERVAL_HOUR * 4
    }

    override fun onReceive(context: Context, intent: Intent) {
        super.onReceive(context, intent)

        when (intent.action) {
            ACTION_AUTO_UPDATE -> {
                updateWidget(context, getWidgetData(context))
            }

            Intent.ACTION_BOOT_COMPLETED -> {
                setRepeatingUpdate(context)
            }

            AppWidgetManager.ACTION_APPWIDGET_UPDATE -> {
                updateWidget(context, getWidgetData(context))
            }
        }
    }

    override fun onUpdate(
        context: Context,
        appWidgetManager: AppWidgetManager,
        appWidgetIds: IntArray
    ) {
        updateWidget(context, getWidgetData(context))
        setRepeatingUpdate(context)
    }

    override fun onEnabled(context: Context) {
        setRepeatingUpdate(context)
    }

    override fun onDisabled(context: Context) {
        cancelRepeatingUpdate(context)
    }

    private fun getWidgetData(context: Context): WidgetData {
        val prefs = HomeWidgetPlugin.getData(context)

        val textList = prefs.getStringSet("textList", emptySet())?.toList() ?: emptyList()

        val randomText = if (textList.isNotEmpty()) {
            textList.random()
        } else {
            ""
        }

        return WidgetData(
            createdTime = prefs.getInt("createdTime", 0),
            randomText = randomText
        )
    }


    private fun updateWidget(context: Context, data: WidgetData) {
        val intent = Intent(context, UpdateWidgetService::class.java).apply {
            putExtra("createdTime", data.createdTime)
            putExtra("text", data.randomText)
        }
        UpdateWidgetService.enqueueWork(context, intent)
    }


    private fun setRepeatingUpdate(context: Context) {
        val alarmManager = context.getSystemService(Context.ALARM_SERVICE) as AlarmManager

        val intent = Intent(context, BecomeWidgetProvider::class.java).apply {
            action = ACTION_AUTO_UPDATE
        }

        val pendingIntent = PendingIntent.getBroadcast(
            context,
            REQUEST_CODE,
            intent,
            PendingIntent.FLAG_UPDATE_CURRENT or PendingIntent.FLAG_IMMUTABLE
        )

        alarmManager.setInexactRepeating(
            AlarmManager.RTC,
            System.currentTimeMillis() + UPDATE_INTERVAL,
            UPDATE_INTERVAL,
            pendingIntent
        )
    }

    private fun cancelRepeatingUpdate(context: Context) {
        val alarmManager = context.getSystemService(Context.ALARM_SERVICE) as AlarmManager
        val intent = Intent(context, BecomeWidgetProvider::class.java).apply {
            action = ACTION_AUTO_UPDATE
        }

        val pendingIntent = PendingIntent.getBroadcast(
            context,
            REQUEST_CODE,
            intent,
            PendingIntent.FLAG_UPDATE_CURRENT or PendingIntent.FLAG_IMMUTABLE
        )

        alarmManager.cancel(pendingIntent)
    }

    data class WidgetData(
        val createdTime: Int,
        val randomText: String
    )
}
