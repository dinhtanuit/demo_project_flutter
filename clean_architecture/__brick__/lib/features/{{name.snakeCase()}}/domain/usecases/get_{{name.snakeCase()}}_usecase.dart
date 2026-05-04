import 'package:dartz/dartz.dart';
import '../entities/{{name.snakeCase()}}_entity.dart';
import '../repositories/{{name.snakeCase()}}_repository.dart';
import '../../../../core/errors/failures.dart';

class Get{{name.pascalCase()}}UseCase {
  final {{name.pascalCase()}}Repository repository;

  Get{{name.pascalCase()}}UseCase({required this.repository});

  Future<Either<Failure, {{name.pascalCase()}}Entity>> execute() async {
    return await repository.get{{name.pascalCase()}}();
  }
}
