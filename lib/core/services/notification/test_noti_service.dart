import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'package:timezone/timezone.dart' as tz;

class MyLocalNotification {
  static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  static initNotification() async {
    // initialise the plugin. app_icon needs to be a added as a drawable resource to the Android head project
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    final DarwinInitializationSettings initializationSettingsDarwin =
        DarwinInitializationSettings();
    final InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsDarwin,
      macOS: initializationSettingsDarwin,
      // linux: initializationSettingsLinux,
      // windows: initializationSettingsWindows,
    );
    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (details) {},
    );
  }

  static NotificationDetails notificationDetails() {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      'your channel id',
      'your channel name',
      channelDescription: 'your channel description',
      importance: Importance.max,
      priority: Priority.high,
      showWhen: false,
    );
    NotificationDetails platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
    );
    return platformChannelSpecifics;
  }

  static void simpleNotification({
    required int id,
    required String title,
    required String body,
    required String payload,
    // {required String title, required String body, required String payload}
  }) async {
    await flutterLocalNotificationsPlugin.show(
      id,
      title,
      body,
      notificationDetails(),
      payload: payload,
    );
  }

  static void perudicNotification({
    required int id,
    required String title,
    required String body,
    required String payload,
    // {required String title, required String body, required String payload}
  }) async {
    await flutterLocalNotificationsPlugin.periodicallyShow(
      id,
      title,
      body,
      RepeatInterval.everyMinute,
      notificationDetails(),
      payload: payload,
      androidScheduleMode: AndroidScheduleMode.alarmClock,
    );
  }

  static void cancelNotification(int id) async {
    await flutterLocalNotificationsPlugin.cancel(id);
  }

  static void cancelAllNotification() async {
    await flutterLocalNotificationsPlugin.cancelAll();
  }

  static void scheduleNotification({
    required int id,
    required String title,
    required String body,
    required String payload,
    // {required String title, required String body, required String payload}
  }) async {
    await flutterLocalNotificationsPlugin.zonedSchedule(
      id,
      title,
      body,
      tz.TZDateTime.now(tz.local).add(const Duration(seconds: 5)),
      notificationDetails(),
      androidScheduleMode: AndroidScheduleMode.alarmClock,
      payload: payload,
    );
  }
}
