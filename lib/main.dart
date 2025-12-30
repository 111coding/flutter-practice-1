import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_practice_1/weather.dart';
import 'package:http/http.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomePage());
  }
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String currentTemp = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("오늘의 날씨")),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(currentTemp),
            IconButton(
              onPressed: () async {
                // 1. http 패키지 사용해서 편지쓰기
                // 2. 답장받기
                Client httpClient = Client();
                Response res = await httpClient.get(
                  Uri.parse(
                    "https://api.open-meteo.com/v1/forecast?latitude=37.57&longitude=126.98&current_weather=true",
                  ),
                );

                // 답장이 성공적으로 잘 왔는지 여부 코드
                // 200 -> 성공
                print(res.statusCode);

                // 3. 받은 답장(문자열) 역직렬화 하기
                print(res.body);
                String jsonString = res.body;
                // 역직렬화
                // jsonDecode 함수로 Map 형태로 바꿔주기
                Map<String, dynamic> jsonMap = jsonDecode(jsonString);
                // Map을 객체로 바꿔주기
                Weather w = Weather.fromJson(jsonMap);
                currentTemp =
                    "${w.currentWeather.temperature} ${w.currentWeatherUnits.temperature}";
                setState(() {});
              },
              icon: Icon(Icons.refresh),
            ),
          ],
        ),
      ),
      //
    );
  }
}
