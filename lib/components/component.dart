import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weathermodel.dart';
import 'package:weather_app/providers/weather_provider.dart';

class Try extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(appBar: AppBar(),
    body: Container(height: 200,
      child: ListView.builder(scrollDirection: Axis.horizontal,
        itemBuilder: (context,index)=>buildForcastItem(context,index),itemCount: 10,),
    ));

  }
}
Widget buildForcastItem(context,index)
{
  Provider.of<WeatherProvider>(context).weatherData;
  WeatherModel ?model;
  return Padding(
    padding: const EdgeInsets.all(20.0),
    child: Container(width:100,height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(35),
      color: Colors.deepPurple,),
      child: Column(
        children: [
          Center(child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Image.asset(width: 50,height: 50,
                'assets/images/rain.png'),
          ),),
      Text('sunny',
        style: TextStyle(fontSize: 22,
          fontWeight: FontWeight.bold),
        
      ),
        SizedBox(height: 10,),
        Text('23/19')],
      )),

  );
}
