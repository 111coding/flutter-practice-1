import 'package:flutter/material.dart';
import 'package:flutter_practice_1/weather.dart';

class Temp extends StatelessWidget {
  const Temp({super.key, required this.weather});

  final Weather weather;

  @override
  Widget build(BuildContext context) {
    return Text(
      "${weather.currentWeather.temperature} ${weather.currentWeatherUnits.temperature}",
      style: TextStyle(fontSize: 36),
    );
  }
}
