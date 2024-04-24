import 'package:bloom_project/EditProfile/edit_profilePage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Style/constant.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

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
                fontSize: 25,
                fontWeight: FontWeight.bold,
                fontFamily: 'font1',
              ),
            ),
            Text(
              'email@gmail.com',
              style: TextStyle(
                fontSize: 18,
                fontFamily: 'font1',
              ),
            ),
            Text(
              '0959867573',
              style: TextStyle(
                fontSize: 18,
                fontFamily: 'font1',
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
    return Row(
      children: [
        IconButton(
          icon: Icon(Icons.more_vert),
          onPressed: () {
            // Handle project options functionality
          },
        ),
        Text(
          'Project Name',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            fontFamily: 'font1',
          ),
        ),
        Spacer(),
        Row(
          children: [
            Text(
              'SP',
              style: TextStyle(
                fontSize: 16,
                fontFamily: 'font1',
              ),
            ),
            SizedBox(width: 5),
            Text(
              '\$1000', // Replace with actual price
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                fontFamily: 'font1',
              ),
            ),
          ],
        ),
        IconButton(
          icon: Icon(Icons.add), // Replace with desired icon for adding report
          onPressed: () {
            // Handle add report functionality
          },
        ),
      ],
    );
  }
}