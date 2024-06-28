import 'package:bloom_project/HomePage/basic_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    email = '';
    password = '';
    message = '';
    service = LoginPageService();
    loginState = false;
    remember = true.obs;
    formstate = GlobalKey<FormState>();
    super.onInit();
  }

  void toggleCheckbox() {
    remember.value = !remember.value;
    update();
  }

  void onClicksignin() async {
    isLoading.value = true;
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      formdata.save();
      print("email : $email");
      print("password : $password");
      await loginclick();
      if (loginState) {
        Get.offAll(BasicPage());
      }
      else{
        Get.snackbar(
          "عذراً","البريد الإلكتروني أو كلمة المرور غير صحيحة",
          icon: Icon(
            Icons.report_gmailerrorred,
            size: 40,
            // color: Colors.white,
          ),
          duration: Duration(seconds: 5),
          snackPosition: SnackPosition.TOP,
        );
      }
    }
    isLoading.value = false;
  }

  Future<void> loginclick() async {
    LoginPageModel user = LoginPageModel(email: email, password: password);
    loginState = await service.login(user);
    var mapmsg = service.message;
    if (mapmsg is Map) {
    } else if (mapmsg is String) {
      isLoading.value = false;
      message = mapmsg;
    }
  }
}
