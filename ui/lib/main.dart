import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ui/generated/l10n.dart';
import 'package:ui/models/app_model.dart';
import 'package:ui/screens/welcome_screen.dart';
import 'package:ui/utils/app_model_helper.dart';
import 'package:ui/utils/route_helper.dart';
import 'package:ui/teachers/teacher_bottom_navigation.dart';
import 'package:ui/students/student_bottom_navigation.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  S.load(Locale('en'));
  await Firebase.initializeApp();
  Get.put(AppModel.shared);
  if (FirebaseAuth.instance.currentUser != null)
    AppModelHelper.shared.loadCurrentUser(() {
      runApp(MyApp());
    });
  else
    runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: S.current.goSchool,
      localizationsDelegates: [
        S.delegate,
        DefaultMaterialLocalizations.delegate
      ],
      theme: ThemeData(
        primaryColor: Color(0xFF202328),
        accentColor: Color(0xFF63CF93),
        backgroundColor: Color(0xFF12171D),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: _getRoute(),
    );
  }

  Widget _getRoute() {
    return FirebaseAuth.instance.currentUser != null
        ? RouteHelper.shared.getHomeByRole()
        : WelcomeScreen();
  }
}
