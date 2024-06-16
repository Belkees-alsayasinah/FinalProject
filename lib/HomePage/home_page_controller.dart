import 'package:bloom_project/HomePage/home_page_model.dart';
import 'package:bloom_project/HomePage/home_page_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import '../service/info.dart';

class HomePageController extends GetxController {

  late RxBool isLoad;
  late HomePageService service;
  late RxList<HomePageModel> models;
  late String message;
  var d;
  late bool state;
  late GlobalKey<FormState> formstate;
  @override
  void onInit() async {
    formstate = GlobalKey<FormState>();
    isLoad = true.obs;
    service = HomePageService();
    models = <HomePageModel>[].obs;
    message = '';

    await getdata();
    // await getdataInterests();
  }

  getdata() async {
    d = await service.getSectors(UserInformation.user_token);
    models.value.assignAll(service.model);
    models.refresh();
    isLoad.value = false;
    update();
    if (models.isEmpty) {
    } else if (models[0].name == "null") {}
  }

}
