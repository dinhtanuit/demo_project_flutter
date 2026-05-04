import 'package:get/get.dart';
import '../../domain/entities/photo_detail_entity.dart';
import '../../domain/usecases/get_photo_detail_usecase.dart';

class PhotoDetailController extends GetxController {
  final GetPhotoDetailUseCase getPhotoDetailUseCase;

  PhotoDetailController({required this.getPhotoDetailUseCase});

  // Observable state
  final _isLoading = true.obs;
  final _errorMessage = ''.obs;
  final _photoDetail = Rx<PhotoDetailEntity?>(null);

  // Getters
  bool get isLoading => _isLoading.value;
  String get errorMessage => _errorMessage.value;
  PhotoDetailEntity? get photoDetail => _photoDetail.value;

  @override
  void onInit() {
    super.onInit();
    loadPhotoDetail();
  }

  Future<void> loadPhotoDetail() async {
    try {
      _isLoading.value = true;
      _errorMessage.value = '';

      final result = await getPhotoDetailUseCase.execute();

      result.fold(
        (failure) => _errorMessage.value = failure.message,
        (data) => _photoDetail.value = data,
      );
    } finally {
      _isLoading.value = false;
    }
  }

  /// Toggle favorite
  void toggleFavorite() {
    final current = _photoDetail.value;
    if (current == null) return;

    _photoDetail.value = current.copyWith(
      isFavorite: !current.isFavorite,
      favoriteCount: current.isFavorite
          ? current.favoriteCount - 1
          : current.favoriteCount + 1,
    );
  }
}
