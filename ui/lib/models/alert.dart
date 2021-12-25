// To parse this JSON data, do
//
//     final alert = alertFromJson(jsonString);

import 'dart:convert';

Alert alertFromJson(String str) => Alert.fromJson(json.decode(str));

String alertToJson(Alert data) => json.encode(data.toJson());

class Alert {
  Alert({
    this.title,
    this.subject,
    this.time,
  });

  String title;
  String subject;
  DateTime time;

  factory Alert.fromJson(Map<String, dynamic> json) => Alert(
    title: json["title"],
    subject: json["subject"],
    time: DateTime.parse(json["time"]),
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "subject": subject,
    "time": time.toIso8601String(),
  };
}
