import 'package:flutter/material.dart';

class PlusOne extends StatelessWidget {
  PlusOne({super.key, required this.plusClick});

  void Function() plusClick;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        plusClick();
        // print("플러스1");
        // number = number + 1;
        // print(number);
        // // 플러터 프레임워크에 build 메서드 다시 호출해서
        // // 그림 다시 그리라고 명령하는 함수!`
        // setState(() {});
      },
      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(color: Colors.amber, shape: BoxShape.circle),
        child: Icon(Icons.plus_one, size: 48),
      ),
    );
  }
}
