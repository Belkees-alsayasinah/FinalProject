class GetTransactionModel {
  int id;
  String name;
  String description;
  String price;
  String discount;
  String status;
  int projectId;
  int userId;
  DateTime createdAt;
  DateTime updatedAt;

  GetTransactionModel({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.discount,
    required this.status,
    required this.projectId,
    required this.userId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory GetTransactionModel.fromJson(Map<String, dynamic> json) =>
      GetTransactionModel(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        price: json["price"],
        discount: json["discount"],
        status: json["status"],
        projectId: json["project_id"],
        userId: json["user_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "price": price,
        "discount": discount,
        "status": status,
        "project_id": projectId,
        "user_id": userId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
