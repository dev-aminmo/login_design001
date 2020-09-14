import 'package:flutter/material.dart';

class MyCustomBackGround extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    _drawBlackBackground(canvas, size);
    _drawBottomCurves(canvas, size);
    _drawMiddleCurves(canvas, size);
    _drawTopCurves(canvas, size);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }

  void _drawBlackBackground(Canvas canvas, Size size) {
    Paint paint = Paint();
    paint.color = Color(0xff262628);
    Rect rect = Rect.fromLTWH(0, 0, size.width, size.height);
    canvas.drawRect(rect, paint);
  }

  void _drawBottomCurves(Canvas canvas, Size size) {
    Path path = Path();
    Paint paint = Paint();
    paint.color = Color(0xFF2173d7);
    path.lineTo(0, size.height * 0.8);
    path.quadraticBezierTo(size.width * 0.07, size.height * 0.95,
        size.width * 0.2, size.height * 0.92);
    path.quadraticBezierTo(size.width * 0.3, size.height * 0.9,
        size.width * 0.32, size.height * 0.93);
    path.quadraticBezierTo(size.width * 0.35, size.height * 0.97,
        size.width * 0.46, size.height * 0.94);
    path.quadraticBezierTo(size.width * 0.75, size.height * 0.86,
        size.width * 0.78, size.height * 0.95);
    path.quadraticBezierTo(size.width * 0.8, size.height * 0.99,
        size.width * 0.85, size.height * 0.98);
    path.quadraticBezierTo(
        size.width * 0.95, size.height * 0.95, size.width, size.height * 0.99);

    path.lineTo(size.width, size.height * 0.95);
    path.lineTo(size.width, size.height);

    path.lineTo(0, size.height);
    path.close();
    canvas.drawPath(path, paint);
  }

  void _drawMiddleCurves(Canvas canvas, Size size) {
    Path path = Path();
    Paint paint = Paint();
    paint.color = Color(0xffFFA810);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height * 0.4);
    path.quadraticBezierTo(size.width * 0.9, size.height * 0.3,
        size.width * 0.6, size.height * 0.37);
    path.quadraticBezierTo(size.width * 0.32, size.height * 0.44,
        size.width * 0.35, size.height * 0.32);
    path.quadraticBezierTo(size.width * 0.37, size.height * 0.25,
        size.width * 0.25, size.height * 0.28);
    path.quadraticBezierTo(size.width * 0.02, size.height * .35,
        size.width * 0.02, size.height * 0.2);

    path.close();
    canvas.drawPath(path, paint);
  }

  void _drawTopCurves(Canvas canvas, Size size) {
    Path path = Path();
    Paint paint = Paint();
    paint.color = Color(0xffEC4137);
    path.lineTo(size.width, 0);
    path.quadraticBezierTo(size.width * 0.9, size.height * .2, size.width * .7,
        size.height * 0.13);
    path.quadraticBezierTo(size.width * 0.4, size.height * 0.05,
        size.width * .3, size.height * 0.2);
    path.quadraticBezierTo(
        size.width * 0.2, size.height * .3, 0, size.height * 0.22);
    path.lineTo(0, 0);
    path.close();
    canvas.drawPath(path, paint);
  }
}
