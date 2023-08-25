

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class WeatherModel {
  String date;
  String image;
  double temp;
  double minTemp;
  double maxTemp;
  String weatherState;

  WeatherModel(
      {required this.date,
      required this.image,
      required this.temp,
      required this.minTemp,
      required this.maxTemp,
      required this.weatherState});
  factory WeatherModel.fromJson(dynamic mp)
  {
    var jsonData = mp['forecast']['forecastday'][0]['day'];

    return WeatherModel(
      date: DateFormat().add_jm().format(
        (DateTime.parse(mp['location']['localtime'])),),
      image: mp['current']['condition']['icon'],
      temp:  jsonData['avgtemp_c'],
      minTemp:jsonData['mintemp_c'],
      maxTemp: jsonData['maxtemp_c'],
      weatherState: jsonData['condition']['text'],
    );
  }
  // @override
  // String toString()
  // {
  //   return 'temp = $temp mintemp =$minTemp';
  //
  // }

String getImage()
{
  if(weatherState=='Sunny')
    {
            return 'assets/images/sun.png';
    }
  else if(weatherState=='Clear')
    {
          return 'assets/images/clear.png';
    }
  else if(weatherState=='Partly Cloudy')
    {
 return 'assets/images/cloudy.png';
    }
  else if(weatherState=='Moderate rain')
    {
 return 'assets/images/rain.png';
    }
  else if(weatherState=='Patchy rain possible')
    {
      return 'assets/images/rain.png';
    }
  return 'assets/images/clear.png';
}
  MaterialColor getThemeColor()
  {
    if(weatherState=='Sunny')
    {
      return Colors.orange;
    }
    else if(weatherState=='Clear')
    {
      return Colors.cyan;
    }
    else if(weatherState=='Partly Cloudy')
    {
      return Colors.blueGrey;
    }
    else if(weatherState=='Moderate rain')
    {
      return Colors.indigo;
    }
    else if(weatherState=='Patchy rain possible')
    {
      return Colors.blue;
    }
    return Colors.grey;
  }
}
