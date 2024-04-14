import 'package:bloom_project/Components/TextField.dart';
import 'package:bloom_project/RegisterPage/register_controller.dart';
import 'package:bloom_project/Style/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Components/MyButton.dart';

class bb extends StatelessWidget {
  var appPadding = 30;

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    RegisterPageController controller = Get.put(RegisterPageController());
    return Scaffold(
      body: Padding(
        padding:
            const EdgeInsets.only(top: 70, bottom: 30, left: 20, right: 20),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [

                SizedBox(
                  height: 40,
                ),
                SizedBox(width: screenSize.width * 0.04),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  textDirection: TextDirection.ltr,
                  children: [
                    // Text(
                    //   ':نوع الحساب',
                    //   style: TextStyle(
                    //     fontWeight: FontWeight.bold,
                    //     fontSize: screenSize.shortestSide * 0.06,
                    //     fontFamily: 'font1',
                    //   ),
                    // ),
                    Container(
                      width: 500,
                      // height: 10,
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Obx(() => SingleChildScrollView(
                            child: DropdownButtonFormField<String>(
                              value: controller.accountType.value,
                              onChanged: (value) {
                                controller.accountType.value = value!;
                              },
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                // isDense: true, // تقليل الارتفاع
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 8,
                                    horizontal: 10), // تحديد التباعد الداخلي
                              ),
                              items: [
                                DropdownMenuItem(
                                  value: 'عامل',
                                  child: Text('عامل'),
                                ),
                                DropdownMenuItem(
                                  value: 'مستثمر',
                                  child: Text('مستثمر'),
                                ),
                              ],
                            ),
                          )),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
