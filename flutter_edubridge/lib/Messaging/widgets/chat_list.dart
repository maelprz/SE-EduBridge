import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../screens/messaging_screen.dart';
import 'package:intl/intl.dart';

class ChatList extends StatelessWidget {
  final String currentUserId;

  const ChatList({super.key, required this.currentUserId});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('chats')
          .where('participants', arrayContains: currentUserId)
          .snapshots(),
      builder: (context, chatSnapshot) {
        if (!chatSnapshot.hasData) return const Center(child: CircularProgressIndicator());

        final existingChats = chatSnapshot.data!.docs;

        if (existingChats.isEmpty) {
          return const Center(child: Text("No chats yet"));
        }

        return StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('users').snapshots(),
          builder: (context, userSnapshot) {
            if (!userSnapshot.hasData) return const Center(child: CircularProgressIndicator());

            final allUsers = userSnapshot.data!.docs
                .where((doc) => doc.id != currentUserId)
                .toList();

            return ListView(
              padding: const EdgeInsets.only(top: 70),
              children: existingChats.map((chatDoc) {
                final participants = List<String>.from(chatDoc['participants']);
                final otherUserId = participants.firstWhere((id) => id != currentUserId);

                QueryDocumentSnapshot? userData;
                try {
                  userData = allUsers.firstWhere((u) => u.id == otherUserId);
                } catch (e) {
                  userData = null;
                }

                final displayName = userData != null
                    ? '${userData['firstName']} ${userData['lastName']}'
                    : 'Unknown User';

                return StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('chats')
                      .doc(chatDoc.id)
                      .collection('messages')
                      .orderBy('timestamp', descending: true)
                      .limit(1)
                      .snapshots(),
                  builder: (context, msgSnapshot) {
                    String lastMessage = '';
                    String timeText = '';
                    if (msgSnapshot.hasData && msgSnapshot.data!.docs.isNotEmpty) {
                      final lastMsg = msgSnapshot.data!.docs.first;
                      lastMessage = lastMsg['text'] ?? '';
                      final timestamp = lastMsg['timestamp'] as Timestamp?;
                      if (timestamp != null) {
                        final dt = timestamp.toDate();
                        timeText = DateFormat('hh:mm a').format(dt);
                      }
                    }

                    return ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.green.shade700,
                        child: Text(
                          displayName.isNotEmpty ? displayName[0] : '?',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                      title: Text(
                        displayName,
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      subtitle: Text(
                        lastMessage,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      trailing: Text(
                        timeText,
                        style: const TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                      onTap: () {
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
                    );
                  },
                );
              }).toList(),
            );
          },
        );
      },
    );
  }
}
