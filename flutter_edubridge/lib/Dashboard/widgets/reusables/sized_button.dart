import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SizedButton extends StatelessWidget{
  const SizedButton({
    super.key,
    required this.text,
    this.textColor,
    this.backColor,
    this.height,
    this.width
  });

  final String text;
  final Color? textColor;
  final Color? backColor;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height??45,
      width: width??375,
      decoration: BoxDecoration(
        color: backColor??Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: backColor??Colors.white,
          width: 1,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 5),
        child: Center(
          child: Text(
            text,
            style: GoogleFonts.raleway(
              fontSize: 16,
              fontWeight: FontWeight.w300,
              color: textColor??Colors.black,
            ),
          ),
        ),
      )
    );
  }
}