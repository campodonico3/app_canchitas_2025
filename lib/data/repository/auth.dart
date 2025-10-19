import 'package:app_canchitas_2025/data/source/auth_api_service.dart';
import 'package:dartz/dartz.dart';

import '../../domain/repository/auth.dart';
import '../../service_locator.dart';
import '../models/signup_req_params.dart';

// IMPLEMENTACIÓN DEL CONTRATO
class AuthRepositoryImpl implements AuthRepository {

  @override
  Future<Either> signup(SignUpReqParams signUpReqParams) async {
    return sl<AuthApiService>().signup(signUpReqParams);
  }
}