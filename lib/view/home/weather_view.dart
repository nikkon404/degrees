import 'package:degrees/core/controller/weather_controller.dart';
import 'package:degrees/core/utils/utils.dart';
import 'package:degrees/view/home/forecast_view.dart';
import 'package:degrees/view/home/today_view.dart';
import 'package:degrees/view/widgets/resueables/fly_in.dart';
import 'package:degrees/view/widgets/resueables/opacity_in.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WeatherView extends StatelessWidget {
  final controller = Get.find<WeatherController>();
  @override
  Widget build(BuildContext context) {
    final data = controller.data.response;

    print('f list is ' + controller.foreCast.length.toString());

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Scrollbar(
        child: SingleChildScrollView(
          child: Container(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
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
                1.6,
                Text(
                  Utilities.formatDate(data.dt) +
                      ', ' +
                      Utilities.formatTime(data.dt),
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
                  data.weather.first.description.toUpperCase(),
                  textScaleFactor: 1.5,
                ),
                yAxis: false,
              ),
              TodayView(
                todayData: controller.todaysData,
              ),
              ForecastView(
                forcasts: controller.foreCast,
              )
            ],
          )),
        ),
      ),
    );
  }
}
