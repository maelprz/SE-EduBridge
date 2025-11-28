import 'package:flutter/material.dart';

class ProfileImageCard extends StatelessWidget {
  final String imageUrl;
  final double size;

  const ProfileImageCard({
    super.key,
    required this.imageUrl,
    this.size = 160,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Image.asset(
        imageUrl,
        width: size,
        height: size,
        fit: BoxFit.cover,
      ),
    );
  }
}
