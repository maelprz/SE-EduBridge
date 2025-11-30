import 'package:flutter/material.dart';
import '../Dashboard/dashboard_screen.dart';
import '../Profile/profile_screen.dart';

class BottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final void Function(int)? onTap;

  const BottomNavBar({
    super.key,
    this.selectedIndex = 1, // default: Home
    this.onTap,
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
              color: Colors.black.withOpacity(0.08),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _BottomNavItem(
              icon: Icons.message_rounded,
              selected: selectedIndex == 0,
              index: 0,
              onTap: onTap,
            ),
            _BottomNavItem(
              icon: Icons.home_rounded,
              selected: selectedIndex == 1,
              index: 1,
              onTap: onTap,
            ),
            _BottomNavItem(
              icon: Icons.person_rounded,
              selected: selectedIndex == 2,
              index: 2,
              onTap: onTap,
            ),
          ],
        ),
      ),
    );
  }
}

class _BottomNavItem extends StatelessWidget {
  final IconData icon;
  final bool selected;
  final int index;
  final void Function(int)? onTap;

  const _BottomNavItem({
    required this.icon,
    required this.selected,
    required this.index,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!selected) {
          if (index == 1) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (_) => const DashboardScreen(),
              ),
            );
          }
          if (index == 2) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (_) => const ProfileScreen(),
              ),
            );
          }
        }

        onTap?.call(index);
      },
      child: Icon(
        icon,
        size: 28,
        color: selected ? const Color.fromARGB(255, 121, 157, 121) : const Color.fromARGB(255, 255, 255, 255),
      ),
    );
  }
}