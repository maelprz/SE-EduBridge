import 'package:flutter/material.dart';
import '../../../reusables/navigation/bottom_nav_wrapper.dart';
import '../../../reusables/app_bar_pill.dart';

class WritingLessonThree extends StatelessWidget {
  const WritingLessonThree({super.key});

  @override
  Widget build(BuildContext context) {
    final Color green = const Color(0xFF0C4B36);

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
              // Introduction
              Text(
                "Creative Story Writing",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: green,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "This lesson focuses on creative writing. You will learn how to write short stories using imagination, characters, settings, and plots. Creative writing allows you to express ideas in unique and engaging ways.",
                style: TextStyle(fontSize: 16, height: 1.6),
              ),
              const SizedBox(height: 25),

              // Elements of a Story
              Text(
                "Elements of a Story",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: green,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                "• Characters – Who is in the story?\n"
                "• Setting – Where and when does the story take place?\n"
                "• Plot – What happens? Outline beginning, middle, and end.\n"
                "• Conflict – What challenges do characters face?\n"
                "• Resolution – How is the conflict resolved?",
                style: TextStyle(fontSize: 16, height: 1.6),
              ),
              const SizedBox(height: 25),

              // Story Writing Tips
              Text(
                "Tips for Creative Writing",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: green,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                "• Plan your story before writing.\n"
                "• Start with a strong hook.\n"
                "• Show, don't tell – describe actions and feelings.\n"
                "• Use dialogue to develop characters.\n"
                "• Revise and improve your story after writing.",
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
                "Write a short story (150–200 words) using the following:\n"
                "• One main character\n"
                "• A clear setting\n"
                "• A problem or conflict\n"
                "• A resolution",
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
                "• Share your story with a friend or teacher.\n"
                "• Ask for feedback on clarity, plot, and creativity.\n"
                "• Revise your story based on feedback.",
                style: TextStyle(fontSize: 16, height: 1.6),
              ),
              const SizedBox(height: 60),
            ],
          ),
        ),
      ),
    );
  }
}
