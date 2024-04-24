import 'package:bloom_project/DetailsPage/details_page_view.dart';
import 'package:bloom_project/SearchPage/search_page_view.dart';
import 'package:bloom_project/SectorPage/sector_page_view.dart';
import 'package:bloom_project/Style/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          style: TextStyle(
            color: textColor,
            fontFamily: 'font1',
            fontSize: 34,
          ),
        ),
      ),
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
        padding: const EdgeInsets.only(right: 30, top: 30),
        child: Column(
          textDirection: TextDirection.rtl,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('اقتراحات قد تناسبك:',textDirection: TextDirection.rtl,style: TextStyle(fontSize: 20,fontFamily: 'font1')),
            Expanded(
              child: ListView.separated(
                reverse: true,
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    width: 156,
                    height:123,
                    decoration: BoxDecoration(
                      color: cardColor,
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
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        textDirection: TextDirection.rtl,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                        Text('مصمم جرافيكي',style: TextStyle(fontSize: 20,fontFamily: 'font1'),),
                        Text('حمص الدبلان',style: TextStyle(fontSize: 20,fontFamily: 'font1'),),
                        Text('بمبلغ: 20000',style: TextStyle(fontSize: 20,fontFamily: 'font1'),),
                          TextButton(onPressed: (){Get.to(DetailsPageView());}, child: Text('عرض المزيد...',textDirection: TextDirection.rtl,style: TextStyle(fontSize: 20,fontFamily: 'font1',color: textColor),),)
                      ],),
                    )
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(width: 10);
                },
                itemCount: 20,
              ),
            ),
            SizedBox(height: 20,),
            Expanded(
              flex: 2, // Adjust the flex value as needed
              child: ListView.separated(
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Get.to(SectorPageView());
                    },
                    child: Stack(
                      children: [
                        Container(
                          width: 386,
                          height: 167,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(15),
                              bottomRight: Radius.circular(15),
                            ),
                          ),
                          child: Image.asset(
                            'assets/images/1.png',
                            fit: BoxFit.contain,
                          ),
                        ),
                        Positioned.fill(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.4),
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(15),
                                bottomRight: Radius.circular(15),
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
                              'القطاع الفلاني',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 25,
                                fontWeight: FontWeight.w800,
                                fontFamily: 'font1',
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(height: 20);
                },
                itemCount: 3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
