import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/questions.dart';

class QuizService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  static final List<Questions> sampleQuestions = [
    Questions(
      qId: 1,
      question: "What does CPU stand for?",
      choices: [
        "Central Processing Unit",
        "Computer Personal Unit",
        "Control Processing Utility",
        "Central Processor Unit",
      ],
      answerIndex: 0,
    ),
    Questions(
      qId: 2,
      question: "What is the capital of Japan?",
      choices: ["Beijing", "Tokyo", "Seoul", "Bangkok"],
      answerIndex: 1,
    ),
    Questions(
      qId: 3,
      question: "Which language is used for Flutter?",
      choices: ["Java", "Kotlin", "Dart", "Swift"],
      answerIndex: 2,
    ),
    Questions(
      qId: 4,
      question: "2 + 5 = ?",
      choices: ["5", "6", "7", "8"],
      answerIndex: 2,
    ),
    Questions(
      qId: 5,
      question: "Which planet is closest to the sun?",
      choices: ["Mars", "Venus", "Mercury", "Earth"],
      answerIndex: 2,
    ),
  ];

  /// Upload questions to Firestore ONCE per quizId
  Future<void> uploadQuizOnce(String quizId) async {
    final quizRef = _db.collection('quizzes').doc(quizId);
    final quesRef = quizRef.collection('questions');

    final existing = await quesRef.limit(1).get();
    if (existing.docs.isNotEmpty) return;

    // write sampleQuestions
    final batch = _db.batch();
    for (var q in sampleQuestions) {
      final docRef = quesRef.doc(q.qId.toString());
      batch.set(docRef, q.toMap());
    }

    await batch.commit();
  }

  /// Fetch questions from Firestore
  Future<List<Questions>> fetchQuestions(String quizId) async {
    final snap = await _db
        .collection('quizzes')
        .doc(quizId)
        .collection('questions')
        .orderBy('qId')
        .get();

    return snap.docs.map((d) => Questions.fromMap(d.data())).toList();
  }
}
