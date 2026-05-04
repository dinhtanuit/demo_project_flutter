import 'package:demo_flutter/core/config/app_env.dart';

/// Tập trung tất cả API endpoints
class ApiConstants {
  ApiConstants._();

  static String get baseUrl => AppEnv.baseUrl;

  // Weather API
  static const String weatherBaseUrl = 'https://api.open-meteo.com/v1';
  static const String weatherForecast = '$weatherBaseUrl/forecast';

  /// Build weather URL cho một thành phố
  static String weatherUrl({
    required double latitude,
    required double longitude,
  }) {
    return '$weatherForecast?latitude=$latitude&longitude=$longitude&current_weather=true';
  }
}
