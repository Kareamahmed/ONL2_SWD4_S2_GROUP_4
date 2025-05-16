import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:striky/core/constants/container_decoration.dart';
import 'package:striky/core/constants/global_constants.dart';
import 'package:striky/core/constants/text_fonts.dart';
import 'package:striky/core/routes/go_route.dart';
import 'package:striky/data/models/workout/general_exercise_model/general_exercise_model.dart';
import 'package:striky/data/models/workout/general_workout_model.dart';
import 'package:striky/presentation/cubits/Exercises/gen/generalexercise_cubit.dart';
import 'package:striky/presentation/view/myPhotos/widgets/custom_purple_button.dart';
import 'package:striky/presentation/view/workOut/widgets/custom_divider.dart';
import 'package:striky/presentation/view/workOut/widgets/double_text.dart';
import 'package:striky/presentation/view/workOut/widgets/upper_part.dart';
import 'package:striky/presentation/view/workOut/widgets/workout_card.dart';
import 'package:striky/presentation/view/workOut/widgets/workout_info_card.dart';

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
                                    GoRouter.of(context)
                                        .push(AppRoutes.schedulescreen);
                                  },
                                )
                              ],
                            ),
                          ),
                        ),
                        SliverToBoxAdapter(
                          child: DoubleText(
                              text1: 'Upcoming Workout', text2: 'See All'),
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
                          child: DoubleText(
                              text1: 'What Do You Want to Train', text2: ''),
                        ),
                       SliverToBoxAdapter(
                        child: WorkoutInfoCard(
                                       id: 1,
                                        name: 'Fullbody',
                                        countExercises: 10,
                                        photoUrl: kabimg,
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
