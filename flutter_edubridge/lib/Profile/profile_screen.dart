import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../Dashboard/dashboard_screen.dart';
import '../reusables/navigation/bottom_nav_wrapper.dart';
import '../reusables/app_bar_pill.dart';
import 'widgets/profile_image_card.dart';
import '../../../providers/user_provider.dart';
import 'package:intl/intl.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  // Mask email for privacy
  String maskEmail(String email) {
    final parts = email.split('@');
    if (parts.length != 2) return email;

    final name = parts[0];
    final domain = parts[1];

    if (name.length <= 2) {
      return '${name[0]}*****@$domain';
    }

    final firstChar = name[0];
    final lastChar = name[name.length - 1];
    return '$firstChar*****$lastChar@$domain';
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userProfile = ref.watch(userProfileProvider);

    // Load profile if empty
    if (userProfile == null) {
      ref.read(userProfileProvider.notifier).loadProfile();
      return const Center(child: CircularProgressIndicator());
    }

    final firstName = userProfile['firstName'] ?? '';
    final lastName = userProfile['lastName'] ?? '';
    final username = userProfile['username'] ?? '';
    final email = userProfile['email'] ?? '';
    final courseYear = userProfile['courseYear'] ?? 'Not set';
    final birthdayRaw = userProfile['birthday'];

    DateTime? parseBirthday(dynamic raw) {
      if (raw == null) return null;

      // Firestore Timestamp
      if (raw is Timestamp) return raw.toDate();

      // ISO string
      if (raw is String) return DateTime.tryParse(raw);

      // Firestore returns map if malformed
      if (raw is Map && raw.containsKey('_seconds')) {
        return DateTime.fromMillisecondsSinceEpoch(raw['_seconds'] * 1000);
      }

      // DateTime passed directly (rare)
      if (raw is DateTime) return raw;

      return null;
    }
    
    final birthdayDate = parseBirthday(birthdayRaw);
    final birthdayFormatted = birthdayDate != null
        ? DateFormat('MMMM d, y').format(birthdayDate)
        : "Not set";

    return BottomNavWrapper(
      index: 2,
      child: Column(
        children: [
          AppBarPill(
            title: "Profile",
            onLeadingIconPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const DashboardScreen()),
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

                  // Name
                  _ProfileField(label: "Name", value: "$lastName, $firstName"),
                  const SizedBox(height: 25),

                  // Username
                  _ProfileField(label: "Username", value: username),
                  const SizedBox(height: 25),

                  // Email (masked)
                  _ProfileField(label: "Email", value: maskEmail(email)),
                  const SizedBox(height: 25),

                  // Course & Year
                  _ProfileField(label: "Course & Year", value: courseYear),
                  const SizedBox(height: 25),

                  // Birthday
                  _ProfileField(label: "Birthday", value: birthdayFormatted),
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
