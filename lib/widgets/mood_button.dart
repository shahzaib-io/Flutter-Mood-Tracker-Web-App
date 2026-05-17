import 'package:flutter/material.dart';
import '../painters/mood_painter.dart';

class MoodButton extends StatelessWidget {
  final String mood;
  final Color color;
  final VoidCallback onTap;

  const MoodButton({
    super.key,
    required this.mood,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          shape: BoxShape.circle,
          border: Border.all(color: color, width: 2),
        ),
        child: SizedBox(
          width: 70,
          height: 70,
          child: CustomPaint(painter: MoodPainter(mood)),
        ),
      ),
    );
  }
}
