import 'package:flutter/material.dart';
import '../../../reusables/navigation/bottom_nav_wrapper.dart';
import '../../../reusables/app_bar_pill.dart';

class HistoryLessonThree extends StatelessWidget {
  const HistoryLessonThree({super.key});

  @override
  Widget build(BuildContext context) {
    final Color green = const Color(0xFF0C4B36);

    return BottomNavWrapper(
      index: 1,
      child: Scaffold(
        appBar: AppBarPill(
          title: "Lesson 3",
          onLeadingIconPressed: () => Navigator.pop(context),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(25, 20, 25, MediaQuery.of(context).padding.bottom + 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Modern History Overview",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: green),
              ),
              const SizedBox(height: 10),
              const Text(
                "Modern history explores the last few centuries, including revolutions, independence, and global events.",
                style: TextStyle(fontSize: 16, height: 1.6),
              ),
              const SizedBox(height: 25),

              Text(
                "Key Events",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: green),
              ),
              const SizedBox(height: 8),
              const Text(
                "• Industrial Revolution – Machines and factories changed work and life.\n"
                "• World Wars – Major global conflicts that shaped nations.\n"
                "• Independence Movements – Countries gaining freedom.\n"
                "• Technology & Communication – Inventions like the internet changed the world.",
                style: TextStyle(fontSize: 16, height: 1.6),
              ),
              const SizedBox(height: 25),

              Text(
                "Exercise",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: green),
              ),
              const SizedBox(height: 8),
              const Text(
                "1. Pick one modern event and describe it in your own words.\n"
                "2. List three inventions from the past 200 years.\n"
                "3. Write one paragraph about how a historical event affects us today.\n"
                "4. Compare life 100 years ago to life today.",
                style: TextStyle(fontSize: 16, height: 1.6),
              ),
              const SizedBox(height: 60),
            ],
          ),
        ),
      ),
    );
  }
}
