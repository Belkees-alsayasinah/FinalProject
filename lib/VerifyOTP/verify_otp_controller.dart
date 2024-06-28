import 'package:bloom_project/HomePage/basic_page.dart';
import 'package:bloom_project/HomePage/home_page_View.dart';
import 'package:bloom_project/Interests/interests_view.dart';
import 'package:bloom_project/VerifyOTP/verify_otp_model.dart';
import 'package:bloom_project/VerifyOTP/verify_otp_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../service/info.dart';
import '../../Style/constant.dart';

class VerifyOTPController extends GetxController {
  late String email;
  late String otp;
  late VerifyOTPService service;
  late String message;
  late bool verifyState;
  late RxBool remember;
  late GlobalKey<FormState> formstate;
  late RxBool isLoading;

  @override
  void onInit() {
    email = '';
    otp = '';
    message = '';
    service = VerifyOTPService();
    verifyState = false;
    remember = true.obs;
    isLoading = false.obs;
    formstate = GlobalKey<FormState>();
    super.onInit();
  }

  void onClick() async {
    isLoading = true.obs;
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      formdata.save();
      await verifyOtp();
      if (verifyState) {
        UserInformation.type == 'inv'
            ? Get.offAll(InterestsView())
            : Get.offAll(BasicPage());

        Get.snackbar('Done', 'You have been logged in successfully',
            borderRadius: 20,
            margin: EdgeInsets.symmetric(horizontal: 5, vertical: 20),
            backgroundColor: buttonColorOpa,
            icon: Icon(
              Icons.emoji_emotions_outlined,
              size: 40,
              color: Colors.white,
            ),
            colorText: Colors.white,
            snackPosition: SnackPosition.TOP);
      } else {
        Get.snackbar('Sorry', 'There was a problem signing in',
            borderRadius: 20,
            margin: EdgeInsets.symmetric(horizontal: 5, vertical: 20),
            backgroundColor: Colors.red,
            icon: Icon(
              Icons.report_problem_outlined,
              size: 40,
              color: Colors.white,
            ),
            colorText: Colors.white,
            snackPosition: SnackPosition.TOP);
      }
    }
    isLoading = false.obs;
  }

  Future<void> verifyOtp() async {
    VerifyOTP user = VerifyOTP(email: email, otp: otp);
    verifyState = await service.verify(user);
    var mapmsg = service.message;
    if (mapmsg is Map) {
    } else if (mapmsg is String) {
      message = mapmsg;
    }
  }
}
