import 'package:flutter/material.dart';
import 'package:flutter_practice_1/home_view_model.dart';
import 'package:flutter_practice_1/weather.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Temp extends ConsumerWidget {
  const Temp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // WidgetRef ref : 뷰모델을 관리하는 객체에게 상태 혹은 뷰모델 달라고 요청할 수 있는 기능제공하는 애!
    // 상태 가지고오기
    HomeState state = ref.watch(homeViewModelProvider);
    Weather? weather = state.weather;

    return Text(
      "${weather?.currentWeather.temperature} ${weather?.currentWeatherUnits.temperature}",
      style: TextStyle(fontSize: 36),
    );
  }
}
