import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ui/models/alert.dart';
import 'package:ui/utils/alert_helper.dart';

class AlertsService {
  static var shared = AlertsService();
  CollectionReference alerts = FirebaseFirestore.instance.collection('alerts');

  Future<void> addAlert(BuildContext context, Alert alert) async {
    return alerts
        .add(alert.toJson())
        .then((value) => print("Alert Added"))
        .catchError((error) {
      AlertHelper.hideProgressDialog(context);
      AlertHelper.showError(context, error);
    });
  }

  Future<List<Alert>> getAlerts(BuildContext context) async {
    try {
      var querySnapshot = await alerts.get();
      return querySnapshot.docs
          .map<Alert>((e) => Alert.fromJson(e.data()))
          .toList();
    } catch (error) {
      AlertHelper.showError(context, error);
      return [];
    }
  }
}
