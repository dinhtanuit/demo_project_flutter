import 'package:equatable/equatable.dart';

/// Entity đại diện cho User đã đăng nhập
class LoginEntity extends Equatable {
  final String userId;
  final String email;
  final String name;
  final String token;
  final String? avatarUrl;
  final DateTime loginAt;

  const LoginEntity({
    required this.userId,
    required this.email,
    required this.name,
    required this.token,
    this.avatarUrl,
    required this.loginAt,
  });

  @override
  List<Object?> get props => [userId, email, name, token, avatarUrl, loginAt];

  @override
  String toString() =>
      'LoginEntity(userId: $userId, email: $email, name: $name, token: $token)';
}
