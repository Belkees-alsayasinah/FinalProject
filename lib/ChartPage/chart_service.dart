import 'dart:convert';
import 'package:bloom_project/ChartPage/chart_model.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:http/http.dart' as http;
import '../Config/server_config.dart';

class ChartService {
  late String message;
  late bool x = false;

  RxList<StatisticsModel> model = <StatisticsModel>[].obs;

  Future<List<StatisticsModel>> getChart(String token) async {
    var response = await http.get(
      Uri.parse(ServerConfig.domainNameServer + ServerConfig().chartInfo),
      // تحقق من أن المسار صحيح
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
      },
    );
    print(response.statusCode);
    if (response.statusCode == 200) {
      var r = json.decode(response.body);
      List<dynamic> chartInfo = r; // هنا نفترض أن الرد هو قائمة من الخرائط
      model.clear(); // مسح البيانات القديمة قبل إضافة الجديدة
      for (var i in chartInfo) {
        model.add(StatisticsModel.fromJson(i));
        print(model[0].month);
      }
      return model;
    } else {
      return [];
    }
  }
}
