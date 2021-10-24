import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ui/models/user.dart';
import 'package:ui/utils/alert_helper.dart';

class UsersService {
  static var shared = UsersService();
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  Future<void> addUser(BuildContext context, User user) {
    return users
        .add(user.toMap())
        .then((value) => print("User Added"))
        .catchError((error) {
      AlertHelper.hideProgressDialog(context);
      AlertHelper.showError(context, error);
    });
  }
}
