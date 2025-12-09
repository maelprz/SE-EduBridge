import 'package:flutter/material.dart';

class InputFieldPill extends StatelessWidget {
  final TextEditingController? controller;
  final String text;
  final double width;
  final double height;
  final Color backgroundColor;
  final Color textColor;
  final Color hintColor;
  final bool obscureText; // <-- add this

  const InputFieldPill({
    super.key,
    this.controller,
    required this.text,
    required this.width,
    required this.height,
    required this.backgroundColor,
    required this.textColor,
    required this.hintColor,
    this.obscureText = false, // default to false
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Center(
          child: TextField(
            controller: controller,
            obscureText: obscureText,
            style: TextStyle(color: textColor),
            decoration: InputDecoration(
              hintText: text,
              hintStyle: TextStyle(color: hintColor),
              border: InputBorder.none,
            ),
          ),
        ),
      ),
    );
  }
}
