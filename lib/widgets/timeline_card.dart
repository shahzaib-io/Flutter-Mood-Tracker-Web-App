import 'package:flutter/material.dart';
import '../models/mood_model.dart';
import '../painters/mood_painter.dart';

class TimelineCard extends StatelessWidget {
  final MoodEntry entry;
  final Color color;
  final bool isAnimated;
  final VoidCallback onTap;

  const TimelineCard({
    super.key,
    required this.entry,
    required this.color,
    required this.isAnimated,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedScale(
        duration: const Duration(milliseconds: 300),
        scale: isAnimated ? 1.2 : 1,
        child: Container(
          width: 120,
          margin: const EdgeInsets.only(right: 16),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: color, width: 2),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 60,
                height: 60,
                child: CustomPaint(painter: MoodPainter(entry.mood)),
              ),
              const SizedBox(height: 16),
              Text(
                '${entry.date.day}/${entry.date.month}',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
