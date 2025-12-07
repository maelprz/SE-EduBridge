import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../Profile/profile_screen.dart';
import '../../LogIn/screens/login.dart';
import '../../../providers/user_provider.dart';

class DashboardHeader extends ConsumerStatefulWidget {
  const DashboardHeader({super.key});

  @override
  ConsumerState<DashboardHeader> createState() => _DashboardHeaderState();
}

class _DashboardHeaderState extends ConsumerState<DashboardHeader> {
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
              color: Colors.white,
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
                    onTap: () async {
                      _removeDropdown();

                      await FirebaseAuth.instance.signOut();

                      ref.invalidate(userProfileProvider);
                      if (context.mounted) {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (_) => const LoginScreen()),
                          (route) => false,
                        );
                      }
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
    ref.watch(userProfileProvider);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.07),
            blurRadius: 6,
            offset: const Offset(0, 3),
          )
        ],
      ),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const ProfileScreen()),
              );
            },
            borderRadius: BorderRadius.circular(28),
            child: const CircleAvatar(
              radius: 28,
              backgroundColor: Color(0xFF0C4B36),
              child: Icon(Icons.person, color: Colors.white, size: 32),
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Consumer(
              builder: (context, ref, _) {
                final profile = ref.watch(userProfileProvider);

                if (profile == null) {
                  return const Text("Loading...",
                      style: TextStyle(fontSize: 14, color: Colors.black54));
                }

                final first = profile["firstName"] ?? "";
                final last = profile["lastName"] ?? "";
                final formatted = "$last, $first";

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Welcome!",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    Text(
                      formatted,
                      style: const TextStyle(fontSize: 14, color: Colors.black54),
                    ),
                  ],
                );
              },
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
