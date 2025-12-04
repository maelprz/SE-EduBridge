import 'package:flutter/material.dart';
import '../providers/quiz_provider.dart';
import '../models/questions.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class QuizScreen extends ConsumerWidget {
  const QuizScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(quizProvider);
    final Questions currentQ = questionBank[currentIndex];

    final labelLetters = ["A", "B", "C", "D"];

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ---------- QUESTION TEXT ----------
              Text(
                "Question ${currentIndex + 1}",
                style: const TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),

              Text(currentQ.question, style: const TextStyle(fontSize: 22)),

              const SizedBox(height: 40),

              // ---------- CHOICES ----------
              Expanded(
                child: ListView.builder(
                  itemCount: currentQ.choices.length,
                  itemBuilder: (context, i) {
                    final choiceText = currentQ.choices[i];

                    return Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                            vertical: 16,
                            horizontal: 12,
                          ),
                          backgroundColor: Colors.teal.shade50,
                          foregroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: () {
                          // After choosing, show next question
                          ref.read(quizProvider.notifier).nextQuestion();
                        },
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 20,
                              backgroundColor: Colors.teal,
                              child: Text(
                                labelLetters[i],
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Text(
                                choiceText,
                                style: const TextStyle(fontSize: 18),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
