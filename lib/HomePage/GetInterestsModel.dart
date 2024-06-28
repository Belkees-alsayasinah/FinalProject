
class GetInterestsModel {
  int id;
  String name;
  String description;

  int amount;
  String location;
  int investmentStatus;
  int acceptStatus;
  int investorId;
  int userId;
  int typeId;
  DateTime createdAt;
  DateTime updatedAt;

  GetInterestsModel({
    required this.id,
    required this.name,
    required this.description,

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

  factory GetInterestsModel.fromJson(Map<String, dynamic> json) => GetInterestsModel(
    id: json["id"],
    name: json["name"],
    description: json["description"],

    amount: json["amount"],
    location:json["location"],
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

