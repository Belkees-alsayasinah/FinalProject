import 'dart:convert';

import 'package:bloom_project/RegisterPage/register_model.dart';
import 'package:http/http.dart' as http;

import '../Config/server_config.dart';
import '../service/info.dart';

class EditProfileService {
  var message;

//Update
  Future<bool> updateProfile(String id, RegisterModel model) async {
    var response = await http.post(
        Uri.parse(UserInformation.type == 'inv'
            ? ServerConfig.domainNameServer +
                ServerConfig().investorUpdateProfile +
                '$id'
            : ServerConfig.domainNameServer +
                ServerConfig().userUpdateProfile +
                '$id'),
        headers: {
          'Authorization': 'Bearer ${UserInformation.user_token}'
        },
        body: {
          "first_name": model.firstName,
          "last_name": model.lastName,
          "email": model.email,
          "phone": model.phone,
          "location": model.location,
        });

    print(response.statusCode);
    print(response.body);

    if (response.statusCode == 200 || response.statusCode == 201) {
      var r = jsonDecode(response.body);
      message = r['message'];
      print('message: $message');
      return true;
    } else if (response.statusCode == 404) {
      message = "somthings wrong!";
      return false;
    } else {
      return false;
    }
  }
}
