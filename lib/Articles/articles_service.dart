import 'dart:convert';
import 'package:bloom_project/Articles/articles_model.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:http/http.dart' as http;
import '../Config/server_config.dart';

class ArticlesService {
  late String message;
  late bool x = false;

  Stream<List<ArticlesModel>> fetchArticles(String user_token) {
    return Stream.periodic(const Duration(seconds: 10))
        .asyncMap((event) => getArticles(user_token));
  }

  RxList<ArticlesModel> model = <ArticlesModel>[].obs;

  Future<List<ArticlesModel>> getArticles(String token) async {

    var response = await http.get(
      Uri.parse(ServerConfig.domainNameServer + ServerConfig().getArticlesApi),
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      var r = await json.decode((response.body));
      Map<String, dynamic> s = r;
      List<dynamic> articles = s['data'];
      model.clear();
      for (var i in articles) {
        model.add(ArticlesModel.fromJson(i));
      }
      return model;
    } else {
      return [];
    }
  }
}
