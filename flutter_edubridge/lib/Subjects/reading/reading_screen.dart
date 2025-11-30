import 'package:flutter/material.dart';

class ReadingSubject extends StatelessWidget {
  const ReadingSubject({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Reading"),
        backgroundColor: const Color(0xFF0B6A32),
      ),
      body: const Center(
        child: Text(
          "Reading Activities and Lessons",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
