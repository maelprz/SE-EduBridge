import 'package:flutter/material.dart';
import '../../../reusables/navigation/bottom_nav_wrapper.dart';
import '../../../reusables/app_bar_pill.dart';

class ReadingLessonThree extends StatelessWidget {
  const ReadingLessonThree({super.key});

  @override
  Widget build(BuildContext context) {
    const Color green = Color(0xFF0C4B36);

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
              // Story Reading Practice
              Text(
                "Story Reading Practice",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: green,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "In this lesson, you'll practice reading a short story and answering comprehension questions. "
                "Use the strategies from the previous lessons: skimming, scanning, understanding context, and summarizing.",
                style: TextStyle(fontSize: 16, height: 1.6),
              ),
              const SizedBox(height: 25),

              // Short Story
              Text(
                "Short Story",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: green,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                "\"It was a chilly autumn morning when Daniel decided to take a walk through the forest near his home. "
                "The leaves crunched beneath his feet, and the crisp air filled his lungs. "
                "He noticed squirrels darting up trees and birds hopping from branch to branch. "
                "As he walked deeper into the woods, he discovered a small, hidden pond shimmering in the sunlight. "
                "The peaceful scene made him pause and appreciate the simple beauty of nature.\"",
                style: TextStyle(fontSize: 16, height: 1.6),
              ),
              const SizedBox(height: 25),

              // Comprehension Questions
              Text(
                "Comprehension Questions",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: green,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                "1. What season is described in the story?\n"
                "2. How does Daniel feel as he walks through the forest?\n"
                "3. List two things Daniel observes in the forest.\n"
                "4. Why does the pond make him pause?\n"
                "5. Summarize the story in 2-3 sentences.",
                style: TextStyle(fontSize: 16, height: 1.6),
              ),
              const SizedBox(height: 25),

              // Mini Activity
              Text(
                "Mini Activity",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: green,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                "Find a short story or article online or in a book. "
                "• Skim it first to get the main idea.\n"
                "• Scan for 3 important details.\n"
                "• Read it carefully and summarize in your own words.\n"
                "• Highlight new vocabulary and try to understand it using context clues.",
                style: TextStyle(fontSize: 16, height: 1.6),
              ),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
