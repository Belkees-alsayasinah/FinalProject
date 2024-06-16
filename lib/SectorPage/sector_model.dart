// To parse this JSON data, do
//
//     final sectorModel = sectorModelFromJson(jsonString);

import 'dart:convert';

class SectorModel {
  int id;
  String name;
  String description;
  String feasibilityStudy;
  int amount;
  String location;
  dynamic investmentStatus;
  int acceptStatus;
  int investorId;
  int userId;
  int typeId;
  DateTime createdAt;
  DateTime updatedAt;

  SectorModel({
    required this.id,
    required this.name,
    required this.description,
    required this.feasibilityStudy,
    required this.amount,
    required this.location,
    required this.investmentStatus,
    required this.acceptStatus,
    required this.investorId,
    required this.userId,
    required this.typeId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory SectorModel.fromJson(Map<String, dynamic> json) => SectorModel(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        feasibilityStudy: json["feasibility_study"],
        amount: json["amount"],
        location: json["location"],
        investmentStatus: json["investment_status"],
        acceptStatus: json["accept_status"],
        investorId: json["investor_id"],
        userId: json["user_id"],
        typeId: json["type_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "feasibility_study": feasibilityStudy,
        "amount": amount,
        "location": location,
        "investment_status": investmentStatus,
        "accept_status": acceptStatus,
        "investor_id": investorId,
        "user_id": userId,
        "type_id": typeId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
