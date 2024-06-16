class ProfileModel {
  User user;
  List<InvestedProjects> investedProjects;
  List<PendingProject> pendingProjects;

  ProfileModel({
    required this.user,
    required this.investedProjects,
    required this.pendingProjects,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
    user: User.fromJson(json["user"]),
    investedProjects: List<InvestedProjects>.from(
        json["invested_projects"].map((x) => InvestedProjects.fromJson(x))),
    // pendingProjects: List<PendingProject>.from(
        //         json["pending_projects"].map((x) => PendingProject.fromJson(x))),

        pendingProjects: List<PendingProject>.from(
        json["pending_projects"].values.map((x) => PendingProject.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
    "user": user.toJson(),
    "invested_projects": List<dynamic>.from(investedProjects.map((x) => x.toJson())),
    "pending_projects": List<dynamic>.from(pendingProjects.map((x) => x.toJson())),
  };
}
class User {
  int id;
  String firstName;
  String lastName;
  String userType;
  String email;
  int verified;
  String otp;
  String phone;
  String location;
  String iDCard;
  String personalPhoto;
  String propertyDeed;
  String cleanRecord;
  DateTime createdAt;
  DateTime updatedAt;

  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.userType,
    required this.email,
    required this.verified,
    required this.otp,
    required this.phone,
    required this.location,
    required this.iDCard,
    required this.personalPhoto,
    required this.propertyDeed,
    required this.cleanRecord,
    required this.createdAt,
    required this.updatedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    userType: json["user_type"],
    email: json["email"],
    verified: json["verified"],
    otp: json["otp"],
    phone: json["phone"],
    location: json["location"],
    iDCard: json["iD_card"],
    personalPhoto: json["personal_photo"],
    propertyDeed: json["property_deed"],
    cleanRecord: json["clean_record"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "first_name": firstName,
    "last_name": lastName,
    "user_type": userType,
    "email": email,
    "verified": verified,
    "otp": otp,
    "phone": phone,
    "location": location,
    "iD_card": iDCard,
    "personal_photo": personalPhoto,
    "property_deed": propertyDeed,
    "clean_record": cleanRecord,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
class PendingProject {
  int id;
  String name;
  String description;
  String feasibilityStudy;
  int amount;
  String location;
  int investmentStatus;
  int acceptStatus;
  int investorId;
  int userId;
  int typeId;
  DateTime createdAt;
  DateTime updatedAt;

  PendingProject({
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

  factory PendingProject.fromJson(Map<String, dynamic> json) => PendingProject(
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

class InvestedProjects {
  int id;
  String name;
  String description;
  String feasibilityStudy;
  int amount;
  String location;
  int investmentStatus;
  int acceptStatus;
  int investorId;
  int userId;
  int typeId;
  DateTime createdAt;
  DateTime updatedAt;

  InvestedProjects({
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

  factory InvestedProjects.fromJson(Map<String, dynamic> json) =>
      InvestedProjects(
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
