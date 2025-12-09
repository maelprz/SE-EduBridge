import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../reusables/app_bar_pill.dart';
import '../../reusables/bottom_nav_wrapper.dart';
import '../../Dashboard/dashboard_screen.dart';
import '../widgets/chat_list.dart';
import '../widgets/user_search_dropdown.dart';

class MessageListScreen extends StatefulWidget {
  const MessageListScreen({super.key});

  @override
  State<MessageListScreen> createState() => _MessageListScreenState();
}

class _MessageListScreenState extends State<MessageListScreen> {
  final TextEditingController searchController = TextEditingController();
  final FocusNode searchFocusNode = FocusNode();
  final GlobalKey searchKey = GlobalKey();
  final GlobalKey stackKey = GlobalKey();

  String searchQuery = '';
  double dropdownTop = 0;
  final String currentUserId = FirebaseAuth.instance.currentUser!.uid;

  @override
  void dispose() {
    searchController.dispose();
    searchFocusNode.dispose();
    super.dispose();
  }

  void _dismissDropdown() {
    setState(() {
      searchQuery = '';
      searchController.clear();
    });
    searchFocusNode.unfocus();
  }

  void _updateDropdownPosition() {
    final RenderBox? renderBox = searchKey.currentContext?.findRenderObject() as RenderBox?;
    final RenderBox? stackBox = stackKey.currentContext?.findRenderObject() as RenderBox?;
    if (renderBox != null && stackBox != null) {
      final position = renderBox.localToGlobal(Offset.zero);
      final stackPosition = stackBox.localToGlobal(Offset.zero);
      setState(() {
        dropdownTop = position.dy - stackPosition.dy + renderBox.size.height;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BottomNavWrapper(
        index: 0,
        child: Column(
          children: [
            AppBarPill(
              title: "Messages",
              onLeadingIconPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => const DashboardScreen()),
                );
              },
            ),
            const Divider(height: 1),

            Expanded(
              child: Stack(
                key: stackKey,
                children: [
                  // Existing chats list
                  GestureDetector(
                    onTap: _dismissDropdown,
                    child: ChatList(currentUserId: currentUserId),
                  ),

                  // Search bar
                  Positioned(
                    top: 10,
                    left: 20,
                    right: 20,
                    child: TextField(
                      key: searchKey,
                      focusNode: searchFocusNode,
                      controller: searchController,
                      decoration: InputDecoration(
                        hintText: "Search users...",
                        prefixIcon: const Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding:
                            const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                      ),
                      onChanged: (value) {
                        setState(() {
                          searchQuery = value.trim();
                        });
                        _updateDropdownPosition();
                      },
                    ),
                  ),

                  // Floating user search dropdown
                  if (searchQuery.isNotEmpty)
                    UserSearchDropdown(
                      currentUserId: currentUserId,
                      searchQuery: searchQuery,
                      top: dropdownTop,
                      onSelect: _dismissDropdown,
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
