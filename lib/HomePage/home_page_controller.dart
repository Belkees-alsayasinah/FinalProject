
import 'package:bloom_project/HomePage/basic_page.dart';
import 'package:bloom_project/HomePage/home_page_View.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../ChartPage/chart_page_view.dart';

class HomeController extends GetxController {

  int currentIndex = 2;

  List<Widget> screens = [
    Icon(Icons.person),
    ChartPageView(),
    HomePageView(),
    Icon(Icons.notifications),
    Icon(Icons.article),
  ];

  List<BottomNavigationBarItem> bottomItem = [
    BottomNavigationBarItem(label: "Profile",icon: Icon(Icons.person)),
    BottomNavigationBarItem(label: "Chart",icon: Icon(Icons.insert_chart)),
    BottomNavigationBarItem(label: "Home",icon: Icon(Icons.home)),
    BottomNavigationBarItem(label: "Notification",icon: Icon(Icons.notifications)),
    BottomNavigationBarItem(label: "Article",icon: Icon(Icons.article)),
  ];

  void changeBottomNavBar(int index) {
    currentIndex = index;
    update();
    // emit(ShopChangeBottomNavState());
  }
}
