import 'dart:ui';
import 'package:flutter/material.dart';

class DrawingArea {
  Offset point;
  Paint areaPaint;
  DrawingArea({required this.point, required this.areaPaint});
}

// ignore: camel_case_types
class My_TouchPad extends CustomPainter {
  List<DrawingArea> points;
  My_TouchPad({required List<DrawingArea> points})
      // ignore: unnecessary_this
      : this.points = points.toList();
  @override
  void paint(Canvas canvas, Size size) {
    Paint bg = Paint()..color = Colors.black;
    Rect rect = Rect.fromLTWH(0, 0, size.width, size.height);
    canvas.drawRect(rect, bg);
    canvas.clipRect(rect);
    for (var i = 0; i < points.length - 1; i++) {
      if (points[i].point != Offset.zero &&
          points[i + 1].point != Offset.zero) {
        canvas.drawLine(
            points[i].point, points[i + 1].point, points[i].areaPaint);
      } else if (points[i].point != Offset.zero &&
          points[i + 1].point == Offset.zero) {
        canvas.drawPoints(
            PointMode.points, [points[i].point], points[i].areaPaint);
      }
    }
  }

  @override
  bool shouldRepaint(My_TouchPad oldDelegate) {
    return oldDelegate.points != points;
  }
}
