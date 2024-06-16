import 'package:bloom_project/Articles/articles_page.dart';
import 'package:bloom_project/FirstPage/first_page.dart';
import 'package:bloom_project/FirstPage/type_of_user.dart';
import 'package:bloom_project/HomePage/basic_page.dart';
import 'package:bloom_project/HomePage/home_page_View.dart';
import 'package:bloom_project/Interests/interests_view.dart';
import 'package:bloom_project/ProfilePage/pending_project.dart';
import 'package:bloom_project/VerifyOTP/verify_otp_view.dart';
import 'package:bloom_project/RegisterPage/register_page.dart';
import 'package:bloom_project/SearchPage/search_page_view.dart';
import 'package:bloom_project/project_tracking/pay_for_project_tracking_ui.dart';
import 'package:bloom_project/project_tracking/request_for_project_tracking.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get.dart';

import 'AddReport/add_report_view.dart';
import 'Add_Project/add_project_ui.dart';
import 'Communication_Request/communication_request page.dart';
import 'EditProfile/edit_profilePage.dart';
import 'Notifications/notification_controller.dart';
import 'OnBoarding/on_boarding.dart';
import 'Trasactions/annual_transactions.dart';
import 'Trasactions/transaction_details.dart';
import 'Notifications/firebase_notification.dart';
import 'Notifications/firebase_options.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  final notificationController = Get.put(NotificationController());
  final firebaseNotification = FirebaseNotification(notificationController);
  firebaseNotification.initNotification();
  runApp(const MyApp());
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      navigatorKey: navigatorKey,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        primarySwatch: Colors.green,
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: TypeOfUser(),
    );
  }
}
