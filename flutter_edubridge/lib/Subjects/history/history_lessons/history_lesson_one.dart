import 'package:flutter/material.dart';
import '../../../reusables/navigation/bottom_nav_wrapper.dart';
import '../../../reusables/app_bar_pill.dart';
import 'history_lesson_two.dart';

class HistoryLessonOne extends StatelessWidget {
  const HistoryLessonOne({super.key});

  @override
  Widget build(BuildContext context) {
    final Color green = const Color(0xFF0C4B36);

    return BottomNavWrapper(
      index: 1,
      child: Scaffold(
        appBar: AppBarPill(
          title: "Lesson 1",
          onLeadingIconPressed: () => Navigator.pop(context),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(25, 20, 25, MediaQuery.of(context).padding.bottom + 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Introduction to History",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: green),
              ),
              const SizedBox(height: 10),
              const Text(
                "History is the study of past events, people, and societies. "
                "It helps us understand how the world we live in today came to be.",
                style: TextStyle(fontSize: 16, height: 1.6),
              ),
              const SizedBox(height: 25),

              Text(
                "Why Study History?",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: green),
              ),
              const SizedBox(height: 8),
              const Text(
                "• Learn from past successes and mistakes.\n"
                "• Understand different cultures and societies.\n"
                "• Build critical thinking by analyzing events.\n"
                "• Appreciate how history shapes our world.",
                style: TextStyle(fontSize: 16, height: 1.6),
              ),
              const SizedBox(height: 25),

              Text(
                "History Skills",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: green),
              ),
              const SizedBox(height: 8),
              const Text(
                "• Observation – Look at sources carefully.\n"
                "• Chronology – Understand timelines.\n"
                "• Cause and Effect – See how events influence each other.\n"
                "• Research – Find and verify information.",
                style: TextStyle(fontSize: 16, height: 1.6),
              ),
              const SizedBox(height: 25),

              Text(
                "Exercise",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: green),
              ),
              const SizedBox(height: 8),
              const Text(
                "1. Find an event from your country’s history and write the year it happened.\n"
                "2. Describe one famous person from history and what they did.\n"
                "3. Make a small timeline of your own life events.\n"
                "4. Identify a historical event that affects your community today.",
                style: TextStyle(fontSize: 16, height: 1.6),
              ),
              const SizedBox(height: 30),

              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const HistoryLessonTwo()),
                    );
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: green, padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15)),
                  child: const Text("Next Lesson →", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
                ),
              ),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
