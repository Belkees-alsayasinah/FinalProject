import 'package:bloom_project/WorkerProfilePage/profile_model.dart';
import 'package:bloom_project/WorkerProfilePage/profile_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../service/info.dart';

class ProfilePageController extends GetxController {
  late String id;
  late RxBool isLoad;
  late ProfileService service;
  late RxList<ProfileModel> models;
  late String message;
  var d;
  late bool state;
  late GlobalKey<FormState> formstate;

  @override
  Future<void> onInit() async {
    super.onInit();
    formstate = GlobalKey<FormState>();
    isLoad = true.obs;
    service = ProfileService();
    models = <ProfileModel>[].obs;
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
    } else if (models[0].investedProjects == []) {}
  }

  // //delete
  // ondelete(int id) async {
  //   state = await service.deleteData(id);
  //   if (state) {
  //   } else {
  //     print('noop');
  //   }
  // }
}
