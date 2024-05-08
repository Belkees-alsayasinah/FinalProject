import 'package:bloom_project/Style/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailsPageView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: 500,
        height: screenSize.height * 0.95,
        child: Stack(
          children: [
            Container(
              width: 386,
              height: 167,
              decoration: BoxDecoration(
                color: buttonColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    spreadRadius: 0, // انتشار الظل
                    offset: Offset(3, 3), // تحديد الزاوية والاتجاه
                    blurRadius: 4, // وضوح الظل
                  ),
                ],
              ),
            ),
            Positioned.directional(
              textDirection: TextDirection.rtl,
              start: 20,
              bottom: 0,
              end: 20,
              top: 70,
              child: Stack(
                children: [
                  Container(
                    height: 1000,
                    decoration: BoxDecoration(
                      color: buttonColor,
                      //elevation: 10, // قيمة التعريف يمكن تعديلها حسب الحاجة
                      //shadowColor: Colors.black,
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                  ),
                  Container(
                    height: 1000,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.4),
                      //elevation: 10, // قيمة التعريف يمكن تعديلها حسب الحاجة
                      //shadowColor: Colors.black,
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        textDirection: TextDirection.rtl,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            textDirection: TextDirection.rtl,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                'مصوّر فوتوغرافي',
                                style: TextStyle(
                                    fontSize: 34, fontFamily: 'font1'),
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Text(
                                'متاح للاستثمار',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontFamily: 'font1',
                                    color: grey),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text('العنوان: اللاذقية-جبلة',
                              style: TextStyle(
                                fontSize: 25,
                                fontFamily: 'font1',
                              )),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                              'التفاصيل: مصور فوتوغرافي للتصوير الشخصي وتصوير المناسبات (تخرج- خطبة -افتتاح)، تصوير منتجات، بخبرة تزيد عن الخمس سنوات. ',
                              textDirection: TextDirection.rtl,
                              style: TextStyle(
                                fontSize: 25,
                                fontFamily: 'font1',
                              )),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                              'المبلغ المطلوب: 1000 يشمل الكاميرا والعدسات والتجهيزات الأخرة المصاحبة لهها ',
                              textDirection: TextDirection.rtl,
                              style: TextStyle(
                                fontSize: 25,
                                fontFamily: 'font1',
                              )),
                          SizedBox(
                            height: 15,
                          ),
                          Text('العنوان: اللاذقية-جبلة',
                              style: TextStyle(
                                fontSize: 25,
                                fontFamily: 'font1',
                              )),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 0,
              right: 0,
              child: Padding(
                  padding: EdgeInsets.all(6.0),
                  child: Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            Get.back();
                          },
                          icon: Icon(
                            Icons.arrow_forward_ios,
                            color: black,
                            size: 30,
                          )),
                    ],
                  )),
            ),
            Positioned(
               top: 0,
              right: screenSize.width*0.3,
              left: screenSize.width*0.36,
              child: Padding(
                  padding: EdgeInsets.all(6.0),
                  child: Text('التفاصيل',style: TextStyle(fontFamily: 'font1',fontSize: 34),)
              ),
            ),
          ],
        ),
      ),
    );
  }
}
