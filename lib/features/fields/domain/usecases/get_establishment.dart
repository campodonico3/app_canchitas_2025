import 'package:app_canchitas_2025/core/usecase/usecase.dart';
import 'package:app_canchitas_2025/features/fields/domain/entities/establishment_entity.dart';
import 'package:app_canchitas_2025/features/fields/domain/repository/establishment_repository.dart';
import 'package:app_canchitas_2025/service_locator.dart';
import 'package:dartz/dartz.dart';

class GetEstablishmentUseCase implements UseCase<Either, dynamic> {
  @override
  Future<Either<String, List<EstablishmentEntity>>> call({params}) {
    return sl<EstablishmentRepository>().getEstablishment();
  }
}