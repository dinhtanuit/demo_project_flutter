import 'package:equatable/equatable.dart';

/// Entity đại diện cho thời tiết của một thành phố
class CityWeatherEntity extends Equatable {
  final String name;
  final double latitude;
  final double longitude;
  final double temperature;

  const CityWeatherEntity({
    required this.name,
    required this.latitude,
    required this.longitude,
    required this.temperature,
  });

  @override
  List<Object?> get props => [name, latitude, longitude, temperature];
}
