import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ui/config/themes.dart';
import 'package:ui/generated/l10n.dart';
import 'package:ui/models/user.dart' as user;
import 'package:ui/services/auth_service.dart';
import 'package:ui/services/users_service.dart';
import 'package:ui/utils/alert_helper.dart';
import 'package:ui/widgets/app_outlinebutton.dart';
import 'package:ui/widgets/app_textfield.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController _emailController;
  TextEditingController _passwordController;
  TextEditingController _firstNameController;
  TextEditingController _lastNameController;
  TextEditingController _schoolNameController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _firstNameController = TextEditingController();
    _lastNameController = TextEditingController();
    _schoolNameController = TextEditingController();
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
              Stack(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Image.asset(
                      "assets/register.jpg",
                      height: 250,
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.keyboard_arrow_left),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
              Text(
                S.of(context).signUp,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Themes.colorHeader,
                  fontSize: 32,
                ),
              ),
              SizedBox(height: 12),
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
              SizedBox(height: 24),
              Text(
                S.of(context).orRegisterWithEmail,
                style: TextStyle(color: Colors.black38),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 24),
              AppTextField(
                controller: _emailController,
                hint: S.of(context).emailId,
                icon: Icons.email,
              ),
              SizedBox(height: 12),
              AppTextField(
                  controller: _passwordController,
                  hint: S.of(context).password,
                  icon: Icons.lock,
                  isObscureText: true),
              SizedBox(height: 12),
              AppTextField(
                controller: _firstNameController,
                hint: S.of(context).firstName,
                icon: Icons.person,
              ),
              SizedBox(height: 12),
              AppTextField(
                controller: _lastNameController,
                hint: S.of(context).lastName,
                icon: Icons.person,
              ),
              SizedBox(height: 12),
              AppTextField(
                controller: _schoolNameController,
                hint: S.of(context).schoolName,
                icon: Icons.school,
              ),
              SizedBox(height: 12),
              FlatButton(
                color: Themes.colorPrimary,
                padding: EdgeInsets.all(16),
                child: Text(
                  S.of(context).register,
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
                      .signUp(context, _emailController.text,
                          _passwordController.text)
                      .then((value) {
                    if (value != null)
                      UsersService.shared
                          .addUser(
                              context,
                              user.User(
                                  email: _emailController.text,
                                  firstName: _firstNameController.text,
                                  lastName: _lastNameController.text,
                                  schoolName: _schoolNameController.text,
                                  uid: value.user.uid,
                                  role: 'S'))
                          .then((value) {
                        AlertHelper.hideProgressDialog(context);
                        Navigator.of(context).pop();
                      });
                  });
                },
              ),
              SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }
}
