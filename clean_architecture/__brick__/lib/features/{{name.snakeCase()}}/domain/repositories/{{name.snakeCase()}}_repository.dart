import 'package:dartz/dartz.dart';
import '../entities/{{name.snakeCase()}}_entity.dart';
import '../../../../core/errors/failures.dart';

abstract class {{name.pascalCase()}}Repository {
  Future<Either<Failure, {{name.pascalCase()}}Entity>> get{{name.pascalCase()}}();
  
  // Add more methods as needed
  // Future<Either<Failure, List<{{name.pascalCase()}}Entity>>> getAll{{name.pascalCase()}}s();
  // Future<Either<Failure, {{name.pascalCase()}}Entity>> create{{name.pascalCase()}}({{name.pascalCase()}}Entity entity);
  // Future<Either<Failure, {{name.pascalCase()}}Entity>> update{{name.pascalCase()}}({{name.pascalCase()}}Entity entity);
  // Future<Either<Failure, void>> delete{{name.pascalCase()}}(String id);
}
