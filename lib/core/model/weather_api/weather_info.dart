import 'primary.dart';
import 'weather.dart';
import 'wind.dart';
import 'clouds.dart';
import 'sys.dart';

class WeatherData {
  String cityName;
  List<Weather> weather;
  Primary primary;
  int visibility;
  Wind wind;
  Clouds clouds;
  DateTime dt;
  Sys sys;
  int timezone;

  WeatherData(
      {this.weather,
      this.primary,
      this.visibility,
      this.wind,
      this.clouds,
      this.dt,
      this.sys,
      this.timezone});

  WeatherData.fromJson(Map<String, dynamic> json) {
    if (json['weather'] != null) {
      weather = <Weather>[];
      json['weather'].forEach((v) {
        weather.add(new Weather.fromJson(v));
      });
    }
    primary = Primary.fromJson(json['main']);
    visibility = json['visibility'];
    wind = Wind.fromJson(json['wind']);
    clouds = Clouds.fromJson(json['clouds']);
    dt = DateTime.fromMillisecondsSinceEpoch(json['dt'] * 1000);
    if (json['sys'] != null) sys = Sys.fromJson(json['sys']);
    timezone = json['timezone'];
    cityName = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.weather != null) {
      data['weather'] = this.weather.map((v) => v.toJson()).toList();
    }
    if (this.primary != null) {
      data['main'] = this.primary.toJson();
    }
    data['visibility'] = this.visibility;
    if (this.wind != null) {
      data['wind'] = this.wind.toJson();
    }

    if (this.clouds != null) {
      data['clouds'] = this.clouds.toJson();
    }
    data['dt'] = this.dt;
    if (this.sys != null) {
      data['sys'] = this.sys.toJson();
    }
    data['timezone'] = this.timezone;
    return data;
  }
}
