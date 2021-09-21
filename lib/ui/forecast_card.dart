import 'package:flutter/material.dart';
import 'package:weather_app_example/model/weather_forecast_model.dart';
import 'package:weather_app_example/utility/convert_icon.dart';

Widget ForecastCard(AsyncSnapshot<WeatherForecastModel> snapshot, int index){
  var weatherDescription =snapshot.data!.weather.weather[0].main;
  var tempMax = snapshot.data!.main.tempMax;
  var tempMin = snapshot.data!.main.tempMin;
  var feelsLike = snapshot.data!.main.feelsLike;

  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        children: [
          CircleAvatar(
          radius: 33,
            backgroundColor: Colors.white,
            child: getWeatherIcon(weatherDescription: weatherDescription, size: 100),
          ),
        ],
        ),
      Column(
        children: [
          Row(
            children: [

            ],
          ),
        ],
      ),
    ],
  );
}