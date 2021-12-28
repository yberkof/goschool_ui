import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:ui/config/themes.dart';
import 'package:ui/generated/l10n.dart';
import 'package:ui/models/homework.dart';
import 'package:ui/services/homework_service.dart';
import 'package:ui/utils/alert_helper.dart';
import 'package:ui/widgets/app_textfield.dart';

class AddHomeworkScreen extends StatefulWidget {
  const AddHomeworkScreen({Key key}) : super(key: key);

  @override
  State<AddHomeworkScreen> createState() => _AddHomeworkScreenState();
}

class _AddHomeworkScreenState extends State<AddHomeworkScreen> {
  TextEditingController _courseNameController;
  TextEditingController _examChapterController;
  TextEditingController _examDateController;
  DateTime selectedTime = DateTime.now();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _courseNameController = TextEditingController();
    _examChapterController = TextEditingController();
    _examDateController = TextEditingController();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
          child: SizedBox(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AppBar(
                    title: Text(S.current.addHomework),
                  ),
                  AppTextField(
                    controller: _courseNameController,
                    hint: S.current.courseName,
                    icon: Icons.drive_file_rename_outline,
                  ),
                  // InkWell(
                  //   onTap: (){
                  //
                  //   },
                  //   child: AbsorbPointer(
                  //     absorbing: true,
                  //     child: AppTextField(
                  //       controller: _examDateController,
                  //       hint: S.current.courseName,
                  //       icon: Icons.update,
                  //     ),
                  //   ),
                  // ),
                  DateTimePicker(
                    type: DateTimePickerType.dateTimeSeparate,
                    dateMask: 'd MMM, yyyy',
                    initialValue: DateTime.now().toString(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2100),
                    icon: Icon(Icons.event),
                    dateLabelText: S.current.date,
                    timeLabelText: S.current.hour,
                    onChanged: (val) => selectedTime=DateTime.parse(val),
                    validator: (val) {
                      print(val);
                      return null;
                    },
                    onSaved: (val) => selectedTime = DateTime.parse(val),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: FlatButton(
                      color: Themes.colorPrimary,
                      padding: EdgeInsets.all(16),
                      child: Text(
                        S.current.saveAlert,
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(16),
                        ),
                      ),
                      onPressed: () {
                        AlertHelper.showProgressDialog(context);
                        HomeworksService.shared
                            .addHomework(
                            context,
                            Homework(
                                title: _courseNameController.text,
                                time: selectedTime,
                            doneBy: []))
                            .then((value) {
                          AlertHelper.hideProgressDialog(context);
                          Navigator.of(context).pop();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          )),
    );

  }
}
