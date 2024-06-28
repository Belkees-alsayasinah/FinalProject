import 'package:bloom_project/Profile/profile_model.dart';
import 'package:bloom_project/Profile/profile_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../service/info.dart';

class UserProfilePageController extends GetxController {

  String id;

  UserProfilePageController(this.id);
  late RxBool isLoad;
  late UserProfileService service;
  late RxList<UserProfileModel> models;
  late String message;
  var d;
  late bool state;
  late GlobalKey<FormState> formstate;

  @override
  Future<void> onInit() async {
    super.onInit();
    formstate = GlobalKey<FormState>();
    isLoad = true.obs;
    service = UserProfileService();
    models = <UserProfileModel>[].obs;
    message = '';
    await getdata();
  }

  getdata() async {
    d = await service.getProfileData(UserInformation.user_token, id);
    models.assignAll(service.model);
    isLoad.value = false;
    update();
    models.refresh();
    if (models.isEmpty) {
    } else if (models[0].user.location == null) {}
  }
}
