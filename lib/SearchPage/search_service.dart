import 'dart:convert';
import 'package:bloom_project/SearchPage/search_model.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:http/http.dart' as http;
import '../Config/server_config.dart';

class SearchService {
  late String message;
  late bool x = false;

  RxList<SearchModel> model = <SearchModel>[].obs;

  Future<List<SearchModel>> getResult(
      String token, String searchParameter, String typeOfSearch) async {
    model.clear();
    var response = await http.get(
      Uri.parse(typeOfSearch == 'amount'
          ? ServerConfig.domainNameServer +
              ServerConfig().searchAmount +
              '$searchParameter'
          : ServerConfig.domainNameServer +
              ServerConfig().searchName +
              '$searchParameter'),
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
      },
    );
    print(response.statusCode);
    if (response.statusCode == 200 || response.statusCode == 201) {
      var r = await json.decode((response.body));
      Map<String, dynamic> s = r;
      List<dynamic> result = s['data'];
      for (var i in result) {
        model.add(SearchModel.fromJson(i));
        print(SearchModel.fromJson(i).name);
      }
      return model;
    } else {
      return [];
    }
  }
}
