import 'package:bloom_project/ChartPage/chart_model.dart';
import 'package:bloom_project/ChartPage/chart_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../service/info.dart';

class ChartController extends GetxController {
  late String id;
  late RxBool isLoad;
  late ChartService service;
  late RxList<StatisticsModel> models;
  late String message;
  var d;
  late bool state;
  late GlobalKey<FormState> formstate;
  late RxList<double> totalNetProfits;
  late RxList<double> totalNetProfitEmployer;
  late RxList<double> totalNetProfitInvestor;
  late RxList<double> totalRevenue;

  late RxList<String> months; // إضافة متغير جديد لتخزين الأشهر

  @override
  Future<void> onInit() async {
    super.onInit();
    formstate = GlobalKey<FormState>();
    isLoad = true.obs;
    service = ChartService();
    models = <StatisticsModel>[].obs;
    totalNetProfits = <double>[].obs;
    totalNetProfitEmployer = <double>[].obs;
    totalNetProfitInvestor = <double>[].obs;
    totalRevenue = <double>[].obs;
    months = <String>[].obs; // تهيئة المتغير الجديد
    message = '';
    await getdata();
  }

  getdata() async {
    d = await service.getChart(UserInformation.user_token);
    models.assignAll(service.model);
    totalNetProfits
        .assignAll(models.map((model) => model.totalNetProfit.toDouble()));
    months.assignAll(models.map((model) => model.month)); // استخراج الأشهر
    totalNetProfitEmployer.assignAll(
        models.map((model) => model.totalNetProfitEmployer.toDouble()));
    totalNetProfitInvestor.assignAll(
        models.map((model) => model.totalNetProfitInvestor.toDouble()));
    totalRevenue
        .assignAll(models.map((model) => model.totalRevenue.toDouble()));
    models.refresh();
    isLoad.value = false;
    update();
    if (models.isEmpty) {
      message = "No data available";
    } else if (models[0].month == "null") {
      message = "Invalid data";
    }
  }
}
