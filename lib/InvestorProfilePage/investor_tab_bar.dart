import 'package:bloom_project/InvestorProfilePage/profile_controller.dart';
import 'package:bloom_project/InvestorProfilePage/projects.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../EditProfile/edit_profilePage.dart';
import '../Style/constant.dart';

class InvestorTabBar extends StatefulWidget {
  @override
  State<InvestorTabBar> createState() => _InvestorTabBarState();
}

class _InvestorTabBarState extends State<InvestorTabBar> {
  InvestorProfilePageController controller =
      Get.put(InvestorProfilePageController());

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
            Get.to(
                EditProfilePage(
                  id: controller.models[0].investor.id.toString(),
                  firstName: controller.models[0].investor.firstName,
                  lastName: controller.models[0].investor.lastName,
                  email: controller.models[0].investor.email,
                  phone: controller.models[0].investor.phone,
                  address: controller.models[0].investor.location,
                ),
                arguments: {
                  'firstName': controller.models[0].investor.firstName,
                  'lastName': controller.models[0].investor.lastName,
                  'email': controller.models[0].investor.email,
                  'phone': controller.models[0].investor.phone,
                  'address': controller.models[0].investor.location,
                  'id': controller.models[0].investor.id.toString(),
                });
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
                        : controller.models[0].investor.personalPhoto == null
                            ? CircleAvatar(
                                radius: 50,
                                backgroundImage:
                                    AssetImage('assets/images/profile.jpg'))
                            : CircleAvatar(
                                radius: 50,
                                backgroundImage: NetworkImage(controller
                                    .models[0].investor.personalPhoto));
                  }),
                  SizedBox(height: 15),
                  Text(
                    "${controller.models[0].investor.firstName} ${controller.models[0].investor.lastName}",
                    style: TextStyle(
                      color: textColor,
                      fontFamily: 'font1',
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    controller.models[0].investor.email,
                    style: TextStyle(
                      color: textColor,
                      fontFamily: 'font1',
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    controller.models[0].investor.phone,
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
            length: 1,
            child: Expanded(
              child: Scaffold(
                appBar: AppBar(
                  leading: Text(''),
                  bottom: TabBar(tabs: [
                    Tab(
                      text: "مشاريعك",
                      icon: Icon(Icons.done_all),
                    ),
                  ]),
                ),
                body: TabBarView(
                  children: [
                    Projects(
                      userID: '0',
                    ),
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
