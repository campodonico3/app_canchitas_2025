import '../../domain/entities/user.dart';

class UserModel {
  final String email;
  final String username;

  UserModel({required this.email, required this.username});

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      email: map['email'] as String,
      username: map['username'] as String,
    );
  }
}

extension UserxModel on UserModel {
  UserEntity toEntity() {
    return UserEntity(
        email: email,
        username: username,
    );
  }
}
