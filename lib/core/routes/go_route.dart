import 'package:go_router/go_router.dart';
import 'package:striky/presentation/view/home/fitover_screen/widgets/fitover_loader.dart';
import 'package:striky/presentation/view/auth/congrats_screen/congrats_screen.dart';
import 'package:striky/presentation/view/auth/create_account/create_account.dart';
import 'package:striky/presentation/view/auth/login/login_page.dart';
import 'package:striky/presentation/view/auth/forget_password_screen/foget_password_screen.dart';
import 'package:striky/presentation/view/auth/otp/otp_page.dart';
import 'package:striky/presentation/view/auth/reset_password/reset_password.dart';
import 'package:striky/presentation/view/home/fitover_screen/fit_over_screen.dart';
import 'package:striky/presentation/view/intro_pages/set_goal/set_goal.dart';
import 'package:striky/presentation/view/auth/set_info/set_info.dart';
import 'package:striky/presentation/view/intro_pages/upload_pic/apload_pic.dart';
import 'package:striky/presentation/view/intro_pages/on_boarding_pages/on_boarding_pages.dart';
import 'package:striky/presentation/view/myPhotos/camera_screen/camera_screen.dart';
import 'package:striky/presentation/view/navigation_buttom_bar/navigation_buttom_bar.dart';
import 'package:striky/presentation/view/workOut/pages/exercise_page.dart';
import 'package:striky/presentation/view/workOut/pages/exercise_work_out.dart';
import 'package:striky/presentation/view/workOut/pages/schedule/pages/add_schedule.dart';
import 'package:striky/presentation/view/workOut/pages/schedule/pages/schedule_screen.dart';

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

  static final GoRouter router = GoRouter(
    initialLocation: navigationButtomBarPage,
    routes: [
      GoRoute(
        path: onboardingScreen,
        builder: (context, state) => const OnboardingScreen(),
      ),
      GoRoute(
        path: login,
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: createaccount,
        builder: (context, state) => const CreateAccount(),
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
        builder: (context, state) => SetInfo(),
      ),
      GoRoute(
        path: setGoal,
        builder: (context, state) => SetGoal(),
      ),
      GoRoute(
        path: uploadPic,
        builder: (context, state) => UploadPic(),
      ),
      GoRoute(
        path: navigationButtomBarPage,
        builder: (context, state) => NavigationButtomBarPage(),
      ),
      GoRoute(
        path: camerascreen,
        builder: (context, state) => CameraScreen(),
      ),
      GoRoute(
        path: exerciseworkOut,
        builder: (context, state) => ExerciseWorkOut(),
      ),
      GoRoute(
        path: exercisepage,
        builder: (context, state) => ExercisePage(),
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
    ],
  );
}
