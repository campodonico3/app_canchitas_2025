import 'package:app_canchitas_2025/data/repository/auth.dart';
import 'package:app_canchitas_2025/data/source/auth_api_service.dart';
import 'package:app_canchitas_2025/data/source/auth_local_service.dart';
import 'package:app_canchitas_2025/domain/repository/auth.dart';
import 'package:app_canchitas_2025/domain/usecases/get_user.dart';
import 'package:app_canchitas_2025/domain/usecases/is_logged_in.dart';
import 'package:app_canchitas_2025/domain/usecases/signin.dart';
import 'package:app_canchitas_2025/domain/usecases/signup.dart';
import 'package:get_it/get_it.dart';

import 'core/network/dio_client.dart';
import 'domain/usecases/logout.dart';

final sl = GetIt.instance;

void setupServiceLocator() {
  sl.registerSingleton<DioClient>(DioClient());

  // Services
  sl.registerSingleton<AuthApiService>(AuthApiServiceImpl());
  sl.registerSingleton<AuthLocalService>(AuthLocalServiceImpl());

  // Repositories
  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl());

  // UseCases
  sl.registerSingleton<SignUpUseCase>(SignUpUseCase());
  sl.registerSingleton<IsLoggedInUseCase>(IsLoggedInUseCase());
  sl.registerSingleton<GetUserUseCase>(GetUserUseCase());
  sl.registerSingleton<LogoutUseCase>(LogoutUseCase());
  sl.registerSingleton<SignInUseCase>(SignInUseCase());
}
