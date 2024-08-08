import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'notification_controller.dart';
import 'package:get/get.dart';

class FirebaseNotification {
  final _firebaseMessaging = FirebaseMessaging.instance;

  // final NotificationController notificationController;
  //
  // FirebaseNotification(this.notificationController);

  Future<void> initNotification() async {
    await _firebaseMessaging.requestPermission();
    String? token = await _firebaseMessaging.getToken();
    print("token: ");
    print(token);

    handleBackgroundNotification();

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      if (message.notification != null) {
        // notificationController.addNotification(message);
        Get.snackbar(
          message.notification!.title ?? 'Notification',
          message.notification!.body ?? 'You have a new notification',
          icon: Icon(
            Icons.notifications,
            size: 40,
            // color: Colors.white,
          ),
          duration: Duration(seconds: 5),
          snackPosition: SnackPosition.TOP,
        );
        final NotificationController controller = Get.find();
      }
    });
  }

  void handleMessaging(RemoteMessage? message) {
    if (message == null) return;
    // notificationController.addNotification(message);
    if (message.notification != null) {
      // Get.snackbar(
      //   message.notification!.title ?? 'Notification',
      //   message.notification!.body ?? 'You have a new notification',
      //   icon: Icon(
      //     Icons.notifications,
      //     size: 40,
      //     // color: Colors.white,
      //   ),
      //   duration: Duration(seconds: 5),
      //   snackPosition: SnackPosition.TOP,
      // );
    }
  }

  Future<void> handleBackgroundNotification() async {
    FirebaseMessaging.instance.getInitialMessage().then(handleMessaging);
    FirebaseMessaging.onMessageOpenedApp.listen(handleMessaging);
  }
}
