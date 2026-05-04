import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../domain/usecases/get_login_usecase.dart';
import '../../domain/entities/login_entity.dart';

class LoginController extends GetxController {
  final LoginUseCase loginUseCase;

  LoginController({required this.loginUseCase});

  // Form controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // Observable state
  final _isLoading = false.obs;
  final _errorMessage = ''.obs;
  final _isPasswordVisible = false.obs;
  final _loggedInUser = Rx<LoginEntity?>(null);

  // Getters
  bool get isLoading => _isLoading.value;
  String get errorMessage => _errorMessage.value;
  bool get isPasswordVisible => _isPasswordVisible.value;
  LoginEntity? get loggedInUser => _loggedInUser.value;

  /// Toggle password visibility
  void togglePasswordVisibility() {
    _isPasswordVisible.value = !_isPasswordVisible.value;
  }

  /// Login với email và password
  Future<void> login() async {
    try {
      _isLoading.value = true;
      _errorMessage.value = '';

      final email = emailController.text.trim();
      final password = passwordController.text;

      final result = await loginUseCase.execute(
        email: email,
        password: password,
      );

      result.fold(
        (failure) {
          _errorMessage.value = failure.message;
          Get.snackbar(
            'Lỗi',
            failure.message,
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red.shade100,
            colorText: Colors.red.shade900,
            margin: const EdgeInsets.all(16),
          );
        },
        (entity) {
          _loggedInUser.value = entity;
          Get.snackbar(
            'Thành công',
            'Đăng nhập thành công!',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green.shade100,
            colorText: Colors.green.shade900,
            margin: const EdgeInsets.all(16),
          );

          // Navigate to home or dashboard
          // Get.offNamed('/home');
        },
      );
    } catch (e) {
      _errorMessage.value = e.toString();
    } finally {
      _isLoading.value = false;
    }
  }

  /// Clear form
  void clearForm() {
    emailController.clear();
    passwordController.clear();
    _errorMessage.value = '';
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
