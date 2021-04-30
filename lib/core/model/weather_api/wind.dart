class Wind {
  Wind({this.speed, this.deg});

  Wind.fromJson(Map<String, dynamic> json) {
    speed = double.parse(json['speed'].toString());
    deg = json['deg'];
  }

  int deg;
  double speed;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['speed'] = this.speed;
    data['deg'] = this.deg;
    return data;
  }
}
