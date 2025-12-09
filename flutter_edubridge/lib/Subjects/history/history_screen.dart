import 'package:flutter/material.dart';
import '../../reusables/navigation/bottom_nav_wrapper.dart';
import '../../reusables/app_bar_pill.dart';
import 'history_lessons/history_lesson_one.dart';
import 'history_lessons/history_lesson_two.dart';
import 'history_lessons/history_lesson_three.dart';

class HistorySubject extends StatelessWidget {
  const HistorySubject({super.key});

  final Color green = const Color(0xFF0C4B36);
  final Color lightGreen = const Color(0xFFE8EEEA);

  @override
  Widget build(BuildContext context) {
    return BottomNavWrapper(
      index: 1,
      child: Scaffold(
        appBar: AppBarPill(
          title: "History",
          onLeadingIconPressed: () => Navigator.pop(context),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "History",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w900,
                    color: green,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  "Welcome to History Class!\n"
                  "Explore past events, civilizations, and cultures. "
                  "Understand timelines, cause-and-effect, and the impact of history on today’s world.",
                  style: const TextStyle(fontSize: 16, height: 1.5),
                ),
                const SizedBox(height: 20),

                sectionCard(
                  title: "Course Objective",
                  icon: Icons.history_edu,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text("• Understand major events in world and local history"),
                      Text("• Learn about past civilizations and cultures"),
                      Text("• Analyze cause-and-effect relationships in history"),
                      Text("• Appreciate how history shapes our present and future"),
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
                      lessonButton(context, "Lesson 1: Introduction to History", const HistoryLessonOne()),
                      lessonButton(context, "Lesson 2: Ancient Civilizations", const HistoryLessonTwo()),
                      lessonButton(context, "Lesson 3: Modern History Overview", const HistoryLessonThree()),
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
