import 'package:flutter/material.dart';
import 'package:weather_app_example/home/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: const TextTheme(
          body1: TextStyle(
            color: Colors.white,
            fontSize: 15,
          ),
        ),
      ),
      home: WeatherForecast(),
    );
  }
}

