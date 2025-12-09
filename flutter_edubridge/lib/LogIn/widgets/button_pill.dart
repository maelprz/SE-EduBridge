import 'package:flutter/material.dart';

class ButtonPill extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final Color textColor;
  final double textSize;
  final double width;
  final double height;
  final FontWeight? fontWeight;
  final VoidCallback? onPressed;

  const ButtonPill({
    super.key,
    required this.text,
    required this.backgroundColor,
    required this.textColor,
    required this.textSize,
    required this.width,
    required this.height,
    this.fontWeight,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(40),
          boxShadow: [
            BoxShadow(
              // ignore: deprecated_member_use
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 3,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: textColor,
              fontSize: textSize,
              fontWeight: fontWeight ?? FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }
}
