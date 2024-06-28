import 'package:bloom_project/AddReport/add_report_view.dart';
import 'package:bloom_project/Complaints/complaints_view.dart';
import 'package:bloom_project/Reports/reports_view.dart';
import 'package:bloom_project/Trasactions/GetTransaction/get_transaction_view.dart';
import 'package:bloom_project/service/info.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../AddComplaint/complaint_view.dart';
import '../Style/constant.dart';
import '../Trasactions/annual_transactions.dart';

class MyListProject extends StatelessWidget {
  const MyListProject({
    required this.title,
    required this.address,
    required this.function,
    required this.onTap,
    required this.id,
    required this.investedProject,
    required this.cost,
    this.locationIcon,
    this.moneyIcon,
    this.userID,
  });

  final Function() function;
  final String investedProject;
  final String id;
  final String title;
  final String address;
  final String cost;
  final IconData? locationIcon;
  final IconData? moneyIcon;
  final String? userID;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    print("ddd: $investedProject");
    const style = TextStyle(
        color: black,
        fontWeight: FontWeight.bold,
        fontSize: 18,
        fontFamily: 'font1');
    final Size screenSize = MediaQuery.of(context).size;
    return InkWell(
      onTap: onTap,
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
                  color: Colors.black.withOpacity(0.5),
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
                color: Colors.white.withOpacity(0.4),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  bottomLeft: Radius.circular(15),
                ),
              ),
            ),
          ),
          Positioned(
            right: 25,
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Column(
                textDirection: TextDirection.rtl,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    textDirection: TextDirection.rtl,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                            fontSize: screenSize.width * 0.06,
                            fontFamily: 'font1',
                            color: black),
                      ),
                      SizedBox(
                        width: screenSize.width * 0.3,
                      ),
                      investedProject == '1'
                          ? UserInformation.type == 'inv'
                              ? PopupMenuButton(
                                  itemBuilder: (BuildContext context) {
                                    return <PopupMenuEntry>[
                                      PopupMenuItem(
                                        child: Text(
                                          'إضافة شكوى',
                                          style: style,
                                        ),
                                        value: 'option1',
                                      ),
                                      PopupMenuItem(
                                        child: Text(
                                          'عرض تقارير المشروع',
                                          style: style,
                                        ),
                                        value: 'option2',
                                      ),
                                      PopupMenuItem(
                                        child: Text(
                                          'عرض شكاوي المشروع',
                                          style: style,
                                        ),
                                        value: 'option3',
                                      ),
                                    ];
                                  },
                                  onSelected: (value) {
                                    if (value == 'option1') {
                                      print('gg');
                                      Get.to(ComplaintView(
                                        id: id,
                                      ));
                                    } else if (value == 'option2') {
                                      Get.to(ReportsView(
                                          title: 'تقارير المشروع', id: id));
                                      // Navigate to another page for option 3
                                    } else if (value == 'option3') {
                                      Get.to(ComplaintsView(
                                          title: 'شكاوي المشروع', id: id));
                                      // Navigate to another page for option 3
                                    }
                                  },
                                )
                              : PopupMenuButton(
                                  itemBuilder: (BuildContext context) {
                                    return <PopupMenuEntry>[
                                      PopupMenuItem(
                                        child: Text(
                                          'المعاملات',
                                          style: style,
                                        ),
                                        value: 'option1',
                                      ),
                                      PopupMenuItem(
                                        child: Text(
                                          'إضافة تقرير',
                                          style: style,
                                        ),
                                        value: 'option2',
                                      ),
                                      PopupMenuItem(
                                        child: Text(
                                          'عرض تقارير المشروع',
                                          style: style,
                                        ),
                                        value: 'option3',
                                      ),
                                      PopupMenuItem(
                                        child: Text(
                                          'عرض معاملات المشروع',
                                          style: style,
                                        ),
                                        value: 'option4',
                                      ),
                                    ];
                                  },
                                  onSelected: (value) {
                                    if (value == 'option1') {
                                      Get.to(AnnualTransactions(id: id));
                                    } else if (value == 'option2') {
                                      Get.to(AddReportView(id: id));
                                    } else if (value == 'option3') {
                                      Get.to(ReportsView(
                                          title: 'تقارير المشروع', id: id));
                                    } else if (value == 'option4') {
                                      Get.to(TransactionsView(
                                          title: 'معاملات المشروع', id: id));
                                    }
                                  },
                                )
                          : PopupMenuButton(
                              itemBuilder: (BuildContext context) {
                                return <PopupMenuEntry>[
                                  PopupMenuItem(
                                    child: Text(
                                      'حذف المشروع',
                                      style: style,
                                    ),
                                    value: 'option1',
                                  ),
                                ];
                              },
                              onSelected: (value) {
                                if (value == 'option1') {
                                  print('gg');
                                }
                              },
                            ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    textDirection: TextDirection.rtl,
                    children: [
                      Icon(
                        locationIcon,
                        color: black,
                      ),
                      SizedBox(width: 10,),
                      Text(
                        address,
                        style: TextStyle(
                            fontSize: screenSize.width * 0.04,
                            fontFamily: 'font1',
                            color: black),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    textDirection: TextDirection.rtl,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        textDirection: TextDirection.rtl,
                        children: [
                          Icon(
                            moneyIcon,
                            color: Colors.grey[700],
                          ),
                          SizedBox(width: 10,),
                          Text(
                            cost,
                            style: TextStyle(
                                fontSize: 25,
                                fontFamily: 'font1',
                                color: Colors.grey[700]),
                          ),
                          SizedBox(
                            width: screenSize.width * 0.20,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
