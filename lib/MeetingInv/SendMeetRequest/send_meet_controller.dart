import 'package:bloom_project/MeetingInv/SendMeetRequest/send_meet_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SendMeetController extends GetxController {
  int projectID;
  int id;

  SendMeetController(this.projectID, this.id);

  late SendMeetService service;
  late String message;
  late bool addState;
  late RxBool remember;
  late GlobalKey<FormState> formstate;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    print('gg: ');
    print(projectID);
    message = '';
    service = SendMeetService();
    addState = false;
    remember = true.obs;
    formstate = GlobalKey<FormState>();
    super.onInit();
  }

  void onClickAddReq() async {
    isLoading.value = true;

    await addReq();
    if (addState) {
      print(addState);
      Get.back();
    }
  }

  Future<void> addReq() async {
    addState = await service.addReq(projectID, id);
    var mapmsg = service.message;
    if (mapmsg is Map) {
    } else if (mapmsg is String) {
      isLoading.value = false;
      message = mapmsg;
    }
  }
}
