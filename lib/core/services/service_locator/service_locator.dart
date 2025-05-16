import 'package:get_it/get_it.dart';
import 'package:striky/data/repos/Auth/auth_repo_IMPL.dart';
import 'package:striky/data/repos/home/home_repo_IMPL.dart';
import 'package:striky/data/repos/workout/general_workout/general_workout_repo_IMPl.dart';
import 'package:striky/data/source/API/api_service.dart';

final getIt = GetIt.instance;

void serviceLocator() {
  // Register ApiService as a lazy singleton
  getIt.registerLazySingleton(() => ApiService());

  // Register MovieRepoImpl as a lazy singleton
  getIt.registerLazySingleton(
      () => GeneralWorkoutRepoImpl(apiService: getIt.get<ApiService>()));
  getIt.registerLazySingleton(
      () => AuthRepoImpl(apiService: getIt.get<ApiService>()));
       getIt.registerLazySingleton(
      () => HomeRepoImpl(apiService: getIt.get<ApiService>()));
}
