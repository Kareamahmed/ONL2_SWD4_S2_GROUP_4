import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:striky/controllers/notifications/notification_controller.dart';
import 'package:striky/core/services/notification/noti_service.dart';
import 'package:striky/core/services/service_locator/service_locator.dart';
import 'package:striky/myapp.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  tz.initializeTimeZones();
  tz.setLocalLocation(tz.getLocation('Africa/Cairo'));
  serviceLocator();

  NotiService().initNotifications();
  Get.put(NotificationController());

  runApp(const MyApp());
}
