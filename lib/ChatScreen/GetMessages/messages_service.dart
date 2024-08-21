import 'dart:convert';
import 'package:bloom_project/ChatScreen/GetMessages/messages_model.dart';
import 'package:bloom_project/service/info.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:http/http.dart' as http;
import '../../Config/server_config.dart';
import 'dart:async';

class GetMessagesService {
  late String message;
  late bool x = false;

  RxList<MessagesModel> model = <MessagesModel>[].obs;

  // // قم بإضافة دالة `startAutoRefresh` لبدء التحديث التلقائي
  // void startAutoRefresh(String token) {
  //   Timer.periodic(Duration(seconds: 5), (Timer t) {
  //     getMessages(token);
  //   });
  // }

  Future<List<MessagesModel>> getMessages(String token) async {
    var response = await http.post(
      Uri.parse(UserInformation.type == 'inv'
          ? ServerConfig.domainNameServer + ServerConfig().getMessageInv
          : ServerConfig.domainNameServer + ServerConfig().getMessagesUser),
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
      },
      body: {
        "limit": '100',

      },
    );
    print(response.statusCode);
    if (response.statusCode == 200) {
      print('suiiii');
      var r = await json.decode((response.body));
      Map<String, dynamic> s = r;
      List<dynamic> messages = s['messages'];
      model.clear();
      for (var i in messages) {
        model.add(MessagesModel.fromJson(i));
      }
      return model;
    } else {
      return [];
    }
  }
}
