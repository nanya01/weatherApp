import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app_example/model/weather_forecast_model.dart';
import 'package:weather_app_example/utility/convert_icon.dart';

import 'forecast_card.dart';

Widget bottomView(AsyncSnapshot<WeatherForecastModel> snapshot, BuildContext context){
  var weatherDescription =snapshot.data!.weather.weather[0].main;
  var tempMax = snapshot.data!.main.tempMax;
  var tempMin = snapshot.data!.main.tempMin;
  var feelsLike = snapshot.data!.main.feelsLike;

  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Text('7 Days Weather Forecast', style: TextStyle(
        fontSize: 15,
        color: Colors.white
      ),),
      Container(
        height: 170,
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 10),
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [Colors.blue, Colors.white],
                begin: Alignment.topLeft, end:Alignment.bottomRight)
        ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                child: getWeatherIcon(weatherDescription: weatherDescription, size: 150),
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 50),
                        child: Text('Temp Max:')
                      ),

                      Container(
                        padding: EdgeInsets.only(left: 10),
                        child: Text('${tempMax.round()}'),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                          margin: EdgeInsets.only(left: 50, top: 20),
                          child: Text('Feels Like:')
                      ),

                      Container(
                        padding: EdgeInsets.only(left: 10, top: 20),
                        child: Text('${feelsLike.round()}'),
                      ),
                    ],
                  ),

                  Row(
                    children: [
                      Container(
                          margin: EdgeInsets.only(left: 50, top: 20),
                          child: Text('Temp Min:')
                      ),

                      Container(
                        padding: EdgeInsets.only(left: 10, top: 20),
                        child: Text('${tempMin.round()}'),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
      ),
    ],
  );
}