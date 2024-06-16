class AddReportModel {
  String title;
  String summaryGoalsAchieved;
  String summaryGoalsNotAchieved;
  String ammountInvested;
  String totalRevenues;
  String totalCosts;
  String netProfit;
  String netProfitWorker;
  String netProfitInvestor;
  String materialsReceived;
  String materialsPrice;
  String totalSales;
  String overallNetProfit;
  String maintenance;
  String transactions;
  String recommendations;
  String futurePlans;
  String productId;

  AddReportModel(
      {required this.title,
      required this.summaryGoalsAchieved,
      required this.summaryGoalsNotAchieved,
      required this.ammountInvested,
      required this.totalRevenues,
      required this.totalCosts,
      required this.netProfit,
      required this.netProfitWorker,
      required this.netProfitInvestor,
      required this.materialsReceived,
      required this.materialsPrice,
      required this.totalSales,
      required this.overallNetProfit,
      required this.maintenance,
      required this.transactions,
      required this.recommendations,
      required this.futurePlans,
      required this.productId});
}
