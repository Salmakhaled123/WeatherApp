import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/models/weathermodel.dart';

class WeatherService
{
  Future<WeatherModel?> getWeather({required String cityName}) async
  {
    WeatherModel? model;
   try{
     String baseUrl = 'http://api.weatherapi.com/v1';
     String apikey = '6ff8336124294341a7b195944232301';
     int x=5;
     http.Response response = await http.get(Uri.parse(
         '$baseUrl/forecast.json?key=$apikey&q=$cityName&days=$x&aqi=no&alerts=no'));
     Map<String, dynamic> mp = jsonDecode(response.body);
     model = WeatherModel.fromJson(mp);

   }catch(e)
   {
     Fluttertoast.showToast(
         msg: "enter valid city",
         toastLength: Toast.LENGTH_LONG,
         gravity: ToastGravity.BOTTOM,
         timeInSecForIosWeb: 1,
         backgroundColor: Colors.red,
         textColor: Colors.white,
         fontSize: 16.0
     );
     print(e.toString());
   }
    return model;
  }
}


