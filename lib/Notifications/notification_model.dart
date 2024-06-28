class NotificationModel {
  int id;
  int notifiableId;
  String notifiableType;
  String title;
  String body;
  DateTime createdAt;
  DateTime updatedAt;

  NotificationModel({
    required this.id,
    required this.notifiableId,
    required this.notifiableType,
    required this.title,
    required this.body,
    required this.createdAt,
    required this.updatedAt,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      NotificationModel(
        id: json["id"],
        notifiableId: json["notifiable_id"],
        notifiableType: json["notifiable_type"],
        title: json["title"],
        body: json["body"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "notifiable_id": notifiableId,
        "notifiable_type": notifiableType,
        "title": title,
        "body": body,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
