import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'chat_model.dart';
import 'chat_service.dart';

class ChatController extends GetxController {
  late String content;
  late ChatService service;
  late String message;
  late bool addState;
  late RxBool remember;
  late GlobalKey<FormState> formstate;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    content = '';
    message = '';
    service = ChatService();
    addState = false;
    remember = true.obs;
    formstate = GlobalKey<FormState>();
    super.onInit();
  }

  void onClickSendMessage() async {
    isLoading.value = true;
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      formdata.save();
      await addComplaint();
      if (addState) {
        print(addState);
        Get.back();
      }
    }
  }

  Future<void> addComplaint() async {
    ChatModel sendMessage =
    ChatModel(content: content);
    addState = await service.sendMessage(sendMessage);
    var mapmsg = service.message;
    if (mapmsg is Map) {
    } else if (mapmsg is String) {
      isLoading.value = false;
      message = mapmsg;
    }
  }
}
