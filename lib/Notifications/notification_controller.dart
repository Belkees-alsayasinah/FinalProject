import 'package:get/get.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class NotificationController extends GetxController {
  var notifications = <RemoteMessage>[].obs;

  void addNotification(RemoteMessage message) {
    notifications.add(message);
  }
}
