import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../entities/profile_entity.dart';
import '../repositories/profile_repository.dart';

/// UseCase lấy thông tin profile
class GetProfileUseCase {
  final ProfileRepository repository;

  GetProfileUseCase({required this.repository});

  Future<Either<Failure, ProfileEntity>> execute() async {
    return await repository.getProfile();
  }
}
