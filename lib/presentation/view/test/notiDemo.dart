import 'package:flutter/material.dart';
import 'package:striky/core/services/notification/test_noti_service.dart';

class NotificationDemoPage extends StatefulWidget {
  const NotificationDemoPage({super.key});

  @override
  State<NotificationDemoPage> createState() => _NotificationDemoPageState();
}

class _NotificationDemoPageState extends State<NotificationDemoPage> {
  final int notificationId = 100;

  @override
  void initState() {
    super.initState();
    _initializeNotifications();
  }

  Future<void> _initializeNotifications() async {
    await MyLocalNotification.initNotification();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Notification Demo")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            NotificationButton(
              label: "Show Simple Notification",
              onPressed: () {
                MyLocalNotification.simpleNotification(
                  id: notificationId,
                  title: "Hello!",
                  body: "This is a simple notification.",
                  payload: "simple",
                );
              },
            ),
            NotificationButton(
              label: "Schedule Notification (after 5s)",
              onPressed: () {
                MyLocalNotification.scheduleNotification(
                  id: notificationId + 1,
                  title: "Reminder",
                  body: "This is a scheduled notification.",
                  payload: "scheduled",
                );
              },
            ),
            NotificationButton(
              label: "Periodic Notification (every minute)",
              onPressed: () {
                MyLocalNotification.perudicNotification(
                  id: notificationId + 2,
                  title: "Repeat",
                  body: "This notification repeats every minute.",
                  payload: "periodic",
                );
              },
            ),
            NotificationButton(
              label: "Cancel Notification (id: 100)",
              onPressed: () {
                MyLocalNotification.cancelNotification(notificationId);
              },
            ),
            NotificationButton(
              label: "Cancel All Notifications",
              onPressed: () {
                MyLocalNotification.cancelAllNotification();
              },
            ),
          ],
        ),
      ),
    );
  }
}

class NotificationButton extends StatelessWidget {
  const NotificationButton({
    super.key,
    required this.label,
    required this.onPressed,
  });

  final String label;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          minimumSize: const Size.fromHeight(50),
        ),
        child: Text(label),
      ),
    );
  }
}
