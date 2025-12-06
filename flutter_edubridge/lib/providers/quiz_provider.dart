import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/questions.dart';

final List<Questions> questionBank = [
  Questions(
    qId: 1,
    question: "What is 2 + 2?",
    choices: ["3", "4", "5", "6"],
    answerIndex: 1,
  ),
  Questions(
    qId: 2,
    question: "Capital of France?",
    choices: ["Rome", "Paris", "Berlin", "Madrid"],
    answerIndex: 1,
  ),
  Questions(
    qId: 3,
    question: "Which planet is known as the Red Planet?",
    choices: ["Earth", "Mars", "Jupiter", "Saturn"],
    answerIndex: 1,
  ),
];

class QuizNotifier extends StateNotifier<int> {
  QuizNotifier() : super(0);

  int score = 0;

  void nextQuestion({required int selectedIndex}) {
    // Increment score if correct
    if (selectedIndex == questionBank[state].answerIndex) {
      score++;
    }

    // Move to next question if not last
    if (state < questionBank.length - 1) {
      state++;
    }
  }

  void resetQuiz() {
    state = 0;
    score = 0;
  }
}

final quizProvider = StateNotifierProvider<QuizNotifier, int>((ref) {
  return QuizNotifier();
});
