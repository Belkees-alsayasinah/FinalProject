import 'package:bloom_project/DetailsPage/details_page_view.dart';
import 'package:bloom_project/SearchPage/search_page_view.dart';
import 'package:bloom_project/SectorPage/sector_controller.dart';
import 'package:bloom_project/Style/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SectorPageView extends StatelessWidget {
  SectorController controller = Get.put(SectorController());

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
          title: Text('الأعمال الإبداعية',
              style: TextStyle(
                  color: textColor, fontFamily: 'font1', fontSize: 34))),
      endDrawer: Container(
        width: 200,
        child: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(),
                child: Center(
                  child: Text(
                    'الإعدادات',
                    style: TextStyle(
                        fontSize: 35, color: textColor, fontFamily: 'font1'),
                  ),
                ),
              ),
              ListTile(
                title: Row(
                  textDirection: TextDirection.rtl,
                  children: [
                    Icon(
                      Icons.brightness_4_outlined,
                      color: black,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'الوضع الليلي',
                      style: TextStyle(
                          color: black, fontSize: 27, fontFamily: 'font1'),
                    ),
                  ],
                ),
                onTap: () {
                  // اتخذ إجراء عند النقر على عنصر القائمة 1
                },
              ),
              ListTile(
                title: Row(
                  textDirection: TextDirection.rtl,
                  children: [
                    Icon(
                      Icons.language,
                      color: black,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'تغيير اللغة',
                      style: TextStyle(
                          color: black, fontSize: 27, fontFamily: 'font1'),
                    ),
                  ],
                ),
                onTap: () {
                  // اتخذ إجراء عند النقر على عنصر القائمة 2
                },
              ),
              ListTile(
                title: Row(
                  textDirection: TextDirection.rtl,
                  children: [
                    Icon(
                      Icons.logout,
                      color: black,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'تسجيل الخروج',
                      style: TextStyle(
                          color: black, fontSize: 27, fontFamily: 'font1'),
                    ),
                  ],
                ),
                onTap: () {
                  // اتخذ إجراء عند النقر على عنصر القائمة 2
                },
              ),
              // يمكنك إضافة المزيد من عناصر القائمة هنا
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(right: 10, top: 30, left: 10),
        child: Obx(() {
          return controller.isLoad.value
              ? Center(
            child: CircularProgressIndicator(
              color: textColor,
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
                          onTap: (){
                            Get.to(DetailsPageView());
                          },
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
                                end: 0,
                                top: 0,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.4),
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
                                      textDirection: TextDirection.rtl,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'مصوّر فوتوغرافي',
                                          style: TextStyle(
                                              fontSize: 25,
                                              fontFamily: 'font1',
                                              color: black),
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
                                              'دمشق-الجسر الأبيض',
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
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          textDirection: TextDirection.rtl,
                                          children: [
                                            Icon(
                                              Icons.attach_money_rounded,
                                              color: Colors.grey[700],
                                            ),
                                            Text(
                                              'بمبلغ قدره 3000',
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontFamily: 'font1',
                                                  color: Colors.grey[700]),
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
              itemCount: 5);
        })
      ),
    );
  }
}
