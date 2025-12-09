import 'package:flutter/material.dart';
import '../../../reusables/navigation/bottom_nav_wrapper.dart';
import '../../../reusables/app_bar_pill.dart';
import 'spelling_lesson_three.dart';

class SpellingLessonTwo extends StatelessWidget {
  const SpellingLessonTwo({super.key});

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
              Text(
                "Common Word Lists",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: green,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "Learning common words is a foundation for spelling success. "
                "Here are some essential lists:",
                style: TextStyle(fontSize: 16, height: 1.6),
              ),
              const SizedBox(height: 25),

              Text(
                "List 1: High-Frequency Words",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: green,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                "the, and, a, to, in, is, you, that, it, he, was, for, on, are",
                style: TextStyle(fontSize: 16, height: 1.6),
              ),
              const SizedBox(height: 15),

              Text(
                "List 2: Commonly Misspelled Words",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: green,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                "accommodate, definitely, separate, necessary, receive, believe, argument, embarrass",
                style: TextStyle(fontSize: 16, height: 1.6),
              ),
              const SizedBox(height: 15),

              Text(
                "List 3: Word Families",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: green,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                "play, player, playful, playing\n"
                "write, writer, writing, written\n"
                "teach, teacher, teaching",
                style: TextStyle(fontSize: 16, height: 1.6),
              ),
              const SizedBox(height: 25),

              Text(
                "Practice Activity",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: green,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                "• Write each word from the lists 3 times.\n"
                "• Use each word in a sentence.\n"
                "• Identify which words you find most challenging and focus on them.",
                style: TextStyle(fontSize: 16, height: 1.6),
              ),
              const SizedBox(height: 30),

              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SpellingLessonThree(),
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
