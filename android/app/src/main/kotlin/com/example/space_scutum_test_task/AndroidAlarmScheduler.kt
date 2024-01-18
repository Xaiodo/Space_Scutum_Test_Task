package com.example.space_scutum_test_task

import android.app.AlarmManager
import android.app.PendingIntent
import android.content.Context
import android.content.Intent
import android.os.Build
import androidx.annotation.RequiresApi
import java.time.ZoneId

class AndroidAlarmScheduler (
    private val context: Context
) {
    private val id = 10012345
    private val alarmManager = context.getSystemService(AlarmManager::class.java)
    fun scheduleAlarm(alarmItem: AlarmItem) {
        var intent = Intent(context, AlarmReceiver::class.java).apply {
            putExtra("TITLE", alarmItem.title)
            putExtra("BODY", alarmItem.body)
        }
        val interval :Long = 60000
        alarmManager.setRepeating(
            AlarmManager.RTC_WAKEUP,
            alarmItem.time.atZone(ZoneId.systemDefault()).toEpochSecond() * 1000,
            interval,
            PendingIntent.getBroadcast(context, id, intent, PendingIntent.FLAG_UPDATE_CURRENT or PendingIntent.FLAG_IMMUTABLE)
        )
    }

}