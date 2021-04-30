import 'package:degrees/core/controller/weather_controller.dart';
import 'package:degrees/view/home/weather/forecasts/forecast_view.dart';
import 'package:degrees/view/home/weather/forecasts/today_view.dart';
import 'package:degrees/view/widgets/resueables/opacity_in.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'swipe_widgets.dart/swipe_widget.dart';

class WeatherView extends StatelessWidget {
  final controller = Get.find<WeatherController>();
  @override
  Widget build(BuildContext context) {
    final data = controller.data.response;

    Widget title() {
      return OpacityIn(
          2,
          Text(
            data.cityName + ', ' + data.sys.country,
            textScaleFactor: 1,
          ));
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Scrollbar(
        child: SingleChildScrollView(
          child: Container(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              title(),
              SwipeWidget(),
              TodayView(
                todayData: controller.todaysData,
              ),
              ForecastView(
                forecasts: controller.forecastData,
              )
            ],
          )),
        ),
      ),
    );
  }
}
