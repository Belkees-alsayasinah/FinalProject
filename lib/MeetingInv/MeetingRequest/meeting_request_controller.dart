import 'package:bloom_project/MeetingInv/MeetingRequest/meeting_request_model.dart';
import 'package:bloom_project/MeetingInv/MeetingRequest/meeting_request_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../service/info.dart';

class GetMeetRequestController extends GetxController {


  late String id;
  late RxBool isLoad;
  late GetMeetRequestsService service;
  late RxList<MeetingRequestModel> models;
  late String message;
  var d;
  late bool state;
  late GlobalKey<FormState> formstate;

  @override
  Future<void> onInit() async {
    super.onInit();
    formstate = GlobalKey<FormState>();
    isLoad = true.obs;
    service = GetMeetRequestsService();
    models = <MeetingRequestModel>[].obs;
    message = '';
    await getdata();
  }

  getdata() async {
    print('gg');
    d = await service.getMeetingRequests(UserInformation.user_token);
    models.assignAll(service.model);
    models.refresh();
    isLoad.value = false;
    update();
    if (models.isEmpty) {
    } else if (models[0].hour == "null") {}
  }
}
