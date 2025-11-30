import 'package:flutter/material.dart';
import 'reading/reading_screen.dart' as reading;
import 'spelling/spelling_screen.dart' as spelling;

class SubjectsScreen extends StatelessWidget {
  const SubjectsScreen({super.key});

  final Color green = const Color(0xFF0B6A32);
  final Color lightGreen = const Color(0xFFE8EEEA);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F6F6),
      body: SafeArea(
        child: Column(
          children: [
            /// HEADER ---------------------------------------------------
            Container(
              height: 90,
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: lightGreen,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.12),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  )
                ],
              ),
              child: Row(
                children: [
                  Icon(Icons.arrow_back, size: 26, color: green),
                  const SizedBox(width: 10),
                  Icon(Icons.menu_book_rounded, size: 30, color: green),
                  const SizedBox(width: 10),
                  Text("Subjects",
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          color: green)),
                ],
              ),
            ),

            const SizedBox(height: 30),

            /// SUBJECTS -------------------------------------------------
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: GridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 25,
                  crossAxisSpacing: 18,
                  children: [
                    /// READING ------------------------------------------
                    subjectCard(
                      title: "Reading",
                      image: "", // ← set asset later
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const reading.ReadingSubject(),
                          ),
                        );
                      },
                    ),

                    /// SPELLING ------------------------------------------
                    subjectCard(
                      title: "Spelling",
                      image: "", // ← placeholder
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const spelling.SpellingSubject(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// WIDGET REUSABLE CARD -----------------------------------------------
  Widget subjectCard({required String title, required String image, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade300, /// TEMP placeholder instead of asset
          borderRadius: BorderRadius.circular(22),
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
            ),
            child: Text(title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                )),
          ),
        ),
      ),
    );
  }
}
