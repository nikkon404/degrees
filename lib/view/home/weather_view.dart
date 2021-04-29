import 'package:degrees/core/model/weather_api/weather_info.dart';
import 'package:flutter/material.dart';

class WeatherView extends StatelessWidget {
  final WeatherData data;

  const WeatherView({Key key, @required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          child: Column(
        children: [
          Text(
            data.cityName + ', ' + data.sys.country,
            textScaleFactor: 1,
          ),
          Text(
            data.primary.temp.toString() + ' °C',
            textScaleFactor: 3,
          ),
          Text(
            data.weather.first.description,
            textScaleFactor: 1,
          ),
        ],
      )),
    );
  }
}
