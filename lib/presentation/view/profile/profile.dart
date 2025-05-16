import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:striky/core/constants/global_constants.dart';
import 'package:striky/presentation/cubits/profile/profile_cubit.dart';
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
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        if (state is ProfileSuccess) {
          print(state.profile.email);
          print(state.profile.age);
          print(state.profile.userName);
          print(state.profile.id);
          print(state.profile.weight);          print(state.profile.height);
          return Scaffold(
            backgroundColor: knormalwhite,
            appBar: CustomAppBar(
                title: 'Profile', onpressed1: () {}, onpressed2: () {}),
            body: SingleChildScrollView(
              child: Column(children: [
                CustomProfileTile(
                    img: state.profile.photo!,
                    name: state.profile.userName!,
                    program: state.profile.goal!),
                Row(children: [
                  ProfileDetailItem(
                      txt1: '${state.profile.height}CM', txt2: 'Height'),
                  ProfileDetailItem(
                      txt1: '${state.profile.weight}CM', txt2: 'Weight'),
                  ProfileDetailItem(
                      txt1: state.profile.age.toString(), txt2: 'Age'),
                ]),
                ProfileAccountContainer(),
                ProfileNotificationContainer(),
                ProfileOthersContainer(),
              ]),
            ),
          );
        } else if (state is ProfileFailure) {
          return Center(child: Text(state.errMsg));
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
