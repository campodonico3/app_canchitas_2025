import 'package:app_canchitas_2025/domain/entities/signin_params.dart';
import 'package:app_canchitas_2025/domain/entities/signup_params.dart';
import 'package:dartz/dartz.dart';

// 📋 CONTRATO -> Define QUÉ se puede hacer, no CÓMO
abstract class AuthRepository {
  // Future<Either> signup(SignUpReqParams signUpReqParams);
  Future<Either> signup(SignupParams params);
  Future<Either> signin(SignInParams params);

  Future<bool> isLoggedIn(); // Know if the user is authenticated
  Future<Either> getUser();
  Future logout();
}