import '../../domain/entities/login_entity.dart';

/// Model nhận response từ API login
class LoginModel {
  final String userId;
  final String email;
  final String name;
  final String token;
  final String? avatarUrl;
  final DateTime loginAt;

  LoginModel({
    required this.userId,
    required this.email,
    required this.name,
    required this.token,
    this.avatarUrl,
    required this.loginAt,
  });

  /// From JSON - parse API response
  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      userId: json['user_id'] as String? ?? json['id'] as String,
      email: json['email'] as String,
      name: json['name'] as String,
      token: json['token'] as String? ?? json['access_token'] as String,
      avatarUrl: json['avatar_url'] as String?,
      loginAt: json['login_at'] != null
          ? DateTime.parse(json['login_at'] as String)
          : DateTime.now(),
    );
  }

  /// To JSON - send request
  Map<String, dynamic> toJson() {
    return {
      'user_id': userId,
      'email': email,
      'name': name,
      'token': token,
      'avatar_url': avatarUrl,
      'login_at': loginAt.toIso8601String(),
    };
  }

  /// To Entity - chuyển sang Domain layer
  LoginEntity toEntity() {
    return LoginEntity(
      userId: userId,
      email: email,
      name: name,
      token: token,
      avatarUrl: avatarUrl,
      loginAt: loginAt,
    );
  }

  /// From Entity
  factory LoginModel.fromEntity(LoginEntity entity) {
    return LoginModel(
      userId: entity.userId,
      email: entity.email,
      name: entity.name,
      token: entity.token,
      avatarUrl: entity.avatarUrl,
      loginAt: entity.loginAt,
    );
  }

  @override
  String toString() =>
      'LoginModel(userId: $userId, email: $email, name: $name)';
}
