
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class HomeController extends GetxController {
  final List<Widget> pages = const [
    Icon(Icons.home),
    Icon(Icons.person),
    Icon(Icons.notifications),
    Icon(Icons.article),
    Icon(Icons.insert_chart),
  ];

  final currentIndex = ValueNotifier<int>(0); // استخدام ValueNotifier لتحديث BottomNavigationBar

  void changePage(int index) {
    currentIndex.value = index;
  }
}
