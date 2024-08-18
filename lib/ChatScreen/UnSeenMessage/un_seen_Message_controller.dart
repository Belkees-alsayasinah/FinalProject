import 'package:bloom_project/ChatScreen/UnSeenMessage/un_seen_Message_service.dart';
import 'package:bloom_project/ChatScreen/UnSeenMessage/un_seen_message_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../service/info.dart';

class UnSeenMessageController extends GetxController {
  late RxBool isLoad;
  late UnSeenMessageService service;
  late RxList<UnSeenMessgaeModel> models;
  late String message;
  var d;
  late bool state;
  late GlobalKey<FormState> formstate;

  @override
  Future<void> onInit() async {
    super.onInit();
    formstate = GlobalKey<FormState>();
    isLoad = true.obs;
    service = UnSeenMessageService();
    models = <UnSeenMessgaeModel>[].obs;
    message = '';
    await getdata();
  }

  getdata() async {
    d = await service.getUnSeenMessage(UserInformation.user_token);
    models.assignAll(service.model);
    models.refresh();
    isLoad.value = false;
    update();
    if (models.isEmpty) {
    } else if (false) {}
  }
}
