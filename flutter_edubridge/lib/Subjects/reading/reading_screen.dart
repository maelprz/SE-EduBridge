import 'package:flutter/material.dart';
import '../../reusables/bottom_nav_wrapper.dart';
import '../../reusables/app_bar_pill.dart';
import 'reading_lessons/reading_lesson_one.dart';
import 'reading_lessons/reading_lesson_two.dart';
import 'reading_lessons/reading_lesson_three.dart';

class ReadingSubject extends StatelessWidget {
  const ReadingSubject({super.key});

  final Color green = const Color(0xFF0C4B36);
  final Color lightGreen = const Color(0xFFE8EEEA);

  @override
  Widget build(BuildContext context) {
    return BottomNavWrapper(
      index: 1,
      child: Scaffold(
        appBar: AppBarPill(
          title: "Reading",
          onLeadingIconPressed: () => Navigator.pop(context),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Reading",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w900,
                    color: green,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  "Welcome to Reading Class!\n"
                  "This course is designed to help students develop strong reading skills "
                  "through stories, poems, and informational texts. Students will learn "
                  "to understand what they read, build vocabulary, and express ideas clearly.",
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
                        "• Understand and analyze reading material\n"
                        "• Improve vocabulary and comprehension\n"
                        "• Develop confidence in reading and expression\n"
                        "• Enhance critical thinking through literature",
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
                                  builder: (context) => const ReadingLessonOne(),
                                ),
                              );
                            },
                            child: const Text(
                              "Lesson 1: Introduction to Reading",
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
                                  builder: (context) => const ReadingLessonTwo(),
                                ),
                              );
                            },
                            child: const Text(
                              "Lesson 2: Vocabulary Building",
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
                                  builder: (context) => const ReadingLessonThree(),
                                ),
                              );
                            },
                            child: const Text(
                              "Lesson 3: Story Reading Practice",
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
