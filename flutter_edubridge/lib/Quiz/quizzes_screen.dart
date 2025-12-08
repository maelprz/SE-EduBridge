import 'package:flutter/material.dart';
import '../../reusables/app_bar_pill.dart';
import '../../reusables/bottom_nav_wrapper.dart';
import 'quiz_screen.dart';

class QuizzesScreen extends StatelessWidget {
  const QuizzesScreen({super.key});

  @override
  Widget build(BuildContext context) {
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

    return BottomNavWrapper(
      index: 1, // ← IMPORTANT
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
              return InkWell(
                borderRadius: BorderRadius.circular(16),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => QuizScreen(title: quizzes[index]),
                    ),
                  );
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
                        quizzes[index],
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF004F3C),
                        ),
                      ),
                      const Icon(
                        Icons.arrow_forward_ios,
                        size: 18,
                        color: Colors.grey,
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
