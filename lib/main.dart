import 'package:flutter/material.dart';
import 'package:flutter_practice_1/plus_one.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      //
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int number = 0;

  // void Function() plusNumber = (){}
  // 위 문법이랑 같음!
  // 함수를 변수처럼 파라미터로 전달 가능!
  void plusNumber() {
    number++;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    print("build 메서드 호출됨");
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("$number", style: TextStyle(fontSize: 100)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              PlusOne(plusClick: plusNumber),
              PlusOne(plusClick: plusNumber),
            ],
          ),
          //
        ],
      ),
    );
  }
}
