import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';
import 'package:untitled/main_page.dart';
import 'package:untitled/page1.dart';
import 'package:untitled/page2.dart';
import 'package:untitled/page3.dart';

import 'package:url_launcher/url_launcher.dart';

void main() {

  runApp(const MyApp()); // 앱 구동하는 코드
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
  // 여기까지 기본 셋팅 코드
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/' : (context) => MainPage(),
        '/page1' : (context) => Page1(),
        '/page2' : (context) => Page2(),
        '/page3' : (context) => Page3(),
      },
    );
  }
}
