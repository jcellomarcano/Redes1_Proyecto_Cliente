// To parse this JSON data, do
//
//     final alertSender = alertSenderFromJson(jsonString);

import 'dart:convert';

AlertSender alertSenderFromJson(String str) => AlertSender.fromJson(json.decode(str));

String alertSenderToJson(AlertSender data) => json.encode(data.toJson());

class AlertSender {
  String id;
  String time;
  String date;
  String location;

  AlertSender({
    this.id,
    this.time,
    this.date,
    this.location,
  });

  factory AlertSender.fromJson(Map<String, dynamic> json) => new AlertSender(
    id: json["id"],
    time: json["time"],
    date: json["date"],
    location: json["location"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "time": time,
    "date": date,
    "location": location,
  };
}
