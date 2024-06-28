import 'package:bloom_project/Add_Project/add_project_controller.dart';
import 'package:bloom_project/Interests/interests_controller.dart';
import 'package:bloom_project/service/info.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Components/MyButton.dart';
import '../Style/constant.dart';

class InterestsView extends StatefulWidget {
  const InterestsView({Key? key}) : super(key: key);

  @override
  State<InterestsView> createState() => _InterestsViewState();
}

class _InterestsViewState extends State<InterestsView> {
  List<bool> selectedOptions = List.generate(20, (index) => false);
  InterestController controller = Get.put(InterestController());
  AddProjectController controller0 = Get.put(AddProjectController());

  List<int> selectedInterestsIds = [];
  void toggleOption(int index, int id) {
    if (index >= 0 && index < selectedOptions.length) {
      setState(() {
        selectedOptions[index] = !selectedOptions[index];
        if (selectedOptions[index]) {
          selectedInterestsIds.add(id);
        } else {
          selectedInterestsIds.remove(id);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: textColor),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(top: 70, bottom: 30, left: 30, right: 30),
        child: Center(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'اختر اهتماماتك',
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
                UserInformation.type == 'inv'? Text(
                  'اختر اهتماماتك بعناية، ستظهر لك المواضيع التي اخترتها في مقدّمة المشاريع لتسهّل عليك عملية البحث.',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    fontFamily: 'font1',
                    color: grey,
                  ),
                  textDirection: TextDirection.rtl,
                ): Text(
                  'قم بتحديد المواضيع التي ينتمي لها مشروعك لتساعد المستثمرين في الوصول اليه.',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    fontFamily: 'font1',
                    color: grey,
                  ),
                  textDirection: TextDirection.rtl,
                ),
                SizedBox(
                  height: 25,
                ),
                Obx(() {
                  return controller.isLoad.value
                      ? Center(
                          child: CircularProgressIndicator(
                            color: textColor,
                          ),
                        )
                      : controller.models.length == 0
                          ? Center(
                              child: Text(''),
                            )
                          : GridView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 10,
                                crossAxisSpacing: 10,
                              ),
                              itemCount: controller.optionsNames.length,
                              itemBuilder: (context, index) {
                                if (index >= controller.optionsNames.length) {
                                  return SizedBox(); // or any other placeholder widget
                                }
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
                                        return MyButton(
                                          onsave: () {
                                            //print(optionsNames.length);
                                            toggleOption(index,
                                                controller.models[index].id);
                                          },
                                          width: screenSize.width * 0.35,
                                          height: 62,
                                          text: controller.optionsNames[index],
                                          color: selectedOptions[index]
                                              ? buttonColor
                                              : buttonColorOpa,
                                          radius: 15,
                                          textColor: black,
                                          fontSize: 20,
                                        );
                                      }
                                    });
                              },
                            );
                }),
                SizedBox(
                  height: 50,
                ),
                MyButton(
                  onsave: () {
                    UserInformation.type == "inv"
                        ? controller.setInterests(selectedInterestsIds)
                        : controller0.setIndex(selectedInterestsIds);
                  },
                  width: 348,
                  height: 62,
                  text: 'تأكيد',
                  color: buttonColor,
                  radius: 15,
                  textColor: Colors.white,
                  fontSize: 35,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
