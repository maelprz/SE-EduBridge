import 'package:cloud_firestore/cloud_firestore.dart';

class UserQuizService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  /// Save a completed quiz attempt
  Future<void> saveQuizResult({
    required String userId,
    required String quizId,
    required int score,
    required int totalQuestions,
    required Map<int, int> answers,
  }) async {
    final attemptRef = _db
        .collection("users")
        .doc(userId)
        .collection("quiz_attempts")
        .doc(quizId);

    final answersMap = answers.map(
      (key, value) => MapEntry(key.toString(), value),
    );

    await attemptRef.set({
      "quizId": quizId,
      "score": score,
      "totalQuestions": totalQuestions,
      "answers": answersMap,
      "timestamp": FieldValue.serverTimestamp(),
      "completed": true,
    });
  }

  /// Save an in-progress quiz attempt
  Future<void> saveProgress({
    required String userId,
    required String quizId,
    required int currentIndex,
    required int score,
    required Map<int, int> answers,
  }) async {
    final progressRef = _db
        .collection("users")
        .doc(userId)
        .collection("quiz_attempts")
        .doc(quizId);

    final answersMap = answers.map(
      (key, value) => MapEntry(key.toString(), value),
    );

    await progressRef.set({
      "quizId": quizId,
      "score": score,
      "currentIndex": currentIndex,
      "answers": answersMap,
      "timestamp": FieldValue.serverTimestamp(),
      "completed": false,
    }, SetOptions(merge: true));
  }

  /// Fetch a quiz attempt for a user
  Future<Map<String, dynamic>?> getQuizResult(
    String userId,
    String quizId,
  ) async {
    final doc = await _db
        .collection("users")
        .doc(userId)
        .collection("quiz_attempts")
        .doc(quizId)
        .get();
    return doc.exists ? doc.data() : null;
  }

  /// Fetch all quiz attempts for a user
  Future<Map<String, Map<String, dynamic>>> getAllQuizAttempts(
    String userId,
  ) async {
    final snapshot = await _db
        .collection("users")
        .doc(userId)
        .collection("quiz_attempts")
        .get();

    final data = <String, Map<String, dynamic>>{};
    for (var doc in snapshot.docs) {
      data[doc.id] = doc.data();
    }
    return data;
  }
}
