import 'package:app_canchitas_2025/features/fields/domain/entities/establishment_entity.dart';

abstract class EstablishmentsDisplayState {}

class EstablishmentsLoading extends EstablishmentsDisplayState {}

class EstablishmentsLoaded extends EstablishmentsDisplayState {
  final List<EstablishmentEntity> establishments;
  EstablishmentsLoaded({required this.establishments});
}

class LoadEstablishmentFailure extends EstablishmentsDisplayState {
  final String errorMessage;
  LoadEstablishmentFailure({required this.errorMessage});
}
