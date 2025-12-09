import 'package:flutter/material.dart';
import '../reusables/app_bar_pill.dart';
import '../reusables/bottom_nav_wrapper.dart';
import '../Dashboard/dashboard_screen.dart';
import 'messaging_screen.dart';

class MessageListScreen extends StatelessWidget {
  const MessageListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BottomNavWrapper(
        index: 0,
        child: Column(
          children: [
            AppBarPill(
              title: "Messages",
              onLeadingIconPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => const DashboardScreen()),
                );
              },
            ),

            const Divider(height: 1),

            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  _chatTile(
                    context,
                    name: "Mr. Robert Avelino",
                    message:
                        "Hello,\nIt seems you still have some pending activities that haven't been submitted.",
                    unread: true,
                  ),
                  _simpleTile("Lee Ado Amit", "di ko mo sud"),
                  _simpleTile(
                    "Brian Arashya",
                    "huyyy, imo na gibuhat ang assignment?",
                  ),
                  _simpleTile("Raven Nacua", "Si lee wa ni sud"),
                  _simpleTile("DLKG", "seen"),
                  _simpleTile("Ms. Erika", ""),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _chatTile(BuildContext context,
      {required String name,
      required String message,
      bool unread = false}) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => MessagingScreen(personName: name),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey)),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 16,
              width: 16,
              margin: const EdgeInsets.only(top: 8, right: 16),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: unread ? const Color(0xFF004F3C) : Colors.transparent,
                border: Border.all(
                    color: const Color(0xFF004F3C),
                    width: unread ? 0 : 1),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20)),
                  const SizedBox(height: 6),
                  Text(message,
                      style: const TextStyle(
                          fontSize: 16, color: Colors.black87)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _simpleTile(String name, String message) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(name,
              style:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
          if (message.isNotEmpty) ...[
            const SizedBox(height: 6),
            Text(message,
                style: const TextStyle(fontSize: 16, color: Colors.black87)),
          ],
        ],
      ),
    );
  }
}
