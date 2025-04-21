import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:striky/controllers/notifications/notification_controller.dart';
import 'package:striky/core/routes/go_route.dart';
import 'package:striky/core/services/notification/noti_service.dart';
import 'package:striky/core/themes/light_theme.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;


void main() {
    WidgetsFlutterBinding.ensureInitialized();
      tz.initializeTimeZones();
        tz.setLocalLocation(tz.getLocation('Africa/Cairo'));
      
    NotiService().initNotifications();
      Get.put(NotificationController());

  runApp(const MainApp());
}



class MainApp extends StatelessWidget {
  
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp.router(
      theme: lighttheme,
      routerConfig: AppRoutes.router ,
      debugShowCheckedModeBanner: false,
    );
  }
}