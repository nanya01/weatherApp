import 'dart:convert';

import 'package:http/http.dart';
import 'package:weather_app_example/model/weather_forecast_model.dart';
import 'package:weather_app_example/utility/forecast_util.dart';

class Network{

  Future<WeatherForecastModel> getWeatherForecast(cityName) async{
    var url ='http://api.openweathermap.org/data/2.5/weather?q=${cityName}&appid=${Util.appId}';
    Response response = await get(Uri.parse(url));
    
    if(response.statusCode == 200) {
      print('Url: ${Uri.encodeFull(url)}');
      print(response.body);
      return WeatherForecastModel.fromJson(json.decode(response.body));
    }else{
      throw new Exception('Failed to  get weather data');
    }
  }
}