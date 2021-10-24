import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:ui/config/themes.dart';
import 'package:ui/generated/l10n.dart';

class AlertHelper {
  static void showError(BuildContext context, String err) {
    CoolAlert.show(
        context: context,
        type: CoolAlertType.error,
        confirmBtnText: S.of(context).retry,
        text: err,
        title: S.of(context).failed,
        backgroundColor: Colors.blue.shade200,
        confirmBtnColor: Themes.colorPrimary);
  }

  static void showProgressDialog(BuildContext context) {
    CoolAlert.show(
        context: context,
        type: CoolAlertType.loading,
        barrierDismissible: false);
  }

  static void hideProgressDialog(BuildContext context) {
    Navigator.pop(context);
  }
}
