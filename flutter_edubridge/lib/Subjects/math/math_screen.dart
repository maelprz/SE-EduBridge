import 'package:flutter/material.dart';
import '../../reusables/bottom_nav_wrapper.dart';
import '../../reusables/app_bar_pill.dart';
import 'math_lessons/math_lesson_one.dart';
import 'math_lessons/math_lesson_two.dart';
import 'math_lessons/math_lesson_three.dart';

class MathSubject extends StatelessWidget {
  const MathSubject({super.key});

  final Color green = const Color(0xFF0C4B36);
  final Color lightGreen = const Color(0xFFE8EEEA);

  @override
  Widget build(BuildContext context) {
    return BottomNavWrapper(
      index: 1,
      child: Scaffold(
        appBar: AppBarPill(
          title: "Math",
          onLeadingIconPressed: () => Navigator.pop(context),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Math",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w900,
                    color: green,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  "Welcome to Math Class!\n"
                  "This course helps students understand mathematical concepts, solve problems, "
                  "and develop logical thinking. Learn numbers, operations, equations, and real-world applications.",
                  style: const TextStyle(fontSize: 16, height: 1.5),
                ),
                const SizedBox(height: 20),

                sectionCard(
                  title: "Course Objective",
                  icon: Icons.calculate,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text("• Understand basic arithmetic operations"),
                      Text("• Solve equations and word problems"),
                      Text("• Develop logical and critical thinking"),
                      Text("• Apply math to everyday situations"),
                    ],
                  ),
                ),
                const SizedBox(height: 12),

                sectionCard(
                  title: "Announcements",
                  icon: Icons.campaign,
                  child: const Text("No announcements yet. Stay tuned!"),
                ),
                const SizedBox(height: 12),

                sectionCard(
                  title: "Lessons",
                  icon: Icons.menu_book,
                  child: Column(
                    children: [
                      lessonButton(context, "Lesson 1: Numbers & Operations", const MathLessonOne()),
                      lessonButton(context, "Lesson 2: Fractions & Decimals", const MathLessonTwo()),
                      lessonButton(context, "Lesson 3: Word Problems & Applications", const MathLessonThree()),
                    ],
                  ),
                ),
                const SizedBox(height: 12),

                sectionCard(
                  title: "Quizzes",
                  icon: Icons.quiz,
                  child: const Text("Quiz list will appear here soon."),
                ),
                const SizedBox(height: 12),

                sectionCard(
                  title: "Assignments",
                  icon: Icons.assignment,
                  child: const Text("Assignments will be posted here once available."),
                ),
                const SizedBox(height: 80),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget sectionCard({required String title, required IconData icon, required Widget child}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: lightGreen,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: green, width: 2),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 13),
            offset: const Offset(0, 3),
            blurRadius: 6,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: green),
              const SizedBox(width: 10),
              Text(
                title,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w800,
                  color: green,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          child,
        ],
      ),
    );
  }

  Widget lessonButton(BuildContext context, String title, Widget screen) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) => screen));
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: green,
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(color: green, width: 1.8),
          ),
          elevation: 3,
        ),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
          ),
        ),
      ),
    );
  }
}
