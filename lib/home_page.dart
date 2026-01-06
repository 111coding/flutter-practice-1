import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_practice_1/home_view_model.dart';
import 'package:flutter_practice_1/refresh_button.dart';
import 'package:flutter_practice_1/speed.dart';
import 'package:flutter_practice_1/temp.dart';
import 'package:flutter_practice_1/weather.dart';
import 'package:http/http.dart';

class HomePage extends StatelessWidget {
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
            Temp(),
            Speed(),
            // if (weather != null) Temp(weather: weather!),
            // if (weather != null) Speed(weather: weather!),
            RefreshButton(),
          ],
        ),
      ),
    );
  }
}
