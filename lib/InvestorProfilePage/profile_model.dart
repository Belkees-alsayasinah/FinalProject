class InvestorProfileModel {
  Investor investor;
  List<Project> projects;

  InvestorProfileModel({
    required this.investor,
    required this.projects,
  });

  factory InvestorProfileModel.fromJson(Map<String, dynamic> json) =>
      InvestorProfileModel(
        investor: Investor.fromJson(json["investor"]),
        projects: List<Project>.from(
            json["projects"].map((x) => Project.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "investor": investor.toJson(),
        "projects": List<dynamic>.from(projects.map((x) => x.toJson())),
      };
}

class Investor {
  int id;
  String firstName;
  String lastName;
  String userType;
  String email;
  int verified;
  String password;
  String otp;
  String phone;
  String location;
  dynamic iDCard;
  dynamic personalPhoto;
  DateTime createdAt;
  DateTime updatedAt;

  Investor({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.userType,
    required this.email,
    required this.verified,
    required this.password,
    required this.otp,
    required this.phone,
    required this.location,
    required this.iDCard,
    required this.personalPhoto,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Investor.fromJson(Map<String, dynamic> json) => Investor(
        id: json["id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        userType: json["user_type"],
        email: json["email"],
        verified: json["verified"],
        password: json["password"],
        otp: json["otp"],
        phone: json["phone"],
        location: json["location"],
        iDCard: json["iD_card"],
        personalPhoto: json["personal_photo"],
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
        "password": password,
        "otp": otp,
        "phone": phone,
        "location": location,
        "iD_card": iDCard,
        "personal_photo": personalPhoto,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

class Project {
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

  Project({
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

  factory Project.fromJson(Map<String, dynamic> json) => Project(
        id: json["id"],
        name: json["name"],
        description: json["description"],
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
