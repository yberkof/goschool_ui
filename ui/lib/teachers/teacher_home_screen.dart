import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui/generated/l10n.dart';
import 'package:ui/models/app_model.dart';
import 'package:ui/utils/app_model_helper.dart';
import 'package:ui/widgets/header.dart';
import 'package:ui/widgets/recents_alerts.dart';
import 'package:ui/widgets/recents_homeworks.dart';
import 'add_alert_screen.dart';

class TeacherHomeScreen extends StatefulWidget {
  @override
  _TeacherHomeScreenState createState() => _TeacherHomeScreenState();
}

class _TeacherHomeScreenState extends State<TeacherHomeScreen> {
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
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        S.of(context).recentAlerts,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.only(end: 16.0),
                      child: IconButton(
                        icon: Icon(
                          Icons.add,
                          color: Colors.green,
                          size: 40,
                        ),
                        onPressed: () {
                          _addAlert();
                        },
                      ),
                    )
                  ],
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

  Future<void> _addAlert() async {
      await Get.bottomSheet(AddAlertScreen(),
        useRootNavigator: true, isScrollControlled: true);
            setState(() {

            });
  }
}
