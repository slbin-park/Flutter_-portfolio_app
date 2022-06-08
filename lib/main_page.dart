import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:typed_data';
import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/services.dart';

abrirUrl(url) async {
  final player = AudioCache();
  player.play('button.mp3');

  if (await canLaunch(url)) {
    await launch(url, forceWebView: false, forceSafariVC: false);
  } else {
    throw 'Could not launch $url';
  }
}
class MainPage extends StatefulWidget{
  HomePage createState()=> HomePage();
}


class HomePage extends State<MainPage>{
  @override
  LocalStorage storage = new LocalStorage('visit');
  final player = AudioCache();

  void click_db() async{
    LocalStorage storage = new LocalStorage('visit');
    storage.setItem('visit', 0);
    player.play('button.mp3');
  }
  Widget build(BuildContext context) {
    // 여기까지 기본 셋팅 코드
    return MaterialApp(
        home: Scaffold( // 상 중 하 로 나눠줌
          // 위치를 부모위젯으로 넣어주어야함 , 위젯 안에 위젯 넣어짐
          appBar:AppBar(
            title: Text('포트폴리오'),
            leading: Icon(Icons.shop),
            actions: [
              Icon(Icons.star),
              Icon(Icons.star)
            ],
          ), //상단
          body:
          SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child : Container(
              width: double.infinity,
              margin:EdgeInsets.all(10),
              decoration: BoxDecoration(
                border : Border.all(color: Colors.black),
              ),

              child: Column(
                children: [
                  Image.asset('assets/ksu.jpg',width: 300, height: 100),
                  Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(40),

                      child:Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('경성대학교 소프트웨어학과',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize:15,
                          )),
                          Text('2017848041',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize:12,
                              )),
                          Text('박슬빈',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize:12,
                              )),
                          Text('평균학점 : 3.92/4.5',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize:12,
                              )),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              FutureBuilder(
                                future: storage.ready,
                                builder: (BuildContext context,sanpshot){
                                  if(sanpshot.data == true){
                                    return Card(
                                      child:Row(
                                        children: [
                                          Icon(Icons.favorite),
                                          Text(storage.getItem('visit').toString()),
                                        ],
                                      )
                                    );
                                  }
                                  else{
                                    return CircularProgressIndicator();
                                  }
                                },
                              )

                            ],
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children:[
                              Text('1. 기술스택',
                              style:TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              )),
                          ElevatedButton(
                              onPressed: (){
                                player.play('button.mp3');
                                setState((){
                                  storage.setItem('visit', storage.getItem('visit')+1);
                                });
                                Navigator.pushNamed(context, '/page1');
                              },
                              child: Text('이동')),
                            ]
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children:[
                                Text('2. 프로젝트',
                                    style:TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    )),
                                ElevatedButton(
                                    onPressed: (){
                                      player.play('button.mp3');
                                      setState((){
                                        storage.setItem('visit', storage.getItem('visit')+1);
                                      });
                                      Navigator.pushNamed(context, '/page2');
                                    },
                                    child: Text('이동')),
                              ]
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children:[
                                Text('3. 날씨',
                                    style:TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    )),
                                ElevatedButton(
                                    onPressed: (){
                                      player.play('button.mp3');
                                      setState((){
                                        storage.setItem('visit', storage.getItem('visit')+1);
                                      });
                                      Navigator.pushNamed(context, '/page3');
                                    },
                                    child: Text('이동')),

                              ]
                          ),
                          ElevatedButton(
                              onPressed: () {
                                setState((){
                                  click_db();
                                });
                              },
                              child: Text('방문기록 초기화'))
                        ],
                      )
                  ),
                  Container(
                    padding:EdgeInsets.fromLTRB(50, 0, 50,0),
                    child: Column(
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children : [
                            Text('Github 이동'),
                            InkWell(
                                child:Image.asset('assets/git.jpeg',width:50,height:50),
                                onTap: ()=>abrirUrl('https://github.com/slbin-park'),

                            )
                          ]
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children : [
                              Text('Blog 이동'),
                              InkWell(
                                  child:Image.asset('assets/velog.jpeg',width:50,height:50),
                                  onTap: ()=>abrirUrl('https://velog.io/@slbin-park'),
                              )
                            ]
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children : [
                              Text('백준 이동'),
                              InkWell(
                                child:Image.asset('assets/baek.png',width:100,height:50),
                                onTap: ()=>abrirUrl('https://www.acmicpc.net/user/slbin_park'),
                              )
                            ]
                        ),

                        // ElevatedButton(
                        //     onPressed: (){
                        //       abrirUrl('https://github.com/slbin-park/Study_Cloud');
                        //     },
                        //     child: Text('이동')
                        // ),
                      ],
                    ),
                  )
                ],
              )

          )),
          // Align(
          //   alignment: Alignment.center,
          //   child: Container(
          //     width: double.infinity , height: 50 ,
          //     padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
          //     decoration: BoxDecoration(
          //       color : Colors.blue,
          //       border: Border.all(color : Colors.black),
          //     ),
          //     child : Text('dddd'),
          //   ),
          // ), // 중단
          bottomNavigationBar: BottomAppBar(
              child : SizedBox(
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(Icons.phone),
                    Icon(Icons.message),
                    Icon(Icons.contact_page),
                  ],
                ),
              )
          ), // 하단

        )
      //      앱에선 앞에 경로도 넣어야함
    );
  }
}
