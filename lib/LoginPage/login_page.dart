import 'package:bloom_project/Components/TextField.dart';
import 'package:bloom_project/HomePage/basic_page.dart';
import 'package:bloom_project/HomePage/home_page_View.dart';
import 'package:bloom_project/RegisterPage/register_page.dart';
import 'package:bloom_project/Style/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../Components/MyButton.dart';
import '../RegisterPage/confirm_account.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:
            const EdgeInsets.only(top: 70, bottom: 30, left: 30, right: 30),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end
            ,
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
              SizedBox(height: 100,),
              Text(':البريد الإلكتروني',style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                fontFamily: 'font1',

              ),),
              MyTextField(label: '', hint: "", textInputAction: TextInputAction.next, onsave: (value){}, keyboardType: TextInputType.emailAddress, blurRadius: 8, offset: 10,width: 348,hieght: 62,),
                            SizedBox(height: 25,),
                Text(':كلمة المرور',style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  fontFamily: 'font1',

                ),),
                MyTextField(label: '', hint: "", textInputAction: TextInputAction.next, onsave: (value){}, keyboardType: TextInputType.emailAddress, blurRadius: 8, offset: 10,width: 348,hieght: 62,),
                SizedBox(height: 50,),
                MyButton(
                  fontSize: 34,
                  onsave: () {
                    Get.to(BasicPage());
                  },
                  width: 348,
                  height: 62,
                  text: 'تسجيل الدخول',
                  color: buttonColor,
                  radius: 15,
                  textColor: Colors.white,
                ),
                SizedBox(height: 25,),
              Center(child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                textDirection: TextDirection.rtl,
                children: [
                 Text('ليس لديك حساب؟',style: TextStyle(
              fontWeight: FontWeight.bold,
                fontSize: 20,
                fontFamily: 'font1',
              ),),
                  TextButton(onPressed: (){
                    Get.to(RegisterPage());
                  }, child:Text('إنشاء حساب',style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    fontFamily: 'font1',
                    color: textColor,
                  ),)),
                ],
              )),
            ],
          ),
        ),
      ),
    );
  }
}
