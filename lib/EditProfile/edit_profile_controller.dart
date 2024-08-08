import 'package:bloom_project/EditProfile/edit_profile_service.dart';
import 'package:bloom_project/RegisterPage/register_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProfileController extends GetxController {
  var args = Get.arguments;
  late String firstName;
  late String lastName;
  late String email;
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
    args = Get.arguments;
    firstName = args['firstName'];
    lastName = args['lastName'];
    email = args['email'];
    phone = args['phone'];
    address = args['address'];
    id = args['id'];
    isload = true.obs;
    models = <RegisterModel>[].obs;
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
          lastName: lastName,
          email: email,
          phone: phone,
          location: address);
      addStudentState = await service.updateProfile(id, student);
      if (addStudentState) {
        Get.back();
        var mapmsg = service.message;
        print('map: $mapmsg');
      }
    }
  }
}
