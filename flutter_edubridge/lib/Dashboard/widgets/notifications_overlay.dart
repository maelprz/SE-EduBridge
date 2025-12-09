import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../providers/message_provider.dart';
import '../../Messaging/screens/messaging_screen.dart';

class NotificationsOverlay {
  static OverlayEntry createOverlay({
    required BuildContext context,
    required WidgetRef ref,
    required VoidCallback onClose,
  }) {
    final renderBox = context.findRenderObject() as RenderBox?;
    if (renderBox == null) throw Exception("RenderBox not ready");

    final size = renderBox.size;
    final offset = renderBox.localToGlobal(Offset.zero);

    final notifAsync = ref.watch(chatNotificationsProvider);

    return OverlayEntry(
      builder: (_) => notifAsync.when(
        data: (notifications) {
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
                right: 70,
                width: 300,
                child: Material(
                  color: Colors.white,
                  elevation: 5,
                  borderRadius: BorderRadius.circular(12),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: notifications.isEmpty
                        ? const Center(child: Text("No new messages"))
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: notifications
                                .map((msg) => _buildNotificationItem(
                                      context: context,
                                      ref: ref,
                                      notification: msg,
                                      onClose: onClose,
                                    ))
                                .toList(),
                          ),
                  ),
                ),
              ),
            ],
          );
        },
        loading: () => const SizedBox.shrink(),
        // ignore: unnecessary_underscores
        error: (_, __) => const SizedBox.shrink(),
      ),
    );
  }

  static Widget _buildNotificationItem({
    required BuildContext context,
    required WidgetRef ref,
    required Map<String, dynamic> notification,
    required VoidCallback onClose,
  }) {
    final senderName = notification['senderName'] as String;
    final text = notification['text'] as String;
    final senderId = notification['senderId'] as String;

    return InkWell(
      onTap: () async {
        onClose();

        // Navigate to chat screen
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => MessagingScreen(
              personName: senderName,
              otherUserId: senderId,
            ),
          ),
        );

        // Remove all notifications from this sender in Firestore
        final notifCollection = FirebaseFirestore.instance
            .collection('users')
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .collection('notifications');

        final query = await notifCollection.where('senderId', isEqualTo: senderId).get();
        for (var doc in query.docs) {
          await notifCollection.doc(doc.id).delete();
        }
        // No need to update Riverpod manually; stream updates automatically
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: Row(
          children: [
            const Icon(Icons.person, size: 22, color: Colors.black54),
            const SizedBox(width: 8),
            Expanded(
              child: RichText(
                text: TextSpan(
                  style: const TextStyle(color: Colors.black),
                  children: [
                    TextSpan(
                      text: "$senderName\n",
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(text: text),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
