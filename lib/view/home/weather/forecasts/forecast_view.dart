import 'package:cached_network_image/cached_network_image.dart';
import 'package:degrees/core/model/weather_api/weather_info.dart';
import 'package:degrees/core/utils/utils.dart';
import 'package:degrees/view/widgets/resueables/fly_in.dart';
import 'package:flutter/material.dart';
import 'package:degrees/view/widgets/resueables/loading_icon.dart';

class ForecastView extends StatelessWidget {
  final List<WeatherData> forecasts;

  const ForecastView({Key key, this.forecasts}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(brightness: Brightness.light),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Divider(
              color: Colors.white,
              height: 7,
            ),
            Row(children: <Widget>[
              Expanded(
                child: new Container(
                    margin: const EdgeInsets.only(left: 10.0, right: 15.0),
                    child: Divider(
                      indent: 9,
                      color: Colors.white,
                      height: 50,
                    )),
              ),
              Text("Forecast"),
              Expanded(
                child: new Container(
                    margin: const EdgeInsets.only(left: 15.0, right: 10.0),
                    child: Divider(
                      color: Colors.white,
                      endIndent: 9,
                      height: 50,
                    )),
              ),
            ]),
            ListView.builder(
              scrollDirection: Axis.vertical,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: forecasts.length,
              itemBuilder: (BuildContext context, int index) {
                var item = forecasts[index];
                return FlyIn(
                  index.toDouble(),
                  Card(
                    color: Colors.white.withOpacity(0.5),
                    child: ListTile(
                      leading: CachedNetworkImage(
                        imageUrl: item.weather.first.icon,
                        placeholder: (context, url) => loadingIcon(),
                      ),
                      title: Text((Utilities.formatDate(item.dt) +
                          ' ' +
                          Utilities.formatTime(item.dt))),
                      trailing:
                          Text(item.primary.temp.toStringAsFixed(0) + '°C'),
                      subtitle: Text(item.weather.first.description),
                    ),
                  ),
                  yAxis: false,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
