import 'package:bloom_project/Components/TextField.dart';
import 'package:bloom_project/HomePage/basic_page.dart';
import 'package:bloom_project/HomePage/home_page_View.dart';
import 'package:bloom_project/RegisterPage/register_page.dart';
import 'package:bloom_project/Style/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../Components/MyButton.dart';
import '../../VerifyOTP/verify_otp_view.dart';
import 'login_page_controller.dart';

class LoginPage extends StatelessWidget {
  LoginPageController loginController = Get.put(LoginPageController());


  @override
  Widget build(BuildContext context) {
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
                  SizedBox(
                    height: 100,
                  ),
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
                    hint: "",
                    textInputAction: TextInputAction.next,
                    onsave: (value) {
                      loginController.email = value!;
                    },
                    keyboardType: TextInputType.emailAddress,
                    blurRadius: 8,
                    offset: 10,
                    width: 348,
                    hieght: 62,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'This field is required';
                        }
                        if (!value.contains('@') || !value.contains('.')) {
                          return 'Incorrect format';
                        }
                        return null;
                      },
                  ),
                  SizedBox(
                    height: 25,
                  ),
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
                    hint: "",
                    textInputAction: TextInputAction.next,
                    onsave: (value) {
                      loginController.password = value!;
                    },
                    keyboardType: TextInputType.emailAddress,
                    blurRadius: 8,
                    offset: 10,
                    width: 348,
                    hieght: 62,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'This field is required';
                      }
                      return null;
                    },
                    obscureText: true,
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  MyButton(
                    fontSize: 34,
                    onsave: () {
                      if (loginController.formstate.currentState!.validate()) {
                        loginController.onClicksignin();
                      }
                    },
                    width: 348,
                    height: 62,
                    text: 'تسجيل الدخول',
                    color: buttonColor,
                    radius: 15,
                    textColor: Colors.white,
                  ),
                  SizedBox(
                    height: 25,
                  ),
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
                          )),
                    ],
                  )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
