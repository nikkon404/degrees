import 'package:degrees/core/controller/bindings.dart';
import 'package:degrees/core/utils/constants.dart';
import 'package:degrees/view/home_page.dart';
import 'package:degrees/view/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(Degrees());
}

class Degrees extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: ControllerBindings(),
      debugShowCheckedModeBanner: false,
      title: Constants.appName,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SafeArea(child: SplashScreen()),
    );
  }
}
