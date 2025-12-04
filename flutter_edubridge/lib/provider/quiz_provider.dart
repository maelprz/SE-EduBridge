//import 'package:flutter/material.dart';
import '../models/questions.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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

class QuizController extends StateNotifier<int> {
  QuizController() : super(0);

  void nextQuestion() {
    if (state < questionBank.length - 1) {
      state++;
    }
  }
}

final quizProvider = StateNotifierProvider<QuizController, int>(
  (ref) => QuizController(),
);
