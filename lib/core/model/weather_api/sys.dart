class Sys {
  int type;
  String country;
  DateTime sunrise;
  DateTime sunset;

  Sys({this.type, this.country, this.sunrise, this.sunset});

  Sys.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    country = json['country'];
    sunrise = (json['sunrise']) != null
        ? DateTime.fromMillisecondsSinceEpoch(json['sunrise'] * 1000)
        : null;
    sunset = (json['sunset']) != null
        ? DateTime.fromMillisecondsSinceEpoch(json['sunset'] * 1000)
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['country'] = this.country;
    data['sunrise'] = this.sunrise;
    data['sunset'] = this.sunset;
    return data;
  }
}
