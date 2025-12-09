import 'package:flutter/material.dart';

class DropdownItem extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const DropdownItem({super.key, required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        child: Text(label),
      ),
    );
  }
}
