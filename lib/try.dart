import 'package:bloom_project/Components/MyButton.dart';
import 'package:bloom_project/Style/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'Evaluation/evaluation_controller.dart';

class PlannerScreen extends StatelessWidget {
  final int id;
  String? userID;
  final String title;
  final String description;
  final String investment_status;
  final String address;
  final dynamic cost;

  PlannerScreen({
    Key? key,
    required this.id,
    this.userID,
    required this.title,
    required this.description,
    required this.investment_status,
    required this.address,
    required this.cost,
  }) : super(key: key);

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
                  color: buttonColor,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40),
                  ),
                  image: DecorationImage(
                    image: AssetImage('assets/images/logo.jpg'),
                    // ضع هنا مسار الصورة الخاصة بك
                    fit: BoxFit.cover,
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
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: GetBuilder<AddEvaluationController>(
                          init: AddEvaluationController(id: '1'),
                          builder: (controller0) {
                            return Obx(() {
                              if (controller0.isLoad.value) {
                                return LoadingAnimationWidget.discreteCircle(
                                  color: textColor,
                                  size: 10,
                                );
                              } else {
                                return Column(
                                  children: [
                                    Stack(
                                      children: [
                                        CircleAvatar(
                                          radius: screenSize.width * 0.03,
                                          backgroundColor: Colors.grey[400],
                                          child: IconButton(
                                            icon: Icon(
                                              Icons.favorite,
                                              color: Colors.red,
                                              size: screenSize.width * 0.03,
                                            ),
                                            onPressed: () {
                                              controller0.addEvaluation('1');
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                    Obx(() {
                                      return Text(
                                        controller0.models.isNotEmpty
                                            ? controller0
                                                .models[0].totalEvaluationCount
                                                .toString()
                                            : '0',
                                        style: TextStyle(
                                            fontSize: screenSize.width * 0.026),
                                      );
                                    })
                                  ],
                                );
                              }
                            });
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
              //SizedBox(height: 16),
              // قسم الأنشطة
              Expanded(
                child: ListView(
                  children: [
                    ActivityCard(
                      title: 'العنوان',
                      subtitle: address,
                      time: '9:00 AM',
                      color: buttonColorOpa,
                    ),
                    ActivityCard(
                      title: 'المبلغ المطلوب',
                      subtitle: cost,
                      time: '12:00 PM',
                      color: Colors.grey,
                    ),
                    ActivityCard(
                      title: 'تفاصيل المشروع',
                      subtitle: description,
                      time: '3:00 PM',
                      color: buttonColorOpa,
                    ),
                    ActivityCard(
                      title: 'طلب تواصل',
                      subtitle:
                          'إذا كنت ترغب في الاستثمار في هذا المشروع يمكنك التقدّم بطلب استثمار وتقديم بعض المستندات: ',
                      time: '6:00 PM',
                      color: grey,
                      actionButton: MyButton(
                        color: buttonColor,
                        fontSize: 20,
                        height: 40,
                        text: 'تواصل',
                        onsave: () {},
                        radius: 15,
                        textColor: Colors.white,
                        width: 100,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          // زر الرجوع في أعلى يمين الصفحة
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
                // التعامل مع الضغط على الزر
                Navigator.of(context).pop();
              },
            ),
          ),
        ],
      ),
    );
  }
}

// class DateCard extends StatelessWidget {
//   final String day;
//   final String date;
//   final bool isSelected;
//
//   const DateCard({
//     required this.day,
//     required this.date,
//     this.isSelected = false,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.symmetric(horizontal: 8),
//       width: 60,
//       decoration: BoxDecoration(
//         color: isSelected ? Colors.orange : Colors.white,
//         borderRadius: BorderRadius.circular(10),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black12,
//             blurRadius: 6,
//             offset: Offset(0, 2),
//           ),
//         ],
//       ),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Text(
//             day,
//             style: TextStyle(
//               fontSize: 16,
//               color: isSelected ? Colors.white : Colors.black,
//             ),
//           ),
//           SizedBox(height: 4),
//           Text(
//             date,
//             style: TextStyle(
//               fontSize: 16,
//               color: isSelected ? Colors.white : Colors.black,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

class ActivityCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String time;
  final Color color;
  final Widget? actionButton; // إضافة زر اختياري

  const ActivityCard({
    required this.title,
    required this.subtitle,
    required this.time,
    required this.color,
    this.actionButton, // إضافة هذا الوسيط ليكون اختياري
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
        mainAxisSize: MainAxisSize.min, // يجعل الطول يتلاءم مع المحتوى
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
          SizedBox(height: 8),
          Text(
            subtitle,
            style: TextStyle(
              fontSize: 16,
              fontFamily: 'font1',
              // color: Colors.white70,
            ),
            textDirection: TextDirection.rtl,
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
              if (actionButton != null) ...[
                SizedBox(width: 8),
                actionButton!, // عرض الزر إذا تم توفيره
              ],
            ],
          ),
        ],
      ),
    );
  }
}
