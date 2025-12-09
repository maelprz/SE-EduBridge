import 'package:flutter/material.dart';
import '../../../reusables/navigation/bottom_nav_wrapper.dart';
import '../../../reusables/app_bar_pill.dart';
import 'writing_lesson_three.dart';

class WritingLessonTwo extends StatelessWidget {
  const WritingLessonTwo({super.key});

  @override
  Widget build(BuildContext context) {
    final Color green = const Color(0xFF0C4B36);

    return BottomNavWrapper(
      index: 1,
      child: Scaffold(
        appBar: AppBarPill(
          title: "Lesson 2",
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
                "Paragraph & Essay Writing",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: green,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "In this lesson, you will learn how to structure paragraphs and essays. "
                "A strong paragraph has a topic sentence, supporting details, and a concluding sentence. "
                "Essays are a collection of organized paragraphs expressing a main idea.",
                style: TextStyle(fontSize: 16, height: 1.6),
              ),
              const SizedBox(height: 25),

              // Paragraph Structure
              Text(
                "Paragraph Structure",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: green,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                "• Topic Sentence: Introduces the main idea of the paragraph.\n"
                "• Supporting Details: Provides facts, examples, or explanations.\n"
                "• Concluding Sentence: Summarizes or reinforces the paragraph's main idea.",
                style: TextStyle(fontSize: 16, height: 1.6),
              ),
              const SizedBox(height: 25),

              // Essay Structure
              Text(
                "Essay Structure",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: green,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                "1. Introduction – Introduce the topic and state your thesis.\n"
                "2. Body Paragraphs – Each paragraph covers one main point supporting your thesis.\n"
                "3. Conclusion – Summarize your ideas and restate the thesis in a new way.",
                style: TextStyle(fontSize: 16, height: 1.6),
              ),
              const SizedBox(height: 25),

              // Tips for Better Paragraphs
              Text(
                "Tips for Writing Strong Paragraphs",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: green,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                "• Keep sentences focused on the main idea.\n"
                "• Use transition words (first, next, however, finally) for flow.\n"
                "• Vary sentence length for readability.\n"
                "• Revise to remove repetition and unclear ideas.",
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
                "Write a paragraph about your favorite place. Include:\n"
                "• Topic sentence introducing the place\n"
                "• 3 supporting details (what it looks like, why you like it, activities)\n"
                "• Concluding sentence",
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
                "• Outline 2-3 paragraphs for a short essay.\n"
                "• Write the essay draft.\n"
                "• Revise and check for grammar and clarity.",
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
                        builder: (context) => const WritingLessonThree(),
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
