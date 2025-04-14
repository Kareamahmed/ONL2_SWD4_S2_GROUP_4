
import 'package:flutter/material.dart';
import 'package:striky/core/constants/container_decoration.dart';
import 'package:striky/core/constants/global_constants.dart';
import 'package:striky/core/constants/text_fonts.dart';
import 'package:striky/view/profile/widgets/profile_account_tile.dart';

class ProfileAccountContainer extends StatelessWidget {
  const ProfileAccountContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
              Text('Account', style: TextFonts.kdarkboldfont16.copyWith(fontSize: 20),textAlign: TextAlign.start,),
            ],
          ),
        ),
    
        ProfileAccountTile(title: 'Personal Data', leadingIcon: kprofile, onpress: (){}, ),
        ProfileAccountTile(title: 'Achievements', leadingIcon: kdecumenticon, onpress: (){}),
        ProfileAccountTile(title: 'Activity History', leadingIcon: kgraphicon, onpress: (){}),
        ProfileAccountTile(title: 'Workout Progress', leadingIcon: kcustomchart, onpress: (){}),
      ]),
    );
  }
  
}
