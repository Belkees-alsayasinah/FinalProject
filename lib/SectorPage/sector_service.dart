import 'dart:convert';
import 'package:bloom_project/SectorPage/sector_model.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:http/http.dart' as http;
import '../Config/server_config.dart';

class SectorService {
  late String message;
  late bool x = false;

  RxList<SectorModel> model = <SectorModel>[].obs;
  Future<List<SectorModel>> getSectorProjects(String token, String id) async {
    var response = await http.get(
      Uri.parse(ServerConfig.domainNameServer + ServerConfig().getSectorProjectApi + id),
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
      },
    );
    print(response.statusCode);
    if (response.statusCode == 200) {
      var r = await json.decode((response.body));
      Map<String, dynamic> s = r;
      List<dynamic> sectorProjects = s['data'];
      //RxList<HomePageModel> model = <HomePageModel>[].obs;
      for (var i in sectorProjects) {
        model.add(SectorModel.fromJson(i));
        print(SectorModel.fromJson(i).name);
      }
      return model;
    } else {
      //show error message
      return [];
    }
  }
}
