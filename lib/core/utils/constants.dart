class Constants {
  static const String APP_NAME = 'Degrees';
  static const String API_KEY = "9dcad0af8fb92ec9c3659f5a7884d75e";
}

class APIURLs {
  static final String mainUrl = 'api.openweathermap.org';
  static final String _endpoint = '/data/2.5/';

  static final String weather = _endpoint + 'weather';
  static final String forecast = _endpoint + 'forecast';
  static final String iconPrefix = 'http://openweathermap.org/img/wn/';
}

class Assets {
  static final String appIcon = 'assets/app_icon.png';
  static final String pressureIcon = 'assets/ic_pressure.png';
  static final String humidityIcon = 'assets/ic_humidity.png';
  static final String minTempIcon = 'assets/ic_min_temp.png';
  static final String maxTempIcon = 'assets/ic_max_temp.png';
  static final String sunriseIcon = 'assets/ic_sunrise.png';
  static final String sunsetIcon = 'assets/ic_sunset.png';
}
