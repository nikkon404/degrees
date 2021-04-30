import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

class FlyIn extends StatelessWidget {
  final double delay;
  final Widget child;
  final bool yAxis;

  FlyIn(this.delay, this.child, {this.yAxis = true});

  @override
  Widget build(BuildContext context) {
    final tween = MultiTrackTween([
      Track("opacity")
          .add(Duration(milliseconds: 500), Tween(begin: 0.0, end: 1.0)),
      Track(yAxis ? 'translateY' : "translateX").add(
          Duration(milliseconds: 500), Tween(begin: 130.0, end: 0.0),
          curve: Curves.easeOut)
    ]);

    return CustomAnimation(
      delay: Duration(milliseconds: (80 * delay).round()),
      duration: tween.duration,
      tween: tween,
      child: child,
      builder: (context, child, animation) => Opacity(
        opacity: animation["opacity"],
        child: Transform.translate(
            offset: yAxis
                ? Offset(0, animation["translateY"])
                : Offset(animation["translateX"], 0),
            child: child),
      ),
    );
  }
}
