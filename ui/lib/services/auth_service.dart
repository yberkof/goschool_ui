import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ui/utils/alert_helper.dart';

class AuthenticationService {
  final FirebaseAuth _firebaseAuth;

  AuthenticationService(
    this._firebaseAuth,
  );

  Stream<User> get authStateChange => _firebaseAuth.authStateChanges();

  Future<UserCredential> signIn(
      BuildContext context, String email, String password) async {
    try {
      UserCredential userCredential = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      return userCredential;
    } on FirebaseAuthException catch (e) {
      AlertHelper.hideProgressDialog(context);
      AlertHelper.showError(context, e.message);
      return null;
    }
  }

  Future<String> logout() async {
    try {
      await _firebaseAuth.signOut();
      return "Signed out";
    } on FirebaseAuthException catch (e) {
      return "Error Signout : " + e.message;
    }
  }

  Future<UserCredential> signUp(
      BuildContext context, String email, String password) async {
    try {
      UserCredential userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      return userCredential;
    } on FirebaseAuthException catch (e) {
      AlertHelper.hideProgressDialog(context);
      AlertHelper.showError(context, e.message);
      return null;
    }
  }
}
