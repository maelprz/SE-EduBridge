import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'user_provider.dart';

final authServiceProvider = Provider<AuthService>((ref) {
  return AuthService(ref);
});

class AuthService {
  final Ref ref;
  AuthService(this.ref);

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  /// Login with email or username
  Future<String?> login({
    required String emailOrUsername, 
    required String password,
  }) async {
    try {
      String email = emailOrUsername;

      // If user entered a username, resolve it to email
      if (!emailOrUsername.contains('@')) {
        final query = await _firestore
            .collection('users')
            .where('username', isEqualTo: emailOrUsername)
            .limit(1)
            .get();
        if (query.docs.isEmpty) return 'Username not found';
        email = query.docs.first.data()['email'];
      }

      final userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      final userDoc = await _firestore.collection('users').doc(userCredential.user!.uid).get();
      final profileData = userDoc.data();
      if (profileData != null) {
        ref.read(userProfileProvider.notifier).setProfile(profileData);
      }

      return null;
    } on FirebaseAuthException catch (e) {
      return e.message;
    } catch (e) {
      return e.toString();
    }
  }

  /// Register a new user
  Future<String?> register({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
    required String username,
  }) async {
    try {
      // Check if username is already taken
      final query = await _firestore
          .collection('users')
          .where('username', isEqualTo: username)
          .get();
      if (query.docs.isNotEmpty) return 'Username already exists';

      final userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Create user profile document
      final profileData = {
        'firstName': firstName,
        'lastName': lastName,
        'username': username,
        'email': email,
      };

      await _firestore.collection('users').doc(userCredential.user!.uid).set(profileData);

      ref.read(userProfileProvider.notifier).setProfile(profileData);

      return null;
    } on FirebaseAuthException catch (e) {
      return e.message;
    } catch (e) {
      return e.toString();
    }
  }

  /// Logout
  Future<void> logout() async {
    await _auth.signOut();
    ref.read(userProfileProvider.notifier).clearProfile();
  }
}
