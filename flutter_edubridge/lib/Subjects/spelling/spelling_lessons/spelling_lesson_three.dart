import 'package:flutter/material.dart';
import '../../../reusables/navigation/bottom_nav_wrapper.dart';
import '../../../reusables/app_bar_pill.dart';

class SpellingLessonThree extends StatelessWidget {
  const SpellingLessonThree({super.key});

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
              Text(
                "Spelling Practice Activities",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: green,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "In this lesson, you will practice spelling using interactive activities. "
                "These exercises help reinforce what you learned in Lessons 1 and 2.",
                style: TextStyle(fontSize: 16, height: 1.6),
              ),
              const SizedBox(height: 25),

              Text(
                "Activity 1: Fill in the Blanks",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: green,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                "Complete the sentences with the correct word:\n"
                "1. I will ______ (accommodate / acommodate) my friend at my house.\n"
                "2. It is ______ (definately / definitely) important to study.\n"
                "3. She is a great ______ (teacher / techer).",
                style: TextStyle(fontSize: 16, height: 1.6),
              ),
              const SizedBox(height: 25),

              Text(
                "Activity 2: Word Scramble",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: green,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                "Unscramble the letters to form correct words:\n"
                "1. mcaodcmote → accommodate\n"
                "2. beleive → believe\n"
                "3. ecnasparote → separate",
                style: TextStyle(fontSize: 16, height: 1.6),
              ),
              const SizedBox(height: 25),

              Text(
                "Activity 3: Dictation Exercise",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: green,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                "Ask someone to read the following words aloud and write them down:\n"
                "necessary, writing, imagination, communication, teacher\n"
                "Check your spelling afterward and correct any mistakes.",
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
