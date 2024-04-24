import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../Style/constant.dart';
import 'bar data.dart';

class MyBarGraph extends StatelessWidget {
  final List weeklySummary;

  const MyBarGraph({super.key, required this.weeklySummary});

  @override
  Widget build(BuildContext context) {
    BarData myBarData = BarData(
        sunAmount: weeklySummary[0],
        monAmount: weeklySummary[1],
        tueAmount: weeklySummary[2],
        wedAmount: weeklySummary[3],
        thurAmount: weeklySummary[4],
        friAmount: weeklySummary[5],
        satAmount: weeklySummary[6]);
    myBarData.initializeBarData();
    return Scaffold(
      body: BarChart(BarChartData(
        maxY: 100,
        minY: 0,
        gridData: FlGridData(show: false),
        borderData: FlBorderData(show: false),
        titlesData: FlTitlesData(
            show: true,
            topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            bottomTitles: AxisTitles(
                sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: getBottomTitles,
            ))),
        barGroups: myBarData.barData
            .map(
              (data) => BarChartGroupData(
                x: data.x,
                barRods: [
                  BarChartRodData(
                    toY: data.y,
                    color: buttonColor,
                    width: 25,
                    borderRadius: BorderRadius.circular(3),
                    backDrawRodData: BackgroundBarChartRodData(
                      show: true,
                      toY: 100,
                      color: Colors.grey[300],
                    ),
                  ),
                ],
              ),
            )
            .toList(),
      )),
    );
  }
}

Widget getBottomTitles(double value, TitleMeta meta) {
  const style =
      TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 10);
  Widget text;
  switch (value.toInt()) {
    case 1:
      text = const Text(
        "Sun",
        style: style,
      );
      break;
    case 2:
      text = const Text(
        "Mon",
        style: style,
      );
      break;
    case 3:
      text = const Text(
        "Tue",
        style: style,
      );
      break;
    case 4:
      text = const Text(
        "Wed",
        style: style,
      );
      break;
    case 5:
      text = const Text(
        "Thur",
        style: style,
      );
      break;
    case 6:
      text = const Text(
        "Fri",
        style: style,
      );
      break;
    case 7:
      text = const Text(
        "Sat",
        style: style,
      );
      break;
    default:
      text = const Text(
        " ",
        style: style,
      );
      break;
  }
  return SideTitleWidget(child: text, axisSide: meta.axisSide);
}
