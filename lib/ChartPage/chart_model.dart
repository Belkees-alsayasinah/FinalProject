
class StatisticsModel {
  String month;
  int totalNetProfit;
  int totalNetProfitEmployer;
  int totalNetProfitInvestor;
  int totalRevenue;

  StatisticsModel({
    required this.month,
    required this.totalNetProfit,
    required this.totalNetProfitEmployer,
    required this.totalNetProfitInvestor,
    required this.totalRevenue,
  });

  factory StatisticsModel.fromJson(Map<String, dynamic> json) => StatisticsModel(
    month: json["month"],
    totalNetProfit: json["total_net_profit"],
    totalNetProfitEmployer: json["total_net_profit_employer"],
    totalNetProfitInvestor: json["total_net_profit_investor"],
    totalRevenue: json["total_revenue"],
  );

  Map<String, dynamic> toJson() => {
    "month": month,
    "total_net_profit": totalNetProfit,
    "total_net_profit_employer": totalNetProfitEmployer,
    "total_net_profit_investor": totalNetProfitInvestor,
    "total_revenue": totalRevenue,
  };
}
