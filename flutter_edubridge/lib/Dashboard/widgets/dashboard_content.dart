import 'package:flutter/material.dart';
import 'green_square_button.dart';
import '../../reusables/image_card.dart';
import 'see_more_card.dart';
import '../../Subjects/subjects_screen.dart';
import '../../Quiz/quizzes_screen.dart';
import '../../Mentorship/mentorship_screen.dart';

class DashboardContent extends StatelessWidget {
  final Size size;

  const DashboardContent({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),

        // GREEN BUTTONS
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GreenSquareButton(
                icon: Icons.menu_book,
                label: "Subjects",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const SubjectsScreen()),
                  );
                },
              ),
              const SizedBox(width: 5),
              GreenSquareButton(
                icon: Icons.quiz,
                label: "Mock Quiz",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const QuizzesScreen()),
                  );
                },
              ),
              const SizedBox(width: 5),
              GreenSquareButton(
                icon: Icons.group,
                label: "Mentorship",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const MentorshipScreen()),
                  );
                }
              ),
              const SizedBox(width: 5),
              GreenSquareButton(
                icon: Icons.mic,
                label: "Vocal Practice",
                onPressed: () => print("Vocal Practice tapped"),
              ),
            ],
          ),
        ),

        const SizedBox(height: 20),
        const Divider(height: 1, thickness: 1),

        // CONTINUE YOUR
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Continue your...",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
        ),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              ImageCard(
                title: "Lessons",
                imageUrl: "assets/dashboard/lessons.png",
                width: 185,
                height: 170,
              ),
              SizedBox(width: 10),
              ImageCard(
                title: "Quizzes",
                imageUrl: "assets/dashboard/quizzes.png",
                width: 185,
                height: 170,
              ),
            ],
          ),
        ),

        const SizedBox(height: 25),
        const Divider(height: 1, thickness: 1),

        // LEARN SOMETHING NEW
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Learn something new!",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
        ),

        SizedBox(
          height: size.height * 0.28,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(left: 20),
            children: const [
              ImageCard(
                title: "HISTORY",
                subtitle: "Who bombed Pearl Harbor?",
                imageUrl: "assets/dashboard/history.png",
                width: 240,
                height: 200,
                isWide: true,
              ),
              SizedBox(width: 15),
              ImageCard(
                title: "ECOLOGY",
                subtitle: "Learn more on ecosystems",
                imageUrl: "assets/dashboard/ecology.jpg",
                width: 240,
                height: 200,
                isWide: true,
              ),
              SizedBox(width: 15),
              SeeMoreCard(),
              SizedBox(width: 20),
            ],
          ),
        ),

        const SizedBox(height: 30),
      ],
    );
  }
}
