import 'package:bloom_project/GetCanvas/get_canvas_model.dart';
import 'package:bloom_project/GetCanvas/get_canvas_servic.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../service/info.dart';

class GetCanvasController extends GetxController {
  String id;

  GetCanvasController(this.id);


  late RxBool isLoad;
  late GetCanvasService service;
  late RxList<GetCanvasModel> models;
  late String message;
  var d;
  late bool state;
  late GlobalKey<FormState> formstate;

  @override
  Future<void> onInit() async {
    super.onInit();
    formstate = GlobalKey<FormState>();
    isLoad = true.obs;
    service = GetCanvasService();
    models = <GetCanvasModel>[].obs;
    message = '';
    await getdata(id);
  }

  getdata(String userId) async {
    d = await service.getCanvas(UserInformation.user_token, userId);
    models.assignAll(service.model);
    models.refresh();
    isLoad.value = false;
    update();
    if (models.isEmpty) {
    } else if (false) {}
  }
}
