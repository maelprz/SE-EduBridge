import 'package:flutter/material.dart';

class DashboardHeader extends StatefulWidget {
  const DashboardHeader({super.key});

  @override
  State<DashboardHeader> createState() => _DashboardHeaderState();
}

class _DashboardHeaderState extends State<DashboardHeader> {
  OverlayEntry? _dropdownOverlay;

  void _toggleDropdown() {
    if (_dropdownOverlay == null) {
      _showDropdown();
    } else {
      _removeDropdown();
    }
  }

  void _showDropdown() {
    final overlay = Overlay.of(context);
    if (overlay == null) return;

    RenderBox renderBox = context.findRenderObject() as RenderBox;
    final size = renderBox.size;
    final offset = renderBox.localToGlobal(Offset.zero);

    _dropdownOverlay = OverlayEntry(
      builder: (context) => Stack(
        children: [
          Positioned.fill(
            child: GestureDetector(
              onTap: _removeDropdown,
              behavior: HitTestBehavior.translucent,
              child: Container(color: Colors.transparent),
            ),
          ),

          // Dropdown menu
          Positioned(
            top: offset.dy + size.height,
            right: 20,
            width: 150,
            child: Material(
              elevation: 4,
              borderRadius: BorderRadius.circular(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _DropdownItem(
                    label: "Settings",
                    onTap: () {
                      _removeDropdown();
                      print("Settings tapped");
                      // TODO: Add navigation or action here
                    },
                  ),
                  _DropdownItem(
                    label: "Support",
                    onTap: () {
                      _removeDropdown();
                      print("Support tapped");
                    },
                  ),
                  _DropdownItem(
                    label: "About Us",
                    onTap: () {
                      _removeDropdown();
                      print("About Us tapped");
                    },
                  ),
                  _DropdownItem(
                    label: "Log Out",
                    onTap: () {
                      _removeDropdown();
                      print("Log Out tapped");
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );

    overlay.insert(_dropdownOverlay!);
  }

  void _removeDropdown() {
    _dropdownOverlay?.remove();
    _dropdownOverlay = null;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.07),
            blurRadius: 6,
            offset: const Offset(0, 3),
          )
        ],
      ),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 28,
            backgroundColor: Color(0xFF0C4B36),
            child: Icon(Icons.person, color: Colors.white, size: 32),
          ),
          const SizedBox(width: 15),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Welcome!",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Text("PEREZ, MEL STEPHEN",
                    style: TextStyle(fontSize: 14, color: Colors.black54)),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(Icons.notifications_none, size: 28),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.settings, size: 28),
            onPressed: _toggleDropdown,
          ),
        ],
      ),
    );
  }
}

class _DropdownItem extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  const _DropdownItem({required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        child: Text(label, style: const TextStyle(fontSize: 15)),
      ),
    );
  }
}
