import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ui/models/app_model.dart';
import 'package:ui/models/user.dart' as user;

class AppModelHelper {
  AppModelHelper._();

  static var shared = AppModelHelper._();
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  void loadCurrentUser(VoidCallback callback) {
    users
        .where('uid', isEqualTo: FirebaseAuth.instance.currentUser.uid)
        .get()
        .then((value) {
      if (value.size == 1) {
        AppModel.shared.setUser( user.User.fromMap(value.docs[0].data()));
        callback.call();
      }
    });
  }
}
