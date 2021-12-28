import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ui/models/homework.dart';
import 'package:ui/utils/alert_helper.dart';

class HomeworksService {
  static var shared = HomeworksService();
  CollectionReference Homeworks =
      FirebaseFirestore.instance.collection('Homeworks');

  Future<void> addHomework(BuildContext context, Homework Homework) async {
    return Homeworks.add(Homework.toJson())
        .then((value) => print("Homework Added"))
        .catchError((error) {
      AlertHelper.hideProgressDialog(context);
      AlertHelper.showError(context, error);
    });
  }

  Future<List<Homework>> getHomeworks(BuildContext context) async {
    try {
      var querySnapshot = await Homeworks.get();
      return querySnapshot.docs
          .map<Homework>((e) => Homework.fromJson(e.data()))
          .toList();
    } catch (error) {
      AlertHelper.showError(context, error);
      return [];
    }
  }
}
