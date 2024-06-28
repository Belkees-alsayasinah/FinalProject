import 'dart:convert';
import 'package:bloom_project/Profile/profile_model.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:http/http.dart' as http;
import '../Config/server_config.dart';

class UserProfileService {
  late String message;
  late bool x = false;

  RxList<UserProfileModel> model = <UserProfileModel>[].obs;

  Future<List<UserProfileModel>> getProfileData(String token, String id) async {
    var response = await http.get(
      Uri.parse(ServerConfig.domainNameServer +
          ServerConfig().showProfileAnother +
          '$id'),
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
      },
    );
    print("profile");
    print(response.statusCode);
    if (response.statusCode == 200) {
      var r = await json.decode(response.body);
      var data = r['data'];
      UserProfileModel profileModel = UserProfileModel.fromJson(data);
      model.add(profileModel);
      print("aaaaaaaa");
      print(profileModel.projects[0].name);
      return model;
    } else {
      throw Exception('Failed to load profile data');
    }
  }
}
