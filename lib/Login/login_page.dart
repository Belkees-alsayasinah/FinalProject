import 'package:bloom_project/Components/TextField.dart';
import 'package:bloom_project/RegisterPage/register_page.dart';
import 'package:bloom_project/Style/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../Components/MyButton.dart';
import 'login_page_controller.dart';

class LoginPage extends StatelessWidget {
  final LoginPageController loginController = Get.put(LoginPageController());

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding:
            const EdgeInsets.only(top: 70, bottom: 30, left: 30, right: 30),
        child: Center(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Form(
              key: loginController.formstate,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'تسجيل الدخول',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 34,
                      fontFamily: 'font1',
                      color: textColor,
                    ),
                  ),
                  SizedBox(height: 100),
                  Text(
                    ':البريد الإلكتروني',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      fontFamily: 'font1',
                    ),
                  ),
                  MyTextField(
                    label: '',
                    hint: "أدخل البريد الإلكتروني",
                    textInputAction: TextInputAction.next,
                    onsave: (value) {
                      loginController.email = value!;
                    },
                    keyboardType: TextInputType.emailAddress,
                    blurRadius: 8,
                    offset: 10,
                    width: screenSize.width * 0.9,
                    height: screenSize.height * 0.08,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'This field is required';
                      }
                      if (!value.contains('@') || !value.contains('.')) {
                        return 'Incorrect format';
                      }
                      return null;
                    },
                    max: 1, // Changed maxLines to 1
                  ),
                  SizedBox(height: 25),
                  Text(
                    ':كلمة المرور',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      fontFamily: 'font1',
                    ),
                  ),
                  MyTextField(
                    label: '',
                    hint: "ادخل كلمة المرور",
                    textInputAction: TextInputAction.done,
                    onsave: (value) {
                      // save value
                    },
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true, // تمكين إخفاء كلمة المرور
                    blurRadius: 8,
                    offset: 10,
                    width: screenSize.width * 0.9,
                    height: screenSize.height * 0.08,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'This field is required';
                      }
                      return null;
                    },
                  ),

                  SizedBox(height: 50),
                  Obx(() {
                    return loginController.isLoading.value
                        ? Center(
                            child:
                                LoadingAnimationWidget.horizontalRotatingDots(
                              color: textColor,
                              size: 50.0,
                            ),
                          )
                        : MyButton(
                            fontSize: 34,
                            onsave: () {
                              if (loginController.formstate.currentState!
                                  .validate()) {
                                loginController.onClicksignin();
                              }
                            },
                            width: 348,
                            height: 62,
                            text: 'تسجيل الدخول',
                            color: buttonColor,
                            radius: 15,
                            textColor: Colors.white,
                          );
                  }),
                  SizedBox(height: 25),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      textDirection: TextDirection.rtl,
                      children: [
                        Text(
                          'ليس لديك حساب؟',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            fontFamily: 'font1',
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Get.to(RegisterPage());
                          },
                          child: Text(
                            'إنشاء حساب',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              fontFamily: 'font1',
                              color: textColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
