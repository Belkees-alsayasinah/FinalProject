// To parse this JSON data, do
//
//     final meetingRequestModel = meetingRequestModelFromJson(jsonString);

import 'dart:convert';

MeetingRequestModel meetingRequestModelFromJson(String str) => MeetingRequestModel.fromJson(json.decode(str));

String meetingRequestModelToJson(MeetingRequestModel data) => json.encode(data.toJson());

class MeetingRequestModel {
  int id;
  String hour;
  int statusHour;
  String timePeriod;
  DateTime date;
  DateTime createdAt;
  DateTime updatedAt;

MeetingRequestModel({
    required this.id,
    required this.hour,
    required this.statusHour,
    required this.timePeriod,
    required this.date,
    required this.createdAt,
    required this.updatedAt,
  });

  factory MeetingRequestModel.fromJson(Map<String, dynamic> json) => MeetingRequestModel(
    id: json["id"],
    hour: json["hour"],
    statusHour: json["status_hour"],
    timePeriod: json["time_period"],
    date: DateTime.parse(json["date"]),
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "hour": hour,
    "status_hour": statusHour,
    "time_period": timePeriod,
    "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
