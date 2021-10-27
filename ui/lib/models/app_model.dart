import 'package:ui/models/user.dart';

class AppModel {
  AppModel._();

  static var shared = AppModel._();
  User currentUser;
}
