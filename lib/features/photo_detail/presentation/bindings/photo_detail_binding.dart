import 'package:get/get.dart';
import '../../data/datasources/photo_detail_local_datasource.dart';
import '../../data/repositories/photo_detail_repository_impl.dart';
import '../../domain/repositories/photo_detail_repository.dart';
import '../../domain/usecases/get_photo_detail_usecase.dart';
import '../controllers/photo_detail_controller.dart';

class PhotoDetailBinding extends Bindings {
  @override
  void dependencies() {
    // DataSource
    Get.lazyPut<PhotoDetailLocalDataSource>(
      () => PhotoDetailLocalDataSourceImpl(),
    );

    // Repository
    Get.lazyPut<PhotoDetailRepository>(
      () => PhotoDetailRepositoryImpl(localDataSource: Get.find()),
    );

    // UseCase
    Get.lazyPut<GetPhotoDetailUseCase>(
      () => GetPhotoDetailUseCase(repository: Get.find()),
    );

    // Controller
    Get.lazyPut<PhotoDetailController>(
      () => PhotoDetailController(getPhotoDetailUseCase: Get.find()),
    );
  }
}
