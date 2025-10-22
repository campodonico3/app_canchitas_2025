import 'package:app_canchitas_2025/core/constants/api_urls.dart';
import 'package:app_canchitas_2025/core/network/dio_client.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../service_locator.dart';
import '../models/signup_req_params.dart';

// COMUNICACIÓN API
abstract class AuthApiService {
  Future<Either> signup(SignUpReqParams signUpReqParams);
}

class AuthApiServiceImpl implements AuthApiService {
  @override
  Future<Either> signup(SignUpReqParams signUpReqParams) async {
    try {
      var response = await sl<DioClient>().post(
        ApiUrls.register,
        data: signUpReqParams.toMap(),
      );
      return Right(response);
    } on DioException catch (e) {
      return Left(e.response!.data['message']);
    }
  }
}
