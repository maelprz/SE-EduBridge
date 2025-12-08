import 'package:flutter/material.dart';
import '../../reusables/bottom_nav_wrapper.dart';
import '../../reusables/app_bar_pill.dart';
import 'mentor_profile.dart';

class MentorListScreen extends StatelessWidget {
  const MentorListScreen({super.key});

  final Color green = const Color(0xFF0C4B36);
  final Color lightGreen = const Color(0xFFE8EEEA);

  @override
  Widget build(BuildContext context) {
    return BottomNavWrapper(
      index: 1,
      child: Scaffold(
        appBar: AppBarPill(
          title: "Mentors",
          onLeadingIconPressed: () => Navigator.pop(context),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Available Mentors",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w900,
                    color: green,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  "Select a mentor who matches your learning goals. "
                  "Tap a mentor to view their details and send an application request.",
                  style: const TextStyle(fontSize: 16, height: 1.4),
                ),
                const SizedBox(height: 25),

                // Mentor Cards
                mentorCard(
                  context: context,
                  name: "Mr. Robert Avelino",
                  specialization: "Reading & Writing",
                  imagePath: "assets/mentorship/robert.png",
                ),
                mentorCard(
                  context: context,
                  name: "Mr. Brian Aratia",
                  specialization: "Math Fundamentals",
                  imagePath: "assets/mentorship/brian.png",
                ),
                mentorCard(
                  context: context,
                  name: "Mr. Raven Nacua",
                  specialization: "eSports - Valorant",
                  imagePath: "assets/mentorship/raven.png",
                ),
                mentorCard(
                  context: context,
                  name: "Ms. Liana Serrano",
                  specialization: "History & Culture",
                  imagePath: "assets/mentorship/teacher1.png",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget mentorCard({
    required BuildContext context,
    required String name,
    required String specialization,
    required String imagePath,
  }) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => MentorProfileScreen(
              mentorName: name,
              mentorSpecialization: specialization,
              mentorImagePath: imagePath,
            ),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(18),
        margin: const EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          color: lightGreen,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: green, width: 2),
          boxShadow: [
            BoxShadow(
              color: green.withAlpha(25),
              offset: const Offset(0, 3),
              blurRadius: 6,
            )
          ],
        ),
        child: Row(
          children: [
            // Avatar with green border
            Container(
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: green, width: 2),
              ),
              child: CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage(imagePath),
                backgroundColor: Colors.white,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      fontSize: 18,
                      color: green,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    specialization,
                    style: const TextStyle(fontSize: 14),
                  ),
                ],
              ),
            ),
            Icon(Icons.arrow_forward_ios, color: green, size: 18),
          ],
        ),
      ),
    );
  }
}
