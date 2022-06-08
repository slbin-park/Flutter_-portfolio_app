import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:untitled/data/my_location.dart';
import 'package:untitled/data/network.dart';

const apiKey = '46547b0f84a929f844bfafa0afad3d59';

class Page3 extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class Post {
  String? name ;
  int? temp ;
  int? feels_like ;
  int? humidity ;

  Post({this.name , this.temp , this.feels_like , this.humidity});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      name: json['name'] ,
      temp: json['main']['temp'].floor()-273 ,
      feels_like: json['main']['feels_like'].floor()-273 ,
      humidity: json['main']['humidity'] ,
    );
  }
}

class _LoadingState extends State<Page3> {

  double? latitude3; // 위도
  double? longitude3; // 경도
  late Future<Post> weatherData;
  @override
  void initState() {
    super.initState();
    // TODO: implement initState
    weatherData = getLocation();
    //fetchData();
  }

  Future<Post> getLocation() async {
    MyLocation myLocation = MyLocation();
    await myLocation.getMyCurrentLocation();
    latitude3 = myLocation.latitude2;
    longitude3 = myLocation.longitude2;

    Network network = Network('http://api.openweathermap.org/data/2.5/weather?lat=${latitude3}&lon=${longitude3}&appid=$apiKey');

    var a = await network.getJsonData();
    print(a);
    return Post.fromJson(a);
    /* Navigator.push(context, MaterialPageRoute(builder: (context) {
      return WeatherScreen();
    }));*/

  }

  /*void fetchData() async {
    http.Response response = await http.get(
        'https://samples.openweathermap.org/data/2.5/weather?q=London&appid=b1b15e88fa797225412429c1c50c122a1');
    print(response.body);
    if (response.statusCode == 200) {
      String jsonData = response.body;
      var parsingData = jsonDecode(jsonData);
      var myjson = parsingData['weather'][0]['description'];
      print(myjson);

      var wind = parsingData['wind']['speed'];
      print(wind);

      var id = parsingData['id'];
      print(id);
    } else {
      print(response.statusCode);
    }
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title : Text('날씨')
      ),
      body: Center(
        child: Container(
          padding:EdgeInsets.all(30),
          child: Column(
            children: [
              FutureBuilder<Post>(
                future : weatherData,
                builder: (context,data){
                  if(data.hasData){
                    return Card(
                        child: Container(
                          child: Column(
                            children: [
                              Text(data.data!.name as String,
                                  style: TextStyle(fontSize: 30)),
                              Text('${(data.data!.temp).toString() as String}°',
                                  style: TextStyle(fontSize: 55)),
                              Text('  (feels : ${data.data!.feels_like.toString() as String}°)',
                                  style: TextStyle(fontSize: 15)),
                              Text('습도 : ${data.data!.humidity.toString() as String}%',
                                  style: TextStyle(fontSize: 55))
                            ],
                          ),
                        )
                    );
                    } else if (data.hasError) {
                    return Text("${data.error}");
                  }

                  // 기본적으로 로딩 Spinner를 보여줍니다.
                  return CircularProgressIndicator();
                  }

              ),
              ElevatedButton(
                  onPressed: () {
                    getLocation();
                  },
                  child: Text(
                    '돌아가기',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(primary: Colors.orangeAccent)),
            ],
          ),
        ),
      ),
    );
  }
}