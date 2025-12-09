import 'package:flutter/material.dart';
import '../reusables/navigation/bottom_nav_wrapper.dart';
import '../reusables/app_bar_pill.dart';
import 'reading/reading_screen.dart';
import 'spelling/spelling_screen.dart';
import 'writing/writing_screen.dart';
import 'math/math_screen.dart';
import 'science/science_screen.dart';
import 'history/history_screen.dart';

class SubjectsScreen extends StatelessWidget {
  const SubjectsScreen({super.key});

  final Color green = const Color(0xFF0C4B36);
  final Color lightGreen = const Color(0xFFE8EEEA);

  @override
  Widget build(BuildContext context) {
    return BottomNavWrapper(
      index: 1,
      child: Scaffold(
        appBar: AppBarPill(
          title: "Subjects",
          onLeadingIconPressed: () => Navigator.pop(context),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
          child: GridView.count(
            crossAxisCount: 2,
            mainAxisSpacing: 25,
            crossAxisSpacing: 18,
            children: [
              subjectCard(
                title: "Reading",
                image: "assets/subjects/reading.png",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => ReadingSubject()),
                  );
                },
              ),
              subjectCard(
                title: "Writing",
                image: "assets/subjects/writing.png",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => WritingSubject()),
                  );
                },
              ),
              subjectCard(
                title: "Spelling",
                image: "assets/subjects/spelling.png",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => SpellingSubject()),
                  );
                },
              ),
              subjectCard(
                title: "Math",
                image: "assets/subjects/math.png",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const MathSubject()),
                  );
                },
              ),
              subjectCard(
                title: "Science",
                image: "assets/subjects/science.png",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const ScienceSubject()),
                  );
                },
              ),
              subjectCard(
                title: "History",
                image: "assets/subjects/history.png",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const HistorySubject()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget subjectCard({
    required String title,
    required String image,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(22),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22),
          border: Border.all(color: const Color(0xFF0C4B36), width: 2.5),
          image: DecorationImage(
            image: AssetImage(image),
            fit: BoxFit.cover,
          ),
        ),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 38,
            width: 110,
            margin: const EdgeInsets.only(bottom: 12),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: const Color(0xFF0C4B36), width: 2),
            ),
            child: Text(
              title,
              style: const TextStyle(
                color: Color(0xFF0C4B36),
                fontSize: 18,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
