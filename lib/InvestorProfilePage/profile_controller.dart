import 'package:bloom_project/InvestorProfilePage/profile_model.dart';
import 'package:bloom_project/InvestorProfilePage/profile_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../service/info.dart';

class InvestorProfilePageController extends GetxController {
  late String id;
  late RxBool isLoad;
  late InvestorProfileService service;
  late RxList<InvestorProfileModel> models;
  late String message;
  var d;
  late bool state;
  late GlobalKey<FormState> formstate;

  @override
  Future<void> onInit() async {
    super.onInit();
    formstate = GlobalKey<FormState>();
    isLoad = true.obs;
    service = InvestorProfileService();
    models = <InvestorProfileModel>[].obs;
    message = '';
    await getdata();
  }

  getdata() async {
    d = await service
        .fetchProfileData(UserInformation.user_token)
        .listen((event) {
      models.value = event;
      isLoad.value = false;
    });
    if (models.isEmpty) {
    } else if (models[0].investor.location == null) {}
  }
}
