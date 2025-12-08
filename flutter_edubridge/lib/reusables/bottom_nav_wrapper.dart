import 'package:flutter/material.dart';
import 'bottom_nav.dart';

class BottomNavWrapper extends StatelessWidget {
  final Widget child;
  final int index;

  const BottomNavWrapper({super.key, required this.child, required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          child,
          BottomNavBar(
            selectedIndex: index,
            onTap: (_) {}, // no navigation yet
          ),
        ],
      ),
    );
  }
}
