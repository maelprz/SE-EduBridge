import 'package:flutter/material.dart';
import 'nav_routes.dart';

class BottomNavItem extends StatelessWidget {
  final IconData icon;
  final bool selected;
  final int index;

  const BottomNavItem({
    super.key,
    required this.icon,
    required this.selected,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (selected) return;

        NavRoutes.goTo(index, context);
      },
      child: Icon(
        icon,
        size: 28,
        color: selected
            ? const Color.fromARGB(255, 121, 157, 121)
            : Colors.white,
      ),
    );
  }
}
