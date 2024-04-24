
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Components/MyButton.dart';
import '../Components/TextField.dart';
import '../Style/constant.dart';

class EditProfilePage extends StatelessWidget {
  var appPadding = 30;

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
   // EditProfileController controller = Get.put(EditProfileController());
    return Scaffold(
      body: Padding(
        padding:
        const EdgeInsets.only(top: 70, bottom: 30, left: 20, right: 20),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'تعديل الحساب',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 34,
                    fontFamily: 'font1',
                    color: textColor,
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  textDirection: TextDirection.rtl,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      textDirection: TextDirection.ltr,
                      children: [
                        Text(
                          ':الاسم الأول',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: screenSize.shortestSide * 0.06,
                            fontFamily: 'font1',
                          ),
                        ),
                        MyTextField(
                          label: '',
                          hint: "",
                          textInputAction: TextInputAction.next,
                          onsave: (value) {},
                          keyboardType: TextInputType.emailAddress,
                          blurRadius: 8,
                          offset: 10,
                          width: screenSize.width * 0.42,
                          hieght: 62,
                        ),
                      ],
                    ),
                    SizedBox(width: screenSize.width * 0.04),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      textDirection: TextDirection.ltr,
                      children: [
                        Text(
                          ':الاسم الأخير',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: screenSize.shortestSide * 0.06,
                            fontFamily: 'font1',
                          ),
                        ),
                        MyTextField(
                          label: '',
                          hint: "",
                          textInputAction: TextInputAction.next,
                          onsave: (value) {},
                          keyboardType: TextInputType.emailAddress,
                          blurRadius: 8,
                          offset: 10,
                          width: screenSize.width * 0.42,
                          hieght: 62,
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  textDirection: TextDirection.ltr,
                  children: [
                    Text(
                      ':البريد الإلكتروني',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: screenSize.shortestSide * 0.06,
                        fontFamily: 'font1',
                      ),
                    ),
                    MyTextField(
                      label: '',
                      hint: "",
                      textInputAction: TextInputAction.next,
                      onsave: (value) {},
                      keyboardType: TextInputType.emailAddress,
                      blurRadius: 8,
                      offset: 10,
                      width: screenSize.width * 1,
                      hieght: 62,
                    ),
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  textDirection: TextDirection.ltr,
                  children: [
                    Text(
                      ':رقم الجوال',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: screenSize.shortestSide * 0.06,
                        fontFamily: 'font1',
                      ),
                    ),
                    MyTextField(
                      label: '',
                      hint: "",
                      textInputAction: TextInputAction.next,
                      onsave: (value) {},
                      keyboardType: TextInputType.emailAddress,
                      blurRadius: 8,
                      offset: 10,
                      width: screenSize.width * 1,
                      hieght: 62,
                    ),
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  textDirection: TextDirection.ltr,
                  children: [
                    Text(
                      ':كلمة المرور',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: screenSize.shortestSide * 0.06,
                        fontFamily: 'font1',
                      ),
                    ),
                    MyTextField(
                      label: '',
                      hint: "",
                      textInputAction: TextInputAction.next,
                      onsave: (value) {},
                      keyboardType: TextInputType.emailAddress,
                      blurRadius: 8,
                      offset: 10,
                      width: screenSize.width * 1,
                      hieght: 62,
                    ),
                  ],
                ),
                SizedBox(height: 25,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  textDirection: TextDirection.ltr,
                  children: [
                    Text(
                      ':العنوان',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: screenSize.shortestSide * 0.06,
                        fontFamily: 'font1',
                      ),
                    ),
                    MyTextField(
                      label: '',
                      hint: "",
                      textInputAction: TextInputAction.next,
                      onsave: (value) {},
                      keyboardType: TextInputType.emailAddress,
                      blurRadius: 8,
                      offset: 10,
                      width: screenSize.width * 1,
                      hieght: 62,
                    ),
                  ],
                ),
                SizedBox(width: screenSize.width * 0.04),
                SizedBox(height: 25,),
                SizedBox(
                  height: 50,
                ),
                MyButton(
                  fontSize: 34,
                  onsave: () {
                  },
                  width: 348,
                  height: 62,
                  text: 'تعديل الحساب',
                  color: buttonColor,
                  radius: 15,
                  textColor: Colors.white,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
