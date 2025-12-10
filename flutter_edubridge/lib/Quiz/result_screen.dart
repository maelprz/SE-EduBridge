import 'package:flutter/material.dart';
import 'quiz_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ResultScreen extends StatelessWidget {
  final int score;
  final int total;
  final String quizId;

  const ResultScreen({
    super.key,
    required this.score,
    required this.total,
    required this.quizId,
  });

  @override
  Widget build(BuildContext context) {
    final passed = score >= (total * 0.6); // passing criteria 60%
    final comment = passed
        ? "Congratulations! You passed."
        : "Ops! You didn't pass, study more.";

    return Scaffold(
      appBar: AppBar(title: const Text("Results")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              passed ? "🎉 Passed!" : "❌ Failed",
              style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Text(
              comment,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 30),
            Text(
              "$score / $total",
              style: const TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
                color: Color(0xFF004F3C),
              ),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                final user = FirebaseAuth.instance.currentUser;
                if (user == null) return;

                // Remove previous attempt to allow retake
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (_) => QuizScreen(title: "Quiz", quizId: quizId),
                  ),
                );
              },
              child: const Text("Try Again"),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Return to Dashboard"),
            ),
          ],
        ),
      ),
    );
  }
}
