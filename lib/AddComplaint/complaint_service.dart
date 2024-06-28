import 'dart:convert';
import 'package:http/http.dart' as http;
import '../Config/server_config.dart';
import '../service/info.dart';
import 'complaint_model.dart';

class ComplaintService {
  var message;

  Future<bool> addComplaint(ComplaintModel model) async {
    var response = await http.post(
      Uri.parse(ServerConfig.domainNameServer + ServerConfig().addComplaint),
      body: {
        "description": model.description,
        "project_id": model.projectID,
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
