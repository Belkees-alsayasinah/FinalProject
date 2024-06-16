import 'package:firebase_messaging/firebase_messaging.dart';
import 'notification_controller.dart';


class FirebaseNotification {
  final _firebaseMessaging = FirebaseMessaging.instance;
  final NotificationController notificationController;

  FirebaseNotification(this.notificationController);

  Future<void> initNoti() async {
    await _firebaseMessaging.requestPermission();
    String? token = await _firebaseMessaging.getToken();
    print("token: ");
    print(token);

    handleBackgroundNotification();

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      if (message.notification != null) {
        notificationController.addNotification(message);
      }
    });
  }

  void handleMessaging(RemoteMessage? message) {
    if (message == null) return;
    notificationController.addNotification(message);
  }

  Future<void> handleBackgroundNotification() async {
    FirebaseMessaging.instance.getInitialMessage().then(handleMessaging);
    FirebaseMessaging.onMessageOpenedApp.listen(handleMessaging);
  }
}
