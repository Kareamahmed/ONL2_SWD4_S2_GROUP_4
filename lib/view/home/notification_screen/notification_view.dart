import 'package:flutter/material.dart';
import 'package:striky/view/home/notification_screen/notification_item.dart';
import 'package:striky/view/home/notification_screen/notification_model.dart';
import 'package:striky/view/myPhotos/widgets/custom_appbar.dart';

class NotificationView extends StatefulWidget {
  const NotificationView({super.key});

  @override
  State<NotificationView> createState() => _NotificationViewState();
}

class _NotificationViewState extends State<NotificationView> {
  List<NotificationModel> notifications = const [
      NotificationModel(
        title: "Hey, it's time for MyDeh",
        subtitle: "minutes ago",
        isNew: true,
      ),
      NotificationModel(
        title: "Don't miss your lowerbody workout",
        subtitle: "About 3 hours ago",
        isNew: false,
      ),
      NotificationModel(
        title: "Hey, let's add some meals for your b...",
        subtitle: "About 3 hours ago",
        isNew: false,
      ),
      NotificationModel(
        title: "Congratulations, You have finished A...",
        subtitle: "29 May",
        isNew: false,
      ),
      NotificationModel(
        title: "Hey, it's time for MyDeh",
        subtitle: "",
        isNew: false,
      ),
      NotificationModel(
        title: "Ups, You have missed your lowerbo...",
        subtitle: "3 April",
        isNew: false,
      ),
    ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Notificatio",onpressed1: () {
        Navigator.pop(context);
      },onpressed2: () {
        
      },),
       body: _buildNotificationList(),
    );
  }

  Widget _buildNotificationList() {
    if (notifications.isEmpty) {
      return const Center(
        child: Text(
          "No notifications",
          style: TextStyle(fontSize: 18)),
      );
    }

    return ListView.builder(
      itemCount: notifications.length,
      itemBuilder: (context, index) {
        return _buildDismissibleNotification(index);
      },
    );
  }

  Widget _buildDismissibleNotification(int index) {
    final notification = notifications[index];
    
    return Dismissible(
      key: UniqueKey(),
      direction: DismissDirection.endToStart,
      background: _buildDeleteBackground(),
      confirmDismiss: (direction) async {
        return await _showDeleteConfirmation(context);
      },
      onDismissed: (direction) {
        _handleDismiss(index);
      },
      child: NotificationItem(notification: notification),
    );
  }

  Widget _buildDeleteBackground() {
    return Container(
      color: Colors.red[400],
      alignment: Alignment.centerRight,
      padding: const EdgeInsets.only(right: 20),
      child: const Icon(
        Icons.delete_forever,
        color: Colors.white,
        size: 30,
      ),
    );
  }

  Future<bool> _showDeleteConfirmation(BuildContext context) async {
    return await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Confirm Delete"),
        content: const Text("Are you sure you want to delete this notification?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text("Cancel"),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text("Delete", style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    ) ?? false;
  }

  void _handleDismiss(int index) {
    final removedItem = notifications[index];
    
    setState(() {
      notifications.removeAt(index);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Notification deleted: ${removedItem.title}"),
        action: SnackBarAction(
          label: "Undo",
          textColor: Colors.white,
          onPressed: () {
            setState(() {
              notifications.insert(index, removedItem);
            });
          },
        ),
        duration: const Duration(seconds: 3),
      ),
    );
  }
}
