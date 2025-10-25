import 'package:flutter/material.dart';

class Content extends StatelessWidget {
  const Content({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'This is the main content area of your dashboard.',
        style: TextStyle(
          fontSize: 18,
          color: Colors.grey[700],
        ),
      ),
    );
  }
}
