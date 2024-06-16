import 'dart:convert';
import 'package:bloom_project/RegisterPage/register_model.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:http/http.dart' as http;

import '../../service/info.dart';
import '../../service/store.dart';
import '../Config/server_config.dart';
import '../Notifications/notification_controller.dart';
import '../Notifications/firebase_notification.dart';

class RegisterService {
  var message;
  var token;
  var url;

  Future<bool> login(RegisterModel model) async {
    print(model.email + model.password);

    StoreInfo info = StoreInfo();
    await info.save("isLogin", "false");
    // Initialize FirebaseNotification class
    FirebaseNotification firebaseNotification = FirebaseNotification(NotificationController());

    // Initialize Firebase messaging and get the device token
    await firebaseNotification.initNotification();
    String? deviceToken = await FirebaseMessaging.instance.getToken();
    print("deviceToken: $deviceToken");
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
          "device_token": deviceToken ?? '',
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
