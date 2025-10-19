import 'package:app_canchitas_2025/data/repository/auth.dart';
import 'package:app_canchitas_2025/data/source/auth_api_service.dart';
import 'package:app_canchitas_2025/domain/repository/auth.dart';
import 'package:app_canchitas_2025/domain/usecases/signup.dart';
import 'package:get_it/get_it.dart';

import 'core/network/dio_client.dart';

final sl = GetIt.instance;

void setupServiceLocator() {
  sl.registerSingleton<DioClient>(DioClient());

  // Services
  sl.registerSingleton<AuthApiService>(
    AuthApiServiceImpl()
  );

  // Repositories
  sl.registerSingleton<AuthRepository>(
    AuthRepositoryImpl()
  );

  // UseCases
  sl.registerSingleton<SignUpUseCase>(
    SignUpUseCase()
  );
}