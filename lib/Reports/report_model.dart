import 'dart:convert';

ReportsModel reportsModelFromJson(String str) => ReportsModel.fromJson(json.decode(str));

String reportsModelToJson(ReportsModel data) => json.encode(data.toJson());

class ReportsModel {
  int id;
  String reportTitle;
  String achievedGoalsSummary;
  String unachievedGoalsSummary;
  String investorAmount;
  String totalRevenue;
  String totalCosts;
  String netProfit;
  String netProfitEmployer;
  String netProfitInvestor;
  String receivedMaterials;
  String materialPrice;
  String totalSales;
  String overallNetProfit;
  String maintenanceAmount;
  String wagesAndTransactionsAmount;
  String mainRecommendations;
  int projectId;
  int userId;
  DateTime createdAt;
  DateTime updatedAt;

  ReportsModel({
    required this.id,
    required this.reportTitle,
    required this.achievedGoalsSummary,
    required this.unachievedGoalsSummary,
    required this.investorAmount,
    required this.totalRevenue,
    required this.totalCosts,
    required this.netProfit,
    required this.netProfitEmployer,
    required this.netProfitInvestor,
    required this.receivedMaterials,
    required this.materialPrice,
    required this.totalSales,
    required this.overallNetProfit,
    required this.maintenanceAmount,
    required this.wagesAndTransactionsAmount,
    required this.mainRecommendations,
    required this.projectId,
    required this.userId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ReportsModel.fromJson(Map<String, dynamic> json) => ReportsModel(
    id: json["id"],
    reportTitle: json["report_title"],
    achievedGoalsSummary: json["achieved_goals_summary"],
    unachievedGoalsSummary: json["unachieved_goals_summary"],
    investorAmount: json["investor_amount"],
    totalRevenue: json["total_revenue"],
    totalCosts: json["total_costs"],
    netProfit: json["net_profit"],
    netProfitEmployer: json["net_profit_employer"],
    netProfitInvestor: json["net_profit_investor"],
    receivedMaterials: json["received_materials"],
    materialPrice: json["material_price"],
    totalSales: json["total_sales"],
    overallNetProfit: json["overall_net_profit"],
    maintenanceAmount: json["maintenance_amount"],
    wagesAndTransactionsAmount: json["wages_and_transactions_amount"],
    mainRecommendations: json["main_recommendations"],
    projectId: json["project_id"],
    userId: json["user_id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "report_title": reportTitle,
    "achieved_goals_summary": achievedGoalsSummary,
    "unachieved_goals_summary": unachievedGoalsSummary,
    "investor_amount": investorAmount,
    "total_revenue": totalRevenue,
    "total_costs": totalCosts,
    "net_profit": netProfit,
    "net_profit_employer": netProfitEmployer,
    "net_profit_investor": netProfitInvestor,
    "received_materials": receivedMaterials,
    "material_price": materialPrice,
    "total_sales": totalSales,
    "overall_net_profit": overallNetProfit,
    "maintenance_amount": maintenanceAmount,
    "wages_and_transactions_amount": wagesAndTransactionsAmount,
    "main_recommendations": mainRecommendations,
    "project_id": projectId,
    "user_id": userId,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}