import 'package:flutter/material.dart';
import 'package:flutter_practice_1/home_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RefreshButton extends ConsumerWidget {
  const RefreshButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 뷰모델 가지고 오기
    HomeViewModel viewModel = ref.read(homeViewModelProvider.notifier);
    return IconButton(
      onPressed: () async {
        viewModel.loadWeather();
      },
      icon: Icon(Icons.refresh),
    );
  }
}
