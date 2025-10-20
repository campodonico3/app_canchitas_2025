import 'package:app_canchitas_2025/data/models/signup_req_params.dart';
import 'package:app_canchitas_2025/domain/repository/auth.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';

import '../../core/usecase/usecase.dart';
import '../../service_locator.dart';

// ROL: Caso de uso específico. Contiene la lógica de negocio (en este caso simple, solo delega).

class SignUpUseCase implements UseCase<Either, SignUpReqParams> {
  @override
  Future<Either> call({SignUpReqParams? params}) async {

    debugPrint('🎯 [USE CASE] SignUpUseCase llamado');
    debugPrint('📦 [USE CASE] Params recibidos: ${params?.toMap()}');
    debugPrint('➡️  [USE CASE] Delegando al Repository...\n');

    // Delegar al repository
    final result = await sl<AuthRepository>().signup(params!);

    debugPrint('⬅️  [USE CASE] Respuesta recibida del Repository');

    return result;
  }
}