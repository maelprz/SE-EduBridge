import 'package:flutter/material.dart';
import '../../../reusables/navigation/bottom_nav_wrapper.dart';
import '../../../reusables/app_bar_pill.dart';
import 'science_lesson_three.dart';

class ScienceLessonTwo extends StatelessWidget {
  const ScienceLessonTwo({super.key});

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
                "Plants, Animals & Environment",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: green,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "Plants and animals are part of our environment. "
                "We rely on them for food, oxygen, and maintaining balance in nature.",
                style: TextStyle(fontSize: 16, height: 1.6),
              ),
              const SizedBox(height: 25),

              Text(
                "Plants",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: green,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                "• Plants produce oxygen and food.\n"
                "• Leaves, stems, roots, and flowers have specific functions.\n"
                "• Plants need sunlight, water, and soil to grow.",
                style: TextStyle(fontSize: 16, height: 1.6),
              ),
              const SizedBox(height: 25),

              Text(
                "Animals",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: green,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                "• Animals need food, water, and shelter.\n"
                "• They can be herbivores, carnivores, or omnivores.\n"
                "• Animals interact with the environment and other organisms.",
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
                "1. Draw a simple food chain with plants and animals.\n"
                "2. List 5 plants and 5 animals you see around you.\n"
                "3. Describe one way humans help the environment.\n"
                "4. Observe a tree and write what parts you see.\n"
                "5. Compare two animals: what they eat and where they live.",
                style: TextStyle(fontSize: 16, height: 1.6),
              ),
              const SizedBox(height: 30),

              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ScienceLessonThree(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: green,
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  ),
                  child: const Text(
                    "Next Lesson →",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
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
