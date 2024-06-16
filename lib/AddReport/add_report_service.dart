import 'dart:convert';

import '../Config/server_config.dart';
import '../service/info.dart';
import 'add_report_model.dart';
import 'package:http/http.dart' as http;

class AddReportService {
  var message;

  Future<bool> addReport(AddReportModel model, String id) async {
    var response = await http.post(
      Uri.parse(
          ServerConfig.domainNameServer + ServerConfig().addReport + '/$id'),
      headers: {
        'Authorization': 'Bearer ${UserInformation.user_token}',
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        "report_title": "ggg",
        "achieved_goals_summary": model.summaryGoalsAchieved,
        "unachieved_goals_summary": model.summaryGoalsNotAchieved,
        "investor_amount": model.ammountInvested,
        "total_revenue": model.totalRevenues,
        "total_costs": model.totalCosts,
        "net_profit": model.netProfit,
        "net_profit_employer": model.netProfitWorker,
        "net_profit_investor": model.netProfitInvestor,
        "received_materials": model.materialsReceived,
        "material_price": model.materialsPrice,
        "total_sales": model.totalSales,
        "overall_net_profit": model.overallNetProfit,
        "maintenance_amount": model.maintenance,
        "wages_and_transactions_amount": model.transactions,
        "main_recommendations": model.recommendations,
      }),
    );

    print(response.statusCode);
    print(response.body); // Print response body for debugging

    if (response.statusCode == 200 || response.statusCode == 201) {
      print('Done');
      var r = jsonDecode(response.body);
      message = r['message'];
      return true;
    } else if (response.statusCode == 404) {
      message = "Something's wrong!";
      return false;
    } else {
      // Handle other error responses
      message = jsonDecode(response.body)['error'] ?? 'Unknown error';
      return false;
    }
  }
}
