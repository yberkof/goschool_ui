import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  final IconData icon;
  final String hint;
  final VoidCallback helpOnTap;
  final Widget helpContent;
  final TextEditingController controller;
  final bool isObscureText;

  AppTextField({
    @required this.icon,
    @required this.hint,
    this.helpOnTap,
    this.helpContent,
    this.controller,
    this.isObscureText,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        TextFormField(
          obscureText: isObscureText ?? false,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(color: Colors.black38),
            prefixIcon: Icon(icon),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black12),
            ),
          ),
          controller: controller,
        ),
        if (helpContent != null && helpOnTap != null)
          Container(
            height: 48,
            child: Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: helpOnTap,
                child: helpContent,
              ),
            ),
          )
      ],
    );
  }
}
