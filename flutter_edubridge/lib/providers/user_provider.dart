import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserProfileNotifier extends StateNotifier<Map<String, dynamic>?> {
  UserProfileNotifier() : super(null);

  /// Set profile immediately (used after login or registration)
  void setProfile(Map<String, dynamic> profile) {
    state = profile;
  }

  /// Load profile from Firestore
  Future<void> loadProfile() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      state = null;
      return;
    }
    final doc = await FirebaseFirestore.instance.collection('users').doc(user.uid).get();
    state = doc.data();
  }

  /// Reset profile (on logout)
  void clearProfile() {
    state = null;
  }
}

/// Provider to watch user profile
final userProfileProvider =
    StateNotifierProvider<UserProfileNotifier, Map<String, dynamic>?>(
        (ref) => UserProfileNotifier());
