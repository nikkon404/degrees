import 'package:flutter/material.dart';

class OpacityIn extends StatefulWidget {
  final durationSec;
  final Widget child;
  OpacityIn(this.durationSec, this.child);
  @override
  _OpacityInState createState() => _OpacityInState();
}

class _OpacityInState extends State<OpacityIn> {
  var _opacity = 0.0;

  @override
  void initState() {
    Future.delayed(Duration(milliseconds: 20), () {
      setState(() {
        _opacity = 1.0;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: _opacity,
      duration: Duration(seconds: widget.durationSec),
      curve: Curves.easeInOut,
      child: widget.child,
    );
  }
}
