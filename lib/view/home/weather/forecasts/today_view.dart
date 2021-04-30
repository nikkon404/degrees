import 'package:degrees/core/model/weather_api/weather_info.dart';
import 'package:degrees/core/utils/utils.dart';
import 'package:degrees/view/widgets/resueables/fly_in.dart';
import 'package:flutter/material.dart';

class TodayView extends StatelessWidget {
  final List<WeatherData> todayData;

  const TodayView({Key key, this.todayData}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InputDecorator(
        decoration: InputDecoration(
          labelText: 'Today',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.blue.shade600,
          ),
          height: 100.0,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: todayData.length,
            itemBuilder: (BuildContext context, int index) {
              var item = todayData[index];
              return FlyIn(
                index.toDouble(),
                Card(
                    color: Colors.transparent,
                    child: Column(
                      children: [
                        Image.network(
                          item.weather.first.icon,
                          scale: 4,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(
                              item.primary.temp.toStringAsFixed(0) + ' °C'),
                        ),
                        Text(
                          Utilities.formatTime(item.dt),
                          textScaleFactor: 0.6,
                        ),
                      ],
                    )),
              );
            },
          ),
        ),
      ),
    );
  }
}
