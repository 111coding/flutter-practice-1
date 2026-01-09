import 'package:flutter/material.dart';

// void main() {
//   //
//   MyClass m1 = MyClass();
//   MyClass m2 = MyClass();
//   MyClass m3 = MyClass();
//   MyClass m4 = MyClass();
//   MyClass m5 = MyClass();
// }

// // 클래스 구성요소
// // 속성, 메서드, 생성자
// class MyClass {
//   // 생성자를 지정하지 않으면 기본 생성자를 만들어줌
//   // MyClass();
//   int count = 1;
//   ThemeMode themeMode = ThemeMode.light;
// }

void main() {
  //
  final m1 = MySingletonClass();
  final m2 = MySingletonClass();
}

// 싱글톤 패턴
// 객체를 하나만 생성해서 앱 전체에서 공유해서 사용할 수 있도록 클래스를 만드는 방법!
// 객체 생성자를 여러번 호출해도 메모리에는 최초 하나만 생성이되게! 클래스를 설계하는 방법!
class MySingletonClass {
  // 1. 객체를 담아놓을 변수가 필요!
  static MySingletonClass? instance;
  // 2. 생성자 즉 함수를 조금 변형시킬거임.
  // ?=> 생성자에서 1번 변수에 객체가 담겨있으면 기존객체, 아니라면 새로운 객체 생성
  // MySingletonClass() {
  //   // 이 안에서 로직을 실행가능!
  //   // 객체를 생성하면서 로직 실행 가능!
  //   // 이미 객체를 생성하고 로직 실행!
  // }

  // 같은파일 이외 사용 불가!
  MySingletonClass._();

  factory MySingletonClass() {
    // factory 생성자
    // 객체를 생성하기 전 로직을 실행할 수 있음!
    if (instance == null) {
      instance = MySingletonClass._();
    }

    return instance!;
  }
}
