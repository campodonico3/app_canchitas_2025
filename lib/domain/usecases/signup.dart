import 'package:app_canchitas_2025/data/models/signup_req_params.dart';
import 'package:app_canchitas_2025/domain/repository/auth.dart';
import 'package:dartz/dartz.dart';

import '../../core/usecase/usecase.dart';
import '../../service_locator.dart';

class SignUpUseCase implements UseCase<Either, SignUpReqParams> {
  @override
  Future<Either> call({SignUpReqParams? params}) async {
    return sl<AuthRepository>().signup(params!);
  }

}