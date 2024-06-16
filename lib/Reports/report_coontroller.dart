import 'package:bloom_project/Reports/report_model.dart';
import 'package:bloom_project/Reports/report_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../service/info.dart';

class ReportsController extends GetxController {
  String userId;
  ReportsController(this.userId);

  late String id;
  late RxBool isLoad;
  late ReportService service;
  late RxList<ReportsModel> models;
  late String message;
  var d;
  late bool state;
  late GlobalKey<FormState> formstate;

  @override
  Future<void> onInit() async {
    super.onInit();
    formstate = GlobalKey<FormState>();
    isLoad = true.obs;
    service = ReportService();
    models = <ReportsModel>[].obs;
    message = '';
    await getdata(userId);
  }

  getdata(String userId) async {
    d = await service.getReports(UserInformation.user_token, userId);
    models.assignAll(service.model);
    models.refresh();
    isLoad.value = false;
    update();
    if (models.isEmpty) {
    } else if (models[0].achievedGoalsSummary == "null") {}
  }
}
