import '../../domain/entities/profile_entity.dart';

/// Model cho profile data
class ProfileModel {
  final String name;
  final String title;
  final String? avatarUrl;

  ProfileModel({
    required this.name,
    required this.title,
    this.avatarUrl,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      name: json['name'] as String,
      title: json['title'] as String,
      avatarUrl: json['avatar_url'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'title': title,
      'avatar_url': avatarUrl,
    };
  }

  ProfileEntity toEntity() {
    return ProfileEntity(
      name: name,
      title: title,
      avatarUrl: avatarUrl,
    );
  }
}
