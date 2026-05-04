import 'package:get/get.dart';
import '../../../../core/network/api_client.dart';
import '../../data/datasources/weather_remote_datasource.dart';
import '../../data/repositories/weather_repository_impl.dart';
import '../../domain/repositories/weather_repository.dart';
import '../../domain/usecases/get_weather_usecase.dart';
import '../controllers/weather_controller.dart';

class WeatherBinding extends Bindings {
  @override
  void dependencies() {
    // Network
    Get.lazyPut<ApiClient>(() => ApiClient());

    // DataSource
    Get.lazyPut<WeatherRemoteDataSource>(
      () => WeatherRemoteDataSourceImpl(apiClient: Get.find()),
    );

    // Repository
    Get.lazyPut<WeatherRepository>(
      () => WeatherRepositoryImpl(remoteDataSource: Get.find()),
    );

    // UseCase
    Get.lazyPut<GetWeatherUseCase>(
      () => GetWeatherUseCase(repository: Get.find()),
    );

    // Controller
    Get.lazyPut<WeatherController>(
      () => WeatherController(getWeatherUseCase: Get.find()),
    );
  }
}
