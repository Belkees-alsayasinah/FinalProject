import 'dart:convert';

import 'package:bloom_project/Notifications/notification_model.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:http/http.dart' as http;
import '../Config/server_config.dart';

class NotificationService {
  late String message;
  late bool x = false;
  Stream<List<NotificationModel>> fetchNotification(String user_token) {
    return Stream.periodic(const Duration(seconds: 5))
        .asyncMap((event) => getNotification(user_token));
  }
  RxList<NotificationModel> model = <NotificationModel>[].obs;

  Future<List<NotificationModel>> getNotification(String token) async {
    var response = await http.get(
      Uri.parse(ServerConfig.domainNameServer + ServerConfig().getNotification),
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
      },
    );
    //print("notification");
    //print(response.statusCode);
    if (response.statusCode == 200) {
      var r = await json.decode((response.body));
      Map<String, dynamic> s = r;
      List<dynamic> notification = s['notifications'];
      for (var i in notification) {
        model.add(NotificationModel.fromJson(i));
      }
      return model;
    } else {
      return [];
    }
  }
}
