import 'package:bloom_project/Interests/interests_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../Components/MyButton.dart';
import '../Components/TextField.dart';
import '../Style/constant.dart';

class ConfirmAccountView extends StatelessWidget {
  const ConfirmAccountView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:
            const EdgeInsets.only(top: 70, bottom: 30, left: 30, right: 30),
        child: Center(
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
                onsave: (value) {},
                keyboardType: TextInputType.emailAddress,
                blurRadius: 8,
                offset: 10,
                width: 348,
                hieght: 62,
              ),
              SizedBox(
                height: 50,
              ),
              MyButton(
                fontSize: 34,
                onsave: () {
                  Get.to(InterestsView());
                },
                width: 348,
                height: 62,
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
    );
  }
}
