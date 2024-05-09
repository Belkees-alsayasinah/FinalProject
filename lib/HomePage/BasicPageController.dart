import 'package:bloom_project/Articles/articles_page.dart';
import 'package:bloom_project/HomePage/home_page_View.dart';
import 'package:bloom_project/ProfilePage/profile_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../ChartPage/chart_page_view.dart';

class BasicPageController extends GetxController {

  var currentIndex = 2.obs;
 // var currentIndex = 0.obs;


  List<Widget> screens = [
    ProfilePage(),
    ChartPageView(),
    HomePageView(),
    Icon(Icons.notifications),
    ArticlesView(),
  ];

  List<BottomNavigationBarItem> bottomItem = [
    BottomNavigationBarItem(label: "Profile", icon: Icon(Icons.person)),
    BottomNavigationBarItem(label: "Chart", icon: Icon(Icons.insert_chart)),
    BottomNavigationBarItem(label: "Home", icon: Icon(Icons.home)),
    BottomNavigationBarItem(
        label: "Notification", icon: Icon(Icons.notifications)),
    BottomNavigationBarItem(label: "Article", icon: Icon(Icons.article)),
  ];

  void changeBottomNavBar(var index) {
    currentIndex.value = index;
    update();
    // emit(ShopChangeBottomNavState());
  }
}
