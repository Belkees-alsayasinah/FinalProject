import 'package:bloom_project/Style/constant.dart';
import 'package:flutter/material.dart';

import 'bar_graph.dart';

class ChartPageView extends StatefulWidget {
  @override
  State<ChartPageView> createState() => _ChartPageViewState();
}

class _ChartPageViewState extends State<ChartPageView> {
  List<double> weeklySummary = [
    40.40,
    99.56,
    42.88,
    65.98,
    86.98,
    22.09,
    43.89,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
          // Image.asset(
          //   'assets/images/chart.jpeg', // Replace with the path to your image
          //   height: 200,
          //   width: 200,
          //   fit: BoxFit.contain,
          // ),
          // SizedBox(height: 100),
          SizedBox(
            height: 200,
            child: MyBarGraph(
              weeklySummary: weeklySummary,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              textDirection: TextDirection.rtl,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '1- المشاريع التي تم الاستثمار فيها في دمشق',
                  style: TextStyle(fontFamily: 'font1', fontSize: 16),
                  textDirection: TextDirection.rtl,
                ),
                SizedBox(height: 10,),
                Text(
                  '2- المشاريع الأكثر استثمارا من القطاع الإبداعي',
                  style: TextStyle(fontFamily: 'font1', fontSize: 16),
                  textDirection: TextDirection.rtl,
                ),
                SizedBox(height: 10,),
                Text(
                  '4- المشاريع التي حققت أعلى نسبة أرباح في الأعمال الصناعية',
                  style: TextStyle(fontFamily: 'font1', fontSize: 16),
                  textDirection: TextDirection.rtl,
                ),
                SizedBox(height: 10,),
                Text(
                  '4- المشاريع التي حققت أعلى نسبة أرباح ضمن مبلغ الاستثمار 15000000',
                  style: TextStyle(fontFamily: 'font1', fontSize: 16),
                  textDirection: TextDirection.rtl,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
