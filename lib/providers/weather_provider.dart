import 'package:flutter/cupertino.dart';
import 'package:weather_app/models/weathermodel.dart';

class WeatherProvider extends ChangeNotifier
{
  WeatherModel ? _weatherData;
  String ?cityName;

  set weatherData(WeatherModel ?weather)
  {
    _weatherData=weather;
    notifyListeners();
  }
  WeatherModel? get weatherData=>_weatherData;

}