import 'package:flutter/material.dart';

Widget loadingIcon() {
  return Container(
      child: Stack(
    alignment: Alignment.center,
    children: [
      Icon(
        Icons.cloud_circle,
        size: 60,
      ),
      SizedBox(width: 70, height: 70, child: CircularProgressIndicator()),
    ],
  ));
}
