import 'package:app_canchitas_2025/core/constants/api_urls.dart';
import 'package:app_canchitas_2025/core/network/dio_client.dart';
import 'package:app_canchitas_2025/service_locator.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/rendering.dart';

abstract class EstablishmentApiService {
  Future<Either> getEstablishment();
}

class EstablishmentApiServiceImpl implements EstablishmentApiService {
  @override
  Future<Either> getEstablishment() async {
    try {
      var response = await sl<DioClient>().get(ApiUrls.establishments);

      debugPrint('🟣 ✅ [API SERVICE ESTABLISHMENT] Response recibida');
      debugPrint('🟣 ✅ [API SERVICE ESTABLISHMENT] Status code: ${response.statusCode}');
      debugPrint('🟣 ✅ [API SERVICE ESTABLISHMENT] Response data: ${response.data['data']}');

      return Right(response);
    } on DioException catch (e) {
      debugPrint('🟣 ❌ [API SERVICE ESTABLISHMENT] DioException');
      return Left(
        e.response?.data['message'] ?? 'Error al obtener los establecimientos',
      );
    }
  }
}
