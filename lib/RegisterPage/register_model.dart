class RegisterModel {
  String firstName;
  String lastName;
  String email;
  String? password;
  String phone;
  String location;

  RegisterModel({
    required this.firstName,
    required this.lastName,
    required this.email,
    this.password,
    required this.location,
    required this.phone,
  });
}
