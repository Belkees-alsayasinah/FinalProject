import 'dart:convert';
import 'package:bloom_project/InvestorProfilePage/profile_model.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:http/http.dart' as http;
import '../Config/server_config.dart';

class InvestorProfileService {
  late String message;
  late bool x = false;

  RxList<InvestorProfileModel> model = <InvestorProfileModel>[].obs;

  Future<List<InvestorProfileModel>> getProfileData(String token) async {
    var response = await http.get(
      Uri.parse(
          ServerConfig.domainNameServer + ServerConfig().showProfileInvestor),
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
      },
    );
    print("profile");
    print(response.statusCode);
    if (response.statusCode == 200) {
      var r = await json.decode(response.body);
      print('ff');
      var data = r['data'];
      InvestorProfileModel profileModel = InvestorProfileModel.fromJson(data);
      model.add(profileModel);
      print("aaaaaaaa");
      // print(profileModel.projects[0].name);
      return model;
    } else {
      throw Exception('Failed to load profile data');
    }
  }
}
