import 'package:bloom_project/LoginPage/login_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Components/MyButton.dart';
import '../Components/TextField.dart';
import '../Style/constant.dart';

class InterestsView extends StatefulWidget {
  const InterestsView({Key? key}) : super(key: key);

  @override
  State<InterestsView> createState() => _InterestsViewState();
}

class _InterestsViewState extends State<InterestsView> {
 List<bool> selectedOptions = List.generate(12, (index) => false);


  List<String> optionsNames = [
    'المواد الغذائية',
    'الحرف اليدوية',
    'المناسبات الشخصية',
    'الفن',
    'المشاريع اليدوية',
    'التصوير',
    'التجارة',
    'الطبخ',
    'الصناعات الاستهلاكية',
    'الزراعة',
    'الصحة والعناية',
    'الخدمات المهنية'
  ];
  //List<bool> selectedOptions = List.generate(optionsNames.length, (index) => false);
 void toggleOption(int index) {
   if (index >= 0 && index < selectedOptions.length) {
     setState(() {
       selectedOptions[index] = !selectedOptions[index];
       print(selectedOptions);
     });
   }
 }

  @override
  Widget build(BuildContext context) {
    print(optionsNames.length);
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding:
        const EdgeInsets.only(top: 70, bottom: 30, left: 30, right: 30),
        child: Center(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'اختر اهتماماتك',
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
                Text(
                  'اختر اهتماماتك بعناية، ستظهر لك المواضيع التي اخترتها في مقدّمة المشاريع لتسهّل عليك عملية البحث.',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    fontFamily: 'font1',
                    color: grey,
                  ),
                  textDirection: TextDirection.rtl,
                ),
                SizedBox(
                  height: 25,
                ),
                GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                  ),
                  itemCount: optionsNames.length,
                  itemBuilder: (context, index) {
                    return MyButton(
                      onsave: () {
                        //print(optionsNames.length);
                        toggleOption(index);
                      },
                      width: screenSize.width * 0.35,
                      height: 62,
                      text: optionsNames[index],
                      color: selectedOptions[index] ? buttonColor : buttonColorOpa,
                      radius: 15,
                      textColor: black,
                      fontSize: 20,
                    );
                  },
                ),
                SizedBox(
                  height: 50,
                ),
                MyButton(
                  onsave: () {
                    Get.to(LoginPage());
                  },
                  width: 348,
                  height: 62,
                  text: 'تأكيد',
                  color: buttonColor,
                  radius: 15,
                  textColor: Colors.white,
                  fontSize: 35,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
