import 'package:equatable/equatable.dart';

/// Entity đại diện cho thông tin profile
class ProfileEntity extends Equatable {
  final String name;
  final String title;
  final String? avatarUrl;

  const ProfileEntity({
    required this.name,
    required this.title,
    this.avatarUrl,
  });

  @override
  List<Object?> get props => [name, title, avatarUrl];
}
