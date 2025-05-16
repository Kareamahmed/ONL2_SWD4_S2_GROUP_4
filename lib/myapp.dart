import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:striky/core/routes/go_route.dart';
import 'package:striky/core/services/service_locator/service_locator.dart';
import 'package:striky/core/themes/light_theme.dart';
import 'package:striky/data/repos/workout/general_workout/general_workout_repo_IMPl.dart';
import 'package:striky/presentation/cubits/Exercises/gen/generalexercise_cubit.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) {
            final generalExerciseCubit =
                GeneralexerciseCubit(getIt.get<GeneralWorkoutRepoImpl>());
            generalExerciseCubit.getGeneralWorkout(); // trigger fetch
            return generalExerciseCubit;
          },
        ),
      ],
      child: MaterialApp.router(
        theme: lighttheme,
        routerConfig: AppRoutes.router,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
