
import 'package:flutter/material.dart';
import 'package:striky/view/home/notification_screen/notification_model.dart';

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
                  maxLines: 2, 
                  overflow: TextOverflow.ellipsis, 
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
