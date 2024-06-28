import 'package:bloom_project/GetCanvas/get_canvas_controller.dart';
import 'package:bloom_project/Profile/profile_tab_bar.dart';
import 'package:bloom_project/Table/table_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../Components/MyButton.dart';
import '../Components/MyDetailsPage.dart';
import '../Components/MylabelText.dart';
import '../Evaluation/evaluation_controller.dart';
import '../Style/constant.dart';
import '../service/info.dart';
import 'details_page_controller.dart';

class DetailsPageView extends StatelessWidget {
  final int id;
  String? userID;
  final String title;
  final String description;
  final String investment_status;
  final String address;
  final dynamic cost;

  DetailsPageController controller = Get.put(DetailsPageController());

  DetailsPageView({
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
    return MyDetailsPage(
      appTitle: 'التفاصيل',
      buttonWidget: UserInformation.type == 'inv'
          ? investment_status == '0'
              ? Positioned.directional(
                  textDirection: TextDirection.ltr,
                  bottom: 10,
                  end: 0,
                  start: 0,
                  child: Padding(
                    padding: EdgeInsets.only(
                        right: screenSize.width * 0.34,
                        left: screenSize.width * 0.34),
                    child: Obx(() => MyButton(
                          onsave: () {
                            controller.buttonText.value == "تواصل"
                                ? _showCreateFolderDialog(context)
                                : null;
                          },
                          width: 200,
                          height: 52,
                          color: buttonColor,
                          fontSize: 20,
                          radius: 20,
                          text: controller.buttonText.value,
                          // Observe buttonText
                          textColor: white,
                        )),
                  ),
                )
              : SizedBox()
          : SizedBox(),
      onsave: () {},
      widget: SingleChildScrollView(
        child: Column(
          textDirection: TextDirection.rtl,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              textDirection: TextDirection.rtl,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.person,
                  size: 30,
                ),
                InkWell(
                  onTap: () {
                    Get.to(UserTabBar(userID: userID.toString()));
                  },
                  child: Container(
                    width: 70,
                    height: 20,
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.4),
                      // تأكد من أنك تستخدم Colors.grey
                      borderRadius: BorderRadius.circular(
                          10), // تحديد نصف قطر تدوير الحواف
                    ),
                    child: Center(
                      // إضافة Center لضمان أن النص يظهر في الوسط
                      child: Text(
                        'الملف الشخصي',
                        style: TextStyle(fontSize: 10),
                      ),
                    ),
                  ),
                )
              ],
            ),
            Row(
              textDirection: TextDirection.rtl,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  title,
                  style: TextStyle(
                      fontSize: screenSize.width * 0.07, fontFamily: 'font1'),
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  investment_status == '0' ? 'متاح للاستثمار' : 'مستثمر',
                  style:
                      TextStyle(fontSize: 20, fontFamily: 'font1', color: grey),
                ),
                Spacer(), // Spacer لدفع الـ Stack إلى اليسار
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: GetBuilder<AddEvaluationController>(
                    init: AddEvaluationController(id: id.toString()),
                    builder: (controller0) {
                      return Obx(() {
                        if (controller0.isLoad.value) {
                          return LoadingAnimationWidget.discreteCircle(
                            color: textColor,
                            size: 30.0,
                          );
                        } else {
                          return Column(
                            children: [
                              Stack(
                                children: [
                                  CircleAvatar(
                                    radius: 20,
                                    backgroundColor: Colors.grey[400],
                                    child: IconButton(
                                      icon: Icon(
                                        Icons.favorite,
                                        color: Colors.red,
                                      ),
                                      onPressed: () {
                                        controller0
                                            .addEvaluation(id.toString());
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              Obx(() {
                                return Text(controller0.models.isNotEmpty
                                    ? controller0.models[0].totalEvaluationCount
                                        .toString()
                                    : '0');
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
            SizedBox(
              height: 15,
            ),
            Row(
              textDirection: TextDirection.rtl,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(Icons.location_on_outlined),
                SizedBox(
                  width: 5,
                ),
                Text(
                  "العنوان: $address",
                  style: TextStyle(
                    fontSize: screenSize.width * 0.05,
                    fontFamily: 'font2',
                  ),
                  textDirection: TextDirection.rtl,
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              textDirection: TextDirection.rtl,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(Icons.description),
                SizedBox(width: 5),
                Expanded(
                  // استخدم Expanded هنا لضبط حجم النص
                  child: Text(
                    "التفاصيل: $description",
                    textDirection: TextDirection.rtl,
                    style: TextStyle(
                      fontSize: screenSize.width * 0.05,
                      fontFamily: 'font2',
                    ),
                    // maxLines: 8,
                    // overflow:
                    //     TextOverflow.ellipsis, // لإظهار النقاط عند تجاوز النص
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              textDirection: TextDirection.rtl,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(Icons.money),
                SizedBox(
                  width: 5,
                ),
                Text("المبلغ المطلوب:  ${cost.toString()}",
                    textDirection: TextDirection.rtl,
                    style: TextStyle(
                      fontSize: screenSize.width * 0.05,
                      fontFamily: 'font2',
                    )),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            GetBuilder<GetCanvasController>(
                init: GetCanvasController(id.toString()),
                builder: (controller) {
                  return Center(
                    child: MyButton(
                        onsave: () {
                          Get.to(TableView());
                        },
                        width: 200,
                        height: 40,
                        text: 'مخطط نموذج الأعمال',
                        color: buttonColor,
                        textColor: Colors.white,
                        radius: 15,
                        fontSize: 16),
                  );
                })
          ],
        ),
      ),
    );
  }

  Future<void> _showCreateFolderDialog(BuildContext context) async {
    final Size screenSize = MediaQuery.of(context).size;
    return Get.defaultDialog(
      title: '',
      content: Container(
        width: screenSize.width * 0.7,
        height: screenSize.height * 0.4,
        child: Column(
          children: [
            Text(
              'نحتاج إلى بعض الوثائق من أجل تأكيد عملية التواصل مع صاحب العمل:',
              style: TextStyle(
                fontFamily: 'font1',
                fontSize: 20,
                color: black,
              ),
              textDirection: TextDirection.rtl,
            ),
            SizedBox(
              height: 25,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              textDirection: TextDirection.rtl,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      MyLabelText(text: 'صورة شخصية:'),
                      MyButton(
                          onsave: () {
                            controller.pickPhotos('personal_photo');
                          },
                          width: Get.width * 0.25,
                          height: 62,
                          text: 'تحديد',
                          color: Colors.white,
                          textColor: black,
                          radius: 15,
                          fontSize: 20)
                    ],
                  ),
                ),
                //SizedBox(width: 40,),
                Expanded(child: Obx(() {
                  return controller.personalPhoto.value == null
                      ? CircleAvatar(
                          backgroundColor: Colors.grey,
                          radius: 30,
                          child: Icon(Icons.image),
                        )
                      : CircleAvatar(
                          backgroundColor: Colors.grey,
                          radius: 30,
                          backgroundImage:
                              controller.personalPhoto.value != null
                                  ? FileImage(controller.personalPhoto.value!)
                                      as ImageProvider<Object>?
                                  : AssetImage('assets/images/s1.jpg')
                                      as ImageProvider<Object>?,
                        );
                })),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              textDirection: TextDirection.rtl,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      MyLabelText(text: 'صورة الهوية:'),
                      MyButton(
                          onsave: () {
                            controller.pickPhotos('idPhoto');
                          },
                          width: Get.width * 0.25,
                          height: 62,
                          text: 'تحديد',
                          color: Colors.white,
                          textColor: black,
                          radius: 15,
                          fontSize: 20)
                    ],
                  ),
                ),
                //SizedBox(width: 40,),
                Expanded(
                  child: Obx(() {
                    return controller.idPhoto.value == null
                        ? CircleAvatar(
                            backgroundColor: Colors.grey,
                            radius: 30,
                            child: Icon(Icons.image),
                          )
                        : CircleAvatar(
                            backgroundColor: Colors.grey,
                            radius: 30,
                            backgroundImage: controller.idPhoto.value != null
                                ? FileImage(controller.idPhoto.value!)
                                    as ImageProvider<Object>?
                                : AssetImage('assets/images/s1.jpg')
                                    as ImageProvider<Object>?,
                          );
                  }),
                ),
              ],
            ),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Get.back();
          },
          child: Text(
            'إلغاء',
            style: TextStyle(
                fontFamily: 'font1',
                fontWeight: FontWeight.bold,
                color: textColor,
                fontSize: 30),
          ),
        ),
        TextButton(
          onPressed: () {
            controller.uploadPhotos(id).then((value) => Navigator.pop(context));
          },
          child: Text(
            'تأكيد الطلب',
            style: TextStyle(
              fontFamily: 'font1',
              fontWeight: FontWeight.bold,
              color: textColor,
              fontSize: 30,
            ),
          ),
        ),
      ],
    );
  }
}
