
class WeatherForecastModel{
  Coord coord;
  WeatherList weather;
  String base;
  Main main;
  int visibility;
  Wind wind;
  Clouds clouds;
  int dt;
  Sys sys;
  int timezone;
  int id;
  String name;
  int cod;

  WeatherForecastModel({
    required this.coord,
    required this.weather,
    required this.base,
    required this.main,
    required this.visibility,
    required this.wind,
    required this.clouds,
    required this.dt,
    required this.sys,
    required this.timezone,
    required this.id,
    required this.name,
    required this.cod,});

    factory WeatherForecastModel.fromJson(Map<String, dynamic> json){
    return  WeatherForecastModel(
        coord : new Coord.fromJson(json['coord']),
        weather: new WeatherList.fromJson(json['weather']),
        base: json['base'],
        main: new Main.fromJson(json['main']),
        visibility: json['visibility'],
        wind: new Wind.fromJson(json['wind']),
        clouds: new Clouds.fromJson(json['clouds']),
        dt: json['dt'],
        sys:  new Sys.fromJson(json['sys']),
        timezone: json['timezone'],
        id: json['id'],
        name : json['name'],
        cod: json['cod']

    );
  }

}



class Coord{
  double lon;
  double lat;

  Coord({required this.lon, required this.lat});

  factory Coord.fromJson(Map<String, dynamic> json){
    return Coord(
      lon: json['lon'],
      lat: json['lat']
    );
  }
}

class Weather{
  int id;
  String main;
  String description;
  String icon;

  Weather({required this.id, required this.main, required this.description, required this.icon});

  factory Weather.fromJson(Map<String, dynamic> json){
    return Weather(
        id: json['id'],
        main: json['main'],
        description: json['description'],
        icon: json['icon']);
  }
}

class WeatherList{
  final List<Weather> weather;

  WeatherList({required this.weather});

  factory WeatherList.fromJson(List<dynamic> parsedJson) {
    List<Weather> weather = <Weather>[];
    weather = parsedJson.map((i) => Weather.fromJson(i)).toList();
    return new WeatherList(weather: weather);
  }
}

class Main{
  double temp;
  double feelsLike;
  double tempMin;
  double tempMax;
  int pressure;
  int humidity;

  Main({required this.temp, required this.feelsLike, required this.tempMin, required this.tempMax, required this.pressure, required this.humidity});

  factory Main.fromJson(Map<String, dynamic> json){
    return Main(
      temp: json['temp'],
      feelsLike: json['feels_like'],
      tempMin: json['temp_min'],
      tempMax: json['temp_max'],
      pressure:json['pressure'],
      humidity: json['humidity']
    );
  }
}


class Wind{
  double speed;
  int deg;

  Wind({required this.speed, required this.deg});

  factory Wind.fromJson(Map<String, dynamic> json){
    return Wind(
      speed: json['speed'],
      deg:  json['deg']
    );
  }
}

class Clouds {
  int all;
  Clouds({required this.all});
  factory Clouds.fromJson(Map<String, dynamic> json) {
    return Clouds(
        all : json['all']
    );
  }

}


class Sys {
  String country;
  int sunrise;
  int sunset;

  Sys({required this.country, required this.sunrise, required this.sunset});

  factory Sys.fromJson(Map<String, dynamic> json) {
    return Sys(
        country : json['country'],
        sunrise : json['sunrise'],
        sunset : json['sunset']
    );
  }}
