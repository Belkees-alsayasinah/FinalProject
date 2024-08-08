import 'package:bloom_project/Style/constant.dart';
import 'package:bloom_project/Trasactions/transactionController.dart';
import 'package:bloom_project/Trasactions/upload_photo_for_transaction.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../Components/MyButton.dart';
import '../Components/MyDetailsPage.dart';
import '../Components/MylabelText.dart';

class TransactionDetails extends StatelessWidget {
  final String id;
  final String name;
  final String price;
  final String description;
  final String discount;
  final String status;

  const TransactionDetails({
    Key? key,
    required this.id,
    required this.name,
    required this.price,
    required this.description,
    required this.discount,
    required this.status,
  }) : super(key: key);

  @override
  build(BuildContext context) {
    print("tans: $id");
    final Size screenSize = MediaQuery.of(context).size;
    return MyDetailsPage(
      appTitle: 'تفاصيل المعاملة',
      onsave: () {},
      widget: SingleChildScrollView(
        child: Column(
          textDirection: TextDirection.rtl,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              textDirection: TextDirection.rtl,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  textDirection: TextDirection.rtl,
                  'تفاصيل المعاملة:',
                  style: TextStyle(fontSize: 30, fontFamily: 'font1'),
                ),
                SizedBox(
                  width: 8,
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              name,
              style: TextStyle(fontSize: 18, color: black),
              textAlign: TextAlign.right,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              description,
              style: TextStyle(fontSize: 18, color: black),
              textAlign: TextAlign.right,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'الخصم: ${discount}',
              style: TextStyle(
                fontSize: 18,
              ),
              textAlign: TextAlign.right,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              price,
              style: TextStyle(fontSize: 18, color: black),
              textAlign: TextAlign.right,
            ),
          ],
        ),
      ),
      buttonWidget: Positioned.directional(
        textDirection: TextDirection.ltr,
        bottom: 10,
        end: 0,
        start: 0,
        child: Padding(
          padding: EdgeInsets.only(
              right: screenSize.width * 0.34, left: screenSize.width * 0.34),
          child: status == 'Available'
              ? MyButton(
                  onsave: () {
                    _showCreateFolderDialog(context);
                  },
                  width: 155,
                  height: 52,
                  color: buttonColor,
                  fontSize: 26,
                  radius: 20,
                  text: "الاستمرار",
                  textColor: white,
                )
              : SizedBox(),
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
              'من أجل الدفع لإجراء المعاملات يجب عليك أن تقوم بتحويل المبلغ المطلوب لحساب البنك الخاص بالمكتب وإرفاق الإشعار في الأسفل ',
              style: TextStyle(
                fontFamily: 'font1',
                fontSize: 20,
                color: black,
              ),
              textDirection: TextDirection.rtl,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'الحساب المطلوب تحويل المبلغ عليه: acoa2020aa',
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
                      MyLabelText(text: 'اشعار الدفع:'),
                      GetBuilder<UploadPhotoTransactionController>(
                          init: UploadPhotoTransactionController(id),
                          builder: (controller) {
                            return MyButton(
                                onsave: () {
                                  controller.pickPdf();
                                },
                                width: Get.width * 0.3,
                                height: 62,
                                text: 'تحديد',
                                color: Colors.white,
                                textColor: black,
                                radius: 15,
                                fontSize: 20);
                          })
                    ],
                  ),
                ),
                Expanded(
                  child: GetBuilder<UploadPhotoTransactionController>(
                      init: UploadPhotoTransactionController(id),
                      builder: (controller) {
                        return controller.image.value == null
                            ? CircleAvatar(
                                backgroundColor: Colors.grey,
                                radius: 30,
                                child: Icon(Icons.image),
                              )
                            : CircleAvatar(
                                backgroundColor: Colors.grey,
                                radius: 30,
                                backgroundImage: controller.image.value != null
                                    ? FileImage(controller.image.value!)
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
        GetBuilder<UploadPhotoTransactionController>(
            init: UploadPhotoTransactionController(id),
            builder: (controller) {
              return TextButton(
                onPressed: () {
                  controller
                      .uploadPdf()
                      .then((value) => Navigator.pop(context));
                },
                child: Text(
                  'تأكيد الدفع',
                  style: TextStyle(
                    fontFamily: 'font1',
                    fontWeight: FontWeight.bold,
                    color: textColor,
                    fontSize: 30,
                  ),
                ),
              );
            }),
      ],
    );
  }
}
