import 'package:bloom_project/EditProfile/edit_profilePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../Add_Project/add_project_ui.dart';
import '../Style/constant.dart';

class ProfilePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.edit),
          onPressed: () {
            Get.to(EditProfilePage());
            // Handle edit profile functionality
          },
        ),
        centerTitle: true,
        title: Text(
          "الصفحة الشخصية",
          style: TextStyle(
            color: textColor,
            fontFamily: 'font1',
            fontSize: 34,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Get.to(AddProject());
              // Handle add action functionality
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/images/profile.jpg'), // Replace 'profile.jpg' with your actual image name
            ),

            SizedBox(height: 15),
            Text(
              'أبو حميد',
              style: TextStyle(
                color: textColor,
                fontFamily: 'font1',
                fontSize: 28,
              ),

            ),
            Text(
              'email@gmail.com',
              style: TextStyle(
                color: textColor,
                fontFamily: 'font1',
                fontSize: 28,
              ),
            ),
            Text(
              '0959867573',
              style: TextStyle(
                color: textColor,
                fontFamily: 'font1',
                fontSize: 28,
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) => projectItem(context),
                separatorBuilder: (context, index) => Divider(),
                itemCount: 3, // Replace with actual project count
              ),
            ),
          ],
        ),
      ),
    );
  }


  Widget projectItem(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius:BorderRadius.circular(15),      color: Color(0xFF659B5E),
      ),

      child: Row(
        children: [
          // Show "عرض المزيد..." on the right

          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            // Right-align the column
            children: [
              // Show three dots icon
              Padding(
                padding: const EdgeInsets.only(right: 40),
                child: IconButton(
                  icon: Icon(Icons.more_vert),
                  onPressed: () {
                    // Handle project options functionality
                  },
                ),
              ),
              SizedBox(height: 20),

              // Add button "إضافة تقرير" on the left
              Padding(
                padding: const EdgeInsets.only(left: 7),
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: textColor, // Use your defined textColor variable here
                  ),
                  child: Text(
                    "إضافة تقرير",
                    style: TextStyle(
                      fontSize: 24,
                      fontFamily: 'font1',
                    ),
                  ),
                  onPressed: () {
                    // Handle add report functionality
                  },
                ),
              ),
              // "نجار محترف" on the right
            ],
          ),
          SizedBox(width: 90,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end, // Right-align the column
              children: [
                Text(
                  "نجار محترف",
                  style:TextStyle(
                 // color: textColor,
                  fontFamily: 'font1',
                  fontSize: 24,
                  ),
                ),
                Row( // Row for location and price
                  mainAxisSize: MainAxisSize.min, // Minimize row width
                  children: [
                    // Location icon
                    Icon(Icons.location_on),
                    SizedBox(width: 5),
                    // "دمشق _ صناعة"
                    Text(
                      "دمشق _ صناعة",
                      style: TextStyle(
                        fontSize: 24,
                        fontFamily: 'font1',
                      ),
                    ),
                  ],
                ),
                Row( // Row for price
                  mainAxisSize: MainAxisSize.min, // Minimize row width
                  children: [
                    // Dollar sign or similar symbol
                    Text(
                      "\$ ", // Replace with your desired symbol
                      style: TextStyle(
                        fontSize: 24,
                        fontFamily: 'font1',
                        color: textColor
                      ),
                    ),
                    // "مبلغ قدره 500 $"
                    Text(
                      "مبلغ قدره 500",
                      style: TextStyle(
                        color: textColor,
                        fontSize: 24,
                        fontFamily: 'font1',
                      ),
                    ),
                  ],
                ),                    SizedBox(width: 5),
                Text(
                  "...عرض المزيد",
                  style: TextStyle(
                      fontSize: 24,
                      fontFamily: 'font1',
                      color: Colors.white
                  ),
                ),


              ],
            ),
          ),


        ],
      ),
    );
  }
}