import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:marquee/marquee.dart';
import 'package:ui/generated/l10n.dart';
import 'package:ui/models/app_model.dart';

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(8.0, 50.0, 8.0, 8.0),
      child: Column(
        children: [
          _buildFirstRow(context),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  S.of(context).name +
                      ' ' +
                      AppModel.shared.currentUser.firstName +
                      ' ' +
                      AppModel.shared.currentUser.lastName,
                  style: _getTextStyle(fontSize: 20),
                ),
                Text(
                  S.of(context).email + ' ' + AppModel.shared.currentUser.email,
                  style: _getTextStyle(fontSize: 20),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Row _buildFirstRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        SvgPicture.asset(
          "assets/icons/grad_cap.png",
          height: 70.0,
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.6,
          height: 30,
          child: Marquee(
            text: AppModel.shared.currentUser.schoolName,
            style: _getTextStyle(),
            scrollAxis: Axis.horizontal,
            crossAxisAlignment: CrossAxisAlignment.start,
            blankSpace: 20.0,
            velocity: 100.0,
            pauseAfterRound: Duration(microseconds: 100),
            startPadding: 10.0,
            accelerationDuration: Duration(seconds: 1),
            accelerationCurve: Curves.linear,
            decelerationDuration: Duration(milliseconds: 500),
            decelerationCurve: Curves.easeOut,
          ),
        ),
        CircleAvatar(
          radius: 25.0,
          backgroundImage: AppModel.shared.currentUser.image != null
              ? CachedNetworkImageProvider(AppModel.shared.currentUser.image)
              : AssetImage("assets/images/user.png"),
        ),
      ],
    );
  }

  TextStyle _getTextStyle({double fontSize = 25}) {
    return TextStyle(
      color: Colors.white,
      fontSize: fontSize,
      fontWeight: FontWeight.bold,
    );
  }
}
