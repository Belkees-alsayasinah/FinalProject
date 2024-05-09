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
    print("h1");
    print(model.email + model.password);
    print("h1");

    StoreInfo info = StoreInfo();
    await info.save("isLogin", "false");
    var response = await http
        .post(Uri.parse("https://grad2222.000webhostapp.com/api/investor/register"), body: {
      "email": model.email,
      "password": model.password,
      "first_name": model.firstName,
      "last_name": model.lastName,
      "location": model.location,
      "phone": model.phone,
    });
    print(model.email);
    print(response.statusCode);
    print(" sss ${response.body}");
    print(model.email);

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
