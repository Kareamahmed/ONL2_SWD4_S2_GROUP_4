import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:striky/core/services/service_locator/service_locator.dart';
import 'package:striky/data/repos/Auth/auth_repo_IMPL.dart';
import 'package:striky/data/repos/home/home_repo_IMPL.dart';
import 'package:striky/data/repos/workout/general_workout/general_workout_repo_IMPl.dart';
import 'package:striky/presentation/cubits/Exercises/exercise/excercisescubit_cubit.dart';
import 'package:striky/presentation/cubits/auth/Pic_cubit/pic_cubit_cubit.dart';
import 'package:striky/presentation/cubits/auth/login_cubit/login_cubit.dart';
import 'package:striky/presentation/cubits/auth/register1/register1_cubit.dart';
import 'package:striky/presentation/cubits/auth/setInfo/setinfo_cubit.dart';
import 'package:striky/presentation/cubits/profile/profile_cubit.dart';
import 'package:striky/presentation/view/home/fitover_screen/widgets/fitover_loader.dart';
import 'package:striky/presentation/view/auth/congrats_screen/congrats_screen.dart';
import 'package:striky/presentation/view/auth/create_account/create_account.dart';
import 'package:striky/presentation/view/auth/login/login_page.dart';
import 'package:striky/presentation/view/auth/forget_password_screen/foget_password_screen.dart';
import 'package:striky/presentation/view/auth/otp/otp_page.dart';
import 'package:striky/presentation/view/auth/reset_password/reset_password.dart';
import 'package:striky/presentation/view/intro_pages/set_goal/set_goal.dart';
import 'package:striky/presentation/view/auth/set_info/set_info.dart';
import 'package:striky/presentation/view/intro_pages/upload_pic/apload_pic.dart';
import 'package:striky/presentation/view/intro_pages/on_boarding_pages/on_boarding_pages.dart';
import 'package:striky/presentation/view/myPhotos/camera_screen/camera_screen.dart';
import 'package:striky/presentation/view/navigation_buttom_bar/navigation_buttom_bar.dart';
import 'package:striky/presentation/view/test/notiDemo.dart';
import 'package:striky/presentation/view/workOut/pages/exercise_page.dart';
import 'package:striky/presentation/view/workOut/pages/exercise_work_out.dart';
import 'package:striky/presentation/view/workOut/pages/schedule/pages/add_schedule.dart';
import 'package:striky/presentation/view/workOut/pages/schedule/pages/schedule_screen.dart';
import 'package:striky/presentation/view/workOut/widgets/local_excercise_widget.dart';

class AppRoutes {
  static const String login = "/login";
  static const String onboardingScreen = "/onboardingScreen";
  static const String createaccount = "/createaccount";
  static const String forgetPasswordScreen = "/forgetPasswordScreen";
  static const String otpPage = "/otpPage";
  static const String resetPassword = "/resetPassword";
  static const String congratsScreen = "/congratsScreen";
  static const String setInfo = "/setInfo";
  static const String setGoal = "/setGoal";
  static const String uploadPic = "/uploadPic";
  static const String navigationButtomBarPage = "/navigationButtomBarPage";
  static const String camerascreen = "/camerascreen";
  static const String exerciseworkOut = "/exerciseworkOut";
  static const String exercisepage = "/exercisepage";
  static const String schedulescreen = "/schedulescreen";
  static const String addSchedule = "/addSchedule";
  static const String fitoverviewloader = "/fitoverviewloader";
  static const String notificationdemopage = "/notificationdemopage";

  static final GoRouter router = GoRouter(
    initialLocation: navigationButtomBarPage,
    routes: [
      GoRoute(
        path: onboardingScreen,
        builder: (context, state) => const OnboardingScreen(),
      ),
      GoRoute(
        path: login,
        builder: (context, state) => BlocProvider(
          create: (context) => LoginCubit(getIt.get<AuthRepoImpl>()),
          child: LoginPage(),
        ),
      ),
      GoRoute(
        path: createaccount,
        builder: (context, state) => BlocProvider(
          create: (context) => Register1Cubit(getIt.get<AuthRepoImpl>()),
          child: CreateAccount(),
        ),
      ),
      GoRoute(
        path: forgetPasswordScreen,
        builder: (context, state) => const ForgetPasswordScreen(),
      ),
      GoRoute(
        path: otpPage,
        builder: (context, state) => const OtpPage(),
      ),
      GoRoute(
        path: resetPassword,
        builder: (context, state) => const ResetPassword(),
      ),
      GoRoute(
        path: congratsScreen,
        builder: (context, state) => const CongratsScreen(),
      ),
      GoRoute(
        path: setInfo,
        builder: (context, state) => BlocProvider(
          create: (context) => SetinfoCubit(getIt.get<AuthRepoImpl>()),
          child: SetInfo(goal: state.extra as String),
        ),
      ),
      GoRoute(
        path: setGoal,
        builder: (context, state) => SetGoal(),
      ),
      GoRoute(
        path: uploadPic,
        builder: (context, state) => BlocProvider(
          create: (context) => PicCubitCubit(getIt.get<AuthRepoImpl>()),
          child: UploadPic(),
        ),
      ),
      GoRoute(
        path: navigationButtomBarPage,
        builder: (context, state) => BlocProvider(
          create: (context) => ProfileCubit(getIt.get<HomeRepoImpl>()),
          child: NavigationButtomBarPage(),
        ),
      ),
      GoRoute(
        path: camerascreen,
        builder: (context, state) => CameraScreen(),
      ),
      GoRoute(
        path: exerciseworkOut,
        builder: (context, state) => BlocProvider(
          create: (context) => ExcercisescubitCubit(getIt.get<GeneralWorkoutRepoImpl>())..getLOcalExcercises(),
          child: ExerciseWorkOut(bodyPart: state.extra as String),
        ),
      ),
      GoRoute(
        path: exercisepage,
        builder: (context, state) => ExercisePage(id: state.extra as String),
      ),
      GoRoute(
        path: schedulescreen,
        builder: (context, state) => ScheduleScreen(),
      ),
      GoRoute(
        path: addSchedule,
        builder: (context, state) => AddSchedule(),
      ),
      GoRoute(
          path: fitoverviewloader,
          builder: (context, state) => FitOverviewLoader()),
      GoRoute(
          path: notificationdemopage,
          builder: (context, state) => NotificationDemoPage()),
    ],
  );
}
