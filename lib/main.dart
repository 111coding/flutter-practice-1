import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// 색상을 관리하는 뷰모델
class ColorState {
  Color color;
  ColorState(this.color);
}

class ColorViewModel extends Notifier<ColorState> {
  @override
  ColorState build() {
    return ColorState(Colors.yellow);
  }
}

// Notifier는 똑같음
final colorViewModelProvider = NotifierProvider<ColorViewModel, ColorState>(() {
  return ColorViewModel();
});

// AutoDisposeNotifier
final colorViewModelProvider2 = NotifierProvider<ColorViewModel, ColorState>(
  () {
    return ColorViewModel();
  },
  isAutoDispose: true,
);

// FamilyNotifier
class ColorViewModel2 extends Notifier<ColorState> {
  final String pageName;
  ColorViewModel2(this.pageName);

  @override
  ColorState build() {
    return ColorState(Colors.yellow);
  }
}

// FamilyNotifier
final colorViewModelProvider3 =
    NotifierProvider.family<ColorViewModel2, ColorState, String>(
      (String arg) {
        return ColorViewModel2(arg);
      },
      isAutoDispose: true, // true로하면 AutoDisposeFamilyNotifier 가 되고 false로하면 FamilyNotifier가 됨!
      //
    );
