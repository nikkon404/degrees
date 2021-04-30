import 'package:degrees/core/model/weather_api/weather_info.dart';
import 'package:degrees/view/widgets/resueables/fly_in.dart';
import 'package:degrees/view/widgets/resueables/opacity_in.dart';
import 'package:flutter/material.dart';

class WeatherView extends StatelessWidget {
  final WeatherData data;

  const WeatherView({Key key, @required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(data.weather.length);
    data.weather.forEach((element) => print(element.toJson()));
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          child: Column(
        children: [
          OpacityIn(
              2,
              Text(
                data.cityName + ', ' + data.sys.country,
                textScaleFactor: 1,
              )),
    

          FlyIn(
            1.0,
            Image.network(
              data.weather.first.icon,
              scale: 1,
            ),
          ),
          FlyIn(
            2.0,
            Text(
              data.primary.temp.toStringAsFixed(0) + ' °C',
              textScaleFactor: 4.5,
            ),
          ),
          FlyIn(
            2.5,
            Text(
              data.weather.first.description.toUpperCase() ,
              textScaleFactor: 1.5,
            ),
            yAxis: false,
          ),
        ],
      )),
    );
  }
}
