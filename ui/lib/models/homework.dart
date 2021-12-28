// To parse this JSON data, do
//
//     final homework = homeworkFromJson(jsonString);

import 'dart:convert';

Homework homeworkFromJson(String str) => Homework.fromJson(json.decode(str));

String homeworkToJson(Homework data) => json.encode(data.toJson());

class Homework {
  Homework({
    this.title,
    this.time,
    this.doneBy,
  });

  String title;
  DateTime time;
  List<String> doneBy;

  factory Homework.fromJson(Map<String, dynamic> json) => Homework(
    title: json["title"],
    time: DateTime.parse(json["time"]),
    doneBy: List<String>.from(json["doneBy"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "time": time.toIso8601String(),
    "doneBy": List<dynamic>.from(doneBy.map((x) => x)),
  };
}
