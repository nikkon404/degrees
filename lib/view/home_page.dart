import 'package:degrees/core/controller/weather_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  final TextEditingController _searchController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: _searchController,
        ),
        actions: [
          IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                FocusScope.of(context).unfocus();
                if (_searchController.text.isNotEmpty) {
                  Get.find<WeatherController>()
                      .getWeatherData(_searchController.text);
                }
              })
        ],
      ),
      body: Center(child: Text('Home Page')),
    );
  }
}
