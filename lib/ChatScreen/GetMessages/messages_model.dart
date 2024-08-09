class MessagesModel {
  int id;
  int senderId;
  String senderType;
  int receiverId;
  String receiverType;
  String content;
  int seen;
  DateTime createdAt;
  DateTime updatedAt;
  String timeAgo;

  MessagesModel({
    required this.id,
    required this.senderId,
    required this.senderType,
    required this.receiverId,
    required this.receiverType,
    required this.content,
    required this.seen,
    required this.createdAt,
    required this.updatedAt,
    required this.timeAgo,
  });

  factory MessagesModel.fromJson(Map<String, dynamic> json) => MessagesModel(
        id: json["id"],
        senderId: json["sender_id"],
        senderType: json["sender_type"],
        receiverId: json["receiver_id"],
        receiverType: json["receiver_type"],
        content: json["content"],
        seen: json["seen"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        timeAgo: json["time_ago"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "sender_id": senderId,
        "sender_type": senderType,
        "receiver_id": receiverId,
        "receiver_type": receiverType,
        "content": content,
        "seen": seen,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "time_ago": timeAgo,
      };
}
