import 'package:flutter/material.dart';

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
            Text("-10도씨", style: TextStyle(fontSize: 36)),
            IconButton(onPressed: () {}, icon: Icon(Icons.refresh)),
          ],
        ),
      ),
    );
  }
}
