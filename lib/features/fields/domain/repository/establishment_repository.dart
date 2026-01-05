import 'package:app_canchitas_2025/features/fields/domain/entities/establishment_entity.dart';
import 'package:dartz/dartz.dart';

abstract class EstablishmentRepository {
  Future<Either<String, List<EstablishmentEntity>>> getEstablishment();
}