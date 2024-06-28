class GetComplaintModel {
  int id;
  String description;
  int projectId;
  int investorId;
  DateTime createdAt;
  DateTime updatedAt;

  GetComplaintModel({
    required this.id,
    required this.description,
    required this.projectId,
    required this.investorId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory GetComplaintModel.fromJson(Map<String, dynamic> json) =>
      GetComplaintModel(
        id: json["id"],
        description: json["description"],
        projectId: json["project_id"],
        investorId: json["investor_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "description": description,
        "project_id": projectId,
        "investor_id": investorId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
