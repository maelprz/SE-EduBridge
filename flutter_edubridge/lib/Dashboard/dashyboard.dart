import 'package:flutter/material.dart';
import 'header.dart';
import 'content.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: const SafeArea(
        child: Column(
          children: [
            // Call the DashboardHeader widget
            DashboardHeader(),
            
            // Main content area
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Content(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
