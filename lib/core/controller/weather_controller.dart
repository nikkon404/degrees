import 'package:degrees/core/model/api/api_response.dart';
import 'package:degrees/core/model/weather_api/weather_info.dart';
import 'package:degrees/core/utils/constants.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class WeatherController extends GetxController {
  var _today = DateTime.now();

  ApiResponse<WeatherData> _weatherData;
  ApiResponse<WeatherData> get data => _weatherData;
  List<WeatherData> todaysData = [];
  List<WeatherData> forecastData = [];

  bool _loading = false;
  bool get isloading => _loading;

  _setLoading(bool val) {
    _loading = val;
    update();
  }

  @override
  void onInit() async {
    // var connected = await Utilities.isInternetWorking();
    // if (connected) fetchWeatherFor("Kathmandu");
    fetchWeatherFor("Kathmandu");
    super.onInit();
  }

  ///Fetch weather data from Open Weather APi
  void fetchWeatherFor(String cityName) async {
    _setLoading(true);
    var params = {"q": cityName, "appid": Constants.API_KEY, "units": "metric"};

    Uri uri = Uri.https(APIURLs.mainUrl, APIURLs.weather, params);
    print(uri);
    try {
      var apiResp = await http.get(uri);
      Map<String, dynamic> jsonObj = json.decode(apiResp.body);

      if (apiResp.statusCode == 200) {
        _weatherData = ApiResponse(true, 'Weather Data for $cityName fetched.',
            WeatherData.fromJson(jsonObj));
        
        await weatherForcastFor(cityName);
      } else {
        _weatherData = ApiResponse(false, jsonObj['message'], null);
      }
      _setLoading(false);
    } catch (e) {
      print(e.toString());

      print(e.stackTrace);
      _weatherData = ApiResponse(false, e.toString(), null);
      _setLoading(false);
    }
  }

  weatherForcastFor(String cityName) async {
    var params = {"q": cityName, "appid": Constants.API_KEY, "units": "metric"};

    Uri uri = Uri.https(APIURLs.mainUrl, APIURLs.forecast, params);
    var apiResp = await http.get(uri);
    Map<String, dynamic> jsonObj = json.decode(apiResp.body);
    if (apiResp.statusCode == 200) {
      final list = jsonObj["list"].cast<Map<String, dynamic>>();
      List<WeatherData> wList = await list
          .map<WeatherData>((json) => WeatherData.fromJson(json))
          .toList();
      todaysData.clear();
      forecastData.clear();
      wList.forEach((element) {
        var date = element.dt;

        if (date.year == _today.year &&
            date.month == _today.month &&
            date.day == _today.day) {
          todaysData.add(element);
        } else {
          forecastData.add(element);
        }
      });
    }
  }
}
