import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../reusables/app_bar_pill.dart';
import '../reusables/navigation/bottom_nav_wrapper.dart';
import 'quiz_screen.dart';
import 'result_screen.dart';
import '../services/user_quiz_service.dart';

class QuizzesScreen extends StatefulWidget {
  const QuizzesScreen({super.key});

  @override
  State<QuizzesScreen> createState() => _QuizzesScreenState();
}

class _QuizzesScreenState extends State<QuizzesScreen> {
  final UserQuizService userQuizService = UserQuizService();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Map<String, bool> completedStatus = {};

  final List<String> quizzes = [
    "Quiz 1",
    "Quiz 2",
    "Quiz 3",
    "Exam 1",
    "Quiz 4",
    "Quiz 5",
    "Exam 2",
    "Final Exam",
  ];

  @override
  void initState() {
    super.initState();
    _loadCompletedStatus();
  }

  Future<void> _loadCompletedStatus() async {
    final user = _auth.currentUser;
    if (user == null) return;

    final Map<String, bool> tempStatus = {};
    for (int i = 0; i < quizzes.length; i++) {
      final quizId = "quiz_${i + 1}";
      final data = await userQuizService.getQuizResult(user.uid, quizId);
      tempStatus[quizId] = data != null && data['completed'] == true;
    }

    if (mounted) {
      setState(() {
        completedStatus = tempStatus;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final user = _auth.currentUser;

    return BottomNavWrapper(
      index: 1,
      child: Scaffold(
        backgroundColor: const Color(0xFFF2F2F2),
        appBar: AppBarPill(
          title: "Quizzes",
          onLeadingIconPressed: () => Navigator.pop(context),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: ListView.separated(
            itemCount: quizzes.length,
            separatorBuilder: (_, __) => const SizedBox(height: 14),
            itemBuilder: (context, index) {
              final quizTitle = quizzes[index];
              final quizId = "quiz_${index + 1}";
              final isCompleted = completedStatus[quizId] ?? false;

              return InkWell(
                borderRadius: BorderRadius.circular(16),
                onTap: () async {
                  if (user == null) return;

                  final data = await userQuizService.getQuizResult(
                    user.uid,
                    quizId,
                  );
                  final completed = data != null && data['completed'] == true;

                  if (completed) {
                    // Navigate directly to ResultScreen
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ResultScreen(
                          score: data['score'] ?? 0,
                          total: data['totalQuestions'] ?? 0,
                          quizId: quizId,
                        ),
                      ),
                    );
                  } else {
                    // Navigate to QuizScreen
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) =>
                            QuizScreen(title: quizTitle, quizId: quizId),
                      ),
                    ).then((_) => _loadCompletedStatus()); // refresh marks
                  }
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 18,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        offset: const Offset(0, 2),
                        blurRadius: 6,
                        color: Colors.black.withOpacity(0.08),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        quizTitle,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF004F3C),
                        ),
                      ),
                      Row(
                        children: [
                          if (isCompleted)
                            const Icon(
                              Icons.check_circle,
                              color: Colors.green,
                              size: 20,
                            ),
                          const SizedBox(width: 8),
                          const Icon(
                            Icons.arrow_forward_ios,
                            size: 18,
                            color: Colors.grey,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
