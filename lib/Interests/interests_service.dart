import 'dart:convert';
import 'package:bloom_project/Interests/interests_model.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:http/http.dart' as http;
import '../Config/server_config.dart';

class InterestService {
  late String message;
  late bool x = false;

  RxList<InterestsModel> model = <InterestsModel>[].obs;
  List<String> optionsNames = [];

  Future<List<InterestsModel>> getInterest(String token) async {
    var response = await http.get(
      Uri.parse(ServerConfig.domainNameServer + ServerConfig().getInterest),
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
      },
    );
    print(response.statusCode);
    if (response.statusCode == 200) {
      var r = await json.decode((response.body));
      Map<String, dynamic> s = r;
      List<dynamic> interests = s['data'];
      for (var i in interests) {
        var interest = InterestsModel.fromJson(i);
        optionsNames.add(interest.name);
        model.add(interest);
        print(InterestsModel.fromJson(i).name);
      }
      return model;
    } else {
      return [];
    }
  }

  Future<bool> setInterests(String token, List<int> fileIds) async {
    print(fileIds);

    Map<String, List<int>> requestBody = {
      'interests': fileIds,
    };
    final response = await http.post(
      Uri.parse(ServerConfig.domainNameServer + ServerConfig().addInterestInv),
      body: json.encode(requestBody),
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
      },
    );
    print(response.statusCode);
    print(token);
    if (response.statusCode == 200) {
      print('interested saved successfully');
      final responseBody = json.decode(response.body);
      return true;
    } else {
      print('Failed to saved interests. Status code: ${response.statusCode}');
      print('Error message: ${response.body}');
      return false;
    }
  }
}
