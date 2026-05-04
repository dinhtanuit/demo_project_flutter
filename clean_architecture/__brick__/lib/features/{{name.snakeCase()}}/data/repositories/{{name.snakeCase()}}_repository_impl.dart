import 'package:dartz/dartz.dart';
import '../../domain/entities/{{name.snakeCase()}}_entity.dart';
import '../../domain/repositories/{{name.snakeCase()}}_repository.dart';
import '../datasources/{{name.snakeCase()}}_remote_datasource.dart';
import '../../../../core/errors/failures.dart';

class {{name.pascalCase()}}RepositoryImpl implements {{name.pascalCase()}}Repository {
  final {{name.pascalCase()}}RemoteDataSource remoteDataSource;

  {{name.pascalCase()}}RepositoryImpl({
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, {{name.pascalCase()}}Entity>> get{{name.pascalCase()}}() async {
    try {
      final model = await remoteDataSource.get{{name.pascalCase()}}();
      final entity = model.toEntity();
      return Right(entity);
    } on Exception catch (e) {
      return Left(ServerFailure(e.toString()));
    } catch (e) {
      return Left(ServerFailure('Unexpected error: $e'));
    }
  }
}
