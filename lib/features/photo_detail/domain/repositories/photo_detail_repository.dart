import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../entities/photo_detail_entity.dart';

/// Repository interface cho Photo Detail feature
abstract class PhotoDetailRepository {
  Future<Either<Failure, PhotoDetailEntity>> getPhotoDetail();
}
