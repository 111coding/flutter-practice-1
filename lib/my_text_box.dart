import 'package:flutter/material.dart';

class MyTextBox extends StatelessWidget {
  MyTextBox({required this.text}) {
    print("생성자 호출됨 : $text");
  }
  String text;

  @override
  Widget build(BuildContext context) {
    print("빌드 메서드 호출됨 : $text");
    return Container(
      width: double.infinity,
      height: 100,
      decoration: BoxDecoration(color: Colors.amber),
      margin: EdgeInsets.all(5),
      child: Center(child: Text(text)),
    );
  }
}
