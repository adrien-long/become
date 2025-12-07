package com.airok.quit

import android.appwidget.AppWidgetManager
import android.content.ComponentName
import android.content.Context
import android.content.Intent
import android.widget.RemoteViews
import androidx.core.app.JobIntentService
import java.time.Instant
import java.time.LocalDateTime
import java.time.ZoneId
import java.time.temporal.ChronoUnit

class UpdateWidgetService : JobIntentService() {

    override fun onHandleWork(intent: Intent) {

        val createdTime = intent.getIntExtra("createdTime", 0)
        val text = intent.getStringExtra("text") ?: ""

        val appWidgetManager = AppWidgetManager.getInstance(this)
        val widget = ComponentName(this, BecomeWidgetProvider::class.java)
        val views = RemoteViews(packageName, R.layout.widget_page1_layout)

        views.setTextViewText(R.id.text_value, text)

        appWidgetManager.updateAppWidget(widget, views)
    }

    companion object {
        private const val JOB_ID = 1000

        fun enqueueWork(context: Context, intent: Intent) {
            enqueueWork(context, UpdateWidgetService::class.java, JOB_ID, intent)
        }
    }
}
