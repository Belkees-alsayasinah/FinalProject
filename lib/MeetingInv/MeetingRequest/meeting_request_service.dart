import 'dart:convert';

import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:http/http.dart' as http;

import '../../Config/server_config.dart';
import 'meeting_request_model.dart';

class GetMeetRequestsService {
  late String message;
  late bool x = false;

  RxList<MeetingRequestModel> model = <MeetingRequestModel>[].obs;

  Future<List<MeetingRequestModel>> getMeetingRequests(String token) async {
    var response = await http.get(
      Uri.parse(
          ServerConfig.domainNameServer + ServerConfig().meetRequestsInv),
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
      },
    );
    print(response.statusCode);
    if (response.statusCode == 200) {
      var r = await json.decode((response.body));
      Map<String, dynamic> s = r;
      List<dynamic> transaction = s['data'];
      for (var i in transaction) {
        model.add(MeetingRequestModel.fromJson(i));
      }
      return model;
    } else {
      return [];
    }
  }
}
