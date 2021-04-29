import 'package:degrees/core/controller/weather_controller.dart';
import 'package:degrees/core/utils/utils.dart';
import 'package:degrees/view/home/weather_view.dart';
import 'package:degrees/view/widgets/resueables/loading_icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  final TextEditingController _searchController = new TextEditingController();
  final controller = Get.find<WeatherController>();
  @override
  Widget build(BuildContext context) {
    Widget viewLoader() {
      if (controller.isloading) {
        return loadingIcon();
      } else {
        if (controller.data.success) {
          return WeatherView(data: controller.data.response);
        } else {
          return Text(controller.data.message);
        }
      }
    }

    _search(String city) async {
      FocusScope.of(context).unfocus();
      var isConnected = await Utilities.isInternetWorking();
      if (isConnected) {
        if (_searchController.text.isNotEmpty) {
          controller.fetchWeatherFor(_searchController.text);
        }
      } else {
        Utilities.showInToast('No internet Connection',
            toastPos: 1, toastType: ToastType.ERROR);
      }
    }

    return Scaffold(
        appBar: AppBar(
          excludeHeaderSemantics: true,
          backgroundColor: Colors.transparent,
          title: TextField(
            onSubmitted: _search,
            decoration: InputDecoration(
              prefixIcon: Hero(tag: 'icon', child: Icon(Icons.location_city)),
              labelText: 'City Name',
            ),
            controller: _searchController,
          ),
          actions: [
            IconButton(
                icon: Icon(Icons.clear),
                onPressed: () => (_searchController.clear()))
          ],
        ),
        body: GetBuilder<WeatherController>(
          builder: (_) {
            return Center(child: viewLoader());
          },
        ));
  }
}
