import 'dart:math';
import 'package:flutter/material.dart';

class MoodPainter extends CustomPainter {
  final String mood;

  MoodPainter(this.mood);

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;

    final facePaint = Paint()
      ..color = mood == 'happy'
          ? Colors.orange
          : mood == 'neutral'
          ? Colors.blue
          : Colors.grey
      ..style = PaintingStyle.fill;

    canvas.drawCircle(center, radius, facePaint);

    final eyePaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.fill;

    canvas.drawCircle(
      Offset(size.width * 0.35, size.height * 0.4),
      4,
      eyePaint,
    );

    canvas.drawCircle(
      Offset(size.width * 0.65, size.height * 0.4),
      4,
      eyePaint,
    );

    final mouthPaint = Paint()
      ..color = Colors.black
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    if (mood == 'happy') {
      canvas.drawArc(
        Rect.fromCenter(
          center: Offset(size.width / 2, size.height * 0.6),
          width: 30,
          height: 20,
        ),
        0,
        pi,
        false,
        mouthPaint,
      );
    } else if (mood == 'neutral') {
      canvas.drawLine(
        Offset(size.width * 0.35, size.height * 0.7),
        Offset(size.width * 0.65, size.height * 0.7),
        mouthPaint,
      );
    } else {
      canvas.drawArc(
        Rect.fromCenter(
          center: Offset(size.width / 2, size.height * 0.8),
          width: 30,
          height: 20,
        ),
        pi,
        pi,
        false,
        mouthPaint,
      );
    }
    final eyebrowPaint = Paint()
      ..color = Colors.black
      ..strokeWidth = 2;

    if (mood == 'sad') {
      canvas.drawLine(
        Offset(size.width * 0.25, size.height * 0.28),
        Offset(size.width * 0.42, size.height * 0.32),
        eyebrowPaint,
      );

      canvas.drawLine(
        Offset(size.width * 0.58, size.height * 0.32),
        Offset(size.width * 0.75, size.height * 0.28),
        eyebrowPaint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
