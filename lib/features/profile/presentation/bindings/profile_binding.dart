import 'package:get/get.dart';
import '../../data/datasources/profile_remote_datasource.dart';
import '../../data/repositories/profile_repository_impl.dart';
import '../../domain/repositories/profile_repository.dart';
import '../../domain/usecases/get_profile_usecase.dart';
import '../controllers/profile_controller.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    // DataSource
    Get.lazyPut<ProfileRemoteDataSource>(
      () => ProfileRemoteDataSourceImpl(),
    );

    // Repository
    Get.lazyPut<ProfileRepository>(
      () => ProfileRepositoryImpl(remoteDataSource: Get.find()),
    );

    // UseCase
    Get.lazyPut<GetProfileUseCase>(
      () => GetProfileUseCase(repository: Get.find()),
    );

    // Controller
    Get.lazyPut<ProfileController>(
      () => ProfileController(getProfileUseCase: Get.find()),
    );
  }
}
