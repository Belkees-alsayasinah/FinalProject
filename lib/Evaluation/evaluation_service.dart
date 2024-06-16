import 'dart:convert';
import 'package:bloom_project/Evaluation/evaluation_model.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:http/http.dart' as http;
import '../Config/server_config.dart';
import '../service/info.dart';

class AddEvaluationService {
  var message;

  Future<bool> addEvaluation(String id) async {
    var response = await http.post(
      Uri.parse(ServerConfig.domainNameServer +
          'api/$id' +
          ServerConfig().addEvaluation),
      headers: {'Authorization': 'Bearer ${UserInformation.user_token}'},
    );

    print(response.statusCode);
    print(response.body);

    if (response.statusCode == 200 || response.statusCode == 201) {
      var r = jsonDecode(response.body);
      message = r['message'];
      return true;
    } else if (response.statusCode == 404) {
      message = "somthings wrong!";
      return false;
    } else {
      return false;
    }
  }

  RxList<EvaluationCountModel> model = <EvaluationCountModel>[].obs;

  Future<EvaluationCountModel?> getEvaluationCount(
      String token, String id) async {
    var response = await http.get(
      Uri.parse(ServerConfig.domainNameServer +
          'api/$id' +
          ServerConfig().getEvaluationCount),
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
      },
    );

    print(response.statusCode);
    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      EvaluationCountModel evaluationCount =
          EvaluationCountModel.fromJson(jsonResponse);

      model.add(evaluationCount);
      print(evaluationCount.totalEvaluationCount);

      return evaluationCount;
    } else {
      return null;
    }
  }
}
