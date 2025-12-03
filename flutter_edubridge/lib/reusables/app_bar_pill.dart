import 'package:flutter/material.dart';

class AppBarPill extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Color backgroundColor;
  final Color textColor;
  final double textSize;
  final double height;
  final VoidCallback? onLeadingIconPressed;

  const AppBarPill({
    super.key,
    required this.title,
    this.backgroundColor = const Color.fromARGB(255, 229, 230, 230),
    this.textColor = const Color(0xFF004F3C),
    this.textSize = 28,
    this.height = 85,
    this.onLeadingIconPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      elevation: 0,
      toolbarHeight: height,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: Color(0xFF004F3C), size: 28),
        onPressed: onLeadingIconPressed,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: textSize,
          fontWeight: FontWeight.w900,
          color: textColor,
        ),
      ),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
