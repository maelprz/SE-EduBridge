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
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
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
                  "This course is designed to help students understand mathematical concepts, "
                  "solve problems, and develop logical thinking. Students will learn numbers, "
                  "operations, equations, and real-world applications.",
                  style: const TextStyle(fontSize: 16, height: 1.5),
                ),
                const SizedBox(height: 25),

                // Course Objective
                ExpansionTile(
                  tilePadding: EdgeInsets.zero,
                  title: Text(
                    "Course Objective",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w800,
                      color: green,
                    ),
                  ),
                  children: const [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      child: Text(
                        "• Understand basic arithmetic operations\n"
                        "• Solve equations and word problems\n"
                        "• Develop logical and critical thinking\n"
                        "• Apply math to everyday situations",
                        style: TextStyle(fontSize: 16, height: 1.4),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 10),

                // Announcements
                ExpansionTile(
                  tilePadding: EdgeInsets.zero,
                  title: Text(
                    "Announcements",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w800,
                      color: green,
                    ),
                  ),
                  children: const [
                    Padding(
                      padding: EdgeInsets.all(12),
                      child: Text(
                        "No announcements yet. Stay tuned!",
                        style: TextStyle(fontSize: 16, height: 1.4),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 10),

                // Lessons
                ExpansionTile(
                  tilePadding: EdgeInsets.zero,
                  title: Text(
                    "Lessons",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w800,
                      color: green,
                    ),
                  ),
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const MathLessonOne(),
                                ),
                              );
                            },
                            child: const Text(
                              "Lesson 1: Numbers & Operations",
                              style: TextStyle(
                                fontSize: 16,
                                height: 1.4,
                                color: Colors.blue,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                          const SizedBox(height: 6),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const MathLessonTwo(),
                                ),
                              );
                            },
                            child: const Text(
                              "Lesson 2: Fractions & Decimals",
                              style: TextStyle(
                                fontSize: 16,
                                height: 1.4,
                                color: Colors.blue,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                          const SizedBox(height: 6),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const MathLessonThree(),
                                ),
                              );
                            },
                            child: const Text(
                              "Lesson 3: Word Problems & Applications",
                              style: TextStyle(
                                fontSize: 16,
                                height: 1.4,
                                color: Colors.blue,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 10),

                // Quizzes
                ExpansionTile(
                  tilePadding: EdgeInsets.zero,
                  title: Text(
                    "Quizzes",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w800,
                      color: green,
                    ),
                  ),
                  children: const [
                    Padding(
                      padding: EdgeInsets.all(12),
                      child: Text(
                        "Quiz list will appear here soon.",
                        style: TextStyle(fontSize: 16, height: 1.4),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 10),

                // Assignments
                ExpansionTile(
                  tilePadding: EdgeInsets.zero,
                  title: Text(
                    "Assignments",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w800,
                      color: green,
                    ),
                  ),
                  children: const [
                    Padding(
                      padding: EdgeInsets.all(12),
                      child: Text(
                        "Assignments will be posted here once available.",
                        style: TextStyle(fontSize: 16, height: 1.4),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
