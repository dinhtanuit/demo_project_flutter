import 'package:dartz/dartz.dart';
import '../../domain/entities/login_entity.dart';
import '../../domain/repositories/login_repository.dart';
import '../datasources/login_remote_datasource.dart';
import '../../../../core/errors/failures.dart';

class LoginRepositoryImpl implements LoginRepository {
  final LoginRemoteDataSource remoteDataSource;
  LoginEntity? _cachedUser;

  LoginRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, LoginEntity>> login({
    required String email,
    required String password,
  }) async {
    try {
      final model = await remoteDataSource.login(email, password);
      final entity = model.toEntity();

      // Cache user in memory
      _cachedUser = entity;

      // TODO: Save token to secure storage
      // await _secureStorage.write(key: 'auth_token', value: entity.token);

      return Right(entity);
    } on Exception catch (e) {
      return Left(ServerFailure(e.toString()));
    } catch (e) {
      return Left(ServerFailure('Lỗi không xác định: $e'));
    }
  }

  @override
  Future<Either<Failure, void>> logout() async {
    try {
      if (_cachedUser != null) {
        await remoteDataSource.logout(_cachedUser!.token);
      }
      _cachedUser = null;

      // TODO: Clear token from secure storage
      // await _secureStorage.delete(key: 'auth_token');

      return const Right(null);
    } on Exception catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> isLoggedIn() async {
    try {
      // TODO: Check token from secure storage
      // final token = await _secureStorage.read(key: 'auth_token');
      // return Right(token != null && token.isNotEmpty);

      return Right(_cachedUser != null);
    } catch (e) {
      return Left(CacheFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, LoginEntity?>> getCurrentUser() async {
    try {
      return Right(_cachedUser);
    } catch (e) {
      return Left(CacheFailure(e.toString()));
    }
  }
}
