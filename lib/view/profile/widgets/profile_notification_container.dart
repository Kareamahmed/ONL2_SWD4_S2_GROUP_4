
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:striky/controllers/notifications/notification_controller.dart';
import 'package:striky/core/constants/container_decoration.dart';
import 'package:striky/core/constants/global_constants.dart';
import 'package:striky/core/constants/text_fonts.dart';
import 'package:striky/view/profile/widgets/custom_switch.dart';

class ProfileNotificationContainer extends StatelessWidget {
  const ProfileNotificationContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final NotificationController _notiController = Get.find();
    return Container(
      decoration: ContainerDecoration.kFloatingContainerDecoration,
      margin: const EdgeInsets.symmetric(horizontal: 10.0),
      padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 15),
      width: double.infinity,
      
      child: Column(
        children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('Notification', style: TextFonts.kdarkboldfont16.copyWith(fontSize: 20),textAlign: TextAlign.start,),
            ],
          ),
        ),
        ListTile(
          leading: SvgPicture.asset(knotification,colorFilter: ColorFilter.mode(kprimaryColor, BlendMode.srcIn),),
          title: Text('Pop-up Notification', style: TextFonts.kdarkgrayfont14,),
          trailing: Obx(()=>CustomSwitch(isOn: _notiController.notificationsEnabled.value, onToggle:(){
            _notiController.notificationsEnabled.value = !_notiController.notificationsEnabled.value;
            _notiController.toggleNotifications(_notiController.notificationsEnabled.value);
          } ),),
        )

      ]),
    );
  }
}
