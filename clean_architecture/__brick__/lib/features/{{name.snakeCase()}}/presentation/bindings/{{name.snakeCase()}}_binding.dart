import 'package:get/get.dart';
import '../controllers/{{name.snakeCase()}}_controller.dart';
import '../../domain/usecases/get_{{name.snakeCase()}}_usecase.dart';
import '../../data/repositories/{{name.snakeCase()}}_repository_impl.dart';
import '../../data/datasources/{{name.snakeCase()}}_remote_datasource.dart';

class {{name.pascalCase()}}Binding extends Bindings {
  @override
  void dependencies() {
    // DataSource
    Get.lazyPut<{{name.pascalCase()}}RemoteDataSource>(
      () => {{name.pascalCase()}}RemoteDataSourceImpl(),
    );

    // Repository
    Get.lazyPut<{{name.pascalCase()}}Repository>(
      () => {{name.pascalCase()}}RepositoryImpl(
        remoteDataSource: Get.find(),
      ),
    );

    // UseCase
    Get.lazyPut<Get{{name.pascalCase()}}UseCase>(
      () => Get{{name.pascalCase()}}UseCase(
        repository: Get.find(),
      ),
    );

    // Controller
    Get.lazyPut<{{name.pascalCase()}}Controller>(
      () => {{name.pascalCase()}}Controller(
        get{{name.pascalCase()}}UseCase: Get.find(),
      ),
    );
  }
}
