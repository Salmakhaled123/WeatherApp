import 'package:flutter/material.dart';
import 'package:weather_app/models/weathermodel.dart';
import 'package:weather_app/modules/searchScreen.dart';
import '../services/weather.dart';
class TemperatureScreen extends StatelessWidget {
  WeatherService service=WeatherService();
  @override
  Widget build(BuildContext context)
  {

    return Scaffold(
        appBar: AppBar(backgroundColor: Colors.orange,
            title: Text('weather app'),actions:
        [
          IconButton(onPressed: ()
          {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>SearchScreen()));
            
          }, icon:Icon(Icons.search))
          
        ]),
        body: Container(height: 500,
          child: Image(image:
          NetworkImage(
              'https://img.freepik.com/free-vector/calm-girl-with-white-cloud-sun-head-angry-girl-stress-with-thunder-storm-woman-bad-good-mood-flat-vector-illustration-premenstrual-syndrome-pms-mental-health-concept_74855-20951.jpg?w=1060&t=st=1674597897~exp=1674598497~hmac=0075955cf1d1bac5fded91fc2ffbc0543e83ae8c1808e7414ac20ee38acc91b2')),
        )
        
      
           
    );


  }
}
