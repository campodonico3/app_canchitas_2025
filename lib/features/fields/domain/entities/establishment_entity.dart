// Inicio -> Creación del Entity --> creamos establishment_model

class EstablishmentEntity {
  final int id;
  final String name;
  final String city;
  final String? phone;
  final String? description;
  final String? coverImage;
  final String? logo;
  final List<String> images;
  final double? latitude;
  final double? longitude;
  final String openTime;
  final String closeTime;
  final bool isActive;
  final DateTime createdAt;
  final DateTime updatedAt;

  EstablishmentEntity(
    this.coverImage,
    this.logo,
    this.images,
    this.openTime,
    this.phone,
    this.description,
    this.latitude,
    this.longitude,
    this.closeTime, {
    required this.id,
    required this.name,
    required this.city,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
  });
}
