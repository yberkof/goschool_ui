import 'package:get/get.dart';
import 'package:ui/models/user.dart';

class AppModel extends GetxController {
  AppModel._();

  static var shared = AppModel._();
  var currentUser = Rx<User>(null);

  void setUser(User fromMap) {
    currentUser= fromMap.obs;
  }
}
