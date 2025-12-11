import 'package:flutter/material.dart';

class VoicePill extends StatelessWidget {
  final String text1;
  final String? text2;
  final String? number;
  final IconData? icon;
  final double? height;
  final double? width;
  final Color textcolor1;
  final Color textcolor2;
  final double textsize;
  final double? textsize2;
  final Color? backgroundColor;

  const VoicePill({
    super.key,
    required this.text1,
    required this.textsize,
    this.textsize2,
    this.text2,
    this.number,
    this.icon,
    this.height,
    this.width,
    required this.textcolor1,
    this.textcolor2 = Colors.black,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: backgroundColor ?? const Color.fromARGB(255, 229, 230, 230),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 10,
      child: Container(
        width: width ?? double.infinity,
        height: height ?? 80,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        alignment: Alignment.centerLeft,
        child: icon != null || number != null
            ? Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (number != null && icon == null)
                    Row(
                      children: [
                        Text(
                          number!,
                          style: TextStyle(
                            color: textcolor1,
                            fontSize: 45,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        SizedBox(width: 10),

                        Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              text1,
                              style: TextStyle(
                                color: textcolor1,
                                fontSize: textsize,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            if (text2 != null)
                              Text(
                                text2!,
                                style: TextStyle(
                                  color: textcolor2,
                                  fontSize: textsize2 ?? 24,
                                ),
                              ),
                          ],
                        ),
                      ],
                    )
                  else if (icon != null && number == null)
                    Row(
                      children: [
                        Icon(icon, color: textcolor1, size: 30),
                        SizedBox(width: 10),
                        Text(
                          text1,
                          style: TextStyle(
                            color: textcolor1,
                            fontSize: textsize,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                ],
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    text1,
                    style: TextStyle(
                      color: textcolor1,
                      fontSize: textsize,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  if (text2 != null)
                    Text(
                      text2!,
                      style: TextStyle(
                        color: textcolor2,
                        fontSize: textsize2 ?? 24,
                      ),
                    ),
                ],
              ),
      ),
    );
  }
}
