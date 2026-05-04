import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../domain/entities/profile_entity.dart';
import '../../domain/repositories/profile_repository.dart';
import '../datasources/profile_remote_datasource.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileRemoteDataSource remoteDataSource;

  ProfileRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, ProfileEntity>> getProfile() async {
    try {
      final model = await remoteDataSource.getProfile();
      return Right(model.toEntity());
    } on Exception catch (e) {
      return Left(ServerFailure('Không thể tải profile: $e'));
    } catch (e) {
      return Left(ServerFailure('Lỗi không xác định: $e'));
    }
  }
}
