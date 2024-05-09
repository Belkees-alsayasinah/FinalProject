import 'package:bloom_project/HomePage/BasicPageController.dart';
import 'package:bloom_project/Style/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BasicPage extends StatefulWidget {
  @override
  State<BasicPage> createState() => _BasicPageState();
}

class _BasicPageState extends State<BasicPage> {
   BasicPageController controller = Get.put(BasicPageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Obx(() {
          return controller.screens[controller.currentIndex.value];
        }),
      ),
      bottomNavigationBar: Obx(() {
        return BottomNavigationBar(
          currentIndex: controller.currentIndex.value,
          onTap: (int nextIndex) {
            controller.changeBottomNavBar(nextIndex);
          },
          items: controller.bottomItem,
          selectedItemColor: buttonColor,
          unselectedItemColor: grey,
        );
      }),
    );
  }
}
