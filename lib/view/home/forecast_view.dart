import 'package:degrees/core/model/weather_api/weather_info.dart';
import 'package:degrees/core/utils/utils.dart';
import 'package:degrees/view/widgets/resueables/fly_in.dart';
import 'package:flutter/material.dart';

class ForecastView extends StatelessWidget {
  final List<WeatherData> forcasts;

  const ForecastView({Key key, this.forcasts}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    print('forcast list is ${forcasts.length}');
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InputDecorator(
        decoration: InputDecoration(
          labelText: 'Upcoming Days',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        child: Container(
          color: Colors.white10,
          height: 300.0,
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            // shrinkWrap: true,
            itemCount: forcasts.length,
            itemBuilder: (BuildContext context, int index) {
              var item = forcasts[index];
              return FlyIn(
                index.toDouble(),
                Card(
                    child: Column(
                  children: [
                    Image.network(
                      item.weather.first.icon,
                      scale: 4,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text(item.primary.temp.toStringAsFixed(0) + ' °C'),
                    ),
                    Text((Utilities.formatDate(item.dt) +
                        ' ' +
                        Utilities.formatTime(item.dt))),
                  ],
                )),
                yAxis: false,
              );
            },
          ),
        ),
      ),
    );
  }
}
