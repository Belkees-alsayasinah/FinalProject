import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterPageController extends GetxController {
  late RxString accountType;
  late GlobalKey<FormState> formstate;

  @override
  void onInit() {
    formstate = GlobalKey<FormState>();
    accountType = 'عامل'.obs;
    super.onInit();
  }

}
