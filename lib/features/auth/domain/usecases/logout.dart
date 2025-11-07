import 'package:dartz/dartz.dart';

import '../../../../core/usecase/usecase.dart';
import '../../../../service_locator.dart';
import '../repository/auth.dart';

class LogoutUseCase implements UseCase<dynamic, dynamic> {
  @override
  Future call({dynamic params}) async {
    try {
      await sl<AuthRepository>().logout();
      return Right('Logout Exitoso');
    } catch (e) {
      return Left('Error al hacer logout: $e');
    }
  }
}
