import 'package:flutter/material.dart';
import 'package:striky/core/constants/global_constants.dart';
import 'package:striky/presentation/view/myPhotos/widgets/custom_appbar.dart';
import 'package:striky/presentation/view/profile/widgets/custom_profile_tile.dart';
import 'package:striky/presentation/view/profile/widgets/profile_account_container.dart';
import 'package:striky/presentation/view/profile/widgets/profile_detial_item.dart';
import 'package:striky/presentation/view/profile/widgets/profile_notification_container.dart';
import 'package:striky/presentation/view/profile/widgets/profile_others_container.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: knormalwhite,
      appBar:
          CustomAppBar(title: 'Profile', onpressed1: () {}, onpressed2: () {}),
      body: SingleChildScrollView(
        child: Column(children: [
          CustomProfileTile(
              img: kprofile, name: 'Amira', program: 'Lose a Fat Program'),
          Row(children: [
            ProfileDetailItem(txt1: '180CM', txt2: 'Height'),
            ProfileDetailItem(txt1: '180CM', txt2: 'Height'),
            ProfileDetailItem(txt1: '180CM', txt2: 'Height'),
          ]),
          ProfileAccountContainer(),
          ProfileNotificationContainer(),
          ProfileOthersContainer(),
        ]),
      ),
    );
  }
}
