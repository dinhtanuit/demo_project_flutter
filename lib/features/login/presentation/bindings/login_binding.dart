import 'package:get/get.dart';
import '../controllers/login_controller.dart';
import '../../domain/usecases/get_login_usecase.dart';
import '../../domain/repositories/login_repository.dart';
import '../../data/repositories/login_repository_impl.dart';
import '../../data/datasources/login_remote_datasource.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    // DataSource
    Get.lazyPut<LoginRemoteDataSource>(() => LoginRemoteDataSourceImpl());

    // Repository
    Get.lazyPut<LoginRepository>(
      () => LoginRepositoryImpl(remoteDataSource: Get.find()),
    );

    // UseCase
    Get.lazyPut<LoginUseCase>(() => LoginUseCase(repository: Get.find()));

    // Controller
    Get.lazyPut<LoginController>(
      () => LoginController(loginUseCase: Get.find()),
    );
  }
}
