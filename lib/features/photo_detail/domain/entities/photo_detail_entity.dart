import 'package:equatable/equatable.dart';

/// Entity đại diện cho chi tiết một bức ảnh/địa điểm
class PhotoDetailEntity extends Equatable {
  final String name;
  final String location;
  final String description;
  final String imagePath;
  final int favoriteCount;
  final bool isFavorite;

  const PhotoDetailEntity({
    required this.name,
    required this.location,
    required this.description,
    required this.imagePath,
    this.favoriteCount = 41,
    this.isFavorite = false,
  });

  PhotoDetailEntity copyWith({
    String? name,
    String? location,
    String? description,
    String? imagePath,
    int? favoriteCount,
    bool? isFavorite,
  }) {
    return PhotoDetailEntity(
      name: name ?? this.name,
      location: location ?? this.location,
      description: description ?? this.description,
      imagePath: imagePath ?? this.imagePath,
      favoriteCount: favoriteCount ?? this.favoriteCount,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }

  @override
  List<Object?> get props => [
        name,
        location,
        description,
        imagePath,
        favoriteCount,
        isFavorite,
      ];
}
