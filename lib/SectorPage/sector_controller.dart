import 'package:bloom_project/HomePage/home_page_View.dart';
import 'package:bloom_project/SectorPage/sector_model.dart';
import 'package:bloom_project/SectorPage/sector_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import '../service/info.dart';

class SectorController extends GetxController {
  late String id;
  var args;
  late RxBool isLoad;
  late SectorService service;
  late RxList<SectorModel> models;
  late String message;
  var d;
  late bool state;
  late GlobalKey<FormState> formstate;

  @override
  void onInit() async {
    formstate = GlobalKey<FormState>();
    isLoad = true.obs;
    service = SectorService();
    models = <SectorModel>[].obs;
    message = '';
    args = Get.arguments;
    id = '1';
    //id = args['id'];
    await getdata(id);
  }

  getdata(String id) async {
    print(id);
    d = await service.getSectorProjects(UserInformation.user_token, id);
    models.value.assignAll(service.model);
    models.refresh();
    isLoad.value = false;
    if (models.isEmpty) {
    } else if (models[0].name == "null") {}
  }
}
