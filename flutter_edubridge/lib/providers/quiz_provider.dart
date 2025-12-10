import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/questions.dart';
import '../services/quiz_service.dart';

final quizListProvider = StateNotifierProvider<QuizNotifier, QuizState>((ref) {
  return QuizNotifier(ref);
});

class QuizState {
  final int currentIndex;
  final int score;
  final List<Questions> questions;
  final Map<int, int> answers; // qId → selectedIndex
  final bool isLoading;
  final String? error;

  QuizState({
    this.currentIndex = 0,
    this.score = 0,
    this.questions = const [],
    this.answers = const {},
    this.isLoading = true,
    this.error,
  });

  QuizState copyWith({
    int? currentIndex,
    int? score,
    List<Questions>? questions,
    Map<int, int>? answers,
    bool? isLoading,
    String? error,
  }) {
    return QuizState(
      currentIndex: currentIndex ?? this.currentIndex,
      score: score ?? this.score,
      questions: questions ?? this.questions,
      answers: answers ?? this.answers,
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }
}

class QuizNotifier extends StateNotifier<QuizState> {
  final Ref ref;
  final QuizService _service = QuizService();

  QuizNotifier(this.ref) : super(QuizState(isLoading: true));

  /// Load quiz from Firestore
  Future<void> loadQuiz(String quizId) async {
    try {
      state = state.copyWith(isLoading: true, error: null);

      // Ensure quiz questions exist in Firestore
      await _service.uploadQuizOnce(quizId);

      // Fetch questions
      final fetched = await _service.fetchQuestions(quizId);

      state = state.copyWith(questions: fetched, isLoading: false);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  /// Move to next question and update score
  void nextQuestion(int selectedIndex) {
    if (state.questions.isEmpty) return;

    final currentQ = state.questions[state.currentIndex];
    final newAnswers = Map<int, int>.from(state.answers)
      ..[currentQ.qId] = selectedIndex;

    int updatedScore = state.score;
    if (selectedIndex == currentQ.answerIndex) updatedScore++;

    if (state.currentIndex < state.questions.length - 1) {
      state = state.copyWith(
        currentIndex: state.currentIndex + 1,
        score: updatedScore,
        answers: newAnswers,
      );
    } else {
      // Last question: update score and answers
      state = state.copyWith(score: updatedScore, answers: newAnswers);
    }
  }

  /// Reset only the current quiz state for retry
  void resetQuiz() {
    state = QuizState(
      currentIndex: 0,
      score: 0,
      questions: state.questions, // keep loaded questions
      answers: {},
      isLoading: false,
    );
  }

  /// Restore in-progress quiz
  void restoreProgress({
    required int currentIndex,
    required int score,
    required Map<int, int> answers,
  }) {
    state = state.copyWith(
      currentIndex: currentIndex,
      score: score,
      answers: answers,
      isLoading: false,
    );
  }
}
