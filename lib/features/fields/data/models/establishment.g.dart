// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'establishment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EstablishmentsResponse _$EstablishmentsResponseFromJson(
  Map<String, dynamic> json,
) => EstablishmentsResponse(
  data: (json['data'] as List<dynamic>)
      .map((e) => EstablishmentModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$EstablishmentsResponseToJson(
  EstablishmentsResponse instance,
) => <String, dynamic>{'data': instance.data};

EstablishmentModel _$EstablishmentModelFromJson(Map<String, dynamic> json) =>
    EstablishmentModel(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      city: json['city'] as String,
      phone: json['phone'] as String?,
      description: json['description'] as String?,
      coverImage: json['coverImage'] as String?,
      logo: json['logo'] as String?,
      images:
          (json['images'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      openTime: json['openTime'] as String,
      closeTime: json['closeTime'] as String,
      isActive: json['isActive'] as bool,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$EstablishmentModelToJson(EstablishmentModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'city': instance.city,
      'phone': instance.phone,
      'description': instance.description,
      'coverImage': instance.coverImage,
      'logo': instance.logo,
      'images': instance.images,
      'latitude': instance.latitude,
      'openTime': instance.openTime,
      'closeTime': instance.closeTime,
      'longitude': instance.longitude,
      'isActive': instance.isActive,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
