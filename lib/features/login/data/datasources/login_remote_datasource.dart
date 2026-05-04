import '../models/login_model.dart';

abstract class LoginRemoteDataSource {
  Future<LoginModel> login(String email, String password);
  Future<void> logout(String token);
}

class LoginRemoteDataSourceImpl implements LoginRemoteDataSource {
  // TODO: Inject Dio khi có API thật
  // final Dio dio;
  // LoginRemoteDataSourceImpl({required this.dio});

  @override
  Future<LoginModel> login(String email, String password) async {
    try {
      // TODO: Thay bằng API call thật
      // final response = await dio.post(
      //   '/api/auth/login',
      //   data: {'email': email, 'password': password},
      // );
      // return LoginModel.fromJson(response.data);

      // Mock API call - simulate network delay
      await Future.delayed(const Duration(seconds: 2));

      // Simulate login validation
      if (email == 'demo@example.com' && password == '123456') {
        return LoginModel(
          userId: 'user_123',
          email: email,
          name: 'Demo User',
          token: 'mock_token_${DateTime.now().millisecondsSinceEpoch}',
          avatarUrl: 'https://i.pravatar.cc/150?u=$email',
          loginAt: DateTime.now(),
        );
      } else {
        throw Exception('Email hoặc password không đúng');
      }
    } catch (e) {
      throw Exception('Login failed: $e');
    }
  }

  @override
  Future<void> logout(String token) async {
    try {
      // TODO: Call API logout
      // await dio.post('/api/auth/logout', options: Options(
      //   headers: {'Authorization': 'Bearer $token'},
      // ));

      await Future.delayed(const Duration(milliseconds: 500));
    } catch (e) {
      throw Exception('Logout failed: $e');
    }
  }
}
