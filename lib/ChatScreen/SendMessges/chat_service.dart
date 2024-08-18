import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../Config/server_config.dart';
import '../../service/info.dart';
import 'chat_model.dart';

class ChatService {
  var message;

  Future<bool> sendMessage(ChatModel model) async {
    var response = await http.post(
      Uri.parse(UserInformation.type == 'inv'
          ? ServerConfig.domainNameServer + ServerConfig().sendMessageInv
          : ServerConfig.domainNameServer + ServerConfig().sendMessageUser),
      body: {
        "content": model.content,
      },
      headers: {
        'Authorization': 'Bearer ${UserInformation.user_token}',
        'Accept': 'application/json',
      },
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      return true;
    } else if (response.statusCode == 404) {
      message = "Something wrong!";
      return false;
    } else {
      return false;
    }
  }
}
