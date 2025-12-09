import 'package:flutter/material.dart';
import 'bottom_nav_item.dart';

class BottomNavBar extends StatelessWidget {
  final int selectedIndex;

  const BottomNavBar({
    super.key,
    required this.selectedIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 15,
      child: Container(
        height: 70,
        margin: const EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
          color: const Color(0xFF0C4B36),
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.08),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            BottomNavItem(
              icon: Icons.message_rounded,
              index: 0,
              selected: selectedIndex == 0,
            ),
            BottomNavItem(
              icon: Icons.home_rounded,
              index: 1,
              selected: selectedIndex == 1,
            ),
            BottomNavItem(
              icon: Icons.person_rounded,
              index: 2,
              selected: selectedIndex == 2,
            ),
          ],
        ),
      ),
    );
  }
}
