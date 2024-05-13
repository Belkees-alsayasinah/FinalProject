import 'package:bloom_project/Style/constant.dart';
import 'package:bloom_project/Trasactions/transaction_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../Components/MyButton.dart';
import '../Components/MyDetailsPage.dart';

class AnnualTransactions extends StatelessWidget {
  @override
  build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return MyDetailsPage(
      appTitle: 'المعاملات',
      buttonWidget:
       Positioned.directional(
        textDirection: TextDirection.ltr,
        bottom: 10,
        end: 0,
        start: 0,
        child: Padding(
          padding: EdgeInsets.only(right: screenSize.width * 0.34, left: screenSize.width * 0.34),
          child: MyButton(onsave: (){
            Get.to(TransactionDetails());
          },width: 155,height: 52,color: buttonColor,fontSize: 26,radius: 20,text: "الاستمرار",textColor: white,),
        ),
      ),
      onsave: () {},
      widget: Column(
        textDirection: TextDirection.rtl,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Row(
            textDirection: TextDirection.rtl,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'المعاملات السنوية',
                style: TextStyle(fontSize: 34, fontFamily: 'font1'),
              ),
              SizedBox(
                width: 8,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
