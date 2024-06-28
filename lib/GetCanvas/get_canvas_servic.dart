import 'dart:convert';

import 'package:bloom_project/GetCanvas/get_canvas_model.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:http/http.dart' as http;
import '../Config/server_config.dart';

class GetCanvasService {
  late String message;
  late bool x = false;

  RxList<GetCanvasModel> model = <GetCanvasModel>[].obs;

  Future<List<GetCanvasModel>> getCanvas(String token, String id) async {
    var response = await http.get(
      Uri.parse(ServerConfig.domainNameServer + ServerConfig().canvas + '$id'),
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
      },
    );
    print(response.statusCode);
    if (response.statusCode == 200) {
      var r = await json.decode((response.body));
      Map<String, dynamic> s = r;
      List<dynamic> canvas = s['data'];
      for (var i in canvas) {
        model.add(GetCanvasModel.fromJson(i));
        print('object');
      }
      return model;
    } else {
      return [];
    }
  }
}
