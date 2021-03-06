import 'package:cached_network_image/cached_network_image.dart';
import 'package:degrees/core/controller/weather_controller.dart';
import 'package:degrees/core/model/weather_api/weather_info.dart';
import 'package:degrees/core/utils/constants.dart';
import 'package:degrees/core/utils/utils.dart';
import 'package:degrees/view/widgets/resueables/fly_in.dart';
import 'package:degrees/view/widgets/resueables/loading_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:get/get.dart';

import 'grid_item.dart';

class SwipeWidget extends StatelessWidget {
  final WeatherData data = Get.find<WeatherController>().data.response;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    Widget firstItem() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          FlyIn(
            1.0,
            CachedNetworkImage(
              imageUrl: data.weather.first.icon,
              placeholder: (context, url) => loadingIcon(),
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
          FlyIn(
            3.5,
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(
                'wind - ' + data.wind.speed.toStringAsFixed(0) + 'm/s ',
                textScaleFactor: 0.8,
              ),
              RotationTransition(
                turns: AlwaysStoppedAnimation(data.wind.deg / 360),
                child: Icon(Icons.arrow_upward_rounded, size: 12.5),
              )
            ]),
            yAxis: false,
          ),
        ],
      );
    }

    Widget secondItem() {
      return Padding(
        padding: const EdgeInsets.all(18.0),
        child: GridView.count(
            crossAxisCount: 2,
            childAspectRatio: (4 / 2.6),
            crossAxisSpacing: 1,
            mainAxisSpacing: 1,
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
      );
    }

    final List<Widget> swiperItems = [firstItem(), secondItem()];
    return Container(
      height: size.height * 0.50,
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
