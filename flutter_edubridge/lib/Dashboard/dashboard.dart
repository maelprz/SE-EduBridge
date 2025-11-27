import 'package:flutter/material.dart';
import 'widgets/dashboard_header.dart';
import 'widgets/dashboard_content.dart';
import 'widgets/bottom_nav.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: const SizedBox.shrink(),

      body: Stack(
        children: [
          SafeArea(
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

          // FLOATING NAV
          const Positioned(
            left: 0,
            right: 0,
            bottom: 15, 
            child: BottomNavBar(),
          )
        ],
      ),
    );
  }
}
