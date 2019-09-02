import 'package:flutter/material.dart';

class CrossAnimation extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => CrossAnimationState();
}

class CrossAnimationState extends State<CrossAnimation> with SingleTickerProviderStateMixin {
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
    return CustomPaint(painter: CrossAnimationPainter(_fraction));
  }
}

class CrossAnimationPainter extends CustomPainter {
  Paint _paint;
  double _fraction;

  CrossAnimationPainter(this._fraction) {
    _paint = Paint()
      ..color = Colors.red
      ..strokeWidth = 5.0
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;
  }

  @override
  void paint(Canvas canvas, Size size) {
    double leftLineFraction, rightLineFraction;

    if (_fraction < .5) {
      leftLineFraction = _fraction / .5;
      rightLineFraction = 0.0;
    } else {
      leftLineFraction = 1.0;
      rightLineFraction = (_fraction - .5) / .5;
    }

    canvas.drawLine(Offset(0.0, 0.0), Offset(size.width * leftLineFraction, size.height * leftLineFraction), _paint);

    if (_fraction >= .5) {
      canvas.drawLine(Offset(size.width, 0.0),
          Offset(size.width - size.width * rightLineFraction, size.height * rightLineFraction), _paint);
    }
  }

  @override
  bool shouldRepaint(CrossAnimationPainter oldDelegate) {
    return oldDelegate._fraction != _fraction;
  }
}
