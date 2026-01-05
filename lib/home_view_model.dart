import 'dart:convert';

import 'package:flutter_practice_1/weather.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';

// 1. 홈페이지에 보여지는 상태 변수들담는 클래스
class HomeState {
  Weather? weather;
  HomeState({required this.weather});
}

// 2. 상태를 관리하는 클래스 => 1번 클래스 객체를 실제로 담고 있는 클래스
// 이거는 riverpod 패키지의 사용방법
// Notifier 사용할 땐 이 클래스가 관리해야하는 상태클래스 타입 명시!
class HomeViewModel extends Notifier<HomeState> {
  @override
  HomeState build() {
    return HomeState(weather: null);
  }

  void loadWeather() async {
    // 1. 정보 달라고 편지 쓰기! -> http 통신 GET 요청
    Client httpClient = Client(); // http 통신을 하기위한 객체!
    Uri target = Uri.parse(
      "https://api.open-meteo.com/v1/forecast?latitude=37.57&longitude=126.98&current_weather=true",
    );
    Response r = await httpClient.get(target);
    // 2. 정보가 담긴 답장 받기
    print(
      r.statusCode,
    ); // 편지가 정상적으로 전달되고 답장을 받았는지 알려주는 숫자코드. 성공 : 200, 실패 : 404, 500...
    print(r.body); // 답장 내용
    // 3. 답장내용(JSON)을 Map으로 변경
    Map<String, dynamic> jsonMap = jsonDecode(r.body);
    // 4. Map을 객체로 변경 (3~4 : 역직렬화)
    Weather w = Weather.fromJson(jsonMap);
    state = HomeState(weather: w);
  }
}


// 로직과 상태가 분리 완료
// 이제부터는 사용에 관한 내용
// 의존성 주입
// 객체를 HomePage에서 직접생성하면 여전히 자녀위젯에 생성자를 통해 전달해줘야하는 불편함 존재
// 객체를 직접 생성하지 않고 공급해주는 NotifierProvider 사용! => 의존성 주입
// NotifierProvider는 공급해줄 객체 (뷰모델)의 타입과 상태클래스 타입을 제너릭으로 명시 해줘야함
final homeViewModelProvider = NotifierProvider<HomeViewModel, HomeState>(
  () {
    print("홈뷰모델 생성됨");
    return HomeViewModel();
  },
);