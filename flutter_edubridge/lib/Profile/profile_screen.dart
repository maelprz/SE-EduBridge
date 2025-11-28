import 'package:flutter/material.dart';
import '../reusables/bottom_nav_wrapper.dart';
import 'widgets/profile_image_card.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavWrapper(
      index: 2, // Profile is selected
      child: Column(
        children: [
          AppBar(
            backgroundColor: const Color(0xFFF4F6F6),
            elevation: 2,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Color(0xFF0C4B36)),
              onPressed: () => Navigator.pop(context),
            ),
            title: const Text(
              'Profile',
              style: TextStyle(
                color: Color(0xFF0C4B36),
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
            centerTitle: true,
          ),

          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
              child: Column(
                children: [
                  const ProfileImageCard(
                    imageUrl: "assets/profile/user.png",
                    size: 190,
                  ),

                  const SizedBox(height: 25),

                  _ProfileField(label: "Name", value: "Perez, Mel Stephen"),
                  _ProfileField(label: "Username", value: "maelprz"),
                  _ProfileField(label: "Email", value: "me*****32@gmail.com"),
                  _ProfileField(
                    label: "Course & Year",
                    value:
                        "Bachelor of Science in Information Technology",
                  ),
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
