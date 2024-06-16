import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../service/info.dart';
import '../../../service/store.dart';
import '../../Config/server_config.dart';
import 'login_page_model.dart';

class LoginPageService {
  var message;
  var token;
  var user_type;

  Future<bool> login(LoginPageModel model) async {
    StoreInfo info = StoreInfo();
    await info.save("isLogin", "false");
    var response = await http.post(
        Uri.parse(
          UserInformation.type == 'inv'
              ? ServerConfig.domainNameServer + ServerConfig().loginApiInv
              : ServerConfig.domainNameServer + ServerConfig().loginApi,
        ),
        body: {
          "email": model.email,
          "password": model.password,
        });
    print("Body: ${response.body}");
    if (response.statusCode == 200 || response.statusCode == 201) {
      var r = jsonDecode(response.body);
      token = r['token'];
      UserInformation.user_token = token;
      UserInformation.usertype = r['user_type'];
      StoreInfo info = StoreInfo();
      await info.save("token", UserInformation.user_token);
      await info.save("usertype", UserInformation.usertype);
      return true;
    } else if (response.statusCode == 404) {
      message = "Something wrong!";
      return false;
    } else {
      return false;
    }
  }
}
