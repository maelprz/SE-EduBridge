import 'package:flutter/material.dart';
import '../../Dashboard/dashboard_screen.dart';
import '../../Profile/profile_screen.dart';
import '../../Messaging/screens/message_list_screen.dart';

class NavRoutes {
  static void goTo(int index, BuildContext context) {
    Widget destination;

    switch (index) {
      case 0:
        destination = const MessageListScreen();
        break;
      case 1:
        destination = const DashboardScreen();
        break;
      case 2:
        destination = const ProfileScreen();
        break;
      default:
        return;
    }

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => destination),
    );
  }
}
