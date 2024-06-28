import 'package:bloom_project/Complaints/complaints_controller.dart';
import 'package:bloom_project/DetailsPage/details_page_view.dart';
import 'package:bloom_project/Reports/report_coontroller.dart';
import 'package:bloom_project/Reports/report_details.dart';
import 'package:bloom_project/SearchPage/search_page_view.dart';
import 'package:bloom_project/SectorPage/sector_controller.dart';
import 'package:bloom_project/Style/constant.dart';
import 'package:bloom_project/Trasactions/GetTransaction/get_transaction_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class TransactionsView extends StatelessWidget {
  final String id;
  final String title;

  TransactionsView({
    Key? key,
    required this.title,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
        child: GetBuilder<GetTransactionController>(
          init: GetTransactionController(id),
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
                'لا يوجد معاملات بعد!',
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
                                            controller.models[index]
                                                .description,
                                            style: TextStyle(
                                                fontSize: 25,
                                                fontFamily: 'font1',
                                                color: black),
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
