class UserProfileModel {
  User user;
  List<Project> projects;

  UserProfileModel({
    required this.user,
    required this.projects,
  });

  factory UserProfileModel.fromJson(Map<String, dynamic> json) =>
      UserProfileModel(
        user: User.fromJson(json["user"]),
        projects: List<Project>.from(
            json["projects"].map((x) => Project.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "user": user.toJson(),
        "projects": List<dynamic>.from(projects.map((x) => x.toJson())),
      };
}

class Project {
  int id;
  String name;
  String description;
  String location;
  int typeId;

  Project({
    required this.id,
    required this.name,
    required this.description,
    required this.location,
    required this.typeId,
  });

  factory Project.fromJson(Map<String, dynamic> json) => Project(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        location: json["location"],
        typeId: json["type_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "location": location,
        "type_id": typeId,
      };
}

class User {
  int id;
  String firstName;
  String lastName;
  String userType;
  String location;

  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.userType,
    required this.location,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        userType: json["user_type"],
        location: json["location"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": firstName,
        "last_name": lastName,
        "user_type": userType,
        "location": location,
      };
}
