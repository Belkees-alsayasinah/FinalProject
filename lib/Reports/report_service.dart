import 'dart:convert';
import 'package:bloom_project/Reports/report_model.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:http/http.dart' as http;
import '../Config/server_config.dart';

class ReportService {
  late String message;
  late bool x = false;

  RxList<ReportsModel> model = <ReportsModel>[].obs;

  Future<List<ReportsModel>> getReports(String token, String id) async {
    var response = await http.get(
      Uri.parse(ServerConfig.domainNameServer +
          ServerConfig().getMyReports +
          '$id/reports'),
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
      },
    );
    print(response.statusCode);
    if (response.statusCode == 200) {
      var r = await json.decode((response.body));
      Map<String, dynamic> s = r;
      List<dynamic> sectorProjects = s['data'];
      for (var i in sectorProjects) {
        model.add(ReportsModel.fromJson(i));

      }
      return model;
    } else {
      return [];
    }
  }
}
