import 'package:bloom_project/HomePage/GetInterestsModel.dart';
import 'package:bloom_project/Notifications/notifiation_service.dart';
import 'package:bloom_project/Notifications/notification_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import '../service/info.dart';

class NotificationController extends GetxController {
  late RxBool isLoad;
  late NotificationService service;
  late RxList<NotificationModel> models;
  var d;
  late bool state;
  late GlobalKey<FormState> formstate;

  @override
  void onInit() {
    super.onInit();
    formstate = GlobalKey<FormState>();
    isLoad = true.obs;
    service = NotificationService();
    models = <NotificationModel>[].obs;

    getdata();
  }

  getdata() async {
    isLoad.value = true;
    try {
      d = await service.getNotification(UserInformation.user_token);
      models.assignAll(service.model);
      isLoad.value = false;
      update();
    } finally {
      isLoad.value = false;
    }
  }
}
