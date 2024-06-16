import 'package:bloom_project/Components/MyListProject.dart';
import 'package:bloom_project/ProfilePage/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Style/constant.dart';

class InvestmentProjects extends StatelessWidget {
  ProfilePageController controller = Get.put(ProfilePageController());

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    const style =
        TextStyle(color: black, fontWeight: FontWeight.bold, fontSize: 26);
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(10.0),
      child: GetBuilder<ProfilePageController>(
          init: ProfilePageController(),
          builder: (controller) {
            return controller.isLoad.value
                ? Center(
                    child: CircularProgressIndicator(
                      color: textColor,
                    ),
                  )
                : controller.models.isEmpty ||
                        controller.models[0].investedProjects.isEmpty
                    ? Center(
                        child: Text(
                          'لا يوجد مشاريع مستثمرة بعد!',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: 'font1',
                              fontSize: screenSize.shortestSide * 0.07,
                              color: textColor),
                          textDirection: TextDirection.rtl,
                        ),
                      )
                    : ListView.separated(
                        physics: BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          final investedtProject =
                              controller.models[0].investedProjects[index];
                          return FutureBuilder(
                              future: null,
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return Center(
                                    child: CircularProgressIndicator(),
                                  );
                                } else if (snapshot.hasError) {
                                  return Text('Error ${snapshot.error}');
                                } else {
                                  return MyListProject(
                                      investedProject: investedtProject
                                          .investmentStatus
                                          .toString(),
                                      id: investedtProject.id.toString(),
                                      address: investedtProject.location,
                                      title: investedtProject.name,
                                      cost: investedtProject.amount.toString(),
                                      function: () {},
                                      onTap: () {});
                                }
                              });
                        },
                        separatorBuilder: (context, index) => SizedBox(
                          height: 20,
                        ),
                        itemCount: controller.models[0].investedProjects.length,
                      );
          }),
    ));
  }
}
