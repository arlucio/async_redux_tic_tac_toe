import 'dart:math';

import 'package:flutter/material.dart';

class CircleAnimation extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => CircleAnimationState();
}

class CircleAnimationState extends State<CircleAnimation> with SingleTickerProviderStateMixin {
  double _fraction = 0.0;
  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(duration: Duration(milliseconds: 300), vsync: this);

    animation = Tween(begin: 0.0, end: 1.0).animate(controller)
      ..addListener(() {
        setState(() {
          _fraction = animation.value;
        });
      });

    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(painter: CircleAnimationPainter(_fraction));
  }
}

class CircleAnimationPainter extends CustomPainter {
  Paint _paint;
  double _fraction;

  CircleAnimationPainter(this._fraction) {
    _paint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 5.0
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;
  }

  @override
  void paint(Canvas canvas, Size size) {
    var rect = Offset(0.0, 0.0) & size;

    canvas.drawArc(rect, -pi / 2, pi * 2 * _fraction, false, _paint);
  }

  @override
  bool shouldRepaint(CircleAnimationPainter oldDelegate) {
    return oldDelegate._fraction != _fraction;
  }
}
