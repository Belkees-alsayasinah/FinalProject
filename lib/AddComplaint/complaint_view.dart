import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import '../Components/MyDetailsPage.dart';
import '../Components/MylabelText.dart';
import '../Components/TextField.dart';
import '../Components/MyButton.dart';
import 'package:bloom_project/Style/constant.dart';

import 'complaint_controller.dart';

class ComplaintView extends StatelessWidget {
  final String id;

  ComplaintView({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(id);
    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        leading: Text(''),
        centerTitle: true,
        title: Text('إضافة شكوى', // Title text
            style: TextStyle(
              color: textColor,
              fontFamily: 'font1',
              fontSize: 34,
            )),
        actions: [
          IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(Icons.arrow_forward_ios, color: textColor, size: 30))
        ],
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(top: 70, bottom: 20, left: 30, right: 30),
        child: Center(
          child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: GetBuilder<ComplaintController>(
                init: ComplaintController(id),
                builder: ((controller) {
                  return Form(
                    key: controller.formstate,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        labelText('محتوى الشكوى:'),
                        SizedBox(
                          height: 10,
                        ),
                        MyTextField(
                          label: '',
                          hint: "",
                          textInputAction: TextInputAction.next,
                          onsave: (value) {
                            controller.description = value!;
                          },
                          keyboardType: TextInputType.emailAddress,
                          blurRadius: 8,
                          offset: 10,
                          width: 348,
                          height: 200,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'This field is required';
                            }
                            if (!value.contains('@') || !value.contains('.')) {
                              return 'Incorrect format';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        MyButton(
                          fontSize: 34,
                          onsave: () {
                            controller.onClickAddComplaint();
                            controller.addState ? Navigator.pop(context) : null;
                          },
                          width: 348,
                          height: 62,
                          text: 'إرسال ',
                          color: buttonColor,
                          radius: 15,
                          textColor: Colors.white,
                        ),
                      ],
                    ),
                  );
                }),
              )),
        ),
      ),
    );
  }

  Widget labelText(String text) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 16,
        fontFamily: 'font1',
        fontWeight: FontWeight.bold,
      ),
      textDirection: TextDirection.rtl,
    );
  }
}
