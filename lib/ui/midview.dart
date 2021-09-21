import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather_app_example/model/weather_forecast_model.dart';
import 'package:weather_app_example/utility/convert_icon.dart';
import 'package:weather_app_example/utility/forecast_util.dart';

Widget midView(AsyncSnapshot<WeatherForecastModel> snapshot){
  var cityName =  snapshot.data!.name;
  var country = snapshot.data!.sys.country;
  var dt = snapshot.data!.dt;
  var temp = snapshot.data!.main.temp;
  var wind = snapshot.data!.wind.speed;
  var humidity =snapshot.data!.main.humidity;
  var weatherDescription =snapshot.data!.weather.weather[0].main;
  Container  midview = Container(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('$cityName, $country', style: TextStyle(
          fontSize: 25,
          fontWeight:FontWeight.bold,
          color: Colors.white
        ),
        ),
        Text('${Util.getFormattedDate(new DateTime.fromMillisecondsSinceEpoch(dt * 1000))}', style: TextStyle(
            fontSize: 15,
            color: Colors.white
        ),),
        getWeatherIcon(weatherDescription: weatherDescription, size: 198),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              margin: EdgeInsets.only(top: 40.0),
              padding: EdgeInsets.all(10.0),
              height: 60,
              width: 70,
              decoration: BoxDecoration(
                border:Border.all(color: Color.fromRGBO(3, 0, 39, 0.5)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
               children: [
                 Text('Temp',style:TextStyle(
                   fontSize: 12,
                   color: Colors.white30
                 ),),
                 Text(temp.round().toString(),),
               ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 40.0),
              padding: EdgeInsets.all(10.0),
              height: 60,
              width: 100,
              decoration: BoxDecoration(
                border:Border.all(color: Color.fromRGBO(3, 0, 39, 0.5)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('Wind',style:TextStyle(
                      fontSize: 12,
                      color: Colors.white30
                  ),),
                  Text(wind.round().toString() + 'Km/hr',),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 40.0),
              padding: EdgeInsets.all(10.0),
              height: 60,
              width: 70,
              decoration: BoxDecoration(
                border:Border.all(color: Color.fromRGBO(3, 0, 39, 0.5)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('Humidity',style:TextStyle(
                      fontSize: 12,
                      color: Colors.white30
                  ),),
                  Text(humidity.round().toString() + '%',),
                ],
              ),
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width:100,
              height: 100,
              decoration: BoxDecoration(
                
              ),
            ),
          ],
        ),
      ],
    ),
  );
  return midview;
}
