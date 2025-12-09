import 'package:flutter/material.dart';
import 'dropdown_item.dart';

class DropdownMenu {
  static OverlayEntry createOverlay({
    required BuildContext context,
    required VoidCallback onLogout,
    required VoidCallback onClose,
  }) {
    final renderBox = context.findRenderObject() as RenderBox?;
    if (renderBox == null) throw Exception("RenderBox not ready");

    final size = renderBox.size;
    final offset = renderBox.localToGlobal(Offset.zero);

    return OverlayEntry(
      builder: (context) {
        return Stack(
          children: [
            Positioned.fill(
              child: GestureDetector(
                onTap: onClose,
                behavior: HitTestBehavior.translucent,
                child: Container(color: Colors.transparent),
              ),
            ),
            Positioned(
              top: offset.dy + size.height,
              right: 20,
              width: 150,
              child: Material(
                color: Colors.white,
                elevation: 4,
                borderRadius: BorderRadius.circular(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    DropdownItem(label: "Settings", onTap: () {}),
                    DropdownItem(label: "Support", onTap: () {}),
                    DropdownItem(label: "About Us", onTap: () {}),
                    DropdownItem(label: "Log Out", onTap: onLogout),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
