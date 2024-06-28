import 'package:bloom_project/HomePage/GetInterestsModel.dart';
import 'package:bloom_project/HomePage/home_page_model.dart';
import 'package:bloom_project/HomePage/home_page_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import '../service/info.dart';

class HomePageController extends GetxController {
  late RxBool isLoad;
  late RxBool isLoad0;
  late HomePageService service;
  late RxList<HomePageModel> models;
  late RxList<GetInterestsModel> models0;
  late String message;
  var d;
  late bool state;
  late GlobalKey<FormState> formstate;

  @override
  void onInit() async {
    formstate = GlobalKey<FormState>();
    isLoad = true.obs;
    isLoad0 = true.obs;
    service = HomePageService();
    models = <HomePageModel>[].obs;
    models0 = <GetInterestsModel>[].obs;
    message = '';

    await getdata();
    UserInformation.type == 'inv' ? await getInterestsData() : null;
    // await getdataInterests();
  }

  getdata() async {
    d = await service.fetchSectors(UserInformation.user_token).listen((event) {
      models.value = event;
      isLoad.value = false;
    });
    if (models.isEmpty) {
    } else if (models[0].name == "null") {}
  }

  getInterestsData() async {
    d = await service.getInterestProjects(UserInformation.user_token);
    models0.value.assignAll(service.model0);
    models0.refresh();
    isLoad0.value = false;
    update();
    if (models0.isEmpty) {
    } else if (models0[0].name == "null") {}
  }
}
