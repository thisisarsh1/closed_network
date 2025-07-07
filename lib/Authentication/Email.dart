import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

ValueNotifier<AuthService> authService = ValueNotifier(AuthService());
class AuthService extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User? _user;                        // cached user
  StreamSubscription<User?>? _sub;    // auth state listener

  // ---- constructor ----
  AuthService() {
    _sub = _auth.authStateChanges().listen(_onAuthChanged);
  }

  // ---- internal listener ----
  void _onAuthChanged(User? user) {
    _user = user;
    notifyListeners();
  }

  // ---- public getters ----
  User? get currentUser {
    return _user;
  }

  bool get isLoggedIn {
    return _user != null;
  }

  Stream<User?> get authStateChanges {
    return _auth.authStateChanges();
  }

  // ---- register ----
  Future<UserCredential?> signUp({
    required String email,
    required String password,
  }) async {
    return await _auth.createUserWithEmailAndPassword(
      email: email.trim(),
      password: password.trim(),
    );
  }

  // ---- login ----
  Future<UserCredential?> signIn({
    required String email,
    required String password,
  }) async {
    return await _auth.signInWithEmailAndPassword(
      email: email.trim(),
      password: password.trim(),
    );
  }

  // ---- logout ----
  Future<void> signOut() async {
    await _auth.signOut();
  }

  // ---- reset e‑mail link ----
  Future<void> sendResetEmail(String email) async {
    await _auth.sendPasswordResetEmail(email: email.trim());
  }

  // ---- change password (requires re‑auth) ----
  Future<void> changePassword({
    required String currentPassword,
    required String newPassword,
  }) async {
    final user = _auth.currentUser;
    if (user == null || user.email == null) {
      throw FirebaseAuthException(
        code: 'no-user',
        message: 'No signed‑in user.',
      );
    }

    // re‑authenticate
    final cred = EmailAuthProvider.credential(
      email: user.email!,
      password: currentPassword.trim(),
    );
    await user.reauthenticateWithCredential(cred);

    // update
    await user.updatePassword(newPassword.trim());
  }

  // ---- cleanup ----
  @override
  void dispose() {
    _sub?.cancel();
    super.dispose();
  }
}
