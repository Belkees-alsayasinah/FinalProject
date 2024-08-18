import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../Style/constant.dart';
import '../service/info.dart';

class MyDetailsPage extends StatelessWidget {
  final Function()? onsave;

  final Widget widget;
  final Widget buttonWidget;
  final String appTitle;

  MyDetailsPage(
      {Key? key,
      required this.onsave,
      required this.widget,
      required this.buttonWidget,
      required this.appTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: 400,
        height: screenSize.height * 0.98,
        child: Stack(children: [
          Container(
            width: double.infinity,
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
                    child: widget,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: Padding(
                padding: EdgeInsets.only(top: 20, left: 6, bottom: 6, right: 6),
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
            right: screenSize.width * 0.3,
            left: screenSize.width * 0.36,
            child: Padding(
                padding: EdgeInsets.all(6.0),
                child: Text(
                  textDirection: TextDirection.rtl,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  appTitle,
                  style: TextStyle(fontFamily: 'font1', fontSize: 34),
                )),
          ),
          buttonWidget,
        ]),
      ),
    );
  }
}
