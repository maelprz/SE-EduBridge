import 'package:flutter/material.dart';
import '../providers/quiz_provider.dart';
import '../models/questions.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../reusables/app_bar_pill.dart';
import '../../reusables/bottom_nav_wrapper.dart';
import 'result_screen.dart';

class QuizScreen extends ConsumerWidget {
  const QuizScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(quizProvider);
    final Questions currentQ = questionBank[currentIndex];

    final labelLetters = ["A", "B", "C", "D"];

    return BottomNavWrapper(
      index: 0,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBarPill(
          title: "Quiz 1",
          onLeadingIconPressed: () => Navigator.pop(context),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                const SizedBox(height: 100),
                Center(
                  child: Text(
                    currentQ.question,
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w900,
                      color: Color(0xFF004F3C),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 40),
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
                            final notifier = ref.read(quizProvider.notifier);
                            final bool isLast =
                                currentIndex == questionBank.length - 1;

                            if (isLast) {
                              // Count last question first
                              notifier.nextQuestion(selectedIndex: i);

                              final finalScore = notifier.score;

                              // Show confirmation dialog
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: const Text("Submit Quiz"),
                                  content: const Text(
                                    "Are you sure you want to submit your answers?",
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () => Navigator.pop(context),
                                      child: const Text("Cancel"),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);

                                        // Navigate to ResultScreen
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (_) => ResultScreen(
                                              score: finalScore,
                                              total: questionBank.length,
                                            ),
                                          ),
                                        ).then((_) {
                                          // Reset quiz after returning
                                          notifier.resetQuiz();
                                        });
                                      },
                                      child: const Text("Submit"),
                                    ),
                                  ],
                                ),
                              );
                            } else {
                              notifier.nextQuestion(selectedIndex: i);
                            }
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
      ),
    );
  }
}
