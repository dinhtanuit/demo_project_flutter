import 'package:get/get.dart';
import '../../domain/usecases/get_{{name.snakeCase()}}_usecase.dart';
import '../../domain/entities/{{name.snakeCase()}}_entity.dart';

class {{name.pascalCase()}}Controller extends GetxController {
  final Get{{name.pascalCase()}}UseCase get{{name.pascalCase()}}UseCase;

  {{name.pascalCase()}}Controller({
    required this.get{{name.pascalCase()}}UseCase,
  });

  // Observable state
  final _isLoading = false.obs;
  final _errorMessage = ''.obs;
  final _data = Rx<{{name.pascalCase()}}Entity?>(null);

  // Getters
  bool get isLoading => _isLoading.value;
  String get errorMessage => _errorMessage.value;
  {{name.pascalCase()}}Entity? get data => _data.value;

  @override
  void onInit() {
    super.onInit();
    load{{name.pascalCase()}}();
  }

  /// Load data using UseCase
  Future<void> load{{name.pascalCase()}}() async {
    try {
      _isLoading.value = true;
      _errorMessage.value = '';

      final result = await get{{name.pascalCase()}}UseCase.execute();

      result.fold(
        (failure) {
          _errorMessage.value = failure.message;
        },
        (entity) {
          _data.value = entity;
        },
      );
    } catch (e) {
      _errorMessage.value = e.toString();
    } finally {
      _isLoading.value = false;
    }
  }

  /// Refresh data
  Future<void> refresh() async {
    await load{{name.pascalCase()}}();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
