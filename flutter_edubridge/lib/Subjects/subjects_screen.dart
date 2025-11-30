import 'package:flutter/material.dart';
import '../reusables/bottom_nav_wrapper.dart';
import 'reading/reading_screen.dart';
import 'spelling/spelling_screen.dart';
import 'writing/writing_screen.dart';

class SubjectsScreen extends StatelessWidget {
  const SubjectsScreen({super.key});

  final Color green = const Color(0xFF0C4B36);
  final Color lightGreen = const Color(0xFFE8EEEA);

  @override
  Widget build(BuildContext context) {
    return BottomNavWrapper(
      index: 1,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(90),
          child: Container(
            decoration: BoxDecoration(
              color: lightGreen, 
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.12),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              toolbarHeight: 90,
              leading: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Icon(Icons.arrow_back, size: 26, color: green),
              ),
              title: Row(
                children: [
                  const SizedBox(width: 35),
                  Icon(Icons.menu_book_rounded, size: 36, color: green),
                  const SizedBox(width: 5),
                  Text(
                    "Subjects",
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.w900,
                      color: green,
                    ),
                  ),
                ],
              ),
            ),
          ),
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
          border: Border.all(color: Colors.black, width: 1),
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
              border: Border.all(color: Colors.black, width: 1),
            ),
            child: Text(
              title,
              style: const TextStyle(
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
