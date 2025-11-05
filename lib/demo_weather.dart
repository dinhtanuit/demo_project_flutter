import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CityWeather {
  final String name;
  final double temp;

  CityWeather({required this.name, required this.temp});
}

class WeatherListScreen extends StatefulWidget {
  const WeatherListScreen({super.key});

  @override
  State<WeatherListScreen> createState() => _WeatherListScreen();
}

class _WeatherListScreen extends State<WeatherListScreen> {
  final List<Map<String, dynamic>> cities = [
    {"name": "Hà Nội", "lat": 21.0285, "lon": 105.8542},
    {"name": "TP. Hồ Chí Minh", "lat": 10.7769, "lon": 106.7009},
    {"name": "Đà Nẵng", "lat": 16.0544, "lon": 108.2022},
    {"name": "Hải Phòng", "lat": 20.8449, "lon": 106.6881},
    {"name": "Cần Thơ", "lat": 10.0452, "lon": 105.7469},
  ];

  bool isLoading = true;
  final List<CityWeather> _cityWeather = [];

  @override
  void initState() {
    super.initState();
    fetchAllCitiesWeather();
  }

  Future<void> fetchAllCitiesWeather() async {
    List<CityWeather> results = [];

    for (var city in cities) {
      final url =
          'https://api.open-meteo.com/v1/forecast?latitude=${city["lat"]}&longitude=${city["lon"]}&current_weather=true';
      final res = await http.get(Uri.parse(url));

      if (res.statusCode == 200) {
        final data = jsonDecode(res.body);
        final temp = data['current_weather']?['temperature'];
        if (temp != null) {
          results.add(CityWeather(name: city["name"], temp: temp.toDouble()));
        }
      }
    }

    setState(() {
      _cityWeather.addAll(results);
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Weather List'),
        centerTitle: true,
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: Divider(height: 1, color: Colors.red),
        ),

      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: _cityWeather.length,
              itemBuilder: (context, index) {
                final weather = _cityWeather[index];
                return WeatherInforView(weather: weather);
              },
            ),
    );
  }
}

class WeatherInforView extends StatelessWidget {
  final CityWeather weather;
  const WeatherInforView({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey, width: 0.5), // line dưới cùng
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 72,
            height: 72,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey[200],
              border: Border.fromBorderSide(BorderSide(color: Colors.black, width: 0.5)),
            ),
            child: Image.asset(
              'assets/icons/icon_rainy.png',
              fit: BoxFit.cover,
            ),
          ),

          SizedBox(width: 16),

          Expanded(
            child:  Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [Text(weather.name), Text('${weather.temp}°C')],
          ),
          ),
        ],
      ),
    );
  }
}
