import 'package:flutter/material.dart';
import 'package:flutter_practice_1/weather.dart';

class Speed extends StatelessWidget {
  const Speed({super.key, required this.weather});

  final Weather weather;

  @override
  Widget build(BuildContext context) {
    return Text(
      "${weather.currentWeather.windspeed} ${weather.currentWeatherUnits.windspeed}",
      style: TextStyle(fontSize: 36),
    );
  }
}
