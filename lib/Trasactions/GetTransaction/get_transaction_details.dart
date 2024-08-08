import 'package:bloom_project/Style/constant.dart';
import 'package:bloom_project/Trasactions/transactionController.dart';
import 'package:bloom_project/Trasactions/upload_photo_for_transaction.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../Components/MyDetailsPage.dart';
class GetTransactionDetails extends StatelessWidget {

  final String name;


  const GetTransactionDetails({
    Key? key,

    required this.name,

  }) : super(key: key);

  @override
  build(BuildContext context) {

    final Size screenSize = MediaQuery
        .of(context)
        .size;
    return MyDetailsPage(
      appTitle: 'تفاصيل المعاملة',
      onsave: () {},
      widget: SingleChildScrollView(
        child: Column(
          textDirection: TextDirection.rtl,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              textDirection: TextDirection.rtl,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  textDirection: TextDirection.rtl,
                  'تفاصيل المعاملة:',
                  style: TextStyle(fontSize: 30, fontFamily: 'font1'),
                ),
                SizedBox(
                  width: 8,
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              name,
              style: TextStyle(fontSize: 18, color: black),
              textAlign: TextAlign.right,
            ),
            SizedBox(
              height: 20,
            ),


          ],
        ),
      ),
      buttonWidget: Positioned.directional(
        textDirection: TextDirection.ltr,
        bottom: 10,
        end: 0,
        start: 0,
        child: Padding(
          padding: EdgeInsets.only(
              right: screenSize.width * 0.34, left: screenSize.width * 0.34),
          child: SizedBox(),
        ),
      ),
    );
  }
}

