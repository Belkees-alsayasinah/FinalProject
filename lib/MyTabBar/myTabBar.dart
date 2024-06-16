import 'package:bloom_project/ProfilePage/investment_projects.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../Add_Project/add_project_ui.dart';
import '../EditProfile/edit_profilePage.dart';
import '../ProfilePage/profile_page.dart';
import '../Style/constant.dart';

class MyTabBar extends StatefulWidget {
  const MyTabBar({super.key});

  @override
  State<MyTabBar> createState() => _MyTabBarState();
}

class _MyTabBarState extends State<MyTabBar> {
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    const style =
        TextStyle(color: black, fontWeight: FontWeight.bold, fontSize: 26);
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
            Text(
              'أبو حميد',
              style: TextStyle(
                color: textColor,
                fontFamily: 'font1',
                fontSize: 28,
              ),
            ),
            Text(
              'email@gmail.com',
              style: TextStyle(
                color: textColor,
                fontFamily: 'font1',
                fontSize: 28,
              ),
            ),
            Text(
              '0959867573',
              style: TextStyle(
                color: textColor,
                fontFamily: 'font1',
                fontSize: 28,
              ),
            ),
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
          ])),
    );
  }
}
