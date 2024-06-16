import 'package:bloom_project/DetailsPage/details_page_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Components/MyDetailsPage.dart';
import '../Components/MylabelText.dart';

class ReportDetails extends StatelessWidget {
  final String achievedGoalsSummary;
  final String unAchievedGoalsSummary;
  final String investorAmount;
  final String totalRevenue;
  final String totalCosts;
  final String netProfit;
  final String netProfitEmployer;
  final String netProfitInvestor;
  final String receivedMaterials;
  final String materialPrice;
  final String totalSales;
  final String overallNetProfit;
  final String maintenanceAmount;
  final String wagesAndTransactionsAmount;
  final String mainRecommendations;

  DetailsPageController controller = Get.put(DetailsPageController());

  ReportDetails(
      {Key? key,
      required this.totalSales,
      required this.overallNetProfit,
      required this.unAchievedGoalsSummary,
      required this.achievedGoalsSummary,
      required this.netProfitInvestor,
      required this.netProfit,
      required this.totalCosts,
      required this.investorAmount,
      required this.mainRecommendations,
      required this.maintenanceAmount,
      required this.materialPrice,
      required this.netProfitEmployer,
      required this.receivedMaterials,
      required this.totalRevenue,
      required this.wagesAndTransactionsAmount})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return MyDetailsPage(
      appTitle: 'تفاصيل التقرير',
      buttonWidget: SizedBox(),
      onsave: () {},
      widget: SingleChildScrollView(
        child: Center(
          child: Column(
            textDirection: TextDirection.rtl,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyLabelText(text: 'الأهداف التي تم تحقيقها:'),
              Text(
                achievedGoalsSummary,
                style: TextStyle(fontSize: 34, fontFamily: 'font1'),
              ),
              SizedBox(
                height: 15,
              ),
              MyLabelText(text: 'الأهداف التي لم يتم تحقيقها:'),
              Text(unAchievedGoalsSummary,
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'font2',
                  )),
              SizedBox(
                height: 15,
              ),
              MyLabelText(text: 'المبلغ المستثمر:'),
              Text(investorAmount,
                  textDirection: TextDirection.rtl,
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'font2',
                  )),
              SizedBox(
                height: 15,
              ),
              MyLabelText(text: 'التكاليف الإجمالية:'),
              Text(totalCosts,
                  textDirection: TextDirection.rtl,
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'font2',
                  )),
              SizedBox(
                height: 15,
              ),
              MyLabelText(text: 'الإيرادات الإجمالية:'),
              Text(totalRevenue,
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'font2',
                  )),
              SizedBox(
                height: 15,
              ),
              MyLabelText(text: 'الأرباح الصافية:'),
              Text(netProfit,
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'font2',
                  )),
              SizedBox(
                height: 15,
              ),
              MyLabelText(text: 'صافي الربح للمستثمر:'),
              Text(netProfitInvestor,
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'font2',
                  )),
              SizedBox(
                height: 15,
              ),
              MyLabelText(text: 'صافي الربح لصاحب العمل:'),
              Text(netProfitEmployer,
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'font2',
                  )),
              SizedBox(
                height: 15,
              ),
              MyLabelText(text: 'المواد المستلمة:'),
              Text(receivedMaterials,
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'font2',
                  )),
              SizedBox(
                height: 15,
              ),
              MyLabelText(text: 'سعر المواد:'),
              Text(materialPrice,
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'font2',
                  )),
              SizedBox(
                height: 15,
              ),
              MyLabelText(text: 'إجمالي المبيعات:'),
              Text(totalSales,
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'font2',
                  )),
              SizedBox(
                height: 15,
              ),
              MyLabelText(text: 'صافي الربح الكلي:'),
              Text(overallNetProfit,
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'font2',
                  )),
              SizedBox(
                height: 15,
              ),
              MyLabelText(text: 'مبلغ الصيانة:'),
              Text(maintenanceAmount,
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'font2',
                  )),
              SizedBox(
                height: 15,
              ),
              MyLabelText(text: 'مبلغ الأجور والمعاملات:'),
              Text(wagesAndTransactionsAmount,
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'font2',
                  )),
              SizedBox(
                height: 15,
              ),
              MyLabelText(text: 'التوصيات الرئيسية:'),
              Text(mainRecommendations,
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'font2',
                  )),
              SizedBox(
                height: 15,
              ),
              MyLabelText(text: 'الخطط المستقبلية لتحسين العمل:'),
              Text("gg",
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'font2',
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
