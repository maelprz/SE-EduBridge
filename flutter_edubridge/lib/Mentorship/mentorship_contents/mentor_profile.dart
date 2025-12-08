import 'package:flutter/material.dart';
import '../../reusables/bottom_nav_wrapper.dart';
import '../../reusables/app_bar_pill.dart';
import 'mentor_application.dart';

class MentorProfileScreen extends StatelessWidget {
  final String mentorName;
  final String mentorSpecialization;
  final String mentorImagePath;

  const MentorProfileScreen({
    super.key,
    required this.mentorName,
    required this.mentorSpecialization,
    required this.mentorImagePath,
  });

  final Color green = const Color(0xFF0C4B36);
  final Color lightGreen = const Color(0xFFE8EEEA);

  @override
  Widget build(BuildContext context) {
    return BottomNavWrapper(
      index: 1,
      child: Scaffold(
        appBar: AppBarPill(
          title: "Mentor Profile",
          onLeadingIconPressed: () => Navigator.pop(context),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Mentor photo
              Center(
                child: Container(
                  padding: const EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: green, width: 2),
                    color: Colors.white,
                  ),
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage(mentorImagePath),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Name
              Center(
                child: Text(
                  mentorName,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                    color: green,
                  ),
                ),
              ),
              const SizedBox(height: 6),

              // Specialization
              Center(
                child: Text(
                  mentorSpecialization,
                  style: const TextStyle(fontSize: 16),
                ),
              ),
              const SizedBox(height: 30),

              // Placeholder for mentor bio
              Text(
                "About the Mentor",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: green,
                ),
              ),
              const SizedBox(height: 10),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: lightGreen,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: green, width: 1.5),
                ),
                child: const Text(
                  "This is a placeholder for the mentor's bio or description. "
                  "You can add education, experience, achievements, and other relevant information here.",
                  style: TextStyle(fontSize: 14, height: 1.4),
                ),
              ),
              const SizedBox(height: 20),

              // Buttons
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Message feature coming soon!")),
                        );
                      },
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(color: green, width: 1.8),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        "Message",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: green,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => MentorApplicationScreen(
                              selectedMentorName: mentorName,
                              selectedMentorSpecialization: mentorSpecialization,
                            ),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: green,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text(
                        "Apply",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
