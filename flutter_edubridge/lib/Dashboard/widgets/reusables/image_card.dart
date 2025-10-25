import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ImageCard extends StatelessWidget{
  const ImageCard({
    super.key, 
    required this.image,
  });
  final Image image;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 200,
          width: 190,
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(9),
            color: const Color(0xFFFFFFFF),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 3)
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(9),
            child: image
          ),
        ),
        SizedBox(height: 6),
        Text(
          'Lorem ipsum dolor sit amet consectetur', 
          style: GoogleFonts.nunitoSans(
            fontSize: 12,
            fontWeight: FontWeight.w400
          )
        ),
        Text(
          '\$17.00',
          style: GoogleFonts.raleway(
            fontSize: 17,
            fontWeight: FontWeight.w700
          )
        )
      ],
    );
  }
}