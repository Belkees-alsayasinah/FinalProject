import 'package:bloom_project/AddReport/add_report_model.dart';
import 'package:bloom_project/AddReport/add_report_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddReportController extends GetxController {
  late String summaryGoalsAchieved;
  late String summaryGoalsNotAchieved;
  late String ammountInvested;
  late String totalRevenues;
  late String totalCosts;
  late String netProfit;
  late String netProfitWorker;
  late String netProfitInvestor;
  late String materialsReceived;
  late String materialsPrice;
  late String totalSales;
  late String overallNetProfit;
  late String maintenance;
  late String transactions;
  late String recommendations;
  late String futurePlans;
  late String title;
  late AddReportService service;
  late String message;
  late bool addReportState;
  late GlobalKey<FormState> formstate;

  @override
  void onInit() {
    formstate = GlobalKey<FormState>();
    summaryGoalsAchieved = '';
    summaryGoalsNotAchieved = '';
    ammountInvested = '';
    totalRevenues = '';
    totalCosts = '';
    netProfit = '';
    netProfitWorker = '';
    netProfitInvestor = '';
    materialsReceived = '';
    materialsPrice = '';
    totalSales = '';
    overallNetProfit = '';
    maintenance = '';
    transactions = '';
    recommendations = '';
    futurePlans = '';
    title = 'title';
    service = AddReportService();
    addReportState = false;
    super.onInit();
  }

  void onClickAddReport(String id) async {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      formdata.save();
      await addReportClick(id);
      if (addReportState) {}
    }
  }

  Future<void> addReportClick(String id) async {
    AddReportModel report = AddReportModel(
      title: title,
      summaryGoalsAchieved: summaryGoalsAchieved,
      summaryGoalsNotAchieved: summaryGoalsNotAchieved,
      ammountInvested: ammountInvested,
      totalRevenues: totalRevenues,
      totalCosts: totalCosts,
      netProfit: netProfit,
      netProfitWorker: netProfitWorker,
      netProfitInvestor: netProfitInvestor,
      materialsReceived: materialsReceived,
      materialsPrice: materialsPrice,
      totalSales: totalSales,
      overallNetProfit: overallNetProfit,
      maintenance: maintenance,
      transactions: transactions,
      recommendations: recommendations,
      futurePlans: futurePlans,
    );
    addReportState = await service.addReport(report, id);
    if (addReportState) Get.back();
    var mapmsg = service.message;
    print('map: $mapmsg');
  }
}
