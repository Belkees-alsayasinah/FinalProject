import 'package:bloom_project/Components/MyButton.dart';
import 'package:bloom_project/FirstPage/first_page.dart';
import 'package:bloom_project/Style/constant.dart';
import 'package:bloom_project/service/info.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TypeOfUser extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          top: 40,
          bottom: 30,
          left: 10,
          right: 10,
        ),
        child: Column(
          children: [
            Image.asset('assets/images/logo.jpg'),
            SizedBox(
              height: 20,
            ),
            Text(
              'أهلاً وسهلاً',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
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
                fontSize: 15,
                fontFamily: 'font1',
              ),
            ),
            SizedBox(
              height: 30,
            ),
            MyButton(
              fontSize: 34,
              onsave: () {
                UserInformation.type = 'user';
                Get.offAll(() => FirstPage());
              },
              width: 348,
              height: 66,
              text: 'صاحب عمل',
              color: buttonColor,
              radius: 15,
              textColor: Colors.white,
            ),
            SizedBox(
              height: 15,
            ),
            MyButton(
              onsave: () {
                UserInformation.type = 'inv';
                Get.offAll(() => FirstPage());
              },
              fontSize: 34,
              width: 348,
              height: 66,
              text: 'مستثمر',
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
