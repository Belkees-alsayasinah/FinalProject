// To parse this JSON data, do
//
//     final interestsModel = interestsModelFromJson(jsonString);

import 'dart:convert';

InterestsModel interestsModelFromJson(String str) => InterestsModel.fromJson(json.decode(str));

String interestsModelToJson(InterestsModel data) => json.encode(data.toJson());

class InterestsModel {
  int id;
  String name;
  DateTime createdAt;
  DateTime updatedAt;

  InterestsModel({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
  });

  factory InterestsModel.fromJson(Map<String, dynamic> json) => InterestsModel(
    id: json["id"],
    name: json["name"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}