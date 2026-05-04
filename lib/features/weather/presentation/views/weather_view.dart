import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/weather_controller.dart';

class WeatherView extends GetView<WeatherController> {
  const WeatherView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather List'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: controller.fetchWeather,
          ),
        ],
      ),
      body: Obx(() {
        if (controller.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.errorMessage.isNotEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.error_outline, size: 64, color: Colors.red),
                const SizedBox(height: 16),
                Text(controller.errorMessage),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: controller.fetchWeather,
                  child: const Text('Thử lại'),
                ),
              ],
            ),
          );
        }

        if (controller.citiesWeather.isEmpty) {
          return const Center(child: Text('Không có dữ liệu thời tiết'));
        }

        return RefreshIndicator(
          onRefresh: controller.fetchWeather,
          child: ListView.builder(
            itemCount: controller.citiesWeather.length,
            itemBuilder: (context, index) {
              final weather = controller.citiesWeather[index];
              return ListTile(
                leading: Icon(
                  _getWeatherIcon(weather.temperature),
                  color: _getWeatherColor(weather.temperature),
                  size: 32,
                ),
                title: Text(weather.name),
                trailing: Text(
                  '${weather.temperature}°C',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: _getWeatherColor(weather.temperature),
                  ),
                ),
              );
            },
          ),
        );
      }),
    );
  }

  IconData _getWeatherIcon(double temp) {
    if (temp >= 35) return Icons.wb_sunny;
    if (temp >= 25) return Icons.cloud_queue;
    if (temp >= 15) return Icons.cloud;
    return Icons.ac_unit;
  }

  Color _getWeatherColor(double temp) {
    if (temp >= 35) return Colors.red;
    if (temp >= 25) return Colors.orange;
    if (temp >= 15) return Colors.blue;
    return Colors.indigo;
  }
}
