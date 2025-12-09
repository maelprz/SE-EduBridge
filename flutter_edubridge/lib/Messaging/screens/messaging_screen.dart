import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../reusables/app_bar_pill.dart';
import '../widgets/message_bubble.dart';
import '../widgets/message_input.dart';

class MessagingScreen extends StatefulWidget {
  final String personName;
  final String otherUserId;

  const MessagingScreen({
    super.key,
    required this.personName,
    required this.otherUserId,
  });

  @override
  State<MessagingScreen> createState() => _MessagingScreenState();
}

class _MessagingScreenState extends State<MessagingScreen> {
  final TextEditingController controller = TextEditingController();
  final ScrollController scrollController = ScrollController();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String currentUserId = FirebaseAuth.instance.currentUser!.uid;

  String get chatId {
    final ids = [currentUserId, widget.otherUserId]..sort();
    return ids.join("_");
  }

  @override
  void initState() {
    super.initState();
    _removeNotificationsFromSender();
  }

  Future<void> _removeNotificationsFromSender() async {
    final notifCollection = _firestore
        .collection('users')
        .doc(currentUserId)
        .collection('notifications');

    final query =
        await notifCollection.where('senderId', isEqualTo: widget.otherUserId).get();

    for (var doc in query.docs) {
      await notifCollection.doc(doc.id).delete();
    }
  }

  Future<void> sendMessage() async {
    if (controller.text.trim().isEmpty) return;
    final messageText = controller.text.trim();
    controller.clear();

    final chatRef = _firestore.collection("chats").doc(chatId);

    final chatSnapshot = await chatRef.get();
    if (!chatSnapshot.exists) {
      await chatRef.set({
        'participants': [currentUserId, widget.otherUserId],
        'createdAt': FieldValue.serverTimestamp(),
      });
    }

    final senderDoc = await _firestore.collection('users').doc(currentUserId).get();
    final senderName = senderDoc.data()?['firstName'] ?? 'Unknown';

    final messageData = {
      'text': messageText,
      'senderId': currentUserId,
      'senderName': senderName,
      'timestamp': FieldValue.serverTimestamp(),
      'chatId': chatId,
      'receiverId': widget.otherUserId,
    };

    await chatRef.collection('messages').add(messageData);

    final receiverRef = _firestore.collection('users').doc(widget.otherUserId);
    final receiverDoc = await receiverRef.get();
    if (!receiverDoc.exists) {
      await receiverRef.set({
        'firstName': 'Unknown',
        'createdAt': FieldValue.serverTimestamp(),
      });
    }

    // Add notification only to the receiver
    await receiverRef.collection('notifications').add(messageData);

    Future.delayed(const Duration(milliseconds: 100), () {
      scrollController.animateTo(
        scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AppBarPill(
            title: widget.personName,
            onLeadingIconPressed: () => Navigator.pop(context),
          ),
          const Divider(height: 1),
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: _firestore
                  .collection('chats')
                  .doc(chatId)
                  .collection('messages')
                  .orderBy('timestamp')
                  .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator());
                }

                final messages = snapshot.data!.docs;
                return ListView.builder(
                  controller: scrollController,
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  itemCount: messages.length,
                  itemBuilder: (context, index) {
                    final msg = messages[index];
                    final isMe = msg['senderId'] == currentUserId;
                    return MessageBubble(text: msg['text'], isMe: isMe);
                  },
                );
              },
            ),
          ),
          const Divider(height: 1),
          MessageInput(controller: controller, onSend: sendMessage),
        ],
      ),
    );
  }
}
