import 'dart:math';

import 'package:bloom_project/DetailsPage/details_page_view.dart';
import 'package:bloom_project/HomePage/home_page_controller.dart';
import 'package:bloom_project/SearchPage/search_page_view.dart';
import 'package:bloom_project/SectorPage/sector_page_view.dart';
import 'package:bloom_project/Style/constant.dart';
import 'package:bloom_project/settings_drawer/settings_drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

import '../service/info.dart';

class HomePageView extends StatelessWidget {
  HomePageController controller = Get.put(HomePageController());
  String title = 'الأعمال الإبداعية';
  final List<String> imagePaths = [
    'assets/images/s1.jpg',
    'assets/images/s2.jpg',
    'assets/images/s3.jpg',
    'assets/images/s4.jpg',
  ];
  Widget _buildRandomImage() {
    final Random random = Random();
    final int index = random.nextInt(imagePaths.length);
    final String imagePath = imagePaths[index];

    return Image.asset(
      imagePath,
      fit: BoxFit.cover,
    );
  }

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
                Get.to(SearchPageView());
              },
              icon: Icon(
                Icons.search,
                color: textColor,
                size: 30,
              ))
        ],
        title: Text(
          'الصفحة الرئيسية',
          style: titleStyle,
        ),
      ),
      endDrawer: SettingsDrawer(),
      body: Padding(
        padding: const EdgeInsets.only(right: 8, top: 30),
        child: Column(
          textDirection: TextDirection.rtl,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (UserInformation.type == "inv") ...[
              Text('اقتراحات قد تناسبك:  ',
                  textDirection: TextDirection.rtl,
                  style: TextStyle(fontSize: 20, fontFamily: 'font1')),
              Expanded(
                child: ListView.separated(
                  reverse: true,
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                        width: 156,
                        decoration: BoxDecoration(
                          color: buttonColorOpa,
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
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            textDirection: TextDirection.rtl,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'مصمم جرافيكي',
                                style: TextStyle(
                                    fontSize: 20, fontFamily: 'font1'),
                              ),
                              Text(
                                'حمص الدبلان',
                                style: TextStyle(
                                    fontSize: 20, fontFamily: 'font1'),
                              ),
                              Text(
                                'بمبلغ: 20000',
                                style: TextStyle(
                                    fontSize: 20, fontFamily: 'font1'),
                              ),
                              TextButton(
                                onPressed: () {
                                  // Get.to(DetailsPageView());
                                },
                                child: Text(
                                  'عرض المزيد...',
                                  textDirection: TextDirection.rtl,
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontFamily: 'font1',
                                      color: textColor),
                                ),
                              )
                            ],
                          ),
                        ));
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(width: 10);
                  },
                  itemCount: 10,
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
            Expanded(
                flex: 2,
                child: Obx(() {
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
                                            Get.to(
                                              SectorPageView(
                                                id: '${controller.models[index].id}',
                                                title: title,
                                              ),
                                            );
                                          },
                                          child: Stack(
                                            children: [
                                              Container(
                                                width: 386,
                                                height: 167,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topRight:
                                                        Radius.circular(15),
                                                    bottomRight:
                                                        Radius.circular(15),
                                                  ),
                                                ),
                                                child: _buildRandomImage(),
                                              ),
                                              Positioned.fill(
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    color: Colors.black
                                                        .withOpacity(0.4),
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      topRight:
                                                          Radius.circular(15),
                                                      bottomRight:
                                                          Radius.circular(15),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Positioned(
                                                bottom: 0,
                                                right: 0,
                                                child: Padding(
                                                  padding: EdgeInsets.all(10.0),
                                                  child: Text(
                                                    controller
                                                        .models[index].name
                                                        .toString(),
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 25,
                                                      fontWeight:
                                                          FontWeight.w800,
                                                      fontFamily: 'font1',
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      }
                                    });
                              },
                              separatorBuilder: (context, index) {
                                return SizedBox(height: 20);
                              },
                              itemCount: controller.models.length,
                            );
                })),
          ],
        ),
      ),
    );
  }
}
