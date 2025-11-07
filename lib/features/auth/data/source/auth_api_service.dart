import 'package:app_canchitas_2025/core/constants/api_urls.dart';
import 'package:app_canchitas_2025/core/network/dio_client.dart';
import 'package:app_canchitas_2025/features/auth/data/models/signin_req_params.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../service_locator.dart';
import '../models/signup_req_params.dart';

// COMUNICACIÓN API
abstract class AuthApiService {
  Future<Either> signup(SignUpReqParams signUpReqParams);
  Future<Either> getUser();
  Future<Either> signin(SignInReqParams signInReqParams);
}

class AuthApiServiceImpl implements AuthApiService {
  @override
  Future<Either> signup(SignUpReqParams signUpReqParams) async {
    debugPrint('🟣 [API SERVICE] signup llamado');
    debugPrint('🟣 [API SERVICE] Params: ${signUpReqParams.toMap()}');

    try {
      var response = await sl<DioClient>().post(
        ApiUrls.register,
        data: signUpReqParams.toMap(),
      );

      debugPrint('🟣 ✅ [API SERVICE] Response recibida');
      debugPrint('🟣 ✅ [API SERVICE] Response type: ${response.runtimeType}');
      debugPrint('🟣 ✅ [API SERVICE] Status code: ${response.statusCode}');
      debugPrint('🟣 ✅ [API SERVICE] Response data: ${response.data}');

      return Right(response);
      
    } on DioException catch (e) {
      
      debugPrint('🟣 ❌ [API SERVICE] DioException');
      debugPrint('🟣 ❌ [API SERVICE] Error: ${e.response?.data}');

      return Left(e.response!.data['message']);
    }
  }

  @override
  Future<Either> getUser() async {
    try {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      var token = sharedPreferences.getString('token');
      var response = await sl<DioClient>().get(
        ApiUrls.userProfile,
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );
      return Right(response);
    } on DioException catch (e) {
      return Left(e.response!.data['message']);
    }
  }
  
  @override
  Future<Either> signin(SignInReqParams signInReqParams) async {
    debugPrint('🟣 [API SERVICE LOGIN] signIn llamado');
    debugPrint('🟣 [API SERVICE LOGIN] Params: ${signInReqParams.toMap()}');

    try {
      var response = await sl<DioClient>().post(
        ApiUrls.login,
        data: signInReqParams.toMap(),
      );

      debugPrint('🟣 ✅ [API SERVICE LOGIN] Response recibida');
      debugPrint('🟣 ✅ [API SERVICE LOGIN] Response type: ${response.runtimeType}');
      debugPrint('🟣 ✅ [API SERVICE LOGIN] Status code: ${response.statusCode}');
      debugPrint('🟣 ✅ [API SERVICE LOGIN] Response data: ${response.data}');

      return Right(response);
      
    } on DioException catch (e) {
      
      debugPrint('🟣 ❌ [API SERVICE LOGIN] DioException');
      debugPrint('🟣 ❌ [API SERVICE LOGIN] Error: ${e.response?.data}');

      return Left(e.response!.data['message']);
    }
  }
}
