package com.example.space_scutum_test_task

import android.app.NotificationChannel
import android.app.NotificationManager
import android.content.Context
import android.os.Build
import android.os.Bundle
import android.os.PersistableBundle
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import java.time.LocalDateTime
import java.time.format.DateTimeFormatter

class MainActivity: FlutterActivity() {
    companion object{
        private const val CHANNEL_ID = "my_channel_id"
        private const val methodChannel = "com.example.spacetask/methodChannel"
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        createNotificationChannel()
    }

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        val notificationService = NotificationService(context)

        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, methodChannel).setMethodCallHandler { call, result ->
            if (call.method == "scheduleNotification") {
                val title = call.argument<String>("title")
                val body = call.argument<String>("body")
                val time = call.argument<String>("time")
                print("title: $title, body: $body")
                if (title != null && body != null && time != null) {
                    val formatter = DateTimeFormatter.ISO_DATE_TIME
                    val parsedTime = LocalDateTime.parse(time, formatter)
                    val alarmItem = AlarmItem(
                        title = title,
                        body = body,
                        time = parsedTime,
                    )
                    val androidAlarmScheduler = AndroidAlarmScheduler(context)
                    androidAlarmScheduler.scheduleAlarm(alarmItem)
                }
            } else {
                result.notImplemented()
            }
        }
    }

    private fun createNotificationChannel(){
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            val name = "Current floor notification"
            val descriptionText = "Shows current floor in the last selected building"
            val importance = NotificationManager.IMPORTANCE_DEFAULT
            val channel = NotificationChannel(CHANNEL_ID, name, importance).apply {
                description = descriptionText
            }


            val notificationManager: NotificationManager = getSystemService(Context.NOTIFICATION_SERVICE) as NotificationManager

            notificationManager.createNotificationChannel(channel)
        }
    }
}
