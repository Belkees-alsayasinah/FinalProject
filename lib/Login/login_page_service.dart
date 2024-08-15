import 'dart:convert';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:http/http.dart' as http;
import '../../service/info.dart';
import '../../service/store.dart';
import '../Config/server_config.dart';
import '../Notifications/firebase_notification.dart';
import 'login_page_model.dart';

class LoginPageService {
  var message;
  var token;
  var user_type;

  Future<bool> login(LoginPageModel model) async {
    StoreInfo info = StoreInfo();
    await info.save("isLogin", "false");
    FirebaseNotification firebaseNotification = FirebaseNotification();

    await firebaseNotification.initNotification();
    String? deviceToken = await FirebaseMessaging.instance.getToken();
    print("deviceToken: $deviceToken");
    var response = await http.post(
      Uri.parse(
        UserInformation.type == 'inv'
            ? ServerConfig.domainNameServer + ServerConfig().loginApiInv
            : ServerConfig.domainNameServer + ServerConfig().loginApi,
      ),
      body: {
        "email": model.email,
        "password": model.password,
        "device_token": deviceToken ?? '', // Pass device token in the body
      },
    );
    print("Body: ${response.body}");

    if (response.statusCode == 200 || response.statusCode == 201) {
      var r = jsonDecode(response.body);
      token = r['token'];
      // طباعة التوكين بالكامل هنا
     // print("Full token: %$token %" );
       print("Token (Part 1): ${token.substring(0, token.length ~/ 2)}");
       print("Token (Part 2): ${token.substring(token.length ~/ 2)}");

      UserInformation.profileType = r['id'];
      //UserInformation.user_id = r['id'];
      print(r['id']);
      UserInformation.user_token = token;
      UserInformation.usertype = r['user_type'];
   //   print("ttttttt: % ${UserInformation.user_token} %");
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
