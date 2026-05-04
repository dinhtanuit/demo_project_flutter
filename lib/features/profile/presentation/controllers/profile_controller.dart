import 'package:get/get.dart';
import '../../domain/entities/profile_entity.dart';
import '../../domain/usecases/get_profile_usecase.dart';

class ProfileController extends GetxController {
  final GetProfileUseCase getProfileUseCase;

  ProfileController({required this.getProfileUseCase});

  // Observable state
  final _isLoading = true.obs;
  final _errorMessage = ''.obs;
  final _profile = Rx<ProfileEntity?>(null);

  // Getters
  bool get isLoading => _isLoading.value;
  String get errorMessage => _errorMessage.value;
  ProfileEntity? get profile => _profile.value;

  @override
  void onInit() {
    super.onInit();
    loadProfile();
  }

  Future<void> loadProfile() async {
    try {
      _isLoading.value = true;
      _errorMessage.value = '';

      final result = await getProfileUseCase.execute();

      result.fold(
        (failure) => _errorMessage.value = failure.message,
        (data) => _profile.value = data,
      );
    } finally {
      _isLoading.value = false;
    }
  }
}
