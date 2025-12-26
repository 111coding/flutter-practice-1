import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_practice_1/post.dart';
import 'package:http/http.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Post> postList = [];

  @override
  void initState() {
    super.initState();
    // HomePage 위젯이 화면에 보이고 난 후 단 한번만 실행되는 함수 initState
    // async 사용시 에러남!!!
    loadData();
  }

  void loadData() async {
    print("데이터 가져오기 시작");
    // 1. JSON 데이터를 불러오기
    //    HTTP 통신 하기 위해서 http 패키지 추가
    //    http 패키지의 Client 라는 객체를 이용해서 편지를 쓸 수 있음
    Client c = Client();
    Response result = await c.get(
      Uri.parse('https://jsonplaceholder.typicode.com/posts'),
    ); // 브라우저에서 주소 입력하고 엔터치는거랑 똑같은 행동

    print(result.statusCode); // 답장의 상태. 200 -> 성공, 404 -> 답장을 쓸 수 없음
    // result.body 에 답장의 내용이 문자열 형태로 담겨있음!
    String data = result.body;

    // 2. 문자열을 객체로 변환(역직렬화)
    // JSON의 최상위는 리스트가 될 수 있음!
    final List<dynamic> decodedData = jsonDecode(data);
    print(decodedData.runtimeType);

    for (Map<String, dynamic> d in decodedData) {
      print(d.runtimeType);
      Post newPost = Post(
        userId: d["userId"],
        id: d["id"],
        title: d["title"],
        body: d["body"],
        //
      );
      postList.add(newPost);
    }

    print("데이터 가져오기 끝");
    // 3. 화면에 뿌려주기
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    print("위젯 그리기 시작");

    return Scaffold(
      appBar: AppBar(title: Text('블로그 샘플')),
      // ListView.builder : itemCount 속성에 정의한 갯수만큼
      // itemBuilder 속성에서 반환하는 위젯 보여주는 네임드 생성자!
      body: ListView.builder(
        padding: EdgeInsets.all(20),
        itemCount: postList.length,
        itemBuilder: (context, index) {
          print(index);
          Post p = postList[index];
          Widget item = Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: BoxBorder.all(),
            ),
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("포스트 아이디 : ${p.id}"),
                Text("사용자 아이디 : ${p.userId}"),
                Text("제목 : ${p.title}"),
                Text("내용 : ${p.body}"),
              ],
            ),
          );
          return item;
        },
      ),
    );
  }
}
