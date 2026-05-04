import '../../domain/entities/city_weather_entity.dart';

/// Model cho weather data từ API
class CityWeatherModel {
  final String name;
  final double latitude;
  final double longitude;
  final double temperature;

  CityWeatherModel({
    required this.name,
    required this.latitude,
    required this.longitude,
    required this.temperature,
  });

  /// Parse từ API response + city info
  factory CityWeatherModel.fromJson(
    Map<String, dynamic> json, {
    required String cityName,
    required double lat,
    required double lon,
  }) {
    final currentWeather = json['current_weather'] as Map<String, dynamic>;
    return CityWeatherModel(
      name: cityName,
      latitude: lat,
      longitude: lon,
      temperature: (currentWeather['temperature'] as num).toDouble(),
    );
  }

  /// Chuyển sang Entity
  CityWeatherEntity toEntity() {
    return CityWeatherEntity(
      name: name,
      latitude: latitude,
      longitude: longitude,
      temperature: temperature,
    );
  }
}
