import 'package:flutter/material.dart';

class SpellingSubject extends StatelessWidget {
  const SpellingSubject({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Spelling"),
        backgroundColor: const Color(0xFF0C4B36),
      ),
      body: const Center(
        child: Text(
          "Spelling Activities and Lessons",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
