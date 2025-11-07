import 'package:app_canchitas_2025/features/auth/data/models/signin_req_params.dart';
import 'package:app_canchitas_2025/features/auth/data/source/auth_api_service.dart';
import 'package:app_canchitas_2025/features/auth/data/source/auth_local_service.dart';
import 'package:app_canchitas_2025/features/auth/domain/entities/signin_params.dart';
import 'package:app_canchitas_2025/features/auth/domain/entities/signup_params.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../domain/repository/auth.dart';
import '../../../../service_locator.dart';
import '../models/signup_req_params.dart';
import '../models/user.dart';

// IMPLEMENTACIÓN DEL CONTRATO
class AuthRepositoryImpl implements AuthRepository {
  @override
  Future<Either> signup(SignupParams params) async {
    debugPrint('🟢 [DATA REPOSITORY] signup llamado');
    debugPrint('🟢 [DATA REPOSITORY] Params: ${params.toString()}');

    // We convert de DOMAIN -> DATA
    final signUpReqParams = SignUpReqParams(
      email: params.email,
      password: params.password,
      username: params.username,
    );

    Either result = await sl<AuthApiService>().signup(signUpReqParams);

    debugPrint('🟢 [DATA REPOSITORY] Result recibido del API Service');
    debugPrint('🟢 [DATA REPOSITORY] Result type: ${result.runtimeType}');

    return result.fold(
      (error) {
        debugPrint('🟢 ❌ [DATA REPOSITORY] LEFT recibido');
        debugPrint('🟢 ❌ [DATA REPOSITORY] Error: $error');
        debugPrint('🟢 ❌ [DATA REPOSITORY] Error type: ${error.runtimeType}');
        return Left(error);
      },
      (data) async {
        try {
          Response response = data;

          debugPrint('🟢 ✅ [DATA REPOSITORY] RIGHT recibido');
          debugPrint('🟢 ✅ [DATA REPOSITORY] Data type: ${data.runtimeType}');
          debugPrint('🟢 ✅ [DATA REPOSITORY] Data: $data');

          SharedPreferences sharedPreferences =
              await SharedPreferences.getInstance();
          sharedPreferences.setString('token', response.data['token']);

          debugPrint('🟢 ✅ [DATA REPOSITORY] Token guardado exitosamente');

          return Right(response);
        } catch (e) {
          debugPrint('🟢 💥 [DATA REPOSITORY] Error en cast o guardado: $e');
          debugPrint('🟢 💥 [DATA REPOSITORY] Error type: ${e.runtimeType}');
          return Left('Error procesando respuesta: $e');
        }
      },
    );
  }

  @override
  Future<bool> isLoggedIn() async {
    return await sl<AuthLocalService>().isLoggedIn();
  }

  @override
  Future<Either> getUser() async {
    Either result = await sl<AuthApiService>().getUser();
    return result.fold(
      (error) {
        return Left(error);
      },
      (data) {
        Response response = data;
        var userModel = UserModel.fromMap(response.data);
        var userEntity = userModel.toEntity();
        return Right(userEntity);
      },
    );
  }

  @override
  Future logout() async {
    return await sl<AuthLocalService>().logout();
  }

  @override
  Future<Either> signin(SignInParams params) async {
    debugPrint('🟢 [DATA REPOSITORY SIGNIN] signin llamado');
    debugPrint('🟢 [DATA REPOSITORY SIGNIN] Params: ${params.toString()}');

    final signInReqParams = SignInReqParams(
      email: params.email,
      password: params.password,
    );

    Either result = await sl<AuthApiService>().signin(signInReqParams);

    debugPrint('🟢 [DATA REPOSITORY SIGNIN] Result recibido del API Service');
    debugPrint(
      '🟢 [DATA REPOSITORY SIGNIN] Result type: ${result.runtimeType}',
    );

    return result.fold(
      (error) {
        debugPrint('🟢 ❌ [DATA REPOSITORY SIGNIN] LEFT recibido');
        debugPrint('🟢 ❌ [DATA REPOSITORY SIGNIN] Error: $error');
        debugPrint(
          '🟢 ❌ [DATA REPOSITORY SIGNIN] Error type: ${error.runtimeType}',
        );
        return Left(error);
      },
      (data) async {
        try {
          Response response = data;

          debugPrint('🟢 ✅ [DATA REPOSITORY SIGNIN] RIGHT recibido');
          debugPrint(
            '🟢 ✅ [DATA REPOSITORY SIGNIN] Data type: ${data.runtimeType}',
          );
          debugPrint('🟢 ✅ [DATA REPOSITORY SIGNIN] Data: $data');

          SharedPreferences sharedPreferences =
              await SharedPreferences.getInstance();
          sharedPreferences.setString('token', response.data['token']);

          debugPrint(
            '🟢 ✅ [DATA REPOSITORY SIGNIN] Token guardado exitosamente',
          );

          return Right(response);
        } catch (e) {
          debugPrint(
            '🟢 💥 [DATA REPOSITORY SIGNIN] Error en cast o guardado: $e',
          );
          debugPrint(
            '🟢 💥 [DATA REPOSITORY SIGNIN] Error type: ${e.runtimeType}',
          );
          return Left('Error procesando respuesta: $e');
        }
      },
    );
  }
}
