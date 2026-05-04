import 'package:get/get.dart';
import '../../domain/entities/city_weather_entity.dart';
import '../../domain/usecases/get_weather_usecase.dart';

class WeatherController extends GetxController {
  final GetWeatherUseCase getWeatherUseCase;

  WeatherController({required this.getWeatherUseCase});

  // Observable state
  final _isLoading = true.obs;
  final _errorMessage = ''.obs;
  final _citiesWeather = <CityWeatherEntity>[].obs;

  // Getters
  bool get isLoading => _isLoading.value;
  String get errorMessage => _errorMessage.value;
  List<CityWeatherEntity> get citiesWeather => _citiesWeather;

  @override
  void onInit() {
    super.onInit();
    fetchWeather();
  }

  Future<void> fetchWeather() async {
    try {
      _isLoading.value = true;
      _errorMessage.value = '';

      final result = await getWeatherUseCase.execute();

      result.fold(
        (failure) => _errorMessage.value = failure.message,
        (data) => _citiesWeather.assignAll(data),
      );
    } finally {
      _isLoading.value = false;
    }
  }
}
