import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

final chatNotificationsProvider =
    StreamProvider.autoDispose<List<Map<String, dynamic>>>((ref) {
  final uid = FirebaseAuth.instance.currentUser!.uid;

  return FirebaseFirestore.instance
      .collection('users')
      .doc(uid)
      .collection('notifications')
      .orderBy('timestamp', descending: true)
      .snapshots()
      .map((snapshot) {
    return snapshot.docs.map((doc) {
      final data = doc.data();
      return {
        'id': doc.id,
        'text': data['text'] ?? '',
        'senderId': data['senderId'] ?? '',
        'senderName': data['senderName'] ?? 'Unknown',
        'chatId': data['chatId'] ?? '',
        'timestamp': data['timestamp'] ?? Timestamp.now(),
      };
    }).toList();
  });
});
