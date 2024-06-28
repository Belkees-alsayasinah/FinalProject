import 'package:bloom_project/ChartPage/chart_page_controller.dart';
import 'package:bloom_project/Style/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'bar_graph.dart';

class ChartPageView extends StatefulWidget {
  @override
  State<ChartPageView> createState() => _ChartPageViewState();
}

class _ChartPageViewState extends State<ChartPageView> {
  ChartController controller = Get.put(ChartController());

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          textDirection: TextDirection.rtl,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Text(
                'الإحصاءات', // Replace with your desired text
                style: titleStyle,
              ),
            ),
            SizedBox(height: 50),
            Text(
              'احصاءات الأربعة أشهر الأخيرة',
              style: TextStyle(
                  fontSize: screenSize.width * 0.05,
                  fontFamily: 'font1',
                  color: textColor,
                  fontWeight: FontWeight.bold),
              textDirection: TextDirection.rtl,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'صافي الربح الكلي',
              style: TextStyle(
                fontSize: screenSize.width * 0.05,
                fontFamily: 'font1',
                color: textColor,
              ),
              textDirection: TextDirection.rtl,
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 200,
              child: Obx(() {
                if (controller.isLoad.value) {
                  return Center(child: CircularProgressIndicator());
                } else if (controller.message.isNotEmpty) {
                  return Center(child: Text(controller.message));
                } else {
                  return MyBarGraph(
                    weeklySummary: controller.totalNetProfits.toList(),
                    months: controller.months.toList(), // تمرير أسماء الأشهر
                  );
                }
              }),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'أرباح أصحاب الأعمال',
              style: TextStyle(
                fontSize: screenSize.width * 0.05,
                fontFamily: 'font1',
                color: textColor,
              ),
              textDirection: TextDirection.rtl,
            ),
            SizedBox(
              height: 15,
            ),
            SizedBox(
              height: 200,
              child: Obx(() {
                if (controller.isLoad.value) {
                  return Center(child: CircularProgressIndicator());
                } else if (controller.message.isNotEmpty) {
                  return Center(child: Text(controller.message));
                } else {
                  return MyBarGraph(
                    weeklySummary: controller.totalNetProfitEmployer.toList(),
                    months: controller.months.toList(), // تمرير أسماء الأشهر
                  );
                }
              }),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              'أرباح المستثمرين',
              style: TextStyle(
                fontSize: screenSize.width * 0.05,
                fontFamily: 'font1',
                color: textColor,
              ),
              textDirection: TextDirection.rtl,
            ),
            SizedBox(
              height: 15,
            ),
            SizedBox(
              height: 200,
              child: Obx(() {
                if (controller.isLoad.value) {
                  return Center(child: CircularProgressIndicator());
                } else if (controller.message.isNotEmpty) {
                  return Center(child: Text(controller.message));
                } else {
                  return MyBarGraph(
                    weeklySummary: controller.totalNetProfitInvestor.toList(),
                    months: controller.months.toList(), // تمرير أسماء الأشهر
                  );
                }
              }),
            ),

            SizedBox(
              height: 15,
            ),

            Text(
              'إجمالي الإيرادات',
              style: TextStyle(
                fontSize: screenSize.width * 0.05,
                fontFamily: 'font1',
                color: textColor,
              ),
              textDirection: TextDirection.rtl,
            ),
            SizedBox(
              height: 15,
            ),
            SizedBox(
              height: 200,
              child: Obx(() {
                if (controller.isLoad.value) {
                  return Center(child: CircularProgressIndicator());
                } else if (controller.message.isNotEmpty) {
                  return Center(child: Text(controller.message));
                } else {
                  return MyBarGraph(
                    weeklySummary: controller.totalRevenue.toList(),
                    months: controller.months.toList(), // تمرير أسماء الأشهر
                  );
                }
              }),
            ),
          ],
        ),
      ),
    );
  }
}
