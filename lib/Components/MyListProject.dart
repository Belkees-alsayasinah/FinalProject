import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../Style/constant.dart';
import '../Trasactions/annual_transactions.dart';

class MyListProject extends StatelessWidget {
  const MyListProject({
    required this.title,
    required this.address,
    required this.function,
    required this.onTap,
    required this.cost
  });

  final Function() function;
  final String title;
  final String address;
  final String cost;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    const style =
    TextStyle(color: black, fontWeight: FontWeight.bold, fontSize: 26,fontFamily: 'font1');
    final Size screenSize = MediaQuery.of(context).size;
    return InkWell(
      onTap: onTap,
      child: Stack(
        children: [
          Container(
            width: 386,
            height: 167,
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    textDirection: TextDirection.rtl,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                            fontSize: 25,
                            fontFamily: 'font1',
                            color: black),
                      ),
                      SizedBox(width: screenSize.width * 0.4,),
                      PopupMenuButton(
                        itemBuilder: (BuildContext context) {
                          return <PopupMenuEntry>[
                            PopupMenuItem(
                              child: Text('المعاملات',style: style,),
                              value: 'option1',
                            ),
                            PopupMenuItem(
                              child: Text('إضافة تقرير',style: style,),
                              value: 'option2',
                            ),
                            PopupMenuItem(
                              child: Text('Option 3',style: style,),
                              value: 'option3',
                            ),
                          ];
                        },
                        onSelected: (value) {
                          if (value == 'option1') {
                            Get.to(AnnualTransactions());
                          } else if (value == 'option2') {
                            //Get.to(a());
                            // Navigate to another page for option 2
                          } else if (value == 'option3') {
                            // Navigate to another page for option 3
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
                        Icons.location_on_outlined,
                        color: black,
                      ),
                      Text(
                        address,
                        style: TextStyle(
                            fontSize: 25,
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
                            Icons.attach_money_rounded,
                            color: Colors.grey[700],
                          ),
                          Text(
                            cost,
                            style: TextStyle(
                                fontSize: 25,
                                fontFamily: 'font1',
                                color: Colors.grey[700]),
                          ),
                          SizedBox(width: screenSize.width * 0.20,),
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
