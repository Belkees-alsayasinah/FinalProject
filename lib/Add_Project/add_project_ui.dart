import 'package:bloom_project/Add_Project/add_project_controller.dart';
import 'package:bloom_project/Components/MyButton.dart';
import 'package:bloom_project/Components/MylabelText.dart';
import 'package:bloom_project/HomePage/home_page_controller.dart';
import 'package:bloom_project/Interests/interests_view.dart';
import 'package:bloom_project/WorkerProfilePage/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../Components/TextField.dart';
import '../Style/constant.dart';

class AddProject extends StatelessWidget {
  AddProjectController controller = Get.put(AddProjectController());
  HomePageController homePageController = Get.put(HomePageController());
  final ProfilePageController profilePageController = Get.find();
  bool isSelected = false;

  @override
  build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: Text(''),
        centerTitle: true,
        title: Text('إضافة مشروع-طلب تمويل', // Title text
            style: TextStyle(
              color: textColor,
              fontFamily: 'font1',
              fontSize: 34,
            )),
        actions: [
          Padding(
              padding: const EdgeInsets.only(right: 20),
              child: IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Icon(Icons.arrow_forward_ios,
                      color: textColor, size: 30))),
        ],
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(top: 70, bottom: 20, left: 30, right: 30),
        child: Center(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Form(
              //key: controller.formstate,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  MyLabelText(text: 'المهنة:'),
                  MyTextField(
                    label: '',
                    hint: "",
                    textInputAction: TextInputAction.next,
                    onsave: (value) {
                      controller.title = value!;
                    },
                    keyboardType: TextInputType.emailAddress,
                    blurRadius: 8,
                    offset: 10,
                    width: 348,
                    hieght: 62,
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
                    height: 25,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    textDirection: TextDirection.ltr,
                    children: [
                      MyLabelText(text: 'نوع المشروع:'),
                      Container(
                        width: screenSize.width * 1,
                        height: 62,
                        decoration: BoxDecoration(
                            color: fieldColor,
                            borderRadius: BorderRadius.circular(15)),
                        // margin: EdgeInsets.symmetric(horizontal: 20),
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Obx(
                          () => SingleChildScrollView(
                            child: DropdownButtonFormField<String>(
                              value: controller.sector.value.isEmpty
                                  ? null
                                  : controller.sector.value,
                              onChanged: (value) {
                                controller.sector.value = value!;
                              },
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 10),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.grey.withOpacity(0.1),
                                    style: BorderStyle.none,
                                  ),
                                ),
                              ),
                              style: TextStyle(
                                fontFamily: 'font1',
                                fontSize: 25,
                                fontWeight: FontWeight.normal,
                                color: Colors.black,
                              ),
                              dropdownColor: Colors.white,
                              focusColor: Colors.white,
                              isExpanded: false,
                              items: homePageController.models.map((sector) {
                                return DropdownMenuItem<String>(
                                  value: sector.id.toString(),
                                  // استخدام id كـ String
                                  child: Text(sector.name),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  MyLabelText(text: 'التفاصيل:'),
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
                    hieght: 62,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'This field is required';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  MyLabelText(text: 'المبلغ المطلوب:'),
                  MyTextField(
                    label: '',
                    hint: "",
                    textInputAction: TextInputAction.next,
                    onsave: (value) {
                      controller.amount = value!;
                    },
                    keyboardType: TextInputType.emailAddress,
                    blurRadius: 8,
                    offset: 10,
                    width: 348,
                    hieght: 62,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'This field is required';
                      }
                      return null;
                    },
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
                            MyLabelText(text: 'صورة الهوية:'),
                            MyButton(
                                onsave: () {
                                  controller.pickPdf('idPhoto');
                                },
                                width: screenSize.width * 0.3,
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
                        return controller.idPhoto.value == null
                            ? profilePageController.models[0].user.iDCard ==
                                    null
                                ? CircleAvatar(
                                    backgroundColor: Colors.grey,
                                    radius: 50,
                                    child: Icon(Icons.image),
                                  )
                                : CircleAvatar(
                                    backgroundColor: Colors.grey,
                                    radius: 50,
                                    backgroundImage: NetworkImage(
                                        profilePageController
                                            .models[0].user.iDCard))
                            : CircleAvatar(
                                backgroundColor: Colors.grey,
                                radius: 50,
                                backgroundImage:
                                    FileImage(controller.idPhoto.value!)
                                        as ImageProvider<Object>?);
                      })),
                    ],
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
                            MyLabelText(text: 'عقد ملكية أو ايجار:'),
                            MyButton(
                                onsave: () {
                                  controller.pickPdf('contract');
                                },
                                width: screenSize.width * 0.3,
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
                        return controller.contract.value == null
                            ? profilePageController
                                        .models[0].user.propertyDeed ==
                                    null
                                ? CircleAvatar(
                                    backgroundColor: Colors.grey,
                                    radius: 50,
                                    child: Icon(Icons.image),
                                  )
                                : CircleAvatar(
                                    backgroundColor: Colors.grey,
                                    radius: 50,
                                    backgroundImage: NetworkImage(
                                        profilePageController
                                            .models[0].user.propertyDeed))
                            : CircleAvatar(
                                backgroundColor: Colors.grey,
                                radius: 50,
                                backgroundImage:
                                    controller.contract.value != null
                                        ? FileImage(controller.contract.value!)
                                            as ImageProvider<Object>?
                                        : AssetImage('assets/images/s1.jpg')
                                            as ImageProvider<Object>?,
                              );
                      })),
                    ],
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
                                  controller.pickPdf('personalPhoto');
                                },
                                width: screenSize.width * 0.3,
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
                            ? profilePageController
                                        .models[0].user.personalPhoto ==
                                    null
                                ? CircleAvatar(
                                    backgroundColor: Colors.grey,
                                    radius: 50,
                                    child: Icon(Icons.image),
                                  )
                                : CircleAvatar(
                                    backgroundColor: Colors.grey,
                                    radius: 50,
                                    backgroundImage: NetworkImage(
                                        profilePageController
                                            .models[0].user.personalPhoto))
                            : CircleAvatar(
                                backgroundColor: Colors.grey,
                                radius: 50,
                                backgroundImage: controller
                                            .personalPhoto.value !=
                                        null
                                    ? FileImage(controller.personalPhoto.value!)
                                        as ImageProvider<Object>?
                                    : AssetImage('assets/images/s1.jpg')
                                        as ImageProvider<Object>?,
                              );
                      })),
                    ],
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
                            MyLabelText(text: 'لا حكم عليه:'),
                            MyButton(
                                onsave: () {
                                  controller.pickPdf('notRule');
                                },
                                width: screenSize.width * 0.3,
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
                        return controller.notRule.value == null
                            ? profilePageController
                                        .models[0].user.cleanRecord ==
                                    null
                                ? CircleAvatar(
                                    backgroundColor: Colors.grey,
                                    radius: 50,
                                    child: Icon(Icons.image),
                                  )
                                : CircleAvatar(
                                    backgroundColor: Colors.grey,
                                    radius: 50,
                                    backgroundImage: NetworkImage(
                                        profilePageController
                                            .models[0].user.cleanRecord))
                            : CircleAvatar(
                                backgroundColor: Colors.grey,
                                radius: 50,
                                backgroundImage:
                                    controller.notRule.value != null
                                        ? FileImage(controller.notRule.value!)
                                            as ImageProvider<Object>?
                                        : AssetImage('assets/images/s1.jpg')
                                            as ImageProvider<Object>?,
                              );
                      })),
                    ],
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  MyButton(
                    fontSize: 34,
                    onsave: () {
                      Get.to(InterestsView());
                    },
                    width: 348,
                    height: 62,
                    text: 'إضافة المشروع',
                    color: buttonColor,
                    radius: 15,
                    textColor: Colors.white,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
