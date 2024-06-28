import 'package:bloom_project/DetailsPage/details_page_view.dart';
import 'package:bloom_project/SearchPage/search_page_view.dart';
import 'package:bloom_project/SectorPage/sector_controller.dart';
import 'package:bloom_project/Style/constant.dart';
import 'package:bloom_project/settings_drawer/settings_drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class SectorPageView extends StatelessWidget {
  final String id;
  final String title;

  SectorPageView({
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
            Builder(
              builder: (BuildContext context) {
                return IconButton(
                  onPressed: () {
                    Scaffold.of(context).openEndDrawer();
                  },
                  icon: Icon(
                    Icons.settings,
                    color: textColor,
                    size: 30,
                  ),
                );
              },
            ),
            IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(Icons.arrow_forward_ios, color: textColor, size: 30))
          ],
          title: Text(title,
              style: TextStyle(
                  color: textColor, fontFamily: 'font1', fontSize: 34))),
      endDrawer: SettingsDrawer(),
      body: Padding(
        padding: const EdgeInsets.only(right: 10, top: 30, left: 10),
        child: GetBuilder<SectorController>(
          init: SectorController(id),
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
                          'لا يوجد مشاريع بعد!',
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
                                      Get.to(DetailsPageView(
                                        id: controller.models[index].id,
                                        userID: controller.models[index].userId
                                            .toString(),
                                        title: controller.models[index].name,
                                        description: controller
                                            .models[index].description,
                                        address:
                                            controller.models[index].location,
                                        cost: controller.models[index].amount,
                                        investment_status: controller
                                            .models[index].investmentStatus
                                            .toString(),
                                      ));
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
                                                // انتشار الظل
                                                offset: Offset(3, 3),
                                                // تحديد الزاوية والاتجاه
                                                blurRadius: 4, // وضوح الظل
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
                                              //elevation: 10, // قيمة التعريف يمكن تعديلها حسب الحاجة
                                              //shadowColor: Colors.black,
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
                                                    controller
                                                        .models[index].name,
                                                    style: TextStyle(
                                                        fontSize:
                                                            screenSize.width *
                                                                0.06,
                                                        fontFamily: 'font1',
                                                        color: black),
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    textDirection:
                                                        TextDirection.rtl,
                                                    children: [
                                                      Icon(Icons.location_on_outlined),
                                                      SizedBox(width: 10,),
                                                      Text(
                                                        "العنوان: ${controller.models[index].location}",
                                                        style: TextStyle(
                                                            fontSize: screenSize
                                                                    .width *
                                                                0.04,
                                                            fontFamily: 'font1',
                                                            color: black),
                                                        textDirection:
                                                            TextDirection.rtl,
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 20,
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    textDirection:
                                                        TextDirection.rtl,
                                                    children: [
                                                      Icon(Icons.money),
                                                      SizedBox(width: 10,),
                                                      Text(
                                                        "المبلغ المطلوب: ${controller.models[index].amount.toString()}",
                                                        style: TextStyle(
                                                            fontSize: screenSize
                                                                    .width *
                                                                0.04,
                                                            fontFamily: 'font1',
                                                            color: Colors
                                                                .grey[700]),
                                                      )
                                                    ],
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
