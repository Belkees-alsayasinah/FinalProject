import 'dart:convert';
import 'package:bloom_project/ChatScreen/UnSeenMessage/un_seen_message_model.dart';
import 'package:bloom_project/service/info.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:http/http.dart' as http;
import '../../Config/server_config.dart';

class UnSeenMessageService {
  late String message;
  late bool x = false;

  RxList<UnSeenMessgaeModel> model = <UnSeenMessgaeModel>[].obs;

  Future<List<UnSeenMessgaeModel>> getUnSeenMessage(String token) async {
    var response = await http.get(
      Uri.parse(UserInformation.type == 'inv'
          ? ServerConfig.domainNameServer + ServerConfig().MessageCountInv
          : ServerConfig.domainNameServer + ServerConfig().MessageCountUser),
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
      },
    );
    print(response.statusCode);
    if (response.statusCode == 200) {
      var r = await json.decode((response.body));
      Map<String, dynamic> s = r;
      List<dynamic> messageCount = s['admins'];
      for (var i in messageCount) {
        model.add(UnSeenMessgaeModel.fromJson(i));
        print(
            'messageCount : ${UnSeenMessgaeModel.fromJson(i).unseenMessagesCount}');
      }
      return model;
    } else {
      return [];
    }
  }
}
