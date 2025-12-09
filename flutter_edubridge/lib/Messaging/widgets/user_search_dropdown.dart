import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../screens/messaging_screen.dart';

class UserSearchDropdown extends StatelessWidget {
  final String currentUserId;
  final String searchQuery;
  final double top;
  final VoidCallback onSelect;

  const UserSearchDropdown({
    super.key,
    required this.currentUserId,
    required this.searchQuery,
    required this.top,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      left: 20,
      right: 20,
      child: GestureDetector(
        onTap: () {},
        child: Material(
          elevation: 5,
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          child: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance.collection('users').snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) return const SizedBox.shrink();

              final allUsers = snapshot.data!.docs
                  .where((doc) => doc.id != currentUserId)
                  .toList();

              final filteredUsers = allUsers.where((doc) {
                final data = doc.data() as Map<String, dynamic>;
                final fullName =
                    '${data['firstName']} ${data['lastName']}'.toLowerCase();
                return fullName.contains(searchQuery.toLowerCase());
              }).toList();

              if (filteredUsers.isEmpty) return const SizedBox.shrink();

              return ListView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                itemCount: filteredUsers.length,
                itemBuilder: (context, index) {
                  final userDoc = filteredUsers[index];
                  final data = userDoc.data() as Map<String, dynamic>;
                  final displayName = '${data['firstName']} ${data['lastName']}';
                  final otherUserId = userDoc.id;

                  return InkWell(
                    onTap: () {
                      onSelect(); // dismiss dropdown
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => MessagingScreen(
                            personName: displayName,
                            otherUserId: otherUserId,
                          ),
                        ),
                      );
                    },
                    child: Padding(
                      padding:
                          const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
                      child: Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.green.shade700,
                            child: Text(
                              displayName.isNotEmpty ? displayName[0] : '?',
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Text(
                            displayName,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
