import 'package:flutter/material.dart';
import 'package:flutter_practice_1/home_view_model.dart';
import 'package:flutter_practice_1/weather.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Speed extends ConsumerWidget {
  const Speed({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    HomeState state = ref.watch(homeViewModelProvider);
    Weather? weather = state.weather;

    return Text(
      "${weather?.currentWeather.windspeed} ${weather?.currentWeatherUnits.windspeed}",
      style: TextStyle(fontSize: 36),
    );
  }
}
