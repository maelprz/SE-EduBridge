import 'package:flutter/material.dart';
import '../../../reusables/navigation/bottom_nav_wrapper.dart';
import '../../../reusables/app_bar_pill.dart';
import 'math_lesson_two.dart';

class MathLessonOne extends StatelessWidget {
  const MathLessonOne({super.key});

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
                "Introduction to Math",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: green,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "Mathematics is the study of numbers, shapes, and patterns. "
                "It helps us solve problems, understand the world, and think logically. "
                "In this lesson, we will explore basic concepts of numbers and operations.",
                style: TextStyle(fontSize: 16, height: 1.6),
              ),
              const SizedBox(height: 25),

              Text(
                "Why Math is Important",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: green,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                "• Problem Solving: Math teaches you to analyze and solve problems.\n"
                "• Everyday Use: Math is everywhere — in shopping, cooking, and measuring.\n"
                "• Logical Thinking: Math develops reasoning skills.\n"
                "• Career Opportunities: Many fields require math skills.",
                style: TextStyle(fontSize: 16, height: 1.6),
              ),
              const SizedBox(height: 25),

              Text(
                "Numbers and Operations",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: green,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                "1. Whole Numbers – Numbers without fractions or decimals (0, 1, 2, ...).\n"
                "2. Integers – Whole numbers including negatives (... -2, -1, 0, 1, 2 ...).\n"
                "3. Addition – Combining numbers to get a sum.\n"
                "4. Subtraction – Finding the difference between numbers.\n"
                "5. Multiplication – Repeated addition.\n"
                "6. Division – Splitting into equal parts.",
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
                "Solve the following:\n"
                "1. 12 + 7 = ?\n"
                "2. 20 - 8 = ?\n"
                "3. 5 × 6 = ?\n"
                "4. 24 ÷ 4 = ?\n"
                "5. What is the difference between an integer and a whole number?",
                style: TextStyle(fontSize: 16, height: 1.6),
              ),
              const SizedBox(height: 30),

              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MathLessonTwo(),
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
