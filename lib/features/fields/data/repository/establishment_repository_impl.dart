
import 'package:app_canchitas_2025/features/fields/data/models/establishment.dart';
import 'package:app_canchitas_2025/features/fields/data/source/establishment_api_service.dart';
import 'package:app_canchitas_2025/features/fields/domain/entities/establishment_entity.dart';
import 'package:app_canchitas_2025/features/fields/domain/repository/establishment_repository.dart';
import 'package:app_canchitas_2025/service_locator.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class EstablishmentRepositoryImpl extends EstablishmentRepository{
  @override
  Future<Either<String, List<EstablishmentEntity>>> getEstablishment() async {
    Either result = await sl<EstablishmentApiService>().getEstablishment();
    return result.fold(
      (error) {
        return Left(error);
      },
      (data) {
        Response response = data;
        debugPrint('🟢 [DATA REPOSITORY Establishment sin formatear] - ${response.data['data']}');
        var establishmentsResponse = EstablishmentsResponse.fromJson(response.data);
        debugPrint('🟢 [DATA REPOSITORY] - ${establishmentsResponse.data.length} establecimientos parseados');
        debugPrint('🟢 [DATA REPOSITORY Establishment] - $establishmentsResponse');
        
        // Convertimos todos los modelos a entidades
        var establishmentEntities = establishmentsResponse.data.map((model)=>model.toEntity()).toList();
        
        debugPrint('🟢 [DATA REPOSITORY Establishments] - ${establishmentEntities.length} entidades creadas');

        return Right(establishmentEntities);
      }
    );
  }
  
}