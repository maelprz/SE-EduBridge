import 'package:flutter/material.dart' hide DropdownMenu;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../Profile/profile_screen.dart';
import '../../LogIn/screens/login.dart';
import '../../../providers/user_provider.dart';
import '../../../providers/message_provider.dart';
import 'dropdown_menu.dart';
import 'notifications_overlay.dart';

class DashboardHeader extends ConsumerStatefulWidget {
  const DashboardHeader({super.key});

  @override
  ConsumerState<DashboardHeader> createState() => _DashboardHeaderState();
}

class _DashboardHeaderState extends ConsumerState<DashboardHeader> {
  OverlayEntry? _dropdownOverlay;
  OverlayEntry? _notifOverlay;

  void _toggleNotifications() {
    if (_notifOverlay == null) {
      _showNotifications();
    } else {
      _removeNotifications();
    }
  }

  void _removeNotifications() {
    _notifOverlay?.remove();
    _notifOverlay = null;
  }

  void _toggleDropdown() {
    if (_dropdownOverlay == null) {
      _showDropdown();
    } else {
      _removeDropdown();
    }
  }

  void _removeDropdown() {
    _dropdownOverlay?.remove();
    _dropdownOverlay = null;
  }

  void _showDropdown() {
    _dropdownOverlay = DropdownMenu.createOverlay(
      context: context,
      onLogout: () async {
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
      onClose: _removeDropdown,
    );

    Overlay.of(context).insert(_dropdownOverlay!);
  }

  void _showNotifications() {
    _notifOverlay = NotificationsOverlay.createOverlay(
      context: context,
      ref: ref,
      onClose: _removeNotifications,
    );

    Overlay.of(context).insert(_notifOverlay!);
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(userProfileProvider);
    ref.watch(chatNotificationsProvider);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: Colors.black.withAlpha(18), blurRadius: 6, offset: const Offset(0, 3))
        ],
      ),
      child: Row(
        children: [
          InkWell(
            onTap: () =>
                Navigator.push(context, MaterialPageRoute(builder: (_) => const ProfileScreen())),
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
                if (profile == null) return const Text("Loading...");
                final first = profile["firstName"] ?? "";
                final last = profile["lastName"] ?? "";
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Welcome!", style: TextStyle(fontWeight: FontWeight.bold)),
                    Text("$last, $first"),
                  ],
                );
              },
            ),
          ),
          Stack(
            children: [
              IconButton(
                icon: const Icon(Icons.notifications_none),
                onPressed: _toggleNotifications,
              ),
              Positioned(
                right: 6,
                top: 6,
                child: Consumer(
                  builder: (context, ref, _) {
                    final notifAsync = ref.watch(chatNotificationsProvider);
                    return notifAsync.when(
                      data: (notifications) {
                        if (notifications.isEmpty) return const SizedBox.shrink();
                        return Container(
                          padding: const EdgeInsets.all(4),
                          decoration: const BoxDecoration(color: Colors.red, shape: BoxShape.circle),
                          child: Text(
                            notifications.length.toString(),
                            style: const TextStyle(
                                color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
                          ),
                        );
                      },
                      loading: () => const SizedBox.shrink(),
                      error: (_, _) => const SizedBox.shrink(),
                    );
                  },
                ),
              ),
            ],
          ),
          IconButton(icon: const Icon(Icons.settings), onPressed: _toggleDropdown),
        ],
      ),
    );
  }
}
