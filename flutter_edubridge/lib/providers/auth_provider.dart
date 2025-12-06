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

  /// LOGIN
  Future<String?> login({
    required String emailOrUsername, 
    required String password,
  }) async {
    try {
      String email = emailOrUsername;

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

      // Load user profile after login
      final userDoc = await _firestore
          .collection('users')
          .doc(userCredential.user!.uid)
          .get();

      final data = userDoc.data();
      if (data != null) {
        if (data['birthday'] is Timestamp) {
          data['birthday'] = (data['birthday'] as Timestamp).toDate();
        }

        ref.read(userProfileProvider.notifier).setProfile(data);
      }

      return null;
    } on FirebaseAuthException catch (e) {
      return e.message;
    } catch (e) {
      return e.toString();
    }
  }

  /// REGISTER USER
  Future<String?> register({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
    required String username,
    required String courseYear,
    required DateTime birthday,
  }) async {
    try {
      // Check username availability
      final query = await _firestore
          .collection('users')
          .where('username', isEqualTo: username)
          .limit(1)
          .get();

      if (query.docs.isNotEmpty) return 'Username already exists';

      final userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final profileData = {
        'firstName': firstName,
        'lastName': lastName,
        'username': username,
        'email': email,
        'courseYear': courseYear,
        'birthday': Timestamp.fromDate(birthday),
        'createdAt': Timestamp.now(),
      };

      await _firestore
          .collection('users')
          .doc(userCredential.user!.uid)
          .set(profileData);

      ref.read(userProfileProvider.notifier).setProfile({
        ...profileData,
        'birthday': birthday,
      });

      return null;
    } on FirebaseAuthException catch (e) {
      return e.message;
    } catch (e) {
      return e.toString();
    }
  }

  /// LOGOUT
  Future<void> logout() async {
    await _auth.signOut();
    ref.read(userProfileProvider.notifier).clearProfile();
  }
}
