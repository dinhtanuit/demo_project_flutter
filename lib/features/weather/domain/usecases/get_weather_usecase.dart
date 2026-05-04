import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../entities/city_weather_entity.dart';
import '../repositories/weather_repository.dart';

/// UseCase lấy thời tiết tất cả thành phố
class GetWeatherUseCase {
  final WeatherRepository repository;

  GetWeatherUseCase({required this.repository});

  Future<Either<Failure, List<CityWeatherEntity>>> execute() async {
    return await repository.getAllCitiesWeather();
  }
}
