import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class EditProfileController extends GetxController {
  late GlobalKey<FormState> formstate;

  @override
  void onInit() {
    formstate = GlobalKey<FormState>();
    super.onInit();
  }

}