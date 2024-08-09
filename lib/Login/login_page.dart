import 'package:bloom_project/Components/TextField.dart';
import 'package:bloom_project/RegisterPage/register_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../Components/MyButton.dart';
import 'login_page_controller.dart';
import 'login_page_string.dart';
import 'login_page_style.dart';

class LoginPage extends StatelessWidget {
  final LoginPageController loginController = Get.put(LoginPageController());

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final LoginPageStyles styles = LoginPageStyles(screenSize);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
        child: Center(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Form(
              key: loginController.formstate,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    LoginPageStrings.loginTitle,
                    style: styles.titleStyle,
                  ),
                  SizedBox(height: screenSize.height * 0.1),
                  Text(
                    LoginPageStrings.emailLabel,
                    style: styles.labelStyle,
                  ),
                  MyTextField(
                    label: '',
                    hint: LoginPageStrings.emailHint,
                    textInputAction: TextInputAction.next,
                    onsave: (value) {
                      loginController.email = value!;
                    },
                    keyboardType: TextInputType.emailAddress,
                    blurRadius: 8,
                    offset: 10,
                    width: styles.textFieldWidth,
                    height: styles.textFieldHeight,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return LoginPageStrings.emailValidationError;
                      }
                      if (!value.contains('@') || !value.contains('.')) {
                        return 'Incorrect format';
                      }
                      return null;
                    },
                    max: 1,
                  ),
                  SizedBox(height: screenSize.height * 0.03),
                  Text(
                    LoginPageStrings.passwordLabel,
                    style: styles.labelStyle,
                  ),
                  MyTextField(
                    label: '',
                    hint: LoginPageStrings.passwordHint,
                    textInputAction: TextInputAction.done,
                    onsave: (value) {
                      loginController.password = value!;
                    },
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    blurRadius: 8,
                    offset: 10,
                    width: styles.textFieldWidth,
                    height: styles.textFieldHeight,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return LoginPageStrings.passwordValidationError;
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: screenSize.height * 0.05),
                  Obx(() {
                    return loginController.isLoading.value
                        ? Center(
                            child:
                                LoadingAnimationWidget.horizontalRotatingDots(
                              color: styles.textColor,
                              size: styles.loadingSize,
                            ),
                          )
                        : MyButton(
                            fontSize: styles.buttonTextStyle.fontSize!,
                            onsave: () {
                              if (loginController.formstate.currentState!
                                  .validate()) {
                                loginController.onClicksignin();
                              }
                            },
                            width: styles.buttonWidth,
                            height: styles.buttonHeight,
                            text: LoginPageStrings.loginButtonText,
                            color: styles.buttonColor,
                            radius: 15,
                            textColor: Colors.white,
                          );
                  }),
                  SizedBox(height: screenSize.height * 0.03),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      textDirection: TextDirection.rtl,
                      children: [
                        Text(
                          LoginPageStrings.noAccountText,
                          style: styles.labelStyle,
                        ),
                        TextButton(
                          onPressed: () {
                            Get.to(RegisterPage());
                          },
                          child: Text(
                            LoginPageStrings.registerText,
                            style: styles.linkTextStyle,
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
