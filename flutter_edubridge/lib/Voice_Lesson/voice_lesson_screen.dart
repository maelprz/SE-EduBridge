import 'package:flutter/material.dart';
import '../../reusables/app_bar_pill.dart';
import '../../Voice_Lesson/voice_pill.dart';
import '../../reusables/bottom_nav_wrapper.dart';

class VoiceLessonScreen extends StatelessWidget {
  const VoiceLessonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavWrapper(
      index: 2, // ← IMPORTANT
      child: Scaffold(
        appBar: AppBarPill(title: 'Voice Lesson'),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: VoicePill(
                text1: 'Get ready to speak with confidence!',
                text2:
                    'Vocal Practice helps you improve your pronunciation, speak clearly, and build the confidence you need for public speaking. Read out loud, practice your voice, and become a better communicator, one word at a time! Choose a level to begin your speaking journey!',
                textsize: 20,
                textsize2: 16,
                width: 410,
                height: 185,
                textcolor1: const Color.fromARGB(255, 2, 95, 78),
              ),
            ),
            Center(
              child: VoicePill(
                icon: Icons.headphones,
                text1: 'Audio Book',
                height: 70,
                width: 410,
                textsize: 22,
                textsize2: 18,
                textcolor1: const Color.fromARGB(255, 2, 95, 78),
              ),
            ),
            Center(
              child: VoicePill(
                number: '1',
                text1: 'Level 1',
                text2: 'Speak the Basics',
                height: 70,
                width: 410,
                textsize: 18,
                textsize2: 16,
                textcolor1: const Color.fromARGB(255, 2, 95, 78),
              ),
            ),

            Center(
              child: VoicePill(
                number: '2',
                text1: 'Level 2',
                text2: 'Phrases and Sentences',
                height: 70,
                width: 410,
                textsize: 18,
                textsize2: 16,
                textcolor1: const Color.fromARGB(255, 2, 95, 78),
              ),
            ),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 17.0),
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 4,
                  mainAxisSpacing: 5,
                  childAspectRatio: 2.5,

                  children: List.generate(8, (index) {
                    final level = index + 3;

                    return VoicePill(
                      icon: Icons.lock,
                      text1: 'Level $level',
                      height: 60,
                      textsize: 20,
                      textsize2: 16,
                      textcolor1: Colors.white,
                      backgroundColor: const Color.fromARGB(255, 2, 95, 78),
                    );
                  }),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
