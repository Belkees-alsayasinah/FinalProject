
class UnSeenMessgaeModel {
  int id;
  String firstName;
  String lastName;
  String userType;
  dynamic bankAccountNumber;
  String email;
  DateTime createdAt;
  DateTime updatedAt;
  int unseenMessagesCount;

  UnSeenMessgaeModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.userType,
    required this.bankAccountNumber,
    required this.email,
    required this.createdAt,
    required this.updatedAt,
    required this.unseenMessagesCount,

  });

  factory UnSeenMessgaeModel.fromJson(Map<String, dynamic> json) => UnSeenMessgaeModel(
    id: json["id"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    userType: json["user_type"],
    bankAccountNumber: json["bank_account_number"],
    email: json["email"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    unseenMessagesCount: json["unseen_messages_count"],

  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "first_name": firstName,
    "last_name": lastName,
    "user_type": userType,
    "bank_account_number": bankAccountNumber,
    "email": email,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "unseen_messages_count": unseenMessagesCount,

  };
}
