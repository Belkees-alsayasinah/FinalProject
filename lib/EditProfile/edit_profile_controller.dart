import 'package:bloom_project/EditProfile/edit_profile_service.dart';
import 'package:bloom_project/RegisterPage/register_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../service/info.dart';

class EditProfileController extends GetxController {
  late String firstName;
  late RxString lastName;
  late RxString email;
  late String phone;
  late String address;
  late String id;
  late EditProfileService service;
  late String message;
  late bool addStudentState;
  late GlobalKey<FormState> formstate;
  var d;
  late RxList<RegisterModel> models;
  late RxBool isload;
  late bool state1;

  @override
  void onInit() async {
    isload = true.obs;
    models = <RegisterModel>[].obs;
    firstName = '';
    lastName = 'first'.obs;
    email = 'first'.obs;
    phone = '';
    address = '';
    id = '';
    service = EditProfileService();
    addStudentState = false;
    formstate = GlobalKey<FormState>();
    super.onInit();
  }

  //Update
  Future<void> onUpdate() async {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      formdata.save();
      RegisterModel student = RegisterModel(
          firstName: firstName,
          lastName: lastName.value,
          email: email.value,
          phone: phone,
          location: address);
      addStudentState = await service.updateProfile(id, student);
      if (addStudentState) {
        var mapmsg = service.message;
        print('map: $mapmsg');
      }
    }
  }
}
