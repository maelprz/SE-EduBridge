import 'package:flutter/material.dart';
import '../../reusables/navigation/bottom_nav_wrapper.dart';
import '../../reusables/app_bar_pill.dart';
import 'writing_lessons/writing_lesson_one.dart';
import 'writing_lessons/writing_lesson_two.dart';
import 'writing_lessons/writing_lesson_three.dart';

class WritingSubject extends StatelessWidget {
  const WritingSubject({super.key});

  final Color green = const Color(0xFF0C4B36);
  final Color lightGreen = const Color(0xFFE8EEEA);

  @override
  Widget build(BuildContext context) {
    return BottomNavWrapper(
      index: 1,
      child: Scaffold(
        appBar: AppBarPill(
          title: "Writing",
          onLeadingIconPressed: () => Navigator.pop(context),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Writing",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w900,
                    color: green,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  "Welcome to Writing Class!\n"
                  "Develop strong writing skills through exercises, essays, and creative texts. "
                  "Learn to organize ideas, improve grammar, and express thoughts clearly.",
                  style: const TextStyle(fontSize: 16, height: 1.5),
                ),
                const SizedBox(height: 20),

                sectionCard(
                  title: "Course Objective",
                  icon: Icons.school,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text("• Develop clear and organized writing skills"),
                      Text("• Improve grammar, punctuation, and spelling"),
                      Text("• Enhance creativity through story and essay writing"),
                      Text("• Build confidence in written communication"),
                    ],
                  ),
                ),
                const SizedBox(height: 12),

                sectionCard(
                  title: "Announcements",
                  icon: Icons.campaign,
                  child: const Text(
                    "No announcements yet. Stay tuned!",
                  ),
                ),
                const SizedBox(height: 12),

                sectionCard(
                  title: "Lessons",
                  icon: Icons.menu_book,
                  child: Column(
                    children: [
                      lessonButton(
                        context,
                        "Lesson 1: Introduction to Writing",
                        const WritingLessonOne(),
                      ),
                      lessonButton(
                        context,
                        "Lesson 2: Paragraph & Essay Writing",
                        const WritingLessonTwo(),
                      ),
                      lessonButton(
                        context,
                        "Lesson 3: Creative Story Writing",
                        const WritingLessonThree(),
                      ),
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

  // Section card with shadow and rounded corners
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

  // Button-style lesson item
  Widget lessonButton(BuildContext context, String title, Widget screen) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) => screen));
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: const Color(0xFF0C4B36),
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: const BorderSide(color: Color(0xFF0C4B36), width: 1.8),
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
