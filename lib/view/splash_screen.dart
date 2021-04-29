import 'package:degrees/view/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double size = 50;
  @override
  void initState() {
    Future.delayed(Duration(milliseconds: 20), () {
      setState(() {
        size = 250;
      });
    });
    Future.delayed(Duration(seconds: 2), () {
      Get.off(() => HomePage());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FlutterLogo(
          size: size,
          curve: Curves.bounceInOut,
          duration: Duration(seconds: 1),
        ),
      ),
    );
  }
}
