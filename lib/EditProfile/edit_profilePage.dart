import 'package:bloom_project/EditProfile/edit_profile_controller.dart';
import 'package:bloom_project/EditProfile/edit_profile_service.dart';
import 'package:bloom_project/RegisterPage/register_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Components/MyButton.dart';
import '../Components/TextField.dart';
import '../Style/constant.dart';

class EditProfilePage extends StatelessWidget {
  var appPadding = 30;
  final String id;
  final String firstName; // Title of the article
  final String lastName; // Description of the article
  final String email;
  final String phone;
  final String address;
  final EditProfileService? service;

  EditProfilePage({
    Key? key,
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.address,
    this.service, // Pass the service through the constructor
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    // EditProfileController controller = Get.put(EditProfileController());
    return Scaffold(
      appBar: AppBar(
        leading: Text(' '),
        actions: [
          IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(
                Icons.arrow_forward_ios,
                size: screenSize.width * 0.1,
                color: textColor,
              )),
        ],
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(top: 30, bottom: 30, left: 20, right: 20),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Center(
              child: GetBuilder<EditProfileController>(
            init: EditProfileController(),
            builder: (controller) {
              return Form(
                key: controller.formstate,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'تعديل الحساب',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 34,
                        fontFamily: 'font1',
                        color: textColor,
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      textDirection: TextDirection.rtl,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          textDirection: TextDirection.ltr,
                          children: [
                            Text(
                              ':الاسم الأول',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: screenSize.shortestSide * 0.06,
                                fontFamily: 'font1',
                              ),
                            ),
                            MyTextField(
                              control: TextEditingController(
                                  text: controller.firstName),
                              label: '',
                              hint: "",
                              textInputAction: TextInputAction.next,
                              onsave: (value) {
                                controller.firstName = value!;
                              },
                              keyboardType: TextInputType.emailAddress,
                              blurRadius: 8,
                              offset: 10,
                              width: screenSize.width * 0.42,
                              height: screenSize.height * 0.1,
                            ),
                          ],
                        ),
                        SizedBox(width: screenSize.width * 0.04),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          textDirection: TextDirection.ltr,
                          children: [
                            Text(
                              ':الاسم الأخير',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: screenSize.shortestSide * 0.06,
                                fontFamily: 'font1',
                              ),
                            ),
                            MyTextField(
                              control: TextEditingController(
                                  text: controller.lastName),
                              label: '',
                              hint: "",
                              textInputAction: TextInputAction.next,
                              onsave: (value) {
                                controller.lastName = value!;
                              },
                              keyboardType: TextInputType.emailAddress,
                              blurRadius: 8,
                              offset: 10,
                              width: screenSize.width * 0.42,
                              height: screenSize.height * 0.1,
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      textDirection: TextDirection.ltr,
                      children: [
                        Text(
                          ':البريد الإلكتروني',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: screenSize.shortestSide * 0.06,
                            fontFamily: 'font1',
                          ),
                        ),
                        MyTextField(
                          control:
                              TextEditingController(text: controller.email),
                          label: '',
                          hint: "",
                          textInputAction: TextInputAction.next,
                          onsave: (value) {
                            controller.email = value!;
                          },
                          keyboardType: TextInputType.emailAddress,
                          blurRadius: 8,
                          offset: 10,
                          width: screenSize.width * 1,
                          height: screenSize.height * 0.1,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      textDirection: TextDirection.ltr,
                      children: [
                        Text(
                          ':رقم الجوال',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: screenSize.shortestSide * 0.06,
                            fontFamily: 'font1',
                          ),
                        ),
                        MyTextField(
                          control:
                              TextEditingController(text: controller.phone),
                          label: '',
                          hint: "",
                          textInputAction: TextInputAction.next,
                          onsave: (value) {
                            controller.phone = value!;
                          },
                          keyboardType: TextInputType.emailAddress,
                          blurRadius: 8,
                          offset: 10,
                          width: screenSize.width * 1,
                          height: screenSize.height * 0.1,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      textDirection: TextDirection.ltr,
                      children: [
                        Text(
                          ':العنوان',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: screenSize.shortestSide * 0.06,
                            fontFamily: 'font1',
                          ),
                        ),
                        MyTextField(
                          control:
                              TextEditingController(text: controller.address),
                          label: '',
                          hint: "",
                          textInputAction: TextInputAction.next,
                          onsave: (value) {
                            controller.address = value!;
                          },
                          keyboardType: TextInputType.text,
                          blurRadius: 8,
                          offset: 10,
                          width: screenSize.width * 1,
                          height: screenSize.height * 0.1,
                        ),
                      ],
                    ),
                    SizedBox(width: screenSize.width * 0.04),
                    SizedBox(
                      height: 25,
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    MyButton(
                      fontSize: 34,
                      onsave: () async {
                        if (controller.formstate.currentState!.validate()) {
                          controller.onUpdate();
                        }
                      },
                      width: screenSize.width * 0.9,
                      height: screenSize.height * 0.08,
                      text: 'تعديل الحساب',
                      color: buttonColor,
                      radius: 15,
                      textColor: Colors.white,
                    ),
                  ],
                ),
              );
            },
          )),
        ),
      ),
    );
  }
}
