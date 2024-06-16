import 'dart:convert';
import 'package:bloom_project/Trasactions/transaction_model.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:http/http.dart' as http;
import '../Config/server_config.dart';

class TransactionService {
  late String message;
  late bool x = false;

  RxList<TransactionModel> model = <TransactionModel>[].obs;

  Future<List<TransactionModel>> getTransactions(
      String token, String id) async {
    model.clear();
    var response = await http.get(
      Uri.parse(ServerConfig.domainNameServer +
          ServerConfig().getTransaction +
          '/$id'),
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
      for (var i in sectorProjects) {
        model.add(TransactionModel.fromJson(i));
      }
      return model;
    } else {
      return [];
    }
  }
}
