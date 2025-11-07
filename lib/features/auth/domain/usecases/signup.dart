import 'package:app_canchitas_2025/features/auth/domain/repository/auth.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';

import '../../../../core/usecase/usecase.dart';
import '../../../../service_locator.dart';
import '../entities/signup_params.dart';

// ROL: Caso de uso específico. Contiene la lógica de negocio (en este caso simple, solo delega).

class SignUpUseCase implements UseCase<Either, SignupParams> {
  
  @override
  Future<Either> call({SignupParams? params}) async {
    debugPrint('🟡 [DOMAIN USECASE] SignUp llamado');
    debugPrint('🟡 [DOMAIN USECASE] Params: ${params?.toString()}');
    // Delegar al repository
    final result = await sl<AuthRepository>().signup(params!);

    debugPrint('🟡 [DOMAIN USECASE] Result recibido del Repository');
    debugPrint('🟡 [DOMAIN USECASE] Result type: ${result.runtimeType}');

    return result;
  }
}