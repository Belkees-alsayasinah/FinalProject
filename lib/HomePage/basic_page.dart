import 'package:bloom_project/HomePage/BasicPageController.dart';
import 'package:bloom_project/Style/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Articles/articles_controller.dart';

class BasicPage extends StatelessWidget {
  final BasicPageController controller = Get.put(BasicPageController());
  final controller0 = Get.lazyPut(() => ArticlesController(), fenix: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: controller.pageController,
        onPageChanged: (index) {
          controller.currentIndex.value = index;
        },
        children: controller.screens,
      ),
      bottomNavigationBar: Obx(() {
        return BottomNavigationBar(
          currentIndex: controller.currentIndex.value,
          onTap: controller.changeBottomNavBar,
          items: controller.bottomItem,
          selectedItemColor: buttonColor,
          unselectedItemColor: grey,
        );
      }),
    );
  }

}
