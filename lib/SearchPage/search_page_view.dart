import 'package:bloom_project/Components/TextField.dart';
import 'package:bloom_project/Style/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchPageView extends StatefulWidget {
  const SearchPageView({Key? key}) : super(key: key);

  @override
  State<SearchPageView> createState() => _SearchPageViewState();
}

class _SearchPageViewState extends State<SearchPageView> {
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
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
              )),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Center(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
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
                      width: screenSize.width * 0.75,
                      hieght: 62),
                  IconButton(
                      onPressed: () {
                        PopupMenuButton(
                          itemBuilder: (BuildContext context) =>
                              <PopupMenuEntry>[
                            PopupMenuItem(
                              child: Text('Option 1'),
                              value: 'Option 1',
                            ),
                          ],
                        );
                      },
                      icon: Icon(
                        Icons.filter_alt,
                        size: 40,
                      ))
                ],
              ),
              SizedBox(
                height: screenSize.width * 0.6,
              ),
              Icon(
                Icons.search,
                size: 100,
                color: textColor,
              ),
              Text(
                'لا يوجد نتائج بحث',
                style: TextStyle(
                    fontSize: 35, fontFamily: 'font1', color: textColor),
              )
            ],
          ),
        ),
      ),
    );
  }
}
// appBar: AppBar(
// actions: [
// PopupMenuButton(
// itemBuilder: (BuildContext context) => <PopupMenuEntry>[
// PopupMenuItem(
// child: Text('Option 1'),
// value: 'Option 1',
// ),
// PopupMenuItem(
// child: Text('Option 2'),
// value: 'Option 2',
// ),
// ],
// onSelected: (value) {
// setState(() {
// selectedFilter = value as String?;
// });
// },
// ),
// ],
// ),
// String? selectedFilter;
