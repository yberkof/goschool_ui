import 'package:flutter/material.dart';
import 'package:ui/config/themes.dart';
import 'package:ui/generated/l10n.dart';
import 'package:ui/widgets/app_outlinebutton.dart';
import 'package:ui/widgets/app_textfield.dart';
import 'package:ui/widgets/fluttericon.dart';
class RegisterPage extends StatelessWidget {
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
                hint: S.of(context).emailId,
                icon: FlutterIcons.email,
              ),
              SizedBox(height: 12),
              AppTextField(
                hint: S.of(context).password,
                icon: FlutterIcons.lock,
              ),
              SizedBox(height: 12),
              AppTextField(
                hint: S.of(context).fullName,
                icon: FlutterIcons.user,
              ),
              SizedBox(height: 12),
              AppTextField(
                hint: S.of(context).companyName,
                icon: FlutterIcons.shop,
              ),
              SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }
}
