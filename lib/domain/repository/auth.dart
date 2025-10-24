import 'package:app_canchitas_2025/data/models/signup_req_params.dart';
import 'package:dartz/dartz.dart';

// 📋 CONTRATO -> Define QUÉ se puede hacer, no CÓMO
abstract class AuthRepository {
  Future<Either> signup(SignUpReqParams signUpReqParams);
  Future<bool> isLoggedIn(); // Know if the user is authenticated
  Future<Either> getUser();
  Future logout();
}
