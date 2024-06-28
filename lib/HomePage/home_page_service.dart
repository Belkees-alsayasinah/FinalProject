import 'dart:convert';
import 'package:bloom_project/HomePage/GetInterestsModel.dart';
import 'package:bloom_project/HomePage/home_page_model.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:http/http.dart' as http;
import '../Config/server_config.dart';

class HomePageService {
  late String message;
  late bool x = false;

  Stream<List<HomePageModel>> fetchSectors(String user_token) {
    return Stream.periodic(const Duration(seconds: 20))
        .asyncMap((event) => getSectors(user_token));
  }

  RxList<HomePageModel> model = <HomePageModel>[].obs;

  Future<List<HomePageModel>> getSectors(String token) async {
    var response = await http.get(
      Uri.parse(ServerConfig.domainNameServer + ServerConfig().getSectorApi),
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
      },
    );
    print("Home");
    print(response.statusCode);
    if (response.statusCode == 200) {
      var r = await json.decode((response.body));
      Map<String, dynamic> s = r;
      List<dynamic> sectors = s['data'];
      model.clear();
      for (var i in sectors) {
        model.add(HomePageModel.fromJson(i));

      }
      return model;
    } else {
      return [];
    }
  }

  RxList<GetInterestsModel> model0 = <GetInterestsModel>[].obs;

  Future<List<GetInterestsModel>> getInterestProjects(String token) async {
    var response = await http.get(
      Uri.parse(
          ServerConfig.domainNameServer + ServerConfig().getInterestsProjects),
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
      },
    );
    print("Home");
    print(response.statusCode);
    if (response.statusCode == 200) {
      var r = await json.decode((response.body));
      Map<String, dynamic> s = r;
      List<dynamic> projects = s['projects'];
      for (var i in projects) {
        model0.add(GetInterestsModel.fromJson(i));
        print(GetInterestsModel.fromJson(i).name);
      }
      return model0;
    } else {
      return [];
    }
  }
}
