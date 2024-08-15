import 'package:bloom_project/Components/TextField.dart';
import 'package:bloom_project/SearchPage/search_controller.dart';
import 'package:bloom_project/Style/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

import '../DetailsPage/details_page_view.dart';
import '../try.dart';

class SearchPageView extends StatefulWidget {
  final TextEditingController priceController = TextEditingController();
  SearchPageController controller = Get.put(SearchPageController());

  @override
  State<SearchPageView> createState() => _SearchPageViewState();
}

class _SearchPageViewState extends State<SearchPageView> {
  bool isSearching = false; // متغير حالة جديد للتحكم في عرض المؤشر الدائري

  void _handleFilterOption(String value) {
    widget.controller.updateSearchType(value == 'price' ? 'amount' : 'name');
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return GetBuilder<SearchPageController>(builder: (controller) {
      return Scaffold(
        appBar: AppBar(
          leading: Text(''),
          actions: [
            IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(
                Icons.arrow_forward_ios,
                color: textColor,
                size: 30,
              ),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Center(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  textDirection: TextDirection.rtl,
                  children: [
                    MyTextField(
                      label: '',
                      hint: '',
                      textInputAction: TextInputAction.done,
                      onsave: (value) {},
                      keyboardType: TextInputType.text,
                      blurRadius: 8,
                      offset: 10,
                      width: screenSize.width * 0.6,
                      height: screenSize.height * 0.1,
                      control: widget.priceController,
                      max: 5,
                    ),
                    PopupMenuButton<String>(
                      icon: Icon(
                        Icons.filter_alt,
                        size: 40,
                        color: textColor,
                      ),
                      onSelected: _handleFilterOption,
                      itemBuilder: (BuildContext context) =>
                          <PopupMenuEntry<String>>[
                        PopupMenuItem<String>(
                          value: 'price',
                          child: Text('البحث حسب السعر'),
                        ),
                        PopupMenuItem<String>(
                          value: 'name',
                          child: Text('البحث حسب الاسم'),
                        ),
                      ],
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.search,
                        size: 40,
                        color: textColor,
                      ),
                      onPressed: () {
                        setState(() {
                          isSearching =
                              true; // تحديث حالة البحث عند النقر على زر البحث
                        });
                        String searchText = widget.priceController.text;
                        controller.getdata(searchText).then((_) {
                          setState(() {
                            isSearching =
                                false; // تحديث حالة البحث بعد انتهاء البحث
                          });
                        });
                      },
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Expanded(
                  child: Obx(() {
                    if (isSearching) {
                      return Center(
                        child: SpinKitFadingCircle(
                          color: textColor,
                          size: 50.0,
                        ),
                      );
                    } else if (controller.models.isEmpty) {
                      return Center(
                        child: Text(
                          'لا يوجد نتائج بحث',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: 'font1',
                            fontSize: screenSize.shortestSide * 0.07,
                            color: textColor,
                          ),
                          textDirection: TextDirection.rtl,
                        ),
                      );
                    } else {
                      return ListView.separated(
                        physics: BouncingScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Get.to(PlannerScreen(
                                id: controller.models[index].id,
                                userID: controller.models[index].userId.toString(),  // Ensure this is a String
                                title: controller.models[index].name,
                                description: controller.models[index].description,
                                address: controller.models[index].location,
                                cost: controller.models[index].amount,
                                investment_status: controller.models[index].investmentStatus.toString(), // Ensure this is a String
                              ));

                            },
                            child: Stack(
                              children: [
                                Container(
                                  width: 386,
                                  height: 167,
                                  decoration: BoxDecoration(
                                    color: buttonColor,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(15),
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.5),
                                        spreadRadius: 0,
                                        offset: Offset(3, 3),
                                        blurRadius: 4,
                                      ),
                                    ],
                                  ),
                                ),
                                Positioned.directional(
                                  textDirection: TextDirection.rtl,
                                  start: 20,
                                  bottom: 0,
                                  end: 0,
                                  top: 0,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.4),
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(15),
                                        bottomLeft: Radius.circular(15),
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  right: 25,
                                  child: Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Column(
                                      textDirection: TextDirection.rtl,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          controller.models[index].name,
                                          style: TextStyle(
                                            fontSize: 25,
                                            fontFamily: 'font1',
                                            color: black,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          textDirection: TextDirection.rtl,
                                          children: [
                                            Icon(
                                              Icons.location_on_outlined,
                                              color: black,
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              controller.models[index].location,
                                              style: TextStyle(
                                                fontSize:
                                                    screenSize.width * 0.04,
                                                fontFamily: 'font1',
                                                color: black,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 20),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          textDirection: TextDirection.rtl,
                                          children: [
                                            Icon(
                                              Icons.money,
                                              color: Colors.grey[700],
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              controller.models[index].amount
                                                  .toString(),
                                              style: TextStyle(
                                                fontSize:
                                                    screenSize.width * 0.04,
                                                fontFamily: 'font1',
                                                color: Colors.grey[700],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(height: 20);
                        },
                        itemCount: controller.models.length,
                      );
                    }
                  }),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
