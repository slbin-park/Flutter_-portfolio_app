import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
abrirUrl(url) async {
  if (await canLaunch(url)) {
    await launch(url, forceWebView: false, forceSafariVC: false);
  } else {
    throw 'Could not launch $url';
  }
}
class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 여기까지 기본 셋팅 코드
    return MaterialApp(
        home : Scaffold(
          appBar: AppBar(
              title : Text('프로젝트')
          ),
          body: Container(
              width: double.infinity,
              padding:EdgeInsets.all(30),
              decoration: BoxDecoration(
                border : Border.all(color: Colors.black),
              ),
              child:Column(
                children: [
                  ElevatedButton(
                      onPressed: (){
                        Navigator.pop(context);
                      },
                      child: Text('페이지 돌아가기')),
                  Text('프로젝트',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize:20,
                    ),),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('1. Refri Bank WEB',
                          style:TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          )),
                      ElevatedButton(
                          onPressed: (){
                            abrirUrl('https://github.com/slbin-park/Refri_Bank');
                          },
                          child: Text('이동')),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('2. 3-2 Kart Game',
                          style:TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          )),
                      ElevatedButton(
                          onPressed: (){
                            abrirUrl('https://github.com/slbin-park/Kart_Game');
                          },
                          child: Text('이동')),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('3. 3-2 Todolist Android App',
                          style:TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          )),
                      ElevatedButton(
                          onPressed: (){
                            abrirUrl('https://github.com/slbin-park/mid_test');
                          },
                          child: Text('이동')),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('4. Study Cloud WEB APP',
                          style:TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          )),
                      ElevatedButton(
                          onPressed: (){
                            abrirUrl('https://github.com/slbin-park/Study_Cloud');
                          },
                          child: Text('이동')
                      ),
                    ],
                  ),

                ],



              )
          ),
        )
    );
  }
}
