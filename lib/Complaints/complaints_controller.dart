import 'package:bloom_project/Complaints/complaints_model.dart';
import 'package:bloom_project/Complaints/complaints_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../service/info.dart';

class GetComplaintsController extends GetxController {
  String userId;

  GetComplaintsController(this.userId);

  late String id;
  late RxBool isLoad;
  late GetComplaintsService service;
  late RxList<GetComplaintModel> models;
  late String message;
  var d;
  late bool state;
  late GlobalKey<FormState> formstate;

  @override
  Future<void> onInit() async {
    super.onInit();
    formstate = GlobalKey<FormState>();
    isLoad = true.obs;
    service = GetComplaintsService();
    models = <GetComplaintModel>[].obs;
    message = '';
    await getdata(userId);
  }

  getdata(String userId) async {
    d = await service.getComplaints(UserInformation.user_token, userId);
    models.assignAll(service.model);
    models.refresh();
    isLoad.value = false;
    update();
    if (models.isEmpty) {
    } else if (models[0].description == "null") {}
  }
}
