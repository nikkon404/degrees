import 'package:degrees/core/controller/weather_controller.dart';
import 'package:degrees/core/utils/utils.dart';
import 'package:degrees/view/home/weather/weather_view.dart';
import 'package:degrees/view/widgets/resueables/loading_icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  final TextEditingController _searchController = new TextEditingController();
  final controller = Get.find<WeatherController>();
  @override
  Widget build(BuildContext context) {
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

    Widget searchField() {
      return TextField(
        onSubmitted: _search,
        decoration: InputDecoration(
          prefixIcon: Hero(tag: 'icon', child: Icon(Icons.location_city)),
          labelText: 'City Name',
        ),
        controller: _searchController,
      );
    }

    Widget viewLoader() {
      if (controller.isloading || controller.data == null) {
        return loadingIcon();
      } else {
        if (controller.data.success) {
          return WeatherView();
        } else {
          return Text(controller.data.message);
        }
      }
    }

    Widget notConnected() {
      return Text('Not Connected');
    }

    return Scaffold(
      appBar: AppBar(
        excludeHeaderSemantics: true,
        backgroundColor: Colors.transparent,
        title: searchField(),
        actions: [
          IconButton(
              icon: Icon(Icons.clear),
              onPressed: () => (_searchController.clear()))
        ],
      ),
      body: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.black12, Colors.black])),
          child: GetBuilder<WeatherController>(
            builder: (_) {
              return FutureBuilder<bool>(
                future: Utilities.isInternetWorking(),
                builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
                  if (snapshot.hasData) {
                    var connected = snapshot.data;
                    if (connected) {
                      return viewLoader();
                    } else {
                      return notConnected();
                    }
                  }
                  return loadingIcon();
                },
              );
            },
          )),
    );
  }
}
