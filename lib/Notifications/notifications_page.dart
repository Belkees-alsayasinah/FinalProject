import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Style/constant.dart';
import 'notification_controller.dart';

class NotificationsPage extends StatelessWidget {
  final NotificationController notificationController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'الإشعارات',
          style: TextStyle(
            color: textColor,
            fontFamily: 'font1',
            fontSize: 34,
          ),
        ),
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
      body: Obx(
            () => ListView.builder(
          itemCount: notificationController.notifications.length,
          itemBuilder: (context, index) {
            RemoteMessage message = notificationController.notifications[index];
            return NotificationItem(message: message);
          },
        ),
      ),
    );
  }
}

class NotificationItem extends StatelessWidget {
  final RemoteMessage message;

  const NotificationItem({required this.message});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 13,left: 13,top: 8),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Container(
          height: MediaQuery.of(context).size.height * 0.15,
          padding: const EdgeInsets.all(16.0),
          margin: const EdgeInsets.only(bottom: 8.0),
          decoration: BoxDecoration(
            color: Colors.white70,
            borderRadius: BorderRadius.circular(8.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 0,
                offset: Offset(3, 3),
                blurRadius: 2,
              ),
            ],
          ),
          child: Row(
            textDirection: TextDirection.rtl,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundColor: Colors.grey.shade300,
                child: Icon(Icons.person, color: textColor),
              ),
              const SizedBox(width: 20.0),
              Expanded(
                child: Column(
                  textDirection: TextDirection.rtl,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      message.notification!.title ?? "Notification",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'font1',
                        fontSize: 18,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 6),
                    Text(
                      message.notification!.body ?? "You have a new notification.",
                      style: TextStyle(
                        fontFamily: 'font1',
                        fontSize: 18,
                        color: grey,
                      ),
                      maxLines: 1,  // تحديد الحد الأقصى لعدد الأسطر
                      overflow: TextOverflow.ellipsis,  // إضافة النقاط في نهاية النص إذا تجاوز عدد الأسطر المحدد
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
