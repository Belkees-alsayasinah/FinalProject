import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Style/constant.dart';
import 'notification_controller.dart';
import 'notification_item.dart';
import 'notification_model.dart';

class NotificationsPage extends StatelessWidget {
  NotificationController notificationController = Get.put(NotificationController());

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
            () {
          if (notificationController.isLoad.value) {
            return Center(child: CircularProgressIndicator());
          }
          if (notificationController.models.isEmpty) {
            return Center(child: Text('لا توجد إشعارات حالياً'));
          }
          return ListView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: notificationController.models.length,
            itemBuilder: (context, index) {
              NotificationModel model = notificationController.models[index];
              return NotificationItem(model: model);
            },
          );
        },
      ),
    );
  }


}
