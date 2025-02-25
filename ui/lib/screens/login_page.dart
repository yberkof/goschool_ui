import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:ui/config/themes.dart';
import 'package:ui/generated/l10n.dart';
import 'package:ui/screens/register_page.dart';
import 'package:ui/services/auth_service.dart';
import 'package:ui/utils/alert_helper.dart';
import 'package:ui/utils/app_model_helper.dart';
import 'package:ui/utils/route_helper.dart';
import 'package:ui/widgets/app_outlinebutton.dart';
import 'package:ui/widgets/app_textfield.dart';
import 'package:ui/students/student_bottom_navigation.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TapGestureRecognizer registerOnTap;

  TextEditingController _passwordController;

  TextEditingController _emailController;

  @override
  void initState() {
    registerOnTap = TapGestureRecognizer();
    registerOnTap
      ..onTap = () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => RegisterPage(),
          ),
        );
      };
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: ListView(
            children: [
              Image.asset(
                "assets/login.jpg",
                height: 250,
              ),
              Text(
                S.of(context).login,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Themes.colorHeader,
                  fontSize: 32,
                ),
              ),
              SizedBox(height: 12),
              AppTextField(
                hint: S.of(context).emailId,
                icon: Icons.email,
                controller: _emailController,
              ),
              SizedBox(height: 12),
              AppTextField(
                hint: S.of(context).password,
                icon: Icons.lock,
                isObscureText: true,
                helpContent: Text(
                  S.of(context).forgot,
                  style: TextStyle(fontSize: 16, color: Themes.colorPrimary),
                ),
                controller: _passwordController,
                helpOnTap: () {},
              ),
              SizedBox(height: 12),
              FlatButton(
                color: Themes.colorPrimary,
                padding: EdgeInsets.all(16),
                child: Text(
                  S.of(context).login,
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(16),
                  ),
                ),
                onPressed: () {
                  AlertHelper.showProgressDialog(context);
                  AuthenticationService(FirebaseAuth.instance)
                      .signIn(context, _emailController.text,
                          _passwordController.text)
                      .then((value) {
                    if (value != null) {
                      AppModelHelper.shared.loadCurrentUser(() {
                        AlertHelper.hideProgressDialog(context);
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (c) =>
                                RouteHelper.shared.getHomeByRole()));
                      });
                    }
                  });
                },
              ),
              SizedBox(height: 24),
              Text(
                S.of(context).orLoginWith,
                style: TextStyle(color: Colors.black38),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    child: AppOutlineButton(
                      asset: "assets/google.png",
                      onTap: () {},
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: AppOutlineButton(
                      asset: "assets/facebook.png",
                      onTap: () {},
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: AppOutlineButton(
                      asset: "assets/apple.png",
                      onTap: () {},
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12),
              Text.rich(
                TextSpan(
                  text: S.of(context).newToIthicklogistics,
                  children: [
                    TextSpan(
                      text: S.of(context).register,
                      style: TextStyle(
                        color: Themes.colorPrimary,
                        fontWeight: FontWeight.bold,
                      ),
                      recognizer: registerOnTap,
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black54),
              ),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
