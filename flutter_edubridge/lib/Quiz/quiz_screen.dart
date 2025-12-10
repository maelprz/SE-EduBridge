import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../providers/quiz_provider.dart';
import '../models/questions.dart';
import '../../reusables/app_bar_pill.dart';
import '../../reusables/navigation/bottom_nav_wrapper.dart';
import '../services/user_quiz_service.dart';
import 'result_screen.dart';

class QuizScreen extends ConsumerStatefulWidget {
  final String? title;
  final String quizId;

  const QuizScreen({super.key, this.title, required this.quizId});

  @override
  ConsumerState<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends ConsumerState<QuizScreen> {
  final userQuizService = UserQuizService();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final currentUser = _auth.currentUser;
      if (currentUser == null) return;

      await ref.read(quizListProvider.notifier).loadQuiz(widget.quizId);
      await _restoreProgressIfAny(currentUser.uid);
    });
  }

  Future<void> _restoreProgressIfAny(String userId) async {
    try {
      final data = await userQuizService.getQuizResult(userId, widget.quizId);

      if (data != null && data['completed'] == false) {
        final answersRaw = Map<String, dynamic>.from(data['answers'] ?? {});
        final answers = <int, int>{};
        answersRaw.forEach((k, v) {
          final keyInt = int.tryParse(k);
          final valueInt = (v is int) ? v : int.tryParse(v.toString());
          if (keyInt != null && valueInt != null) {
            answers[keyInt] = valueInt;
          }
        });

        final questionsLength = ref.read(quizListProvider).questions.length;
        int currentIndex = 0;
        if (data['currentIndex'] != null) {
          final rawIndex = (data['currentIndex'] is int)
              ? data['currentIndex']
              : (data['currentIndex'] is num
                    ? (data['currentIndex'] as num).toInt()
                    : 0);
          currentIndex = (questionsLength > 0)
              ? rawIndex.clamp(0, questionsLength - 1)
              : 0;
        }

        final score = (data['score'] is int)
            ? data['score']
            : (data['score'] is num ? (data['score'] as num).toInt() : 0);

        ref
            .read(quizListProvider.notifier)
            .restoreProgress(
              currentIndex: currentIndex,
              score: score,
              answers: answers,
            );
      }
    } catch (e, st) {
      print('Error restoring progress: $e\n$st');
    }
  }

  @override
  Widget build(BuildContext context) {
    final quizState = ref.watch(quizListProvider);
    final currentUser = _auth.currentUser;

    if (quizState.isLoading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    if (quizState.error != null) {
      return Scaffold(
        appBar: AppBar(title: const Text("Quiz")),
        body: Center(child: Text("Error loading quiz: ${quizState.error}")),
      );
    }

    if (quizState.questions.isEmpty ||
        quizState.currentIndex >= quizState.questions.length) {
      return Scaffold(
        appBar: AppBar(title: const Text("Quiz")),
        body: const Center(child: Text("No questions available.")),
      );
    }

    final currentIndex = quizState.currentIndex;
    final Questions currentQ = quizState.questions[currentIndex];
    final labelLetters = ["A", "B", "C", "D"];

    return BottomNavWrapper(
      index: 0,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBarPill(
          title: widget.title ?? "Quiz",
          onLeadingIconPressed: () async {
            if (currentUser != null) {
              await userQuizService.saveProgress(
                userId: currentUser.uid,
                quizId: widget.quizId,
                currentIndex: quizState.currentIndex,
                score: quizState.score,
                answers: quizState.answers,
              );
            }
            Navigator.pop(context);
          },
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
                          onPressed: () async {
                            if (currentUser == null) return;

                            final bool isLast =
                                currentIndex == quizState.questions.length - 1;

                            if (isLast) {
                              // Calculate tentative final score locally
                              final tentativeAnswers = Map<int, int>.from(
                                quizState.answers,
                              )..[currentQ.qId] = i;

                              final tentativeScore =
                                  quizState.score +
                                  (i == currentQ.answerIndex ? 1 : 0);

                              // Show confirmation dialog
                              showDialog(
                                context: context,
                                builder: (_) => AlertDialog(
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
                                      onPressed: () async {
                                        Navigator.pop(context);

                                        // Save result directly
                                        await userQuizService.saveQuizResult(
                                          userId: currentUser.uid,
                                          quizId: widget.quizId,
                                          score: tentativeScore,
                                          totalQuestions:
                                              quizState.questions.length,
                                          answers: tentativeAnswers,
                                        );

                                        // Navigate to ResultScreen
                                        if (mounted) {
                                          Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                              builder: (_) => ResultScreen(
                                                score: tentativeScore,
                                                total:
                                                    quizState.questions.length,
                                                quizId: widget.quizId,
                                              ),
                                            ),
                                          );
                                        }

                                        // Reset provider AFTER navigation
                                        ref
                                            .read(quizListProvider.notifier)
                                            .resetQuiz();
                                      },
                                      child: const Text("Submit"),
                                    ),
                                  ],
                                ),
                              );
                            } else {
                              // Regular flow: record answer and proceed
                              ref
                                  .read(quizListProvider.notifier)
                                  .nextQuestion(i);

                              // Save progress
                              await userQuizService.saveProgress(
                                userId: currentUser.uid,
                                quizId: widget.quizId,
                                currentIndex: ref
                                    .read(quizListProvider)
                                    .currentIndex,
                                score: ref.read(quizListProvider).score,
                                answers: ref.read(quizListProvider).answers,
                              );
                            }
                          },
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 20,
                                backgroundColor: Colors.teal,
                                child: Text(
                                  labelLetters.length > i
                                      ? labelLetters[i]
                                      : (i + 1).toString(),
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
