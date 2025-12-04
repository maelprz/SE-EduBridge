import 'package:flutter/material.dart';
import '../Dashboard/dashboard_screen.dart';
import 'widgets/profile_image_card.dart';
import '../reusables/bottom_nav_wrapper.dart';
import '../reusables/app_bar_pill.dart';
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavWrapper(
      index: 2, // Profile is selected
      child: Column(
        children: [
          AppBarPill(
            title: "Profile",
            onLeadingIconPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (_) => const DashboardScreen(),
                ),
              );
            },
          ),

          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
              child: Column(
                children: [
                  const SizedBox(height: 25),
                  const ProfileImageCard(
                    imageUrl: "assets/profile/user.png",
                    size: 190,
                  ),

                  const SizedBox(height: 50),

                  _ProfileField(label: "Name", value: "Perez, Mel Stephen"),
                  const SizedBox(height: 25),
                  _ProfileField(label: "Username", value: "maelprz"),
                  const SizedBox(height: 25),
                  _ProfileField(label: "Email", value: "me*****32@gmail.com"),
                  const SizedBox(height: 25),
                  _ProfileField(
                    label: "Course & Year",
                    value:
                        "Bachelor of Science in Information Technology",
                  ),
                  const SizedBox(height: 25),
                  _ProfileField(label: "Birthday", value: "December 25, 2000"),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ProfileField extends StatelessWidget {
  final String label;
  final String value;

  const _ProfileField({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 10),

        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 3,
              child: Text(
                label,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Text(
                value,
                style: const TextStyle(
                  fontSize: 17,
                  color: Colors.black87,
                ),
              ),
            ),
          ],
        ),

        const SizedBox(height: 12),
        Container(
          height: 1,
          color: Colors.grey.shade300,
        ),
      ],
    );
  }
}
