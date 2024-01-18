package com.example.space_scutum_test_task

import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent

class AlarmReceiver: BroadcastReceiver(){
    override fun onReceive(context: Context?, intent: Intent?) {
        val title = intent?.getStringExtra("TITLE") ?: return
        val body = intent?.getStringExtra("BODY") ?: return
        val notificationService = context?.let { NotificationService(it) }
        notificationService?.showNotification(title, body)
    }
}