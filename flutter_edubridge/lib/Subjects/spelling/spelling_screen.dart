import 'package:flutter/material.dart';
import '../../reusables/bottom_nav_wrapper.dart';

class SpellingSubject extends StatelessWidget {
  const SpellingSubject({super.key});

  final Color green = const Color(0xFF0C4B36);
  final Color lightGreen = const Color(0xFFE8EEEA);

  @override
  Widget build(BuildContext context) {
    return BottomNavWrapper(
      index: 1, // adjust if needed for bottom nav
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(90),
          child: Container(
            decoration: BoxDecoration(
              color: lightGreen,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.12),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              toolbarHeight: 90,
              leading: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Icon(Icons.arrow_back, size: 26, color: green),
              ),
              title: Row(
                children: [
                  const SizedBox(width: 75),
                  Text(
                    "Spelling",
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.w900,
                      color: green,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Spelling",
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.w900,
                    color: green,
                  ),
                ),

                const SizedBox(height: 8),

                Text(
                  "Welcome to Spelling Class!\n"
                  "This course is designed to help students improve their spelling skills "
                  "through interactive activities, word lists, and quizzes. Students will learn "
                  "to spell correctly, understand word patterns, and enhance their vocabulary.",
                  style: const TextStyle(fontSize: 16, height: 1.5),
                ),

                const SizedBox(height: 25),

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
                        "• Master correct spelling of common words\n"
                        "• Recognize and use spelling patterns\n"
                        "• Enhance vocabulary and word usage\n"
                        "• Build confidence in written communication",
                        style: TextStyle(fontSize: 16, height: 1.4),
                      ),
                    )
                  ],
                ),

                const SizedBox(height: 10),

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

                ExpansionTile(
                  tilePadding: EdgeInsets.zero,
                  title: Text(
                    "Modules",
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
                        "Module 1: Introduction to Spelling\n"
                        "Module 2: Common Word Lists\n"
                        "Module 3: Spelling Practice Activities",
                        style: TextStyle(fontSize: 16, height: 1.4),
                      ),
                    )
                  ],
                ),

                const SizedBox(height: 10),

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
