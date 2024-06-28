import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import '../Style/constant.dart';
import 'bar data.dart';

class MyBarGraph extends StatelessWidget {
  final List<double> weeklySummary;
  final List<String> months;

  const MyBarGraph(
      {super.key, required this.weeklySummary, required this.months});

  @override
  Widget build(BuildContext context) {
    List<double> completeWeeklySummary = List.filled(4, 0.0);
    List<String> completeMonths = List.filled(4, "");

    for (int i = 0; i < weeklySummary.length && i < 4; i++) {
      completeWeeklySummary[i] = weeklySummary[i];
    }

    for (int i = 0; i < months.length && i < 4; i++) {
      completeMonths[i] = months[i];
    }

    BarData myBarData = BarData(
        sunAmount: completeWeeklySummary[0],
        monAmount: completeWeeklySummary[1],
        tueAmount: completeWeeklySummary[2],
        wedAmount: completeWeeklySummary[3],
       );
    myBarData.initializeBarData();
    return BarChart(BarChartData(
      maxY: 100000000,
      minY: 0,
      //gridData: FlGridData(show: false),
      borderData: FlBorderData(show: false),
      titlesData: FlTitlesData(
          show: true,
          topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          bottomTitles: AxisTitles(
              sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: (double value, TitleMeta meta) {
              return getBottomTitles(value, meta, completeMonths);
            },
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
                    toY: 100000000,
                    color: Colors.grey[300],
                  ),
                ),
              ],
            ),
          )
          .toList(),
    ));
  }
}

Widget getBottomTitles(double value, TitleMeta meta, List<String> months) {
  const style =
      TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 10);
  Widget text;

  int index = value.toInt() - 1;
  if (index >= 0 && index < months.length) {
    text = Text(months[index], style: style);
  } else {
    text = const Text(" ", style: style);
  }

  return SideTitleWidget(child: text, axisSide: meta.axisSide);
}
