import 'package:bloom_project/VerifyOTP/verify_otp_view.dart';
import 'package:bloom_project/RegisterPage/register_model.dart';
import 'package:bloom_project/RegisterPage/register_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../service/info.dart';

class RegisterPageController extends GetxController {
  late RxString accountType;
  late GlobalKey<FormState> formstate;
  late String email;
  late String password;
  late String firstName;
  late String lastName;
  late String location;
  late String phone;
  late RegisterService service;
  late String message;
  late bool loginState;
  late RxBool remember;
  late RxBool isLoading;

  @override
  void onInit() {
    formstate = GlobalKey<FormState>();
    accountType = 'عامل'.obs;
    email = '';
    password = '';
    firstName = '';
    lastName = '';
    location = '';
    phone = '';
    message = '';
    service = RegisterService();
    loginState = false;
    remember = true.obs;
    isLoading = false.obs;
    super.onInit();
  }

  void toggleCheckbox() {
    remember.value = !remember.value;
    update();
  }

  void onClickSignIn() async {
    isLoading = true.obs;
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      formdata.save();
      print("email : $email");
      print("password : $password");
      await loginclick();
      if (loginState) {

        Get.offAll(VerifyOTPView());
        print(UserInformation.usertype);
        Get.snackbar('Done', 'You have been logged in successfully',
            borderRadius: 20,
            margin: EdgeInsets.symmetric(horizontal: 5, vertical: 20),
            backgroundColor: Colors.blueGrey,
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

  Future<void> loginclick() async {
    RegisterModel user = RegisterModel(email: email, password: password, firstName: firstName, lastName: lastName, location: location, phone: phone);
    loginState = await service.login(user);
    var mapmsg = service.message;
    if (mapmsg is Map) {
    } else if (mapmsg is String) {
      message = mapmsg;
    }
  }
}
