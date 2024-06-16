import 'package:bloom_project/Components/TextField.dart';
import 'package:bloom_project/VerifyOTP/verify_otp_view.dart';
import 'package:bloom_project/RegisterPage/register_controller.dart';
import 'package:bloom_project/Style/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Components/MyButton.dart';
import '../Login/login_page.dart';

class RegisterPage extends StatelessWidget {
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
          physics: BouncingScrollPhysics(),
          child: Center(
            child: Form(
              key: controller.formstate,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'إنشاء حساب',
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
                            onsave: (value) {
                              controller.firstName = value!;
                            },
                            keyboardType: TextInputType.emailAddress,
                            blurRadius: 8,
                            offset: 10,
                            width: screenSize.width * 0.42,
                            hieght: 62,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'this field is required';
                              }
                              return null;
                            },
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
                            onsave: (value) {
                              controller.lastName = value!;
                            },
                            keyboardType: TextInputType.emailAddress,
                            blurRadius: 8,
                            offset: 10,
                            width: screenSize.width * 0.42,
                            hieght: 62,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'this field is required';
                              }
                              return null;
                            },
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
                        onsave: (value) {
                          controller.email = value!;
                        },
                        keyboardType: TextInputType.emailAddress,
                        blurRadius: 8,
                        offset: 10,
                        width: screenSize.width * 1,
                        hieght: 62,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'this field is required';
                          }
                          if (!value.contains('@') ||
                              !value.contains('.')) {
                            return 'incorrect formula';
                          }
                          return null;
                        },
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
                        onsave: (value) {
                          controller.phone = value!;
                        },
                        keyboardType: TextInputType.emailAddress,
                        blurRadius: 8,
                        offset: 10,
                        width: screenSize.width * 1,
                        hieght: 62,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'this field is required';
                          }
                          return null;
                        },
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
                        onsave: (value) {
                          controller.password = value!;
                        },
                        keyboardType: TextInputType.emailAddress,
                        blurRadius: 8,
                        offset: 10,
                        width: screenSize.width * 1,
                        hieght: 62,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'this field is required';
                          }

                          return null;
                        },
                        obscureText: true,
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
                        onsave: (value) {
                          controller.location = value!;
                        },
                        keyboardType: TextInputType.emailAddress,
                        blurRadius: 8,
                        offset: 10,
                        width: screenSize.width * 1,
                        hieght: 62,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'this field is required';
                          }

                          return null;
                        },
                      ),
                    ],
                  ),
                  SizedBox(width: screenSize.width * 0.04),
                  SizedBox(height: 25,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    textDirection: TextDirection.ltr,
                    children: [
                      Text(
                        ':نوع الحساب',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: screenSize.shortestSide * 0.06,
                          fontFamily: 'font1',
                        ),
                      ),
                      Container(
                        width: screenSize.width * 1,
                        height: 62,

                        decoration: BoxDecoration(
                            color: fieldColor,
                            borderRadius: BorderRadius.circular(15)
                        ),
                       // margin: EdgeInsets.symmetric(horizontal: 20),
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Obx(() => SingleChildScrollView(
                          child: DropdownButtonFormField<String>(
                            value: controller.accountType.value,
                            onChanged: (value) {
                              controller.accountType.value = value!;
                            },
                            decoration: InputDecoration(

                              contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),

                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey.withOpacity(0.1),
                                style: BorderStyle.none,
                                ), // تحديد لون الخط
                              ),
                            ),
                            style: TextStyle(
                              fontFamily: 'font1', // تعديل نوع الخط هنا
                              fontSize: 25, // تعديل حجم الخط هنا
                              fontWeight: FontWeight.normal, // تعديل سماكة الخط هنا
                              color: Colors.black, // تعديل لون الخط هنا
                            ),
                            dropdownColor: fieldColor,
                            focusColor: fieldColor,
                            isExpanded: false,
                            items: [
                              DropdownMenuItem(
                                value: 'عامل',
                                child: Text('صاحب عمل'),
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
                  SizedBox(
                    height: 50,
                  ),
                  MyButton(
                    fontSize: 34,
                    onsave: () {
                      if (controller
                          .formstate.currentState!
                          .validate()) {
                        controller.onClickSignIn();
                      }
                    },
                    width: 348,
                    height: 62,
                    text: 'إنشاء الحساب',
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
                        'هل لديك حساب؟',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          fontFamily: 'font1',
                        ),
                      ),
                      TextButton(
                          onPressed: () {
                            Get.to(LoginPage());
                          },
                          child: Text(
                            'تسجيل الدخول',
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
