import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

//TODO: finish making this static
class Auth {
  static final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  static User? get currentUser => _firebaseAuth.currentUser;
  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<void> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  static Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  static Widget signOutButton() => const ElevatedButton(
        onPressed: signOut,
        child: Text('sign out'),
      );
}
