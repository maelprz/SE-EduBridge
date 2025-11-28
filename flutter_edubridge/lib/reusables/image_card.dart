import 'package:flutter/material.dart';

class ImageCard extends StatelessWidget {
  final String title;
  final String? subtitle;
  final String imageUrl;

  /// Optional dimensions
  final double? width;
  final double height;

  /// Optional style flag (backwards compatibility)
  final bool isWide;

  const ImageCard({
    super.key,
    required this.title,
    this.subtitle,
    required this.imageUrl,
    this.width,
    this.height = 150,
    this.isWide = false,
  });

  @override
  Widget build(BuildContext context) {
    final cardWidth = width ?? (isWide ? 240 : null);

    return Container(
      width: cardWidth,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(
          image: AssetImage(imageUrl),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            colors: [
              Colors.black.withOpacity(0.6),
              Colors.transparent,
            ],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
        child: Align(
          alignment: Alignment.bottomLeft,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),

              if (subtitle != null)
                Text(
                  subtitle!,
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 13,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
