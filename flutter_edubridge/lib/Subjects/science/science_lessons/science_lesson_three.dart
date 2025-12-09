import 'package:flutter/material.dart';
import '../../../reusables/navigation/bottom_nav_wrapper.dart';
import '../../../reusables/app_bar_pill.dart';

class ScienceLessonThree extends StatelessWidget {
  const ScienceLessonThree({super.key});

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
          padding: EdgeInsets.fromLTRB(
            25,
            20,
            25,
            MediaQuery.of(context).padding.bottom + 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Weather, Earth & Space",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: green,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "Earth and space are full of fascinating phenomena. "
                "Weather, seasons, planets, and stars affect life on our planet.",
                style: TextStyle(fontSize: 16, height: 1.6),
              ),
              const SizedBox(height: 25),

              Text(
                "Weather & Seasons",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: green,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                "• Weather includes sun, rain, clouds, wind, and temperature.\n"
                "• Seasons occur due to Earth's tilt and orbit around the sun.\n"
                "• Seasons affect plants, animals, and human activities.",
                style: TextStyle(fontSize: 16, height: 1.6),
              ),
              const SizedBox(height: 25),

              Text(
                "Earth & Space",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: green,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                "• Earth is the third planet from the sun.\n"
                "• The moon orbits Earth and causes tides.\n"
                "• Stars and planets form the solar system and galaxies.",
                style: TextStyle(fontSize: 16, height: 1.6),
              ),
              const SizedBox(height: 25),

              Text(
                "Science Exercise",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: green,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                "1. Draw the sun, Earth, and moon showing orbits.\n"
                "2. Describe today’s weather and predict tomorrow’s.\n"
                "3. List three planets and one fact about each.\n"
                "4. Identify objects in the night sky.\n"
                "5. Explain why seasons change during the year.",
                style: TextStyle(fontSize: 16, height: 1.6),
              ),
              const SizedBox(height: 70),
            ],
          ),
        ),
      ),
    );
  }
}
