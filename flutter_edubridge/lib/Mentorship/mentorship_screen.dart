import 'package:flutter/material.dart';
import '../reusables/bottom_nav_wrapper.dart';
import '../reusables/app_bar_pill.dart';
import 'mentorship_contents/mentor_list.dart';

class MentorshipScreen extends StatelessWidget {
  const MentorshipScreen({super.key});

  final Color green = const Color(0xFF0C4B36);
  final Color lightGreen = const Color(0xFFE8EEEA);

  Widget bulletItem(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.check_circle, color: green, size: 18),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(fontSize: 16, height: 1.5),
            ),
          ),
        ],
      ),
    );
  }

  Widget sectionCard({required Widget child}) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: lightGreen,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 13),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: child,
    );
  }

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
              Text(
                "Connect with mentors who guide, inspire, and help you grow academically and personally.",
                style: const TextStyle(fontSize: 16, height: 1.5),
              ),

              // Program Objectives
              sectionCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Program Objectives",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w800,
                        color: green,
                      ),
                    ),
                    const SizedBox(height: 12),
                    bulletItem("Receive guidance from experienced mentors"),
                    bulletItem("Improve academic performance and study habits"),
                    bulletItem("Build confidence and leadership skills"),
                    bulletItem("Explore career paths and personal development"),
                  ],
                ),
              ),

              // Announcements
              sectionCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Announcements",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w800,
                        color: green,
                      ),
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      "No announcements yet. Stay tuned!",
                      style: TextStyle(fontSize: 16, height: 1.4),
                    ),
                  ],
                ),
              ),

              // How to Join
              sectionCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "How to Join",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w800,
                        color: green,
                      ),
                    ),
                    const SizedBox(height: 12),
                    bulletItem("Sign up through the mentorship application form"),
                    bulletItem("Choose a mentor that matches your goals"),
                    bulletItem("Schedule sessions and communicate regularly"),
                    bulletItem("Participate actively and complete tasks"),
                  ],
                ),
              ),

              // Benefits
              sectionCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Benefits",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w800,
                        color: green,
                      ),
                    ),
                    const SizedBox(height: 12),
                    bulletItem("Personalized guidance and support"),
                    bulletItem("Improved learning habits and academic performance"),
                    bulletItem("Opportunities to explore interests and career paths"),
                    bulletItem("Enhanced confidence, motivation, and personal growth"),
                  ],
                ),
              ),

              const SizedBox(height: 10),

              // Apply Button
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const MentorListScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: green,
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 3,
                  ),
                  child: const Text(
                    "Apply Now →",
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
