import 'package:app_canchitas_2025/core/constants/api_urls.dart';
import 'package:app_canchitas_2025/core/network/dio_client.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../service_locator.dart';
import '../models/signup_req_params.dart';

// COMUNICACIÓN API
abstract class AuthApiService {
  Future<Either> signup(SignUpReqParams signUpReqParams);
}

class AuthApiServiceImpl implements AuthApiService {
  @override
  Future<Either> signup(SignUpReqParams signUpReqParams) async {

    debugPrint('📡 [API SERVICE] AuthApiServiceImpl.signup() iniciado');
    debugPrint('🌐 [API SERVICE] URL: ${ApiUrls.register}');
    debugPrint('📦 [API SERVICE] Body: ${signUpReqParams.toMap()}');
    debugPrint('➡️  [API SERVICE] Ejecutando petición HTTP...\n');

    try {
      var response = await sl<DioClient>().post(
        ApiUrls.register,
        data: signUpReqParams.toMap(),
      );

      debugPrint('⬅️  [API SERVICE] Respuesta exitosa recibida');
      debugPrint('📄 [API SERVICE] Status: ${response.statusCode}');
      debugPrint('📄 [API SERVICE] Data: ${response.data}');
      debugPrint('✅ [API SERVICE] Retornando Right(response)\n');

      return Right(response.data);

    } on DioException catch (e) {
      return Left(e.response!.data['message']);
    }
  }
}
