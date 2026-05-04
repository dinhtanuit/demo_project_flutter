import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../domain/entities/city_weather_entity.dart';
import '../../domain/repositories/weather_repository.dart';
import '../datasources/weather_remote_datasource.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  final WeatherRemoteDataSource remoteDataSource;

  WeatherRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<CityWeatherEntity>>> getAllCitiesWeather() async {
    try {
      final models = await remoteDataSource.fetchAllCitiesWeather();
      final entities = models.map((m) => m.toEntity()).toList();
      return Right(entities);
    } on Exception catch (e) {
      return Left(ServerFailure('Không thể tải thời tiết: $e'));
    } catch (e) {
      return Left(ServerFailure('Lỗi không xác định: $e'));
    }
  }
}
