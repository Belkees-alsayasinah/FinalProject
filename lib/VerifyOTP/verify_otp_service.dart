import 'dart:convert';
import 'package:bloom_project/VerifyOTP/verify_otp_model.dart';
import 'package:http/http.dart' as http;
import '../../../service/info.dart';
import '../../../service/store.dart';
import '../../Config/server_config.dart';

class VerifyOTPService {
  var message;
  var token;
  var user_type;

  Future<bool> verify(VerifyOTP model) async {
    StoreInfo info = StoreInfo();
    await info.save("isLogin", "false");
    var response = await http.post(
        Uri.parse(UserInformation.type == 'inv'
            ? ServerConfig.domainNameServer + ServerConfig().verifyOtpInvApi
            : ServerConfig.domainNameServer + ServerConfig().verifyOtpWorApi),
        body: {
          "email": model.email,
          "otp": model.otp,
        });

    print(response.statusCode);
    if (response.statusCode == 200 || response.statusCode == 201) {
      var r = jsonDecode(response.body);
      token = r['access_token'];
      UserInformation.user_token = token;
      StoreInfo info = StoreInfo();
      await info.save("token", UserInformation.user_token);
      return true;
    } else if (response.statusCode == 404) {
      message = "Something wrong!";
      return false;
    } else {
      return false;
    }
  }
}
