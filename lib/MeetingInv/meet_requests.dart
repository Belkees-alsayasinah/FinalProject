import 'package:bloom_project/Components/MyButton.dart';
import 'package:bloom_project/MeetingInv/MeetingRequest/meeting_request_controller.dart';
import 'package:bloom_project/MeetingInv/SendMeetRequest/send_meet_controller.dart';
import 'package:bloom_project/Style/constant.dart';
import 'package:bloom_project/service/info.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../Components/MylabelText.dart';

class MeetingRequestsView extends StatelessWidget {
  GetMeetRequestController controller = Get.put(GetMeetRequestController());

  final String title;
  final int projectID;

  MeetingRequestsView(
      {super.key, required this.title, required this.projectID});

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              // القسم العلوي الذي يحتوي على الصورة والنص
              Container(
                height: MediaQuery.of(context).size.height * 0.3,
                decoration: BoxDecoration(
                  color: Color(0xFFC7E3C0),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40),
                  ),
                ),
                child: Center(
                  child: Container(
                    width: 100, // هنا يمكنك ضبط عرض الصورة
                    height: 100, // هنا يمكنك ضبط ارتفاع الصورة
                    child: Image.asset(
                      'assets/images/details.png',
                      fit: BoxFit.contain, // لجعل الصورة تناسب الحاوية المحددة
                    ),
                  ),
                ),
              ),

              SizedBox(height: 16),
              // قسم التواريخ
              Container(
                height: 60,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    textDirection: TextDirection.rtl,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                            fontSize: screenSize.width * 0.07,
                            fontFamily: 'font1'),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        'متاح للاستثمار',
                        // investment_status == '0' ? 'متاح للاستثمار' : 'مستثمر',
                        style: TextStyle(
                            fontSize: screenSize.width * 0.05,
                            fontFamily: 'font1',
                            color: grey),
                      ),
                    ],
                  ),
                ),
              ),

              Expanded(
                child: GetBuilder<GetMeetRequestController>(
                  init: GetMeetRequestController(),
                  builder: (controller) {
                    print('length: ${controller.models.length}');
                    return controller.isLoad.value
                        ? Center(
                            child: SpinKitFadingCircle(
                              color: textColor,
                              size: 50,
                            ),
                          )
                        : controller.models.length == 0
                            ? Center(
                                child: Text(
                                  'لا يوجد حجوزات بعد!',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'font1',
                                      fontSize: screenSize.shortestSide * 0.07,
                                      color: textColor),
                                  textDirection: TextDirection.rtl,
                                ),
                              )
                            : ListView.separated(
                                itemBuilder: (context, index) {
                                  return ActivityCard(
                                    title: controller.models[index].hour,
                                    subtitle:
                                        controller.models[index].timePeriod,
                                    color: grey,
                                    time: index,
                                    projectID: projectID,
                                  );
                                },
                                separatorBuilder: (context, index) {
                                  return SizedBox(
                                    height: 20,
                                  );
                                },
                                itemCount: controller.models.length);
                  },
                ),
              ),
            ],
          ),
          Positioned(
            top: 40,
            right: 16,
            child: IconButton(
              icon: Icon(
                Icons.arrow_forward_ios,
                color: textColor,
                size: 30,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ActivityCard extends StatelessWidget {
  GetMeetRequestController controller = Get.find();

  final String title;
  final String subtitle;
  final int time;
  final Color color;
  final Widget? actionButton;
  final int projectID;

  ActivityCard({
    required this.title,
    required this.subtitle,
    required this.time,
    required this.color,
    required this.projectID,
    this.actionButton,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        textDirection: TextDirection.rtl,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            textDirection: TextDirection.rtl,
            children: [
              Text(
                subtitle,
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'font1',
                  // color: Colors.white70,
                ),
                textDirection: TextDirection.rtl,
              ),
              SizedBox(width: 6),
              Text(
                title,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'font1',
                  // color: Colors.white,
                ),
                textDirection: TextDirection.rtl,
              ),

              Spacer(),
              controller.models[time].statusHour == 0
                  ? GetBuilder<SendMeetController>(
                      init: SendMeetController(
                          projectID, controller.models[time].id),
                      builder: (controller0) {
                        return MyButton(
                          onsave: () {
                            controller0.onClickAddReq();
                          },
                          width: 100,
                          height: 40,
                          text: 'حجز',
                          color: buttonColor,
                          textColor: white,
                          radius: 15,
                          fontSize: 16,
                        );
                      })
                  : SizedBox(),
              // if (actionButton != null) ...[
              //   SizedBox(width: 8),
              //   actionButton!, // عرض الزر إذا تم توفيره
              // ],
            ],
          ),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Expanded(
              //   child:
              //   Text(
              //     time,
              //     style: TextStyle(
              //       fontSize: 14,
              //       fontFamily: 'font1',
              //       // color: Colors.white60,
              //     ),
              //   ),
              // ),
            ],
          ),
        ],
      ),
    );
  }
}
