import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../service/info.dart';
import 'sector_model.dart';
import 'sector_service.dart';

class SectorController extends GetxController {
  String userId;
  SectorController(this.userId);
  late String id;
  late RxBool isLoad;
  late SectorService service;
  late RxList<SectorModel> models;
  late String message;
  var d;
  late bool state;
  late GlobalKey<FormState> formstate;

  @override
  Future<void> onInit() async {
    super.onInit();
    formstate = GlobalKey<FormState>();
    isLoad = true.obs;
    service = SectorService();
    models = <SectorModel>[].obs;
    message = '';
    await getdata(userId);
  }

  getdata(String userId) async {
    d = await service.getSectorProjects(UserInformation.user_token, userId);
    models.assignAll(service.model);
    models.refresh();
    isLoad.value = false;
    update();
    if (models.isEmpty) {
    } else if (models[0].name == "null") {}
  }
}
