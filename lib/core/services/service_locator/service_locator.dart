import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void serviceLocator() {
  // Register ApiService as a lazy singleton
  // getIt.registerLazySingleton(() => ApiService());

  // Register MovieRepoImpl as a lazy singleton
  // getIt.registerLazySingleton(() => MovieRepoImpl(apiService: getIt.get<ApiService>()));
}
