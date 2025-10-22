import 'package:app_canchitas_2025/data/source/auth_api_service.dart';
import 'package:app_canchitas_2025/data/source/auth_local_service.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../domain/repository/auth.dart';
import '../../service_locator.dart';
import '../models/signup_req_params.dart';

// IMPLEMENTACIÓN DEL CONTRATO
class AuthRepositoryImpl implements AuthRepository {
  @override
  Future<Either> signup(SignUpReqParams signUpReqParams) async {
    Either result = await sl<AuthApiService>().signup(signUpReqParams);
    return result.fold(
      (error) {
        return Left(error);
      },
      (data) async {
        Response response = data;
        SharedPreferences sharedPreferences =
            await SharedPreferences.getInstance();
        sharedPreferences.setString('token', response.data['token']);
        return Right(response);
      },
    );
  }

  @override
  Future<bool> isLoggedIn() async{
    return await sl<AuthLocalService>().isLoggedIn();
  }
}
