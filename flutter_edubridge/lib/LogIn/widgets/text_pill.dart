import 'package:flutter/material.dart';

class TextPill extends StatelessWidget {
  final String text;
  final Color textColor;
  final double width;
  final double height;
  final double textSize;
  final FontWeight? fontWeight;

  const TextPill({
    super.key,
    required this.text,
    required this.textColor,
    required this.width,
    required this.height,
    required this.textSize,
    this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
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
    );
  }
}
