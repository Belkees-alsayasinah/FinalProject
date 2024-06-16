import 'package:bloom_project/DetailsPage/details_page_controller.dart';
import 'package:bloom_project/Evaluation/evaluation_controller.dart';
import 'package:bloom_project/Style/constant.dart';
import 'package:bloom_project/service/info.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Components/MyButton.dart';
import '../Components/MyDetailsPage.dart';
import '../Components/MylabelText.dart';

class DetailsPageView extends StatelessWidget {
  final int id;
  final String title;
  final String description;
  final String investment_status;
  final String address;
  final dynamic cost;
  DetailsPageController controller = Get.put(DetailsPageController());

  DetailsPageView(
      {Key? key,
        required this.id,
        required this.title,
        required this.description,
        required this.investment_status,
        required this.address,
        required this.cost})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return MyDetailsPage(
      appTitle: 'التفاصيل',
      buttonWidget: UserInformation.type == 'inv'
          ? Positioned.directional(
        textDirection: TextDirection.ltr,
        bottom: 10,
        end: 0,
        start: 0,
        child: Padding(
          padding: EdgeInsets.only(
              right: screenSize.width * 0.34,
              left: screenSize.width * 0.34),
          child: MyButton(
            onsave: () {
              _showCreateFolderDialog(context);
            },
            width: 155,
            height: 52,
            color: buttonColor,
            fontSize: 26,
            radius: 20,
            text: "تواصل",
            textColor: white,
          ),
        ),
      )
          : SizedBox(),
      onsave: () {},
      widget: Column(
        textDirection: TextDirection.rtl,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            textDirection: TextDirection.rtl,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 34, fontFamily: 'font1'),
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
                          return CircularProgressIndicator(); // عرض مؤشر التحميل أثناء جلب البيانات
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
                                        color: Colors.white,
                                      ),
                                      onPressed: () {
                                        controller0.addEvaluation(id.toString());
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              Text(controller0.models.isNotEmpty
                                  ? controller0.models[0].totalEvaluationCount.toString()
                                  : '0'),
                            ],
                          );
                        }
                      });
                    }),
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Text(address,
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'font2',
              )),
          SizedBox(
            height: 15,
          ),
          Text(description,
              textDirection: TextDirection.rtl,
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'font2',
              )),
          SizedBox(
            height: 15,
          ),
          Text(cost.toString(),
              textDirection: TextDirection.rtl,
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'font2',
              )),
          SizedBox(
            height: 15,
          ),
          Text('العنوان: اللاذقية-القرداحة',
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'font2',
              )),
        ],
      ),
    );
  }

  Future<void> _showCreateFolderDialog(BuildContext context) async {
    final Size screenSize = MediaQuery.of(context).size;
    return Get.defaultDialog(
      title: '',
      content: Container(
        width: screenSize.width * 0.7,
        height: screenSize.height * 0.5,
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
                  return controller.personal_photo.value == null
                      ? CircleAvatar(
                    backgroundColor: Colors.grey,
                    radius: 30,
                    child: Icon(Icons.image),
                  )
                      : CircleAvatar(
                    backgroundColor: Colors.grey,
                    radius: 30,
                    backgroundImage:
                    controller.personal_photo.value != null
                        ? FileImage(controller.personal_photo.value!)
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
            controller.uploadPhotos(id);
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
