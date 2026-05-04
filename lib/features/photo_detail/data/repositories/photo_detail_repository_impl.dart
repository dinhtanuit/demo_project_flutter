import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../domain/entities/photo_detail_entity.dart';
import '../../domain/repositories/photo_detail_repository.dart';
import '../datasources/photo_detail_local_datasource.dart';

class PhotoDetailRepositoryImpl implements PhotoDetailRepository {
  final PhotoDetailLocalDataSource localDataSource;

  PhotoDetailRepositoryImpl({required this.localDataSource});

  @override
  Future<Either<Failure, PhotoDetailEntity>> getPhotoDetail() async {
    try {
      final model = await localDataSource.getPhotoDetail();
      return Right(model.toEntity());
    } on Exception catch (e) {
      return Left(ServerFailure('Không thể tải chi tiết: $e'));
    } catch (e) {
      return Left(ServerFailure('Lỗi không xác định: $e'));
    }
  }
}
