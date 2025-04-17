import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:striky/core/constants/container_decoration.dart';
import 'package:striky/core/constants/global_constants.dart';
import 'package:striky/core/constants/text_fonts.dart';
import 'package:striky/core/routes/go_route.dart';
import 'package:striky/core/services/noti_service.dart';
import 'package:striky/models/workout/general_workout_model.dart';
import 'package:striky/view/myPhotos/widgets/custom_purple_button.dart';
import 'package:striky/view/workOut/widgets/custom_divider.dart';
import 'package:striky/view/workOut/widgets/double_text.dart';
import 'package:striky/view/workOut/widgets/upper_part.dart';
import 'package:striky/view/workOut/widgets/workout_card.dart';
import 'package:striky/view/workOut/widgets/workout_info_card.dart';

class WorkOut extends StatelessWidget {
  const WorkOut({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              kprimaryColor,
              kcolor3,
              kgradiantColor1,
              kgradiantColor2,
            ],
          ),
        ),
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverToBoxAdapter(
                child: SizedBox(height: 250, child: UpperPart()),
              ),
            ];
          },
          body: Container(
            decoration: ContainerDecoration.kContainerRoundedDecoration,
            child: Column(
              children: [
                CustomDivider(),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: CustomScrollView(
                      slivers: [
                        SliverToBoxAdapter(
                          child: Container(
                            margin: EdgeInsets.symmetric(vertical: 15),
                            padding: EdgeInsets.all(10),
                            height: 90,
                            width: double.infinity,
                            decoration:
                                ContainerDecoration.kContainerwaterDecoration,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Daily Workout Schedule',
                                  style: TextFonts.kdarkboldfont14,
                                ),
                                CustomPurpleButton(
                                  text: 'Check',
                                  onpressed: () {
                                    GoRouter.of(context).push(AppRoutes.schedulescreen);
                                  },
                                )
                              ],
                            ),
                          ),
                        ),
                        SliverToBoxAdapter(
                          child: DoubleText(text1: 'Upcoming Workout', text2: 'See All'),
                        ),
                        SliverToBoxAdapter(
                          child: Column(
                            children: [
                              WorkoutCard(
                                title: 'Fullbody Workout',
                                time: 'June 05, 02:00pm',
                                pic: kcompleteprofile,
                              ),
                              WorkoutCard(
                                title: 'Upperbody Workout',
                                time: 'June 05, 02:00pm',
                                pic: kcompleteprofile,
                              ),
                            ],
                          ),
                        ),
                        SliverToBoxAdapter(
                          child: DoubleText(text1: 'What Do You Want to Train', text2: ''),
                        ),
                        SliverToBoxAdapter(
                          child: Column(
                            children: [
                              WorkoutInfoCard(
                                generalWorkoutModel: GeneralWorkoutModel(image :kfullbodyimg, title: 'Fullbody Workout', exerciseNo: '12', duration: '32', onTapped: (){
                                  GoRouter.of(context).push(AppRoutes.exerciseworkOut);
                                }),
                              ),
                              WorkoutInfoCard(
                              generalWorkoutModel: GeneralWorkoutModel(image :klowbodyimg, title: 'Lowbody Workout', exerciseNo: '10', duration: '24', onTapped: (){
                                GoRouter.of(context).push(AppRoutes.exerciseworkOut);
                              }),
                              ),
                              WorkoutInfoCard(
                                generalWorkoutModel: GeneralWorkoutModel(image :kabimg, title: 'AB Workout', exerciseNo: '10', duration: '24', onTapped: (){
                                  GoRouter.of(context).push(AppRoutes.exerciseworkOut);
                                }),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
