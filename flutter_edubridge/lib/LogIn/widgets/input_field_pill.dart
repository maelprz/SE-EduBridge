import 'package:flutter/material.dart';

// Container(
//                   padding: const EdgeInsets.symmetric(horizontal: 20),
//                   decoration: BoxDecoration(
//                     // ignore: deprecated_member_use
//                     color: Colors.teal.shade200.withOpacity(0.6),
//                     borderRadius: BorderRadius.circular(40),
//                   ),
//                   child: const TextField(
//                     decoration: InputDecoration(
//                       border: InputBorder.none,
//                       hintText: 'Email',
//                     ),
//                   ),
//                 ),

class InputFieldPill extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final Color textColor;
  final double width;
  final double height;

  const InputFieldPill({
    super.key,
    required this.text,
    required this.backgroundColor,
    required this.textColor,
    this.width = 410,
    this.height = 62,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(40),
      ),
      child: Center(
        child: TextField(
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: text,
            hintStyle: TextStyle(color: textColor),
          ),
          style: TextStyle(color: textColor),
        ),
      ),
    );
  }
}
