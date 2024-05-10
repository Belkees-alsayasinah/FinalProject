import 'package:flutter/material.dart';

import '../Style/constant.dart';

class NotificationsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('الإشعارات', // Title text
            style: TextStyle(
              color: textColor,
              fontFamily: 'font1',
              fontSize: 34,
            )),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Icon(
              Icons.notifications,
              color: textColor,
              size: 30,
            ),
          )
        ],
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
        height: MediaQuery.of(context).size.height * 0.15,
        padding: const EdgeInsets.all(16.0),
        // Content padding
        margin: const EdgeInsets.only(bottom: 8.0),
        // Space between notifications
        decoration: BoxDecoration(
          color: Colors.white70, // Light gray background
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 0, // انتشار الظل
              offset: Offset(3, 3), // تحديد الزاوية والاتجاه
              blurRadius: 2, // وضوح الظل
            ),
          ],
        ),
        child: Row(
          textDirection: TextDirection.rtl,
          mainAxisAlignment: MainAxisAlignment.start, // Right-align content
          children: [
            CircleAvatar(
              // Circle avatar on the right
              backgroundColor: Colors.grey.shade300, // Adjust background color
              child: Icon(Icons.person, color: textColor),
            ),
            const SizedBox(width: 20.0), // Space between avatar and text
            Expanded(
              // Flexible text container
              child: Column(
                textDirection: TextDirection.rtl,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "تم الاستثمار في مشروعك من قبل محمد الأحمد.",
                    // Notification text (replace with actual data)
                    style: TextStyle(
                        color: Colors.black, fontFamily: 'font1', fontSize: 25),
                    maxLines: 1, // Allow for two lines of text
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                      // height: 6,
                      ),
                  Text(
                    "9-4-2024",
                    style: TextStyle(
                        fontFamily: 'font1', fontSize: 18, color: grey),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
