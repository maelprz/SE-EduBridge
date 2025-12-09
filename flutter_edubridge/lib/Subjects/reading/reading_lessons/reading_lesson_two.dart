import 'package:flutter/material.dart';
import '../../../reusables/navigation/bottom_nav_wrapper.dart';
import '../../../reusables/app_bar_pill.dart';
import 'reading_lesson_three.dart'; // Make sure this file exists

class ReadingLessonTwo extends StatelessWidget {
  const ReadingLessonTwo({super.key});

  @override
  Widget build(BuildContext context) {
    const Color green = Color(0xFF0C4B36);

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
              // Vocabulary Building
              Text(
                "Vocabulary Building",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: green,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "Building your vocabulary helps you understand texts better and express yourself clearly. "
                "Here are some strategies to improve your vocabulary:",
                style: TextStyle(fontSize: 16, height: 1.6),
              ),
              const SizedBox(height: 15),
              const Text(
                "• Read regularly: Different types of texts introduce new words.\n"
                "• Use a dictionary: Look up unfamiliar words and write down their meanings.\n"
                "• Learn in context: Try to understand how words are used in sentences.\n"
                "• Practice: Use new words in your writing and speaking.\n"
                "• Flashcards: Create cards to memorize words and their meanings.",
                style: TextStyle(fontSize: 16, height: 1.6),
              ),
              const SizedBox(height: 25),

              // Understanding Context
              Text(
                "Understanding Context",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: green,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                "Words can have different meanings depending on the context. "
                "Pay attention to the sentences around a word to guess its meaning. "
                "This is called using 'context clues.'",
                style: TextStyle(fontSize: 16, height: 1.6),
              ),
              const SizedBox(height: 15),
              const Text(
                "Example:\n"
                "\"Maria was ecstatic when she received the award.\"\n"
                "Even if you don't know 'ecstatic,' the surrounding words 'when she received the award' suggest it means very happy or excited.",
                style: TextStyle(fontSize: 16, height: 1.6),
              ),
              const SizedBox(height: 25),

              // Reading Comprehension Strategies
              Text(
                "Reading Comprehension Strategies",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: green,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                "To fully understand what you read, try the following strategies:\n"
                "• Predicting: Guess what might happen next.\n"
                "• Questioning: Ask yourself questions about the text.\n"
                "• Summarizing: Put the main ideas into your own words.\n"
                "• Visualizing: Picture scenes, characters, or information.\n"
                "• Clarifying: Look up or ask about confusing words or ideas.",
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
                "Read the passage below and try the strategies above:\n\n"
                "\"The market was bustling with activity. Vendors called out their goods while customers moved between stalls. "
                "Fresh fruits and vegetables shone under the morning sun, and the aroma of baked goods filled the air. "
                "Children laughed as they chased one another around the stalls, and an elderly man carefully selected the ripest tomatoes.\n",
                style: TextStyle(fontSize: 16, height: 1.6),
              ),
              const SizedBox(height: 8),
              const Text(
                "Questions:\n"
                "1. What sensory details can you find in the passage?\n"
                "2. How does the author describe the market atmosphere?\n"
                "3. Predict what might happen next at the market.\n"
                "4. Summarize the passage in 2-3 sentences.",
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
                "Choose a short news article, story, or passage. "
                "• Highlight new words and guess their meanings from context.\n"
                "• Summarize the passage in your own words.\n"
                "• Think of one question you would ask about the text.",
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
                        builder: (context) => const ReadingLessonThree(),
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
