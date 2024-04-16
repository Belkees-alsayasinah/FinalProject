import 'package:bloom_project/SearchPage/search_page_view.dart';
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
                      fontSize: 35,
                      color: textColor,
                      fontFamily: 'font1'
                    ),
                  ),
                ),
              ),
              ListTile(
                title: Row(
                  textDirection: TextDirection.rtl,
                  children: [
                    Icon(Icons.brightness_4_outlined,color: black,),
                    SizedBox(width: 10,),
                    Text('الوضع الليلي',style: TextStyle(
                      color: black,
                      fontSize: 27,
                      fontFamily: 'font1'
                    ),),
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
                    Icon(Icons.language,color: black,),
                    SizedBox(width: 10,),
                    Text('تغيير اللغة',style: TextStyle(
                        color: black,
                        fontSize: 27,
                        fontFamily: 'font1'
                    ),),
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
                    Icon(Icons.logout,color: black,),
                    SizedBox(width: 10,),
                    Text('تسجيل الخروج',style: TextStyle(
                        color: black,
                        fontSize: 27,
                        fontFamily: 'font1'
                    ),),
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
        child: ListView.separated(
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return Stack(
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
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned.fill(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.5),
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
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.w800,
                            fontFamily: 'font1'),
                      ),
                    ),
                  ),
                ],
              );
            },
            separatorBuilder: (context, index) {
              return Divider();
            },
            itemCount: 3),
      ),
    );
  }

  Widget buildDrawer() => Container(
        width: 200,
        child: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Text(
                  'عنوان القائمة الجانبية',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
              ListTile(
                title: Text('عنصر القائمة 1'),
                onTap: () {
                  // اتخذ إجراء عند النقر على عنصر القائمة 1
                },
              ),
              ListTile(
                title: Text('عنصر القائمة 2'),
                onTap: () {
                  // اتخذ إجراء عند النقر على عنصر القائمة 2
                },
              ),
              // يمكنك إضافة المزيد من عناصر القائمة هنا
            ],
          ),
        ),
      );
}
