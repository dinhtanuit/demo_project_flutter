import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../entities/profile_entity.dart';

/// Repository interface cho Profile feature
abstract class ProfileRepository {
  Future<Either<Failure, ProfileEntity>> getProfile();
}
