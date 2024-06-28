import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../Add_Project/add_project_ui.dart';
import '../EditProfile/edit_profilePage.dart';
import '../Style/constant.dart';
import '../WorkerProfilePage/invested_projects.dart';
import '../WorkerProfilePage/pending_project.dart';
import '../WorkerProfilePage/profile_controller.dart';

class MyTabBar extends StatefulWidget {
  @override
  State<MyTabBar> createState() => _MyTabBarState();
}

class _MyTabBarState extends State<MyTabBar> {
  ProfilePageController controller = Get.put(ProfilePageController());

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
            Get.to(EditProfilePage(
              id: controller.models[0].user.id.toString(),
              firstName: controller.models[0].user.firstName,
              lastName: controller.models[0].user.lastName,
              email: controller.models[0].user.email,
              phone: controller.models[0].user.phone,
              address: controller.models[0].user.location,
            ));
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
          Obx(() {
            if (controller.isLoad.value) {
              return Center(
                child: LoadingAnimationWidget.horizontalRotatingDots(
                  color: textColor,
                  size: 50.0,
                ),
              );
            } else if (controller.models.isEmpty) {
              return Center(
                child: Text(
                  'No data available',
                  style: TextStyle(
                    color: textColor,
                    fontFamily: 'font1',
                    fontSize: 18,
                  ),
                ),
              );
            } else {
              return Column(
                children: [
                  Obx(() {
                    return controller.isLoad.value
                        ? Center(
                            child: SpinKitFadingCircle(
                              color: textColor,
                              size: 30,
                            ),
                          )
                        : controller.models[0].user.personalPhoto == null
                            ? CircleAvatar(
                                radius: 50,
                                backgroundImage:
                                    AssetImage('assets/images/profile.jpg'))
                            : CircleAvatar(
                                radius: 50,
                                backgroundImage: NetworkImage(
                                    controller.models[0].user.personalPhoto));
                  }),
                  SizedBox(height: 15),
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
            }
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
                    // Assuming you have a class named PendingProjects
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
