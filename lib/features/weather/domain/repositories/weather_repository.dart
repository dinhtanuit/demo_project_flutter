import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../entities/city_weather_entity.dart';

/// Repository interface cho Weather feature
abstract class WeatherRepository {
  /// Lấy thời tiết của tất cả các thành phố
  Future<Either<Failure, List<CityWeatherEntity>>> getAllCitiesWeather();
}
