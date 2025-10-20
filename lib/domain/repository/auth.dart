import 'package:app_canchitas_2025/data/models/signup_req_params.dart';
import 'package:dartz/dartz.dart';

// 📋 CONTRATO (Interface)
// Define QUÉ se puede hacer, no CÓMO
abstract class AuthRepository {
  Future<Either> signup(SignUpReqParams signUpReqParams);
}

// ROL: Define el contrato.
// La capa de dominio NO conoce los detalles de implementación.
// El corazón de tu aplicación
// La lógica de negocio pura.