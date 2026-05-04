import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../entities/photo_detail_entity.dart';
import '../repositories/photo_detail_repository.dart';

/// UseCase lấy chi tiết photo
class GetPhotoDetailUseCase {
  final PhotoDetailRepository repository;

  GetPhotoDetailUseCase({required this.repository});

  Future<Either<Failure, PhotoDetailEntity>> execute() async {
    return await repository.getPhotoDetail();
  }
}
