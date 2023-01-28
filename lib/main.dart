import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/providers/weather_provider.dart';
import 'components/component.dart';
import 'modules/searchScreen.dart';
import 'modules/tempScreen.dart';

void main()
{
  runApp(ChangeNotifierProvider(create:(context)
  {
    return WeatherProvider();
  } ,
      child: WeatherApp()));
}
class WeatherApp extends StatelessWidget
{

  @override
  Widget build(BuildContext context) {
    return MaterialApp(theme: ThemeData(
      primarySwatch: Provider.of<WeatherProvider>(context).weatherData==null?
      Colors.blue :Provider.of<WeatherProvider>(context).weatherData!.getThemeColor(),

       ),
      debugShowCheckedModeBanner: false,
    home: SearchScreen(),);
  }
}
