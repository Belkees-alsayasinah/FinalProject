import 'package:bloom_project/HomePage/home_page_controller.dart';
import 'package:bloom_project/Style/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class HomePage extends StatefulWidget {



  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeController controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GetBuilder<HomeController>(
          init: HomeController(), // Instantiate the controller
          builder: (controller) {
            return controller.screens[controller.currentIndex];
          },
        ),
      ),
      bottomNavigationBar: GetBuilder<HomeController>(
        init: HomeController(),
        builder: (controller){
          return BottomNavigationBar(
            currentIndex: controller.currentIndex,
            onTap: (int nextIndex){
              controller.changeBottomNavBar(nextIndex);

            },
            items: controller.bottomItem,
            selectedItemColor: buttonColor,
            unselectedItemColor: grey,
          );
        }
      ),

    );
  }
}