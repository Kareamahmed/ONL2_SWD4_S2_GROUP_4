import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:striky/controllers/notifications/notification_controller.dart';
import 'package:striky/core/constants/global_constants.dart';
import 'package:striky/presentation/view/profile/widgets/custom_switch.dart';

class WorkoutCard extends StatelessWidget {
  WorkoutCard({
    super.key,
    required this.title,
    required this.time,
    required this.pic,
  });

  final String title;
  final String time;
  final String pic;

  final NotificationController _notiController =
      Get.find<NotificationController>();

  @override
  Widget build(BuildContext context) {
    final notificationId =
        DateTime.now().millisecondsSinceEpoch.remainder(100000);

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 25,
            backgroundColor: Colors.purple.shade50,
            child: SvgPicture.asset(
              pic,
              height: 40,
            ),
          ),
          const SizedBox(width: 14),
          // Texts
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontFamily: kprimaryfont,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  time,
                  style: TextStyle(
                    fontFamily: kprimaryfont,
                    fontSize: 12,
                    color: Colors.grey.shade600,
                  ),
                ),
              ],
            ),
          ),
          Obx(() => CustomSwitch(
                isOn: _notiController.fullbodynotificationsEnabled.value,
                onToggle: () {
                  final current =
                      _notiController.fullbodynotificationsEnabled.value;
                  _notiController.fullbodynotificationsEnabled.value = !current;

                  _notiController.scheduleNotification(
                      id: notificationId,
                      body: 'this is me in it ',
                      hour: 15,
                      minute: 00);

                  _notiController.showNotification(id: 0, body: 'what is it ');
                },
              )),
        ],
      ),
    );
  }
}
