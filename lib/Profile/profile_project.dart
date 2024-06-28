import 'package:bloom_project/Components/MyListProject.dart';
import 'package:bloom_project/Profile/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import '../Style/constant.dart';

class UserProjects extends StatelessWidget {
  final String id;

  UserProjects({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    const style =
        TextStyle(color: black, fontWeight: FontWeight.bold, fontSize: 26);
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(10.0),
      child: GetBuilder<UserProfilePageController>(
          init: UserProfilePageController(id),
          builder: (controller) {
            return controller.isLoad.value
                ? Center(
                    child: SpinKitFadingCircle(
                      color: textColor,
                      size: 50.0,
                    ),
                  )
                : controller.models.length == 0
                    ? Center(
                        child: Text(
                          'لا يوجد مشاريع بعد!',
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
                          final pendingProject =
                              controller.models[0].projects[index];
                          return FutureBuilder(
                              future: null,
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return Center(
                                    child: SpinKitFadingCircle(
                                      color: textColor,
                                      size: 50.0,
                                    ),
                                  );
                                } else if (snapshot.hasError) {
                                  return Text('Error ${snapshot.error}');
                                } else {
                                  return MyListProject(
                                    locationIcon: Icons.location_on_outlined,
                                      moneyIcon: Icons.money,
                                      investedProject: '',
                                      id: pendingProject.id.toString(),
                                      address: pendingProject.location,
                                      title: pendingProject.name,
                                      cost:
                                          pendingProject.description.toString(),
                                      function: () {},
                                      onTap: () {});
                                }
                              });
                        },
                        separatorBuilder: (context, index) => SizedBox(
                          height: 20,
                        ),
                        itemCount: controller.models[0].projects
                            .length, // Replace with actual project count
                      );
          }),
    ));
  }
}
