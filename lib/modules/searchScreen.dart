// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/providers/weather_provider.dart';
import 'package:weather_app/services/weather.dart';

import '../components/component.dart';
import '../models/weathermodel.dart';

class SearchScreen extends StatelessWidget {
  var searchController = TextEditingController();
  WeatherModel? model;
  String? cityName;
  String x=':';
  @override
  Widget build(BuildContext context) {
    model = Provider.of<WeatherProvider>(context).weatherData;
    return Scaffold(
      appBar: AppBar(
        title: Text('search for weather'),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: model != null ? model!.getThemeColor() : Colors.white,
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              TextFormField(
                onChanged: (value)
                {
                  cityName=value;
                },
                onFieldSubmitted: (value) async
                {
                  cityName = value;
                  WeatherService? service = WeatherService();
                  WeatherModel ?model =
                      await service.getWeather(cityName: cityName!);
                  Provider.of<WeatherProvider>(context, listen: false)
                      .weatherData = model;
                  Provider.of<WeatherProvider>(context, listen: false)
                      .cityName = cityName;
                },
                keyboardType: TextInputType.text,
                controller: searchController,
                decoration: InputDecoration(suffixIcon: GestureDetector(onTap: ()async
                {
                  WeatherService? service = WeatherService();
                  WeatherModel ?model =
                      await service.getWeather(cityName: cityName!);
                  Provider.of<WeatherProvider>(context, listen: false)
                      .weatherData = model;
                  Provider.of<WeatherProvider>(context, listen: false)
                      .cityName = cityName;
                },
                    child: Icon(Icons.search)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25))),
              ),
              SizedBox(
                height: 40,
              ),
              model == null
                  ? Container(color: Colors.white,
                    child: Column(mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image(
                              image: NetworkImage(
                                  'https://img.freepik.com/free-vector/weather-concept-illustration_114360-1254.jpg?w=740&t=st=1674604456~exp=1674605056~hmac=20a184d64356f40892343f9de12170835743989945303c3fe959f9fd73a85a24')),
                          // Text(
                          //   'No results found',
                          //   style: TextStyle(
                          //       fontWeight: FontWeight.bold, fontSize: 20),
                          // )
                        ],
                      ),
                  )
                  : Container(
                      height: 500,
                      decoration: BoxDecoration(

                          gradient: LinearGradient(colors:
                          [
                            model!.getThemeColor(),
                            model!.getThemeColor()[300]!,
                            model!.getThemeColor()[100]!,

                          ],begin: Alignment.topCenter,
                          end: Alignment.bottomCenter)),
                      child: Column(
                        children: [
                          Text(
                            Provider.of<WeatherProvider>(context).cityName!,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 35),
                          ),
                          Text(

                            'updated at:${model!.date.toString()}',
                            style: TextStyle(fontSize: 24),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Image(
                                image: AssetImage(model!.getImage()),
                                width: 70,
                                height: 70,
                              ),
                              Text(model!.temp.toInt().toString(),
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold)),
                              Column(
                                children: [
                                  Text('maxTemp :${model!.maxTemp.toInt()}'),
                                  Text('minTemp:${model!.minTemp.toInt()}')
                                ],
                              )
                            ],
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Text(
                            model!.weatherState,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 35),
                          ),


                        ],
                      ),
                    )
            ],
          ),
        ),
      ),
    );
  }
}
