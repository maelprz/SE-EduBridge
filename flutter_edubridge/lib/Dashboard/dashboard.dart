import 'package:flutter/material.dart';
import 'widgets/green_square_button.dart';
import 'widgets/image_card.dart';
import 'widgets/see_more_card.dart';
import 'widgets/bottom_nav_item.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,

      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
        decoration: const BoxDecoration(
          color: Color(0xFF0C4B36),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            BottomNavItem(label: "Messages", icon: Icons.message),
            BottomNavItem(label: "Home", icon: Icons.home),
            BottomNavItem(label: "Profile", icon: Icons.person),
          ],
        ),
      ),

      body: SafeArea(
        child: Column(
          children: [
            // ---------------- HEADER ----------------
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 6,
                    offset: const Offset(0, 3),
                  )
                ],
              ),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 28,
                    backgroundColor: Color(0xFF0C4B36),
                    child: Icon(Icons.person, color: Colors.white, size: 32),
                  ),
                  const SizedBox(width: 15),

                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Welcome!",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        Text("PEREZ, MEL STEPHEN",
                            style: TextStyle(
                                fontSize: 14, color: Colors.black54)),
                      ],
                    ),
                  ),

                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.notifications_none, size: 28),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.settings, size: 28),
                  ),
                ],
              ),
            ),
            
            const Divider(height: 1, thickness: 1),
            const SizedBox(height: 20),
            // ---------------- BODY CONTENT ----------------
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // 4 GREEN BUTTONS
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                      child: Row(
                        children: const [
                          Expanded(child: GreenSquareButton(icon: Icons.menu_book, label: "Subjects")),
                          SizedBox(width: 12),
                          Expanded(child: GreenSquareButton(icon: Icons.quiz, label: "Mock Quiz")),
                          SizedBox(width: 12),
                          Expanded(child: GreenSquareButton(icon: Icons.group, label: "Mentorship")),
                          SizedBox(width: 12),
                          Expanded(child: GreenSquareButton(icon: Icons.mic, label: "Vocal\nPractice")),
                        ],
                      ),
                    ),

                    const SizedBox(height: 20),
                    const Divider(height: 1, thickness: 1),
                    const SizedBox(height: 20),

                    // CONTINUE YOUR
                    
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Continue your...",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 12),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: const [
                          Expanded(
                            child: ImageCard(
                              title: "Lessons",
                              imageUrl: "assets/lessons.png",
                              height: 150,
                            ),
                          ),
                          SizedBox(width: 12),
                          Expanded(
                            child: ImageCard(
                              title: "Quizzes",
                              imageUrl: "assets/quizzes.png",
                              height: 150,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 25),

                    // LEARN SOMETHING NEW
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Learn something new!",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 10),

                    SizedBox(
                      height: size.height * 0.28,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.only(left: 20),
                        children: const [
                          ImageCard(
                            title: "HISTORY",
                            subtitle: "Who bombed Pearl Harbor?",
                            imageUrl: "assets/history.png",
                            width: 240,
                            height: 150,
                            isWide: true,
                          ),
                          SizedBox(width: 15),
                          ImageCard(
                            title: "ECOLOGY",
                            subtitle: "Learn more on ecosystems",
                            imageUrl: "assets/history.png",
                            width: 240,
                            height: 150,
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
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
