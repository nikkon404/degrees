import 'primary.dart';
import 'rain.dart';
import 'weather.dart';
import 'wind.dart';
import 'clouds.dart';
import 'sys.dart';

class WeatherData {
  List<Weather> weather;
  Primary primary;
  int visibility;
  Wind wind;
  Rain rain;
  Clouds clouds;
  int dt;
  Sys sys;
  int timezone;

  WeatherData(
      {this.weather,
      this.primary,
      this.visibility,
      this.wind,
      this.rain,
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
    primary = json['main'] != null ? new Primary.fromJson(json['main']) : null;
    visibility = json['visibility'];
    wind = json['wind'] != null ? new Wind.fromJson(json['wind']) : null;
    rain = json['rain'] != null ? new Rain.fromJson(json['rain']) : null;
    clouds =
        json['clouds'] != null ? new Clouds.fromJson(json['clouds']) : null;
    dt = json['dt'];
    sys = json['sys'] != null ? new Sys.fromJson(json['sys']) : null;
    timezone = json['timezone'];
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
    if (this.rain != null) {
      data['rain'] = this.rain.toJson();
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
