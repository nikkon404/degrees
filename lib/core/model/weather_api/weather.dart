import 'package:degrees/core/utils/constants.dart';

class Weather {
  String main;
  String description;
  String icon;

  Weather({this.main, this.description, this.icon});

  Weather.fromJson(Map<String, dynamic> json) {
    main = json['main'];
    description = json['description'];
    icon = APIURLs.iconPrefix + json['icon'] + '@4x.png';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['main'] = this.main;
    data['description'] = this.description;
    data['icon'] = this.icon;
    return data;
  }
}
