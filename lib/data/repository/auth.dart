import 'package:app_canchitas_2025/data/source/auth_api_service.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';

import '../../domain/repository/auth.dart';
import '../../service_locator.dart';
import '../models/signup_req_params.dart';

// IMPLEMENTACIÓN DEL CONTRATO
class AuthRepositoryImpl implements AuthRepository {
  @override
  Future<Either> signup(SignUpReqParams signUpReqParams) async {

    debugPrint('🗄️  [REPOSITORY] AuthRepositoryImpl.signup() llamado');
    debugPrint('📦 [REPOSITORY] Params: ${signUpReqParams.toMap()}');
    debugPrint('➡️  [REPOSITORY] Llamando al API Service...\n');

    final result = await sl<AuthApiService>().signup(signUpReqParams);

    debugPrint('⬅️  [REPOSITORY] Respuesta del API Service recibida');

    return result;
  }
}

// ROL: Implementación concreta. Decide de dónde vienen los datos (API, DB local, caché, etc.).