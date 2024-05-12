import 'package:bloom_project/Articles/articles_page.dart';
import 'package:bloom_project/HomePage/home_page_View.dart';
import 'package:bloom_project/ProfilePage/profile_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../ChartPage/chart_page_view.dart';
import '../Notifications/notifications_page.dart';

class BasicPageController extends GetxController {
  var currentIndex = 2.obs;

  PageController pageController = PageController(initialPage: 2);

  List<Widget> screens = [
    ProfilePage(),
    ChartPageView(),
    HomePageView(),
    NotificationsPage(),
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

  void changeBottomNavBar(int index) {
    currentIndex.value = index;
    pageController.animateToPage(
      index,
      duration: Duration(milliseconds: 300),
      curve: Curves.ease,
    );
  }
}
