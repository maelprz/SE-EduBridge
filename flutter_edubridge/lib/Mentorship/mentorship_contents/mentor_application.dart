import 'package:flutter/material.dart';
import '../../reusables/bottom_nav_wrapper.dart';
import '../../reusables/app_bar_pill.dart';

class MentorApplicationScreen extends StatefulWidget {
  final String selectedMentorName;
  final String selectedMentorSpecialization;

  const MentorApplicationScreen({
    super.key,
    required this.selectedMentorName,
    required this.selectedMentorSpecialization,
  });

  @override
  State<MentorApplicationScreen> createState() =>
      _MentorApplicationScreenState();
}

class _MentorApplicationScreenState extends State<MentorApplicationScreen> {
  final Color green = const Color(0xFF0C4B36);
  final Color lightGreen = const Color(0xFFE8EEEA);

  final TextEditingController messageController = TextEditingController();

  // Assign mentor photos based on name
  String getMentorImage(String name) {
    switch (name) {
      case "Mr. Robert Avelino":
        return "assets/mentorship/robert.png";
      case "Mr. Brian Aratia":
        return "assets/mentorship/brian.png";
      case "Mr. Raven Nacua":
        return "assets/mentorship/raven.png";
      case "Ms. Liana Serrano":
        return "assets/mentorship/teacher1.png";
      default:
        return "assets/mentorship/teacher1.png";
    }
  }

  @override
  Widget build(BuildContext context) {
    final String mentorImage = getMentorImage(widget.selectedMentorName);

    return BottomNavWrapper(
      index: 1,
      child: Scaffold(
        appBar: AppBarPill(
          title: "Application",
          onLeadingIconPressed: () => Navigator.pop(context),
        ),

        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Mentorship Request",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w900,
                  color: green,
                ),
              ),

              const SizedBox(height: 20),

              // Mentor Profile Card
              Container(
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: lightGreen,
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(color: green, width: 2),
                ),
                child: Row(
                  children: [
                    // PHOTO WITH GREEN BORDER
                    Container(
                      padding: const EdgeInsets.all(3),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: green, width: 2),
                        color: Colors.white,
                      ),
                      child: CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage(mentorImage),
                      ),
                    ),

                    const SizedBox(width: 16),

                    // NAME + SPECIALIZATION
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.selectedMentorName,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w800,
                              color: green,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            widget.selectedMentorSpecialization,
                            style: const TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 25),

              Text(
                "Application Message",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: green,
                ),
              ),

              const SizedBox(height: 10),

              Container(
                padding: const EdgeInsets.all(12),
                height: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: green, width: 1.8),
                ),
                child: TextField(
                  controller: messageController,
                  maxLines: null,
                  expands: true,
                  textAlignVertical: TextAlignVertical.top,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "Write your application message to the mentor...",
                  ),
                ),
              ),

              const SizedBox(height: 25),

              Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                  onPressed: () {
                    // send logic later
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: green,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 36, vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    "Send",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 60),
            ],
          ),
        ),
      ),
    );
  }
}
