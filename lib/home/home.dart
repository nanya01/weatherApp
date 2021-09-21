import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app_example/model/weather_forecast_model.dart';
import 'package:weather_app_example/network/network.dart';
import 'package:weather_app_example/ui/bottom_view.dart';
import 'package:weather_app_example/ui/midview.dart';



class WeatherForecast extends StatefulWidget {
  @override
  _WeatherForecastState createState() => _WeatherForecastState();
}

class _WeatherForecastState extends State<WeatherForecast> {
  late  Future<WeatherForecastModel> forecastObject;
  String _cityName = 'Lagos';
 @override
  void initState() {
    // TODO: implement initState
    super.initState();
    forecastObject =  getWeatherData(cityName: _cityName);

    // forecastObject.then((weather) {
    //   print();
    // });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(3, 0, 39, 0.5),
      body: ListView(
        children: [
          textfield(),
          Container(
            child: FutureBuilder(
              future: forecastObject,
              builder: (BuildContext context, AsyncSnapshot<WeatherForecastModel> snapshot){
                if(snapshot.hasData){
                    return Center(
                      child: Column(
                        children: [
                          midView(snapshot),
                          bottomView(snapshot, context),
                        ],
                      ),
                    );
                }else{
                  return Container(
                    child: Center(child: CircularProgressIndicator(),),
                  );
                }
              }),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: null,
        items: [
          BottomNavigationBarItem(
            backgroundColor:Color.fromRGBO(3, 0, 39, 0.5),
              icon: Icon(Icons.home, color: Colors.white,),
              label: 'home',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.search, color: Colors.white24),
              label: 'search',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.video_call, color: Colors.white24),
              label: 'video'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings, color: Colors.white24),
              label: 'settings',
          ),
        ],
      ),
    );
  }

  Widget textfield(){
    return Container(
      margin: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: Colors.white,
      ),
      child: TextField(
          decoration: InputDecoration(
            hintText:'Enter a city',
            prefixIcon: Icon(Icons.search),
          ),
          onSubmitted:(value){
            setState(() {
              _cityName =  value;
              forecastObject = getWeatherData(cityName: _cityName);
            });
          }
      ),
    );
  }
 Future<WeatherForecastModel> getWeatherData({required String cityName}) async{
   forecastObject  = Network().getWeatherForecast(_cityName);

   forecastObject.then((weather)
   {
     print(weather.weather.weather[0].description);
   });

   return forecastObject;
 }
}

