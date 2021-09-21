import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Widget getWeatherIcon({required String weatherDescription, required double size}){
  switch(weatherDescription){
    case "Clear":
      {return Icon(FontAwesomeIcons.sun, color: Colors.yellowAccent, size: size,);}
    break;

    case "Clouds":
      {return Icon(FontAwesomeIcons.cloud, color: Color.fromRGBO(255, 255, 255, 0.76), size: size);}
      break;

    case "Rain":
      {return Icon(FontAwesomeIcons.cloudRain, color: Color.fromRGBO(255, 255, 255, 0.76), size: size);}
      break;

    case "Snow":
      {return Icon(FontAwesomeIcons.sun, color: Colors.white70, size: size);}
      break;

    default:  {return Icon(FontAwesomeIcons.sun, color: Colors.yellowAccent, size: size);}
    break;
  }
}