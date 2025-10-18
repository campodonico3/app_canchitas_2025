import 'package:dartz/dartz.dart';

import '../../domain/repository/auth.dart';
import '../models/signup_req_params.dart';

class AuthRepositoryImpl implements AuthRepository {


  @override
  Future<Either> signup(SignUpReqParams signUpReqParams) {
    // Logic para las solicitudes http
    throw UnimplementedError();
  }
}