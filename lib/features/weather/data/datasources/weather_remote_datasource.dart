import '../../../../core/constants/api_constants.dart';
import '../../../../core/network/api_client.dart';
import '../models/city_weather_model.dart';

/// Danh sách thành phố mặc định
const List<Map<String, dynamic>> defaultCities = [
  {'name': 'Hà Nội', 'lat': 21.0285, 'lon': 105.8542},
  {'name': 'TP. Hồ Chí Minh', 'lat': 10.7769, 'lon': 106.7009},
  {'name': 'Đà Nẵng', 'lat': 16.0544, 'lon': 108.2022},
  {'name': 'Hải Phòng', 'lat': 20.8449, 'lon': 106.6881},
  {'name': 'Cần Thơ', 'lat': 10.0452, 'lon': 105.7469},
];

/// DataSource interface
abstract class WeatherRemoteDataSource {
  Future<List<CityWeatherModel>> fetchAllCitiesWeather();
}

/// Implementation gọi API thật
class WeatherRemoteDataSourceImpl implements WeatherRemoteDataSource {
  final ApiClient apiClient;

  WeatherRemoteDataSourceImpl({required this.apiClient});

  @override
  Future<List<CityWeatherModel>> fetchAllCitiesWeather() async {
    final List<CityWeatherModel> results = [];

    for (final city in defaultCities) {
      try {
        final url = ApiConstants.weatherUrl(
          latitude: city['lat'] as double,
          longitude: city['lon'] as double,
        );
        final data = await apiClient.get(url);
        results.add(
          CityWeatherModel.fromJson(
            data,
            cityName: city['name'] as String,
            lat: city['lat'] as double,
            lon: city['lon'] as double,
          ),
        );
      } catch (_) {
        // Skip city nếu API fail, tiếp tục với city khác
        continue;
      }
    }

    return results;
  }
}
