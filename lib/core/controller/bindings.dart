import 'package:degrees/core/controller/weather_controller.dart';
import 'package:get/get.dart';

class ControllerBindings implements Bindings {
  @override
  void dependencies() {
    Get.put<WeatherController>(WeatherController(), permanent: true);
  }
}
