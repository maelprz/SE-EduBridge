import 'package:flutter/material.dart';

class BoxIconButton extends StatelessWidget {
  const BoxIconButton({
    super.key,
    required this.boxIcon,
    required this.size,
    this.boxHeight,
    this.boxWidth
  });

  final IconData boxIcon;
  final double size;
  final double? boxHeight;
  final double? boxWidth;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 10, 16, 29),
      child: Container(
        height: boxHeight??30,
        width: boxWidth??30,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(11),
          color: Color.fromARGB(120, 231, 231, 231)
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(11, 9, 10, 7),
          child: Icon(
            boxIcon, 
            size: size
          ),
        ),
      ),
    );
  }
}