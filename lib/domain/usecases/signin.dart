
import 'package:app_canchitas_2025/domain/entities/signin_params.dart';
import 'package:app_canchitas_2025/domain/repository/auth.dart';
import 'package:app_canchitas_2025/service_locator.dart';
import 'package:dartz/dartz.dart';

import '../../core/usecase/usecase.dart';

class SignInUseCase implements UseCase<Either, SignInParams>{
  @override
  Future<Either> call({SignInParams ? params}) {
    return sl<AuthRepository>().signin(params!);
  }

}