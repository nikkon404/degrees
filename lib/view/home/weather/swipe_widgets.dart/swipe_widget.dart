import 'package:degrees/core/controller/weather_controller.dart';
import 'package:degrees/core/model/weather_api/weather_info.dart';
import 'package:degrees/core/utils/constants.dart';
import 'package:degrees/core/utils/utils.dart';
import 'package:degrees/view/widgets/resueables/fly_in.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:get/get.dart';

import 'grid_item.dart';

class SwipeWidget extends StatelessWidget {
  final WeatherData data = Get.find<WeatherController>().data.response;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    final List<Widget> swiperItems = [
      Column(
        children: [
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
        ],
      ),
      Padding(
        padding: const EdgeInsets.all(22.0),
        child: GridView.count(
            crossAxisCount: 2,
            childAspectRatio: (4 / 3),
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.all(10.0),
            children: [
              GridItem('Max Temp', data.primary.tempMax.toStringAsFixed(0),
                  Assets.maxTempIcon),
              GridItem('Min Temp', data.primary.tempMin.toStringAsFixed(0),
                  Assets.minTempIcon),
              GridItem('Sunrise', Utilities.formatTime(data.sys.sunrise),
                  Assets.sunriseIcon),
              GridItem('Sunset', Utilities.formatTime(data.sys.sunset),
                  Assets.sunsetIcon),
              GridItem('Pressure', data.primary.pressure.toStringAsFixed(0),
                  Assets.pressureIcon),
              GridItem('Humidity', data.primary.humidity.toStringAsFixed(0),
                  Assets.humidityIcon),
            ]),
      )
    ];
    return Container(
      height: size.height * 0.48,
      child: Swiper(
        autoplay: true,
        autoplayDelay: 10 * 1000,
        pagination: new SwiperPagination(
          alignment: Alignment.bottomCenter,
          builder: new DotSwiperPaginationBuilder(
              size: 7, color: Colors.white, activeColor: Colors.grey.shade300),
        ),
        control: new SwiperControl(
          color: Color(0xff38547C),
        ),
        itemBuilder: (BuildContext context, int index) {
          return swiperItems[index];
        },
        loop: false,
        itemCount: swiperItems.length,
      ),
    );
  }
}
