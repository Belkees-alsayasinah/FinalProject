import 'package:bloom_project/Components/MyButton.dart';
import 'package:bloom_project/FirstPage/first_page.dart';
import 'package:bloom_project/Style/constant.dart';
import 'package:bloom_project/service/info.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TypeOfUser extends StatelessWidget {
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
                  width: screenSize.width * 0.6, // عرض الصورة
                  height: screenSize.height * 0.3, // ارتفاع الصورة
                  child: Hero(
                    tag: 'imageHero',
                    child: Image.asset(
                      'assets/images/g.jpg',
                    ),
                  )),
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
              'يمكنك اختيار نوع الحساب الذي تريد التسجيل به!',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: screenSize.width * 0.04,
                fontFamily: 'font1',
              ),
              textDirection: TextDirection.rtl,
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
              width: screenSize.width * 1,
              height: screenSize.height * 0.08,
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
              width: screenSize.width * 1,
              height: screenSize.height * 0.08,
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
