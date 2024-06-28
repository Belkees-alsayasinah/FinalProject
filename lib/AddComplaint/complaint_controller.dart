import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'complaint_model.dart';
import 'complaint_service.dart';

class ComplaintController extends GetxController {
  late String description;
  String projectID;

  ComplaintController(this.projectID);

  late ComplaintService service;
  late String message;
  late bool addState;
  late RxBool remember;
  late GlobalKey<FormState> formstate;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    print('gg: ');
    print(projectID);
    description = '';
    message = '';
    service = ComplaintService();
    addState = false;
    remember = true.obs;
    formstate = GlobalKey<FormState>();
    super.onInit();
  }

  void onClickAddComplaint() async {
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
    ComplaintModel user =
        ComplaintModel(description: description, projectID: projectID);
    addState = await service.addComplaint(user);
    var mapmsg = service.message;
    if (mapmsg is Map) {
    } else if (mapmsg is String) {
      isLoading.value = false;
      message = mapmsg;
    }
  }
}
