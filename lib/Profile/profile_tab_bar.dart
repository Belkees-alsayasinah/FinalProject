import 'package:bloom_project/InvestorProfilePage/projects.dart';
import 'package:bloom_project/Profile/profile_controller.dart';
import 'package:bloom_project/Profile/profile_project.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../EditProfile/edit_profilePage.dart';
import '../Style/constant.dart';

class UserTabBar extends StatelessWidget {
  final String userID;

  UserTabBar({
    Key? key,
    required this.userID,
  }) : super(key: key);

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
        actions: [
          IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(Icons.arrow_forward_ios, color: textColor, size: 30)),
        ],
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
        child: GetBuilder<UserProfilePageController>(
          init: UserProfilePageController(userID),
          builder: (controller) {
            return Column(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('assets/images/profile.jpg'),
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
                          ],
                        );
                }),
                DefaultTabController(
                  length: 1,
                  child: Expanded(
                    child: Scaffold(
                      appBar: AppBar(
                        leading: Text(''),
                        bottom: TabBar(tabs: [
                          Tab(
                            text: "المشاريع",
                            icon: Icon(Icons.done_all),
                          ),
                        ]),
                      ),
                      body: TabBarView(
                        children: [
                          UserProjects(id: userID),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
