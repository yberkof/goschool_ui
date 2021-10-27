import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ui/models/app_model.dart';

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(30.0, 50.0, 30.0, 30.0),
      child: Column(
        children: [
          _buildFirstRow(),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    AppModel.shared.currentUser.firstName +
                        ' ' +
                        AppModel.shared.currentUser.lastName,
                    style: _getTextStyle(fontSize: 20),
                  ),
                ),
                Text(
                  AppModel.shared.currentUser.email,
                  style: _getTextStyle(fontSize: 20),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Row _buildFirstRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        SvgPicture.asset(
          "assets/icons/grad_cap.png",
          height: 70.0,
        ),
        Text(
          AppModel.shared.currentUser.schoolName,
          style: _getTextStyle(),
        ),
        CircleAvatar(
          radius: 25.0,
          backgroundImage: AssetImage("assets/images/profile_pic.jpg"),
        ),
      ],
    );
  }

  TextStyle _getTextStyle({double fontSize = 30}) {
    return TextStyle(
      color: Colors.white,
      fontSize: fontSize,
      fontWeight: FontWeight.bold,
    );
  }
}
