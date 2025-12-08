import 'package:flutter/material.dart';
import '../reusables/bottom_nav_wrapper.dart';
import '../reusables/app_bar_pill.dart';

class MentorshipScreen extends StatelessWidget {
  const MentorshipScreen({super.key});

  final Color green = const Color(0xFF0C4B36);
  final Color lightGreen = const Color(0xFFE8EEEA);

  @override
  Widget build(BuildContext context) {
    return BottomNavWrapper(
      index: 1,
      child: Scaffold(
        appBar: AppBarPill(
          title: "Mentorship",
          onLeadingIconPressed: () => Navigator.pop(context),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Mentorship Program",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w900,
                  color: green,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "Welcome to the Mentorship Program! \nThis program connects students with mentors who can guide, inspire, "
                "and help you develop skills in academics, life, and personal growth.",
                style: const TextStyle(fontSize: 16, height: 1.5),
              ),
              const SizedBox(height: 25),

              Text(
                "Program Objectives",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w800,
                  color: green,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "• Receive guidance from experienced mentors\n"
                "• Improve academic performance and study habits\n"
                "• Build confidence and leadership skills\n"
                "• Explore career paths and personal development opportunities",
                style: TextStyle(fontSize: 16, height: 1.5),
              ),
              const SizedBox(height: 20),

              ExpansionTile(
                  tilePadding: EdgeInsets.zero,
                  title: Text(
                    "Announcements",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w800,
                      color: green,
                    ),
                  ),
                  children: const [
                    Padding(
                      padding: EdgeInsets.all(12),
                      child: Text(
                        "No announcements yet. Stay tuned!",
                        style: TextStyle(fontSize: 16, height: 1.4),
                      ),
                    )
                  ],
                ),
              const SizedBox(height: 20),

              Text(
                "How to Join",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w800,
                  color: green,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "1. Sign up through the mentorship application form.\n"
                "2. Choose a mentor that matches your interests or goals.\n"
                "3. Schedule sessions and communicate with your mentor regularly.\n"
                "4. Participate actively and complete assigned tasks for growth.",
                style: TextStyle(fontSize: 16, height: 1.5),
              ),
              const SizedBox(height: 20),

              Text(
                "Benefits",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w800,
                  color: green,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "• Personalized guidance and support\n"
                "• Improved learning habits and academic performance\n"
                "• Opportunities to explore interests and career paths\n"
                "• Enhanced confidence, motivation, and personal growth",
                style: TextStyle(fontSize: 16, height: 1.5),
              ),
              const SizedBox(height: 29),

              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Placeholder for action, e.g., navigate to mentorship form
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: green,
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  ),
                  child: const Text(
                    "Join Now →",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 80),
            ],
          ),
        ),
      ),
    );
  }
}
