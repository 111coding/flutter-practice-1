import 'package:flutter/material.dart';

void temp() {
  Person p = Person();
  p.printHello();
  p.pringName();
}

class Person {
  void printHello() {
    print("안녕");
  }
}

// 기존 클래스에 메서드 추가할 때!
extension PersonExt on Person {
  void pringName() {
    print("OOO입니다");
  }
}

extension DoubleExt on double {
  // getter => 파라미터 없는 함수에서 괄호 생략!
  Widget get w {
    return SizedBox(width: this);
  }

  Widget get h {
    return SizedBox(height: this);
  }
}

extension IntExt on int {
  Widget get w {
    return SizedBox(width: toDouble());
  }

  Widget get h {
    return SizedBox(height: toDouble());
  }
}
