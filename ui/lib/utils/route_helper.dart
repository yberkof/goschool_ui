import 'package:flutter/material.dart';
import 'package:ui/config/themes.dart';
import 'package:ui/generated/l10n.dart';
import 'package:ui/models/app_model.dart';
import 'package:ui/screens/settings_screen.dart';
import 'package:ui/widgets/home_for_not_implemented_role.dart';
import 'package:ui/teachers/teacher_bottom_navigation.dart';
import 'package:ui/students/student_bottom_navigation.dart';

class RouteHelper {
  static var shared = RouteHelper._();

  RouteHelper._();

  Widget getHomeByRole() {
    switch (AppModel.shared.currentUser.value.role) {
      case '3':
        return TeacherBottomNavigation();
      case '4':
        return StudentBottomNavigation();
      default:
        return HomeForNotImplementedRole();
    }
  }
}
