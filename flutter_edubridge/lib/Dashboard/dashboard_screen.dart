import 'package:flutter/material.dart';
import '../reusables/bottom_nav_wrapper.dart';
import 'widgets/dashboard_header.dart';
import 'widgets/dashboard_content.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return BottomNavWrapper(
      index: 1, // Home is selected
      child: SafeArea(
        child: Column(
          children: [
            const DashboardHeader(),
            const Divider(height: 1),
            Expanded(
              child: SingleChildScrollView(
                child: DashboardContent(size: size),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
