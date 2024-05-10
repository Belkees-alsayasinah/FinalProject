import 'dart:convert';
import 'package:bloom_project/Articles/articles_model.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:http/http.dart' as http;

import '../Config/server_config.dart';

class ArticlesService {
  late String message;
  late bool x = false;

  RxList<ArticlesModel> model = <ArticlesModel>[].obs;

  Future<List<ArticlesModel>> getArticles(String token) async {
    print("hi");
    var response = await http.get(
      Uri.parse(ServerConfig.domainNameServer + ServerConfig().getArticlesApi),
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
      },
    );

    print(response.statusCode);
    if (response.statusCode == 200) {
      var r = await json.decode((response.body));
      Map<String, dynamic> s = r;
      List<dynamic> articles = s['data'];
      //RxList<HomePageModel> model = <HomePageModel>[].obs;
      for (var i in articles) {
        model.add(ArticlesModel.fromJson(i));
        print(ArticlesModel.fromJson(i).image);
      }
      return model;
    } else {
      //show error message
      return [];
    }
  }
}
