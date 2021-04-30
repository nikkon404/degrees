import 'package:degrees/view/widgets/resueables/fly_in.dart';
import 'package:degrees/view/widgets/resueables/opacity_in.dart';
import 'package:flutter/material.dart';

class GridItem extends StatelessWidget {
  final String title;
  final String value;
  final String img;

  const GridItem(this.title, this.value, this.img);
  @override
  Widget build(BuildContext context) {
    return FlyIn(
      1,
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: img.isNotEmpty
                    ? Image.asset(
                        img,
                        scale: 1.5,
                      )
                    : FlutterLogo(),
              ),
              OpacityIn(
                1,
                Text(
                  value,
                  textScaleFactor: value.length > 5 ? 1.3 : 2,
                ),
              ),
            ],
          ),
          Text(
            '$title  ',
            textScaleFactor: 0.7,
          ),
        ],
      ),
    );
  }
}
