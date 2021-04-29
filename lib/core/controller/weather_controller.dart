import 'package:degrees/core/model/api/api_response.dart';
import 'package:degrees/core/model/weather_api/weather_info.dart';
import 'package:degrees/core/utils/constants.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class WeatherController extends GetxController {
  Future<ApiResponse<WeatherData>> getWeatherData(String cityName) async {
    var params = {
      "q": cityName,
      "appid": Constants.apiKey,
      "units": "metric",
    };
    Uri uri = Uri.https(APIURLs.mainUrl, APIURLs.endpoint, params);
    print(uri);
    try {
      var apiResp = await http.get(uri);
      Map<String, dynamic> jsonObj = json.decode(apiResp.body);

      if (apiResp.statusCode == 200) {
        print(jsonObj);
        return ApiResponse(false, 'Weather Data for $cityName fetched.',
            WeatherData.fromJson(jsonObj));
      } else {
        print(apiResp.body);
        return ApiResponse(false, jsonObj['message'], null);
      }
    } catch (e) {
      print(e.message);
      return ApiResponse(false, e.message, null);
    }
  }
}
