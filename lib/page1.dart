import 'package:flutter/material.dart';

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 여기까지 기본 셋팅 코드
    return MaterialApp(
      home : Scaffold(
        appBar: AppBar(
          title : Text('기술스택')
        ),
        body: Container(
          width: double.infinity,
          margin:EdgeInsets.all(10),
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
            Text('사용언어',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize:20,
            ),),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Python',
                    style:TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    )),
                Image.asset('assets/python.png',width: 200, height: 50),
              ],
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('JavaScript',
                      style:TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      )),
                  Image.asset('assets/js.png',width: 200, height: 50),
                ],
              ),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
              children: [
                  Text('TypeScript',
                      style:TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      )),
                  Image.asset('assets/tsp.png',width: 200, height: 50),
                ],
              ),
              Text(''),
              Text('프레임워크',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize:20,
                ),),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('React',
                      style:TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      )),
                  Image.asset('assets/React.jpeg',width: 200, height: 50),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Storybook',
                      style:TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      )),
                  Image.asset('assets/storybook.webp',width: 200, height: 50),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('nextjs',
                      style:TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      )),
                  Image.asset('assets/nextjs.png',width: 200, height: 50),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Express',
                      style:TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      )),
                  Image.asset('assets/express.png',width: 200, height: 50),
                ],
              ),
            ],


          )
        ),
      )
    );
  }
}
