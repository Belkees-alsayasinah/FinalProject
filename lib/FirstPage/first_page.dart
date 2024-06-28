import 'package:bloom_project/Components/MyButton.dart';
import 'package:bloom_project/RegisterPage/register_page.dart';
import 'package:bloom_project/Style/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Login/login_page.dart';

class FirstPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          top: 40,
          bottom: 30,
          left: 20,
          right: 20,
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: SizedBox(
                width: screenSize.width * 0.4, // عرض الصورة
                height: screenSize.height * 0.3, // ارتفاع الصورة
                child: Hero(
                  tag: 'dash',
                  child: Image.asset(
                    'assets/images/bloom.jpg',
                  ),
                )
              ),
            ),
            SizedBox(
              height: screenSize.height * 0.25,
            ),
            Text(
              'أهلاً وسهلاً',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: screenSize.width * 0.07,
                fontFamily: 'font1',
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              'يمكنك إنشاء الحساب وتسجيل الدخول بسهولة مع بلوم!',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: screenSize.width * 0.04,
                fontFamily: 'font1',
              ),
            ),
            SizedBox(
              height: 30,
            ),
            MyButton(
              fontSize: 34,
              onsave: () {
                Get.offAll(() => LoginPage());
              },
              width: screenSize.width * 1,
              height: screenSize.height * 0.08,
              text: 'تسجيل الدخول',
              color: buttonColor,
              radius: 15,
              textColor: Colors.white,
            ),
            SizedBox(
              height: 15,
            ),
            MyButton(
              onsave: () {
                Get.offAll(RegisterPage());
              },
              fontSize: 34,
              width: screenSize.width * 1,
              height: screenSize.height * 0.08,
              text: 'إنشاء حساب',
              color: buttonColorOpa,
              radius: 15,
              textColor: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
