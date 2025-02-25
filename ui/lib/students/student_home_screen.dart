import 'package:flutter/material.dart';
import 'package:ui/constants.dart';
import 'package:ui/generated/l10n.dart';
import 'package:ui/models/app_model.dart';
import 'package:ui/utils/app_model_helper.dart';
import 'package:ui/widgets/header.dart';
import 'package:ui/widgets/recents_alerts.dart';
import 'package:ui/widgets/recents_homeworks.dart';

class StudentHomeScreen extends StatefulWidget {
  @override
  _StudentHomeScreenState createState() => _StudentHomeScreenState();
}

class _StudentHomeScreenState extends State<StudentHomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
      AppModelHelper.shared.loadCurrentUser(() {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    if (AppModel.shared.currentUser == null) {
      return Container();
    }
    return SafeArea(
      child: ListView(
        children: <Widget>[
          Header(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: TextField(
              style: TextStyle(color: kTextColor),
              cursorColor: kTextColor,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(8.0),
                border: InputBorder.none,
                fillColor: Theme.of(context).primaryColor,
                filled: true,
                hintText: S.of(context).search,
                hintStyle: TextStyle(color: kTextColor),
                prefixIcon: Icon(Icons.search, color: kTextColor, size: 26.0),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
            ),
          ),
          SizedBox(height: 30.0),
          Container(
            padding: EdgeInsets.only(top: 35, left: 20),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50.0),
                topRight: Radius.circular(50.0),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  S.of(context).recentAlerts,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 30.0),
                RecentAlerts(),
                Center(
                  child: Text(
                    S.of(context).viewAll,
                    style: TextStyle(
                        color: Theme.of(context).accentColor, fontSize: 15.0),
                  ),
                ),
                SizedBox(height: 20.0),
                Text(
                  S.of(context).recentHomework,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 30.0),
                RecentHomeworks(),
                Center(
                  child: Text(
                    S.of(context).viewAll,
                    style: TextStyle(
                        color: Theme.of(context).accentColor, fontSize: 15.0),
                  ),
                ),
                SizedBox(height: 30.0),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
