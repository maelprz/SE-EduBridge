import 'package:flutter/material.dart';
import '../../../reusables/bottom_nav_wrapper.dart';
import '../../../reusables/app_bar_pill.dart';
import 'math_lesson_three.dart';

class MathLessonTwo extends StatelessWidget {
  const MathLessonTwo({super.key});

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
                "Fractions & Decimals",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: green,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "Fractions and decimals are ways to represent parts of a whole. "
                "Understanding them helps with dividing, measuring, and everyday math tasks.",
                style: TextStyle(fontSize: 16, height: 1.6),
              ),
              const SizedBox(height: 25),

              Text(
                "Fractions",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: green,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                "• A fraction represents a part of a whole (e.g., 1/2, 3/4).\n"
                "• The top number is the numerator (parts we have).\n"
                "• The bottom number is the denominator (total parts).\n"
                "• Example: 3/4 means 3 out of 4 equal parts.",
                style: TextStyle(fontSize: 16, height: 1.6),
              ),
              const SizedBox(height: 25),

              Text(
                "Decimals",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: green,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                "• A decimal is another way to show parts of a whole using a dot (e.g., 0.5, 0.75).\n"
                "• 0.5 = 1/2, 0.25 = 1/4\n"
                "• Decimals are often used in money, measurements, and science.",
                style: TextStyle(fontSize: 16, height: 1.6),
              ),
              const SizedBox(height: 25),

              Text(
                "Math Exercise",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: green,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                "1. Shade 1/3 of a rectangle.\n"
                "2. Write 0.75 as a fraction.\n"
                "3. Convert 2/5 to a decimal.\n"
                "4. Add: 1/2 + 3/4 = ?\n"
                "5. Subtract: 0.8 - 0.25 = ?",
                style: TextStyle(fontSize: 16, height: 1.6),
              ),
              const SizedBox(height: 30),

              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MathLessonThree(),
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
