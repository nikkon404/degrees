import 'package:degrees/core/utils/constants.dart';
import 'package:degrees/view/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double _size = 50;
  @override
  void initState() {
    Future.delayed(Duration(milliseconds: 20), () {
      setState(() {
        _size = 250;
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
        child: Hero(
          tag: 'icon',
          child: AnimatedContainer(
              width: _size,
              curve: Curves.easeInExpo,
              duration: Duration(seconds: 1),
              child: Image.asset(Assets.appIcon)),
        ),
      ),
    );
  }
}
