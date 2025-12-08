import 'package:flutter/material.dart';
import '../../../reusables/bottom_nav_wrapper.dart';
import '../../../reusables/app_bar_pill.dart';
import 'writing_lesson_two.dart';

class WritingLessonOne extends StatelessWidget {
  const WritingLessonOne({super.key});

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
                "Introduction to Writing",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: green,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "Writing is a way to communicate ideas clearly and effectively. "
                "It helps you express thoughts, tell stories, and share information. "
                "Strong writing skills are important for school, work, and personal expression.",
                style: TextStyle(fontSize: 16, height: 1.6),
              ),
              const SizedBox(height: 25),

              // Why Writing is Important
              Text(
                "Why Writing is Important",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: green,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                "• Communicates ideas: Writing helps share thoughts clearly.\n"
                "• Improves critical thinking: Organizing your ideas strengthens reasoning.\n"
                "• Enhances creativity: Writing stories and essays sparks imagination.\n"
                "• Builds confidence: Expressing ideas in writing improves self-expression.\n"
                "• Academic and career success: Good writing is essential in school and work.",
                style: TextStyle(fontSize: 16, height: 1.6),
              ),
              const SizedBox(height: 25),

              // Types of Writing
              Text(
                "Types of Writing",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: green,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                "1. Narrative Writing – Telling a story with a beginning, middle, and end.\n"
                "Example: Short stories, personal experiences.\n\n"
                "2. Expository Writing – Explaining or informing about a topic.\n"
                "Example: Essays, reports, articles.\n\n"
                "3. Persuasive Writing – Convincing someone of your opinion.\n"
                "Example: Opinion pieces, advertisements.\n\n"
                "4. Descriptive Writing – Describing people, places, or events in detail.\n"
                "Example: Poems, descriptive paragraphs.",
                style: TextStyle(fontSize: 16, height: 1.6),
              ),
              const SizedBox(height: 25),

              // Writing Tips
              Text(
                "Tips for Effective Writing",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: green,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                "• Plan before writing: Outline your ideas.\n"
                "• Be clear and concise: Avoid unnecessary words.\n"
                "• Use proper grammar and punctuation.\n"
                "• Revise and edit: Improve your draft.\n"
                "• Practice regularly: Writing improves with practice.",
                style: TextStyle(fontSize: 16, height: 1.6),
              ),
              const SizedBox(height: 25),

              // Writing Exercise
              Text(
                "Writing Exercise",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: green,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                "Exercise:\n"
                "Write a short paragraph (5–7 sentences) about your favorite hobby. "
                "Include the following:\n"
                "• What the hobby is\n"
                "• Why you enjoy it\n"
                "• How it makes you feel\n"
                "• One interesting detail or story related to it",
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
                "• Choose a topic you like.\n"
                "• Plan your paragraph using bullet points.\n"
                "• Write a clear paragraph and revise it.\n"
                "• Share your paragraph with a friend or teacher for feedback.",
                style: TextStyle(fontSize: 16, height: 1.6),
              ),
              const SizedBox(height: 30),

              // Next Lesson Button
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const WritingLessonTwo(),
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
