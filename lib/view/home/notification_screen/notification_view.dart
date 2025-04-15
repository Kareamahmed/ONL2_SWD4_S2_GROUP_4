import 'package:flutter/material.dart';
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
class NotificationItem extends StatelessWidget {
  final NotificationModel notification;

  const NotificationItem({
    super.key,
    required this.notification,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey.shade300,
            width: 1,
          ),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (notification.isNew)
            Container(
              margin:  EdgeInsets.only(right: 8, top: 4),
              width: 8,
              height: 8,
              decoration:  BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
              ),
            ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  notification.title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: notification.isNew ? FontWeight.bold : FontWeight.normal,
                  ),
                ),
                if (notification.subtitle.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: Text(
                      notification.subtitle,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class NotificationModel {
  final String title;
  final String subtitle;
  final bool isNew;

  const NotificationModel({
    required this.title,
    required this.subtitle,
    required this.isNew,
  });
}