// // To parse this JSON data, do
// //
// //     final profileModel = profileModelFromJson(jsonString);
//
// import 'dart:convert';
//
// ProfileModel profileModelFromJson(String str) => ProfileModel.fromJson(json.decode(str));
//
// String profileModelToJson(ProfileModel data) => json.encode(data.toJson());
//
// class ProfileModel {
//   User user;
//   List<Project> investedProjects;
//   Map<String, Project> pendingProjects;
//
//   ProfileModel({
//     required this.user,
//     required this.investedProjects,
//     required this.pendingProjects,
//   });
//
//   factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
//     user: User.fromJson(json["user"]),
//     investedProjects: List<Project>.from(json["invested_projects"].map((x) => Project.fromJson(x))),
//     pendingProjects: Map.from(json["pending_projects"]).map((k, v) => MapEntry<String, Project>(k, Project.fromJson(v))),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "user": user.toJson(),
//     "invested_projects": List<dynamic>.from(investedProjects.map((x) => x.toJson())),
//     "pending_projects": Map.from(pendingProjects).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
//   };
// }
//
// class Project {
//   int id;
//   Name name;
//   Description description;
//   String feasibilityStudy;
//   int amount;
//   Location location;
//   int investmentStatus;
//   int acceptStatus;
//   int investorId;
//   int userId;
//   int typeId;
//   DateTime createdAt;
//   DateTime updatedAt;
//
//   Project({
//     required this.id,
//     required this.name,
//     required this.description,
//     required this.feasibilityStudy,
//     required this.amount,
//     required this.location,
//     required this.investmentStatus,
//     required this.acceptStatus,
//     required this.investorId,
//     required this.userId,
//     required this.typeId,
//     required this.createdAt,
//     required this.updatedAt,
//   });
//
//   factory Project.fromJson(Map<String, dynamic> json) => Project(
//     id: json["id"],
//     name: nameValues.map[json["name"]]!,
//     description: descriptionValues.map[json["description"]]!,
//     feasibilityStudy: json["feasibility_study"],
//     amount: json["amount"],
//     location: locationValues.map[json["location"]]!,
//     investmentStatus: json["investment_status"],
//     acceptStatus: json["accept_status"],
//     investorId: json["investor_id"],
//     userId: json["user_id"],
//     typeId: json["type_id"],
//     createdAt: DateTime.parse(json["created_at"]),
//     updatedAt: DateTime.parse(json["updated_at"]),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "name": nameValues.reverse[name],
//     "description": descriptionValues.reverse[description],
//     "feasibility_study": feasibilityStudy,
//     "amount": amount,
//     "location": locationValues.reverse[location],
//     "investment_status": investmentStatus,
//     "accept_status": acceptStatus,
//     "investor_id": investorId,
//     "user_id": userId,
//     "type_id": typeId,
//     "created_at": createdAt.toIso8601String(),
//     "updated_at": updatedAt.toIso8601String(),
//   };
// }
//
// enum Description {
//   DESCRIPTION,
//   EMPTY,
//   GG,
//   GGG
// }
//
// final descriptionValues = EnumValues({
//   "مصور رائع جدًا": Description.DESCRIPTION,
//   "مشروع": Description.EMPTY,
//   "gg": Description.GG,
//   "ggg": Description.GGG
// });
//
// enum Location {
//   DAMASCUS,
//   EMPTY
// }
//
// final locationValues = EnumValues({
//   "damascus": Location.DAMASCUS,
//   "دمشق": Location.EMPTY
// });
//
// enum Name {
//   EMPTY,
//   GG,
//   NAME
// }
//
// final nameValues = EnumValues({
//   "فن": Name.EMPTY,
//   "gg": Name.GG,
//   "مصور": Name.NAME
// });
//
// class User {
//   int id;
//   String firstName;
//   String lastName;
//   String userType;
//   String email;
//   int verified;
//   String otp;
//   String phone;
//   Location location;
//   String iDCard;
//   String personalPhoto;
//   String propertyDeed;
//   String cleanRecord;
//   DateTime createdAt;
//   DateTime updatedAt;
//
//   User({
//     required this.id,
//     required this.firstName,
//     required this.lastName,
//     required this.userType,
//     required this.email,
//     required this.verified,
//     required this.otp,
//     required this.phone,
//     required this.location,
//     required this.iDCard,
//     required this.personalPhoto,
//     required this.propertyDeed,
//     required this.cleanRecord,
//     required this.createdAt,
//     required this.updatedAt,
//   });
//
//   factory User.fromJson(Map<String, dynamic> json) => User(
//     id: json["id"],
//     firstName: json["first_name"],
//     lastName: json["last_name"],
//     userType: json["user_type"],
//     email: json["email"],
//     verified: json["verified"],
//     otp: json["otp"],
//     phone: json["phone"],
//     location: locationValues.map[json["location"]]!,
//     iDCard: json["iD_card"],
//     personalPhoto: json["personal_photo"],
//     propertyDeed: json["property_deed"],
//     cleanRecord: json["clean_record"],
//     createdAt: DateTime.parse(json["created_at"]),
//     updatedAt: DateTime.parse(json["updated_at"]),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "first_name": firstName,
//     "last_name": lastName,
//     "user_type": userType,
//     "email": email,
//     "verified": verified,
//     "otp": otp,
//     "phone": phone,
//     "location": locationValues.reverse[location],
//     "iD_card": iDCard,
//     "personal_photo": personalPhoto,
//     "property_deed": propertyDeed,
//     "clean_record": cleanRecord,
//     "created_at": createdAt.toIso8601String(),
//     "updated_at": updatedAt.toIso8601String(),
//   };
// }
//
// class EnumValues<T> {
//   Map<String, T> map;
//   late Map<T, String> reverseMap;
//
//   EnumValues(this.map);
//
//   Map<T, String> get reverse {
//     reverseMap = map.map((k, v) => MapEntry(v, k));
//     return reverseMap;
//   }
// }
