import 'package:flutter/material.dart';
import '../../../reusables/navigation/bottom_nav_wrapper.dart';
import '../../../reusables/app_bar_pill.dart';
import 'history_lesson_three.dart';

class HistoryLessonTwo extends StatelessWidget {
  const HistoryLessonTwo({super.key});

  @override
  Widget build(BuildContext context) {
    final Color green = const Color(0xFF0C4B36);

    return BottomNavWrapper(
      index: 1,
      child: Scaffold(
        appBar: AppBarPill(
          title: "Lesson 2",
          onLeadingIconPressed: () => Navigator.pop(context),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(25, 20, 25, MediaQuery.of(context).padding.bottom + 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Ancient Civilizations",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: green),
              ),
              const SizedBox(height: 10),
              const Text(
                "Ancient civilizations shaped the world with their inventions, cultures, and ideas.",
                style: TextStyle(fontSize: 16, height: 1.6),
              ),
              const SizedBox(height: 25),

              Text(
                "Famous Civilizations",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: green),
              ),
              const SizedBox(height: 8),
              const Text(
                "• Mesopotamia – Early writing, agriculture, and cities.\n"
                "• Ancient Egypt – Pyramids, pharaohs, and the Nile River.\n"
                "• Ancient Greece – Democracy, philosophy, and arts.\n"
                "• Ancient Rome – Roads, laws, and engineering.",
                style: TextStyle(fontSize: 16, height: 1.6),
              ),
              const SizedBox(height: 25),

              Text(
                "Exercise",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: green),
              ),
              const SizedBox(height: 8),
              const Text(
                "1. Choose one civilization and write three facts about it.\n"
                "2. Draw a simple pyramid or temple.\n"
                "3. Write one invention from ancient times that we still use today.\n"
                "4. Compare Ancient Greece and Rome in one paragraph.",
                style: TextStyle(fontSize: 16, height: 1.6),
              ),
              const SizedBox(height: 30),

              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const HistoryLessonThree()),
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
