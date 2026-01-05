import 'package:app_canchitas_2025/features/fields/domain/entities/establishment_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'establishment.g.dart';

// Modelo para la respuesta completa del API
@JsonSerializable()
class EstablishmentsResponse {
  final List<EstablishmentModel> data;

  EstablishmentsResponse({required this.data});

  factory EstablishmentsResponse.fromJson(Map<String, dynamic> json) =>
      _$EstablishmentsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$EstablishmentsResponseToJson(this);
}

// Modelo individual de establecimiento
@JsonSerializable()
class EstablishmentModel {
  final int id;
  final String name;
  final String city;
  final String? phone;
  final String? description;
  final String? coverImage;
  final String? logo;
  @JsonKey(defaultValue: <String>[])
  final List<String> images;
  final double? latitude;
  final String openTime;
  final String closeTime;
  final double? longitude;
  final bool isActive;
  final DateTime createdAt;
  final DateTime updatedAt;

  EstablishmentModel({
    required this.id,
    required this.name,
    required this.city,
    this.phone,
    this.description,
    this.coverImage,
    this.logo,
    List<String>? images,
    this.latitude,
    this.longitude,
    required this.openTime,
    required this.closeTime,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
  }) : images = images ?? const [];

  factory EstablishmentModel.fromJson(Map<String, dynamic> json) =>
      _$EstablishmentModelFromJson(json);

  Map<String, dynamic> toJson() => _$EstablishmentModelToJson(this);
}

// Extensión para convertir el modelo a entidad
extension EstablishmentXModel on EstablishmentModel {
  EstablishmentEntity toEntity() {
    return EstablishmentEntity(
      coverImage,
      logo,
      images,
      openTime,
      phone,
      description,
      latitude,
      longitude,
      closeTime,
      id: id,
      name: name,
      city: city,
      isActive: isActive,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}
