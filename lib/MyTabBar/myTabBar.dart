import 'package:bloom_project/ProfilePage/invested_projects.dart';
import 'package:bloom_project/ProfilePage/profile_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';  // استيراد حزمة flutter
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../Add_Project/add_project_ui.dart';
import '../EditProfile/edit_profilePage.dart';
import '../ProfilePage/pending_project.dart';
import '../Style/constant.dart';

class MyTabBar extends StatefulWidget {
  @override
  State<MyTabBar> createState() => _MyTabBarState();
}

class _MyTabBarState extends State<MyTabBar> {
  ProfilePageController controller = Get.put(ProfilePageController());

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    const style = TextStyle(color: black, fontWeight: FontWeight.bold, fontSize: 26);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.edit),
          onPressed: () {
            Get.to(EditProfilePage());
          },
        ),
        centerTitle: true,
        title: Text(
          "الصفحة الشخصية",
          style: TextStyle(
            color: textColor,
            fontFamily: 'font1',
            fontSize: 34,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Get.to(AddProject());
              // Handle add action functionality
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(children: [
          CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage(
                'assets/images/profile.jpg'), // Replace 'profile.jpg' with your actual image name
          ),
          SizedBox(height: 15),
          Obx(() {
            return controller.isLoad.value
                ? Center(
              child: LoadingAnimationWidget.horizontalRotatingDots(
                color: textColor,
                size: 50.0,
              ),
            )
                : Column(
              children: [
                Text(
                  "${controller.models[0].user.firstName} ${controller.models[0].user.lastName}",
                  style: TextStyle(
                    color: textColor,
                    fontFamily: 'font1',
                    fontSize: 18,
                  ),
                ),
                Text(
                  controller.models[0].user.email,
                  style: TextStyle(
                    color: textColor,
                    fontFamily: 'font1',
                    fontSize: 18,
                  ),
                ),
                Text(
                  controller.models[0].user.phone,
                  style: TextStyle(
                    color: textColor,
                    fontFamily: 'font1',
                    fontSize: 18,
                  ),
                ),
              ],
            );
          }),
          DefaultTabController(
            length: 2,
            child: Expanded(
              child: Scaffold(
                appBar: AppBar(
                  leading: Text(''),
                  bottom: TabBar(tabs: [
                    Tab(
                      text: "مشاريع متاحة",
                      icon: Icon(Icons.timelapse),
                    ),
                    Tab(
                      text: "مشاريع مستثمرة",
                      icon: Icon(Icons.done_all),
                    ),
                  ]),
                ),
                body: TabBarView(
                  children: [
                    ProfilePage(),
                    InvestmentProjects(),
                  ],
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
