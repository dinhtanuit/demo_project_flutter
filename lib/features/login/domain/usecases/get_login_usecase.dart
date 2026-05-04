import 'package:dartz/dartz.dart';
import '../entities/login_entity.dart';
import '../repositories/login_repository.dart';
import '../../../../core/errors/failures.dart';

/// UseCase xử lý business logic login
class LoginUseCase {
  final LoginRepository repository;

  LoginUseCase({required this.repository});

  /// Execute login với validation
  Future<Either<Failure, LoginEntity>> execute({
    required String email,
    required String password,
  }) async {
    // Validation logic
    if (email.isEmpty) {
      return const Left(ServerFailure('Email không được để trống'));
    }

    if (!_isValidEmail(email)) {
      return const Left(ServerFailure('Email không hợp lệ'));
    }

    if (password.isEmpty) {
      return const Left(ServerFailure('Password không được để trống'));
    }

    if (password.length < 6) {
      return const Left(ServerFailure('Password phải có ít nhất 6 ký tự'));
    }

    // Call repository
    return await repository.login(email: email, password: password);
  }

  bool _isValidEmail(String email) {
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
  }
}
