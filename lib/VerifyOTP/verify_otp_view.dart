import 'package:bloom_project/Interests/interests_view.dart';
import 'package:bloom_project/VerifyOTP/verify_otp_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../Components/MyButton.dart';
import '../Components/TextField.dart';
import '../Style/constant.dart';

class VerifyOTPView extends StatelessWidget {
  VerifyOTPController controller = Get.put(VerifyOTPController());

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
              key: controller.formstate,
              child: Column(
                textDirection: TextDirection.ltr,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'تأكيد الحساب',
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
                    'لقد تم إرسال رسالة الى بريدك الالكتروني للتأكد من صحة البريد المعطى، الرجاء كتابة الرمز المرسل في الحقل الموجود وعدم إعطاء الرمز لأي شخص.',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      fontFamily: 'font1',
                    ),
                    textDirection: TextDirection.rtl,
                  ),
                  SizedBox(height: 25,),
                  Text(
                    ':البريد الالكتروني',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      fontFamily: 'font1',
                    ),
                  ),
                  MyTextField(
                    label: '',
                    hint: "ss@gami.com",
                    textInputAction: TextInputAction.next,
                    onsave: (value) {
                      controller.email = value!;
                    },
                    keyboardType: TextInputType.emailAddress,
                    blurRadius: 8,
                    offset: 10,
                    width: screenSize.width * 0.9,
                    hieght: screenSize.height * 0.08,
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
                    ':الرمز المرسل',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      fontFamily: 'font1',
                    ),
                  ),
                  MyTextField(
                    label: '',
                    hint: "1265-3456-8776",
                    textInputAction: TextInputAction.next,
                    onsave: (value) {
                      controller.otp = value!;
                    },
                    keyboardType: TextInputType.emailAddress,
                    blurRadius: 8,
                    offset: 10,
                    width: screenSize.width * 0.9,
                    hieght: screenSize.height * 0.08,
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
                    height: 50,
                  ),
                  MyButton(
                    fontSize: 34,
                    onsave: () {
                      if (controller.formstate.currentState!.validate()) {
                        controller.onClick();
                      }
                    },
                    width: screenSize.width * 0.9,
                    height: screenSize.height * 0.08,
                    text: 'التحقق',
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
                        'لم تصلك رسالة بعد؟',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          fontFamily: 'font1',
                        ),
                      ),
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            'إعادة إرسال الرمز',
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
