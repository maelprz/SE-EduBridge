import 'package:flutter/material.dart';

class WritingSubject extends StatelessWidget {
  const WritingSubject({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Writing"),
        backgroundColor: const Color(0xFF0C4B36),
      ),
      body: const Center(
        child: Text(
          "Writing Activities and Lessons",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
