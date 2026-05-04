import 'package:dartz/dartz.dart';
import '../errors/failures.dart';

/// Base UseCase interface - không có params
abstract class UseCase<T> {
  Future<Either<Failure, T>> execute();
}

/// Base UseCase interface - có params
abstract class UseCaseWithParams<T, Params> {
  Future<Either<Failure, T>> execute(Params params);
}

/// Dùng khi UseCase không cần params
class NoParams {
  const NoParams();
}
