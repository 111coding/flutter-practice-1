import 'package:flutter/material.dart';
import 'package:flutter_practice_1/home_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  // ProviderScope 는 riverpod 패키가 객체들을 관리할 수 있게 해주는 위젯
  runApp(ProviderScope(child: App()));
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomePage());
  }
}
