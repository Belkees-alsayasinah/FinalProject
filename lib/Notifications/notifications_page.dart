import 'package:flutter/material.dart';

import '../Style/constant.dart';

class NotificationsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center, // Center the title
          children: [
            Text(
              'الإشعارات', // Title text
          style: TextStyle(
            color: textColor,
            fontFamily: 'font1',
            fontSize: 34,)
            ),
            const SizedBox(width: 16.0), // Space between title and icon
             Icon(Icons.notifications, color: textColor,), // Bell icon
          ],
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: 3, // Replace with actual notification count
          itemBuilder: (context, index) {
            return NotificationItem(); // No need to pass textColor
          },
        ),
      ),
    );
  }
}

class NotificationItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl, // Set RTL layout
      child: Container(
        padding: const EdgeInsets.all(16.0), // Content padding
        margin: const EdgeInsets.only(bottom: 8.0), // Space between notifications
        decoration: BoxDecoration(
          color: Colors.grey.shade200, // Light gray background
          borderRadius: BorderRadius.circular(8.0), // Rounded corners
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end, // Right-align content
          children: [
            CircleAvatar( // Circle avatar on the right
              backgroundColor: Colors.grey.shade300, // Adjust background color
              child: Icon(
                Icons.person, color: textColor              ),
            ),
            const SizedBox(width: 8.0), // Space between avatar and text
            Expanded( // Flexible text container
              child: Text(
                "إشعار بأمر مهم", // Notification text (replace with actual data)
                style: TextStyle(
                  color: Colors.black, // Adjust text color
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
