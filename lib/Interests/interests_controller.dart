import 'package:bloom_project/AddCanvas/canvas_view.dart';
import 'package:bloom_project/HomePage/basic_page.dart';
import 'package:bloom_project/Interests/interests_model.dart';
import 'package:bloom_project/Interests/interests_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import '../service/info.dart';

class InterestController extends GetxController {
  late RxBool isLoad;
  late InterestService service;
  late RxList<InterestsModel> models;
  List<String> optionsNames = [];
  late String message;
  var d;
  late bool state, addInterestsState;
  late GlobalKey<FormState> formstate;

  @override
  void onInit() async {
    formstate = GlobalKey<FormState>();
    isLoad = true.obs;
    service = InterestService();
    models = <InterestsModel>[].obs;
    message = '';
    await getdata();
  }

  getdata() async {
    d = await service.getInterest(UserInformation.user_token);
    optionsNames = service.optionsNames;
    models.value.assignAll(service.model);
    models.refresh();
    isLoad.value = false;
    if (models.isEmpty) {
    } else if (models[0].name == "null") {}
  }

  Future<void> setInterests(List<int> selectedIds) async {
    addInterestsState =
        await service.setInterests(UserInformation.user_token, selectedIds);
    if (addInterestsState) {
      Get.offAll(BasicPage());
    } else {
      print('error');
    }
  }
}
