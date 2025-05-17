import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:striky/core/constants/global_constants.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

class NotiService {
  final notificationsPlugin = FlutterLocalNotificationsPlugin();

  final bool _isInitialized = false;
  bool get isInitialized => _isInitialized;

  Future<void> requestNotificationPermission() async {
    if (await Permission.notification.isDenied) {
      await Permission.notification.request();
    }
  }

  //  INITIALIZE

  Future<void> initNotifications() async {
    if (_isInitialized) return; // to prevent reinitialize

    requestNotificationPermission();
    //prepare android init settings
    const initSettingAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    tz.initializeTimeZones();

    final String currenttimezone = await FlutterTimezone.getLocalTimezone();
    tz.setLocalLocation(tz.getLocation(currenttimezone));
    //prepare ios init settings
    const initSettingIOS = DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
    );

    //prepare init settings
    const initSettings = InitializationSettings(
      android: initSettingAndroid,
      iOS: initSettingIOS,
    );

    // plugin initialize
    await notificationsPlugin.initialize(initSettings,
        onDidReceiveNotificationResponse: onNotificationTap);
  }
  // NOTIFICATIONS DETAILS SETUP

  NotificationDetails notificationDetails() {
    return const NotificationDetails(
        android: AndroidNotificationDetails(
            'daily_channel_id', 'daily notifications',
            channelDescription: 'daily notifications description',
            importance: Importance.max,
            priority: Priority.high,
            ticker: 'ticker',
            playSound: true),
        iOS: DarwinNotificationDetails());
  }

  //SHOW NOTIFICATIONS
  Future<void> showNotification({
    int id = 0,
    required String body,
  }) async {
    return notificationsPlugin.show(id, 'striky', body, notificationDetails(),
        payload: 'your_payload');
  }

  // schedule notifications
  Future<void> scheduleNotification({
    int id = 0,
    String? body,
    bool repeatdaily = true,
    required int hour,
    required int minute,
  }) async {
    var now = tz.TZDateTime.now(tz.local);
    var scheduledate =
        tz.TZDateTime(tz.local, now.year, now.month, now.day, hour, minute);

    // 🔥 This is the fix: push to tomorrow if time has passed
    if (scheduledate.isBefore(now)) {
      scheduledate = scheduledate.add(const Duration(days: 1));
    }

    print('⏰ Scheduling notification for $scheduledate');

    try {
      await notificationsPlugin.zonedSchedule(
        id,
        body,
        body,
        scheduledate,
        notificationDetails(),
        androidScheduleMode: AndroidScheduleMode.exact,
        matchDateTimeComponents: repeatdaily ? DateTimeComponents.time : null,
      );
      print('✅ Scheduled successfully for $scheduledate');
    } catch (e) {
      print('🚨 Error scheduling: $e');
    }
  }

  // PERIODIC NOTIFICATIONS
  Future<void> periodicNotification({
    int id = 0,
    String? body,
    bool repeatdaily = true,
  }) async {
    return notificationsPlugin.periodicallyShow(
      100,
      'Hydration Reminder',
      'Drink some water 💧',
      RepeatInterval.hourly,
      notificationDetails(),
      androidScheduleMode:
          AndroidScheduleMode.inexactAllowWhileIdle, // more precise
    );
  }

// TOGGLE NOTIFICATION SETTING
  Future<void> toggleNotificationSetting(bool enable) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(kSharedPrefNotiEnabled, enable);

    if (!enable) {
      await notificationsPlugin.cancelAll();
    }
  }

// GET CURRENT PREFERENCE
  Future<bool> areNotificationsEnabled() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(kSharedPrefNotiEnabled) ?? true;
  }

// WRAPPED NOTIFICATION CALL THAT CHECKS USER PREFERENCE
  Future<void> showNotificationIfEnabled({
    required int id,
    required String body,
  }) async {
    if (!await areNotificationsEnabled()) return;

    await notificationsPlugin.show(id, 'striky', body, notificationDetails());
  }

  //ON NOTIFICATION TAP
  void onNotificationTap(NotificationResponse response) {
    final payload = response.payload;
    print('Notification tapped! Payload: $payload');

    // Example: Navigate to a specific screen (you’ll need context for this)
    // Navigator.pushNamed(context, '/target_screen', arguments: payload);
  }
}
