import 'package:bloom_project/Components/TextField.dart';
import 'package:bloom_project/Style/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Components/MyButton.dart';

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
              MyTextField(label: '', hint: "", textInputAction: TextInputAction.next, onsave: (value){}, keyboardType: TextInputType.emailAddress, blurRadius: 8, offset: 10),
                            SizedBox(height: 25,),
                Text(':كلمة المرور',style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  fontFamily: 'font1',

                ),),
                MyTextField(label: '', hint: "", textInputAction: TextInputAction.next, onsave: (value){}, keyboardType: TextInputType.emailAddress, blurRadius: 8, offset: 10),
                SizedBox(height: 50,),
                MyButton(
                  onsave: () {},
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
                  TextButton(onPressed: (){}, child:Text('إنشاء حساب',style: TextStyle(
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
