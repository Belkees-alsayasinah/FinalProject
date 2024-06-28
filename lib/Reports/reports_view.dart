import 'package:bloom_project/DetailsPage/details_page_view.dart';
import 'package:bloom_project/Reports/report_coontroller.dart';
import 'package:bloom_project/Reports/report_details.dart';
import 'package:bloom_project/SearchPage/search_page_view.dart';
import 'package:bloom_project/SectorPage/sector_controller.dart';
import 'package:bloom_project/Style/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class ReportsView extends StatelessWidget {
  final String id;
  final String title;

  ReportsView({
    Key? key,
    required this.title,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("id: $id");
    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
          leading: Text(''),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(Icons.arrow_forward_ios, color: textColor, size: 30))
          ],
          title: Text(title,
              style: TextStyle(
                  color: textColor, fontFamily: 'font1', fontSize: 34))),
      body: Padding(
        padding: const EdgeInsets.only(right: 10, top: 30, left: 10),
        child: GetBuilder<ReportsController>(
          init: ReportsController(id),
          builder: (controller) {
            return controller.isLoad.value
                ? Center(
                    child: SpinKitFadingCircle(
                      color: textColor,
                      size: 50.0,
                    ),
                  )
                : controller.models.length == 0
                    ? Center(
                        child: Text(
                          'لا يوجد تقارير بعد!',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: 'font1',
                              fontSize: screenSize.shortestSide * 0.07,
                              color: textColor),
                          textDirection: TextDirection.rtl,
                        ),
                      )
                    : ListView.separated(
                        physics: BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return FutureBuilder(
                              future: null,
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return Center(
                                    child: CircularProgressIndicator(),
                                  );
                                } else if (snapshot.hasError) {
                                  return Text('Error ${snapshot.error}');
                                } else {
                                  return InkWell(
                                    onTap: () {
                                      Get.to(ReportDetails(
                                          totalSales: controller
                                              .models[index].totalSales,
                                          overallNetProfit: controller
                                              .models[index].overallNetProfit,
                                          unAchievedGoalsSummary: controller
                                              .models[index]
                                              .unachievedGoalsSummary,
                                          achievedGoalsSummary: controller
                                              .models[index]
                                              .achievedGoalsSummary,
                                          netProfitInvestor: controller
                                              .models[index].netProfitInvestor,
                                          netProfit: controller
                                              .models[index].netProfit,
                                          totalCosts: controller
                                              .models[index].totalCosts,
                                          investorAmount: controller
                                              .models[index].investorAmount,
                                          mainRecommendations: controller
                                              .models[index]
                                              .mainRecommendations,
                                          maintenanceAmount: controller
                                              .models[index].maintenanceAmount,
                                          materialPrice: controller
                                              .models[index].materialPrice,
                                          netProfitEmployer: controller
                                              .models[index].netProfitEmployer,
                                          receivedMaterials: controller
                                              .models[index].receivedMaterials,
                                          totalRevenue: controller
                                              .models[index].totalRevenue,
                                          wagesAndTransactionsAmount: controller
                                              .models[index]
                                              .wagesAndTransactionsAmount));
                                    },
                                    child: Stack(
                                      children: [
                                        Container(
                                          width: screenSize.width * 1,
                                          height: screenSize.height * 0.2,
                                          decoration: BoxDecoration(
                                            color: buttonColor,
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(15),
                                            ),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.black
                                                    .withOpacity(0.5),
                                                spreadRadius: 0,
                                                offset: Offset(3, 3),
                                                blurRadius: 4,
                                              ),
                                            ],
                                          ),
                                        ),
                                        Positioned.directional(
                                          textDirection: TextDirection.rtl,
                                          start: 20,
                                          bottom: 0,
                                          end: 0,
                                          top: 0,
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color:
                                                  Colors.white.withOpacity(0.4),
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(15),
                                                bottomLeft: Radius.circular(15),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          //bottom: 0,
                                          right: 25,
                                          child: Padding(
                                              padding: EdgeInsets.all(10.0),
                                              child: Column(
                                                textDirection:
                                                    TextDirection.rtl,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "ملخص الأهداف التي تم تحقيقها: ${controller.models[index].achievedGoalsSummary}",
                                                    style: TextStyle(
                                                        fontSize:
                                                            screenSize.width *
                                                                0.05,
                                                        fontFamily: 'font1',
                                                        color: black),
                                                    textDirection:
                                                        TextDirection.rtl,
                                                  ),
                                                  SizedBox(
                                                    height: 7,
                                                  ),
                                                  Text(
                                                    "ملخص الأهداف التي لم تتحقق: ${controller.models[index].unachievedGoalsSummary}",
                                                    style: TextStyle(
                                                        fontSize:
                                                            screenSize.width *
                                                                0.05,
                                                        fontFamily: 'font1',
                                                        color: black),
                                                    textDirection:
                                                        TextDirection.rtl,
                                                  ),
                                                  SizedBox(
                                                    height: 20,
                                                  ),
                                                  Text(
                                                    "صافي الربح: ${controller.models[index].overallNetProfit.toString()}",
                                                    style: TextStyle(
                                                        fontSize:
                                                            screenSize.width *
                                                                0.05,
                                                        fontFamily: 'font1',
                                                        color:
                                                            Colors.grey[700]),
                                                    textDirection:
                                                        TextDirection.rtl,
                                                  ),
                                                ],
                                              )),
                                        ),
                                      ],
                                    ),
                                  );
                                }
                              });
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            height: 20,
                          );
                        },
                        itemCount: controller.models.length);
          },
        ),
      ),
    );
  }
}
