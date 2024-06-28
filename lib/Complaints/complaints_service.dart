import 'dart:convert';

import 'package:bloom_project/Complaints/complaints_model.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:http/http.dart' as http;
import '../Config/server_config.dart';

class GetComplaintsService {
  late String message;
  late bool x = false;

  RxList<GetComplaintModel> model = <GetComplaintModel>[].obs;

  Future<List<GetComplaintModel>> getComplaints(String token, String id) async {
    var response = await http.get(
      Uri.parse(
          ServerConfig.domainNameServer + ServerConfig().getMyComplaints + '$id'),
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
      },
    );
    print(response.statusCode);
    if (response.statusCode == 200) {
      var r = await json.decode((response.body));
      Map<String, dynamic> s = r;
      List<dynamic> complaints = s['data'];
      for (var i in complaints) {
        model.add(GetComplaintModel.fromJson(i));
      }
      return model;
    } else {
      return [];
    }
  }
}
