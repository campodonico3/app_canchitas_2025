import 'package:app_canchitas_2025/data/models/signup_req_params.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepository {
  Future<Either> signup(SignUpReqParams signUpReqParams);

}