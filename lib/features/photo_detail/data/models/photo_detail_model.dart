import '../../domain/entities/photo_detail_entity.dart';

/// Model cho photo detail data
class PhotoDetailModel {
  final String name;
  final String location;
  final String description;
  final String imagePath;
  final int favoriteCount;
  final bool isFavorite;

  PhotoDetailModel({
    required this.name,
    required this.location,
    required this.description,
    required this.imagePath,
    this.favoriteCount = 41,
    this.isFavorite = false,
  });

  factory PhotoDetailModel.fromJson(Map<String, dynamic> json) {
    return PhotoDetailModel(
      name: json['name'] as String,
      location: json['location'] as String,
      description: json['description'] as String,
      imagePath: json['image_path'] as String,
      favoriteCount: json['favorite_count'] as int? ?? 41,
      isFavorite: json['is_favorite'] as bool? ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'location': location,
      'description': description,
      'image_path': imagePath,
      'favorite_count': favoriteCount,
      'is_favorite': isFavorite,
    };
  }

  PhotoDetailEntity toEntity() {
    return PhotoDetailEntity(
      name: name,
      location: location,
      description: description,
      imagePath: imagePath,
      favoriteCount: favoriteCount,
      isFavorite: isFavorite,
    );
  }
}
