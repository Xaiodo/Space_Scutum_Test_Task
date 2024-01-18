import 'package:flutter/services.dart';
import 'package:space_scutum_test_task/src/values/app_constants.dart';

class BackgroundNotificationHandler {
  static const platform = MethodChannel(AppConstants.methodChannelName);

  Future<void> showNotification(String title, String body) async {
    try {
      await platform.invokeMethod('scheduleNotification', <String, dynamic>{
        'title': title,
        'body': body,
        'time':
            DateTime.now().add(const Duration(minutes: 1)).toIso8601String(),
      });
    } catch (e) {
      print('Failed to show notification: $e');
    }
  }
}
