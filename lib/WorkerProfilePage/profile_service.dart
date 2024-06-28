import 'dart:convert';
import 'package:bloom_project/WorkerProfilePage/profile_model.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:http/http.dart' as http;
import '../Config/server_config.dart';
import '../service/info.dart';

class ProfileService {
  late String message;
  late bool x = false;

  RxList<ProfileModel> model = <ProfileModel>[].obs;

  Future<List<ProfileModel>> getProfileData(String token) async {
    var response = await http.get(
      Uri.parse(ServerConfig.domainNameServer + ServerConfig().showProfileUser),
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
      ProfileModel profileModel = ProfileModel.fromJson(data);
      model.add(profileModel);
      return model;
    } else {
      throw Exception('Failed to load profile data');
    }
  }

  //delete
  Future<bool> deleteData(int id) async {
    final response = await http.post(
      Uri.parse(
          'http://127.0.0.1:8000/api/employee/destroyUser/$id'),
      headers: {'Authorization': 'Bearer ${UserInformation.user_token}'},
    );
    if (response.statusCode == 200 || response.statusCode == 201) {

      return true;
    }

    print(response.statusCode);
    return false;
  }
}
