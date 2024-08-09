import 'dart:convert';
import 'package:bloom_project/ChatScreen/GetMessages/messages_model.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:http/http.dart' as http;
import '../../Config/server_config.dart';

class GetMessagesService {
  late String message;
  late bool x = false;

  RxList<MessagesModel> model = <MessagesModel>[].obs;

  Future<List<MessagesModel>> getMessages(String token) async {
    var response = await http.post(
      Uri.parse(ServerConfig.domainNameServer + ServerConfig().getMessagesUser),
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
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
  // Add the following method to fetch older messages
  Future<List<MessagesModel>> getOlderMessages(String token, DateTime lastMessageDate) async {
    var response = await http.post(
      Uri.parse(ServerConfig.domainNameServer + ServerConfig().getMessagesUser),
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
      },
      body: {
        'last_message_date': lastMessageDate.toIso8601String(),  // Pass the date of the last message
      },
    );
    print(response.statusCode);
    if (response.statusCode == 200) {
      var r = await json.decode((response.body));
      Map<String, dynamic> s = r;
      List<dynamic> messages = s['messages'];
      for (var i in messages) {
        model.insert(0, MessagesModel.fromJson(i));  // Insert older messages at the beginning
      }
      return model;
    } else {
      return [];
    }
  }
}
