import 'package:bloom_project/HomePage/basic_page.dart';
import 'package:bloom_project/HomePage/home_page_View.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../service/info.dart';
import '../Style/constant.dart';
import 'login_page_model.dart';
import 'login_page_service.dart';


class LoginPageController extends GetxController {
  late String email;
  late String password;
  late LoginPageService service;
  late String message;
  late bool loginState;
  late RxBool remember;
  late GlobalKey<FormState> formstate;
  late RxBool isLoading;

  @override
  void onInit() {
    email = '';
    password = '';
    message = '';
    service = LoginPageService();
    loginState = false;
    remember = true.obs;
    isLoading = false.obs;
    formstate = GlobalKey<FormState>();
    super.onInit();
  }

  void toggleCheckbox() {
    remember.value = !remember.value;
    update();
  }

  void onClicksignin() async {
    isLoading = true.obs;
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      formdata.save();
      print("email : $email");
      print("password : $password");
      await loginclick();
      if (loginState) {
        print(loginState);
        Get.to(BasicPage());
/////////////////////////////////////////////////////////////////////////////////
        if(UserInformation.usertype=="user"||UserInformation.usertype=="User")
        // Get.to(HomePageView());
        if(UserInformation.usertype=="super_admin")
         // Get.to(HomePageView());
        print(UserInformation.usertype);
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

  Future<void> loginclick() async {
    LoginPageModel user = LoginPageModel(email: email, password: password);
    loginState = await service.login(user);
    var mapmsg = service.message;
    if (mapmsg is Map) {
    } else if (mapmsg is String) {
      message = mapmsg;
    }
  }
}
