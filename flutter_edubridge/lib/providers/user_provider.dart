import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserProfileNotifier extends StateNotifier<Map<String, dynamic>?> {
  UserProfileNotifier() : super(null);

  void setProfile(Map<String, dynamic> profile) {
    if (profile['birthday'] is Timestamp) {
      profile['birthday'] = (profile['birthday'] as Timestamp).toDate();
    }
    state = profile;
  }

  /// Load profile from Firestore
  Future<void> loadProfile() async {
    final user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      state = null;
      return;
    }

    final doc = await FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .get();

    final data = doc.data();

    if (data != null) {
      if (data['birthday'] is Timestamp) {
        data['birthday'] = (data['birthday'] as Timestamp).toDate();
      }
    }

    state = data;
  }

  void clearProfile() {
    state = null;
  }
}

final userProfileProvider =
    StateNotifierProvider<UserProfileNotifier, Map<String, dynamic>?>(
        (ref) => UserProfileNotifier());
