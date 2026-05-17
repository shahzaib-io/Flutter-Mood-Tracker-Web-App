import 'package:flutter/material.dart';
import '../models/mood_model.dart';
import '../widgets/mood_button.dart';
import '../widgets/timeline_card.dart';

class MoodTrackerScreen extends StatefulWidget {
  const MoodTrackerScreen({super.key});

  @override
  State<MoodTrackerScreen> createState() => _MoodTrackerScreenState();
}

class _MoodTrackerScreenState extends State<MoodTrackerScreen> {
  final List<MoodEntry> entries = [];

  int? animatedIndex;

  void addMood(String mood) {
    setState(() {
      entries.insert(0, MoodEntry(mood: mood, date: DateTime.now()));
      if (entries.length > 7) {
        entries.removeLast();
      }
    });
  }

  void animateItem(int index) async {
    setState(() {
      animatedIndex = index;
    });

    await Future.delayed(const Duration(milliseconds: 500));

    setState(() {
      animatedIndex = null;
    });
  }

  Color getMoodColor(String mood) {
    switch (mood) {
      case 'happy':
        return Colors.orange;
      case 'neutral':
        return Colors.blue;
      case 'sad':
        return Colors.grey;
      default:
        return Colors.black;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              const Text(
                'Mood Tracker',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Text(
                'How are you feeling today?',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MoodButton(
                    mood: 'happy',
                    color: Colors.orange,
                    onTap: () => addMood('happy'),
                  ),
                  MoodButton(
                    mood: 'neutral',
                    color: Colors.blue,
                    onTap: () => addMood('neutral'),
                  ),
                  MoodButton(
                    mood: 'sad',
                    color: Colors.grey,
                    onTap: () => addMood('sad'),
                  ),
                ],
              ),
              const SizedBox(height: 50),
              const Text(
                'Past 7 Entries',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: entries.length,
                  itemBuilder: (context, index) {
                    final entry = entries[index];

                    return TimelineCard(
                      entry: entry,
                      color: getMoodColor(entry.mood),
                      isAnimated: animatedIndex == index,
                      onTap: () => animateItem(index),
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),

              const Center(
                child: Text(
                  'Built by Muhammad Shahzaib',
                  style: TextStyle(color: Colors.grey, fontSize: 14),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
