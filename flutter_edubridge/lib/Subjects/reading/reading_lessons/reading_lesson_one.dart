import 'package:flutter/material.dart';
import '../../../reusables/bottom_nav_wrapper.dart';
import '../../../reusables/app_bar_pill.dart';
import 'reading_lesson_two.dart';

class ReadingLessonOne extends StatelessWidget {
  const ReadingLessonOne({super.key});

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
              // Introduction
              Text(
                "Introduction to Reading",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: green,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "Reading is the process of understanding written text. "
                "It allows us to learn new things, enjoy stories, and communicate effectively. "
                "Strong reading skills are important for school, work, and everyday life.",
                style: TextStyle(fontSize: 16, height: 1.6),
              ),
              const SizedBox(height: 25),

              // Why Reading is Important
              Text(
                "Why Reading is Important",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: green,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                "• Expands knowledge: Reading introduces you to new ideas and information.\n"
                "• Improves vocabulary: Seeing new words helps you understand and use them.\n"
                "• Enhances imagination: Stories let you picture new worlds and characters.\n"
                "• Develops critical thinking: Understanding and analyzing what you read strengthens your mind.\n"
                "• Helps communication: Reading improves writing and speaking skills.",
                style: TextStyle(fontSize: 16, height: 1.6),
              ),
              const SizedBox(height: 25),

              // Types of Reading
              Text(
                "Types of Reading",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: green,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                "1. Skimming – Reading quickly to get the main idea.\n"
                "Example: Look at headings and first sentences of paragraphs to understand the topic.\n\n"
                "2. Scanning – Searching for specific information.\n"
                "Example: Find a date, name, or number in a text.\n\n"
                "3. Detailed Reading – Reading carefully to understand everything.\n"
                "Example: Read a story or instructions fully to understand the content.",
                style: TextStyle(fontSize: 16, height: 1.6),
              ),
              const SizedBox(height: 25),

              // Tips for Better Reading
              Text(
                "Tips for Better Reading",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: green,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                "• Choose a quiet place with good light.\n"
                "• Preview the text before reading fully.\n"
                "• Highlight or underline key points.\n"
                "• Take notes or summarize after reading.\n"
                "• Ask yourself questions about the text to check understanding.",
                style: TextStyle(fontSize: 16, height: 1.6),
              ),
              const SizedBox(height: 25),

              // Reading Exercise
              Text(
                "Reading Exercise",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: green,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                "Read the passage below:\n\n"
                "\"The sun was setting over the quiet village, painting the sky in shades of orange and pink. "
                "Children ran through the fields, laughing and playing, while farmers finished their work for the day. "
                "Birds flew back to their nests as the cool breeze swept through the trees. "
                "The smell of fresh bread from the bakery mixed with the scent of flowers in the gardens. "
                "People greeted each other warmly, and the village felt calm and peaceful.\"",
                style: TextStyle(fontSize: 16, height: 1.6),
              ),
              const SizedBox(height: 8),
              const Text(
                "Questions:\n"
                "1. What time of day is described in the passage?\n"
                "2. What are the children doing?\n"
                "3. How does the author make the village feel peaceful?\n"
                "4. Name two sensory details (sight, smell, sound) mentioned in the passage.\n"
                "5. What do you imagine is happening after the sun sets?",
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
                "Find a short story, article, or passage. Try the following:\n"
                "• Skim it first to understand the main idea.\n"
                "• Scan for 3 important pieces of information.\n"
                "• Read it carefully and summarize in your own words.",
                style: TextStyle(fontSize: 16, height: 1.6),
              ),
              const SizedBox(height: 20),

              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ReadingLessonTwo(),
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
