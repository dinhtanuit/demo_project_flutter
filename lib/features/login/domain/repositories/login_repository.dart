import 'package:dartz/dartz.dart';
import '../entities/login_entity.dart';
import '../../../../core/errors/failures.dart';

/// Repository interface cho authentication
abstract class LoginRepository {
  /// Login với email và password
  Future<Either<Failure, LoginEntity>> login({
    required String email,
    required String password,
  });

  /// Logout user
  Future<Either<Failure, void>> logout();

  /// Check nếu user đã login (có token saved)
  Future<Either<Failure, bool>> isLoggedIn();

  /// Lấy user hiện tại từ local storage
  Future<Either<Failure, LoginEntity?>> getCurrentUser();
}
