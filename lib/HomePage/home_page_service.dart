import 'dart:convert';
import 'package:bloom_project/HomePage/home_page_model.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:http/http.dart' as http;

import '../Config/server_config.dart';

class HomePageService {
  late String message;
  late bool x = false;

  RxList<HomePageModel> model = <HomePageModel>[].obs;

  Future<List<HomePageModel>> getSectors(String token) async {
    var response = await http.get(
      Uri.parse(ServerConfig.domainNameServer + ServerConfig().getSectorApi),
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
      },
    );

    print(response.statusCode);
    if (response.statusCode == 200) {
      var r = await json.decode((response.body));
      Map<String, dynamic> s = r;
      List<dynamic> objections = s['data'];
      //RxList<HomePageModel> model = <HomePageModel>[].obs;
      for (var i in objections) {
        model.add(HomePageModel.fromJson(i));
        print(HomePageModel.fromJson(i).name);
      }
      return model;
    } else {
      //show error message
      return [];
    }
  }
}
