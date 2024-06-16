import 'dart:convert';
import 'package:bloom_project/RegisterPage/register_model.dart';
import 'package:http/http.dart' as http;

import '../../service/info.dart';
import '../../service/store.dart';
import '../Config/server_config.dart';

class RegisterService {
  var message;
  var token;
  var url;

  Future<bool> login(RegisterModel model) async {
    print(model.email + model.password);

    StoreInfo info = StoreInfo();
    await info.save("isLogin", "false");
    var response = await http.post(
        Uri.parse(
          UserInformation.type == 'inv'
              ? ServerConfig.domainNameServer + ServerConfig().registerApi
              : ServerConfig.domainNameServer + ServerConfig().registerUserApi,
        ),
        body: {
          "email": model.email,
          "password": model.password,
          "first_name": model.firstName,
          "last_name": model.lastName,
          "location": model.location,
          "phone": model.phone,
        });
    print(response.statusCode);
    if (response.statusCode == 200 || response.statusCode == 201) {
      print('succ');
      var r = jsonDecode(response.body);
      return true;
    } else if (response.statusCode == 404) {
      message = "somthings wrong!";
      return false;
    } else {
      return false;
    }
  }
}
