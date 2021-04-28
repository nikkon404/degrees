import 'package:degrees/constants.dart';
import 'package:degrees/view/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Degrees());
}

class Degrees extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: Constants.appName,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SafeArea(child: HomePage()),
    );
  }
}
