import 'package:bloom_project/Style/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Components/MyDetailsPage.dart';

class DetailsPageView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return MyDetailsPage(
      appTitle: 'التفاصيل',
      buttonWidget: SizedBox(),
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
                  'مصوّر فوتوغرافي',
                  style: TextStyle(fontSize: 34, fontFamily: 'font1'),
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  'متاح للاستثمار',
                  style:
                      TextStyle(fontSize: 20, fontFamily: 'font1', color: grey),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Text('العنوان: اللاذقية-جبلة',
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'font2',
                )),
            SizedBox(
              height: 15,
            ),
            Text(
                'التفاصيل: مصور فوتوغرافي للتصوير الشخصي وتصوير المناسبات (تخرج- خطبة -افتتاح)، تصوير منتجات، بخبرة تزيد عن الخمس سنوات. ',
                textDirection: TextDirection.rtl,
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'font2',
                )),
            SizedBox(
              height: 15,
            ),
            Text(
                'المبلغ المطلوب: 1000 يشمل الكاميرا والعدسات والتجهيزات الأخرة المصاحبة لهها ',
                textDirection: TextDirection.rtl,
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'font2',
                )),
            SizedBox(
              height: 15,
            ),
            Text('العنوان: اللاذقية-القرداحة',
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'font2',
                )),
          ],
        ));
  }
}
