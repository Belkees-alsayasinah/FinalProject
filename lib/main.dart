import 'package:bloom_project/Articles/articles_page.dart';
import 'package:bloom_project/FirstPage/first_page.dart';
import 'package:bloom_project/FirstPage/type_of_user.dart';
import 'package:bloom_project/HomePage/basic_page.dart';
import 'package:bloom_project/HomePage/home_page_View.dart';
import 'package:bloom_project/Interests/interests_view.dart';
import 'package:bloom_project/ProfilePage/profile_page.dart';
import 'package:bloom_project/VerifyOTP/verify_otp_view.dart';
import 'package:bloom_project/RegisterPage/register_page.dart';
import 'package:bloom_project/SearchPage/search_page_view.dart';
import 'package:bloom_project/project_tracking/pay_for_project_tracking_ui.dart';
import 'package:bloom_project/project_tracking/request_for_project_tracking.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'AddReport/add_report_view.dart';
import 'Add_Project/add_project_ui.dart';
import 'Communication_Request/communication_request page.dart';
import 'EditProfile/edit_profilePage.dart';
import 'OnBoarding/on_boarding.dart';
import 'Trasactions/annual_transactions.dart';
import 'Trasactions/transaction_details.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
          primarySwatch: Colors.green,
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        home: TypeOfUser()
        );
  }
}
