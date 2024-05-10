import 'package:bloom_project/Articles/articles_page.dart';
import 'package:bloom_project/FirstPage/first_page.dart';
import 'package:bloom_project/HomePage/basic_page.dart';
import 'package:bloom_project/HomePage/home_page_View.dart';
import 'package:bloom_project/Interests/interests_view.dart';
import 'package:bloom_project/LoginPage/login_page.dart';
import 'package:bloom_project/ProfilePage/profile_page.dart';
import 'package:bloom_project/RegisterPage/confirm_account.dart';
import 'package:bloom_project/RegisterPage/register_page.dart';
import 'package:bloom_project/SearchPage/search_page_view.dart';
import 'package:bloom_project/project_tracking/pay_for_project_tracking_ui.dart';
import 'package:bloom_project/project_tracking/request_for_project_tracking.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'Add_Project/add_project_ui.dart';
import 'Communication_Request/communication_request page.dart';
import 'OnBoarding/on_boarding.dart';
import 'Pay_for_a_transaction/pay_for_a_transaction_ui.dart';
import 'Trasactions/annual_transactions.dart';
import 'Trasactions/transaction_details.dart';
//gg
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
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
      home:LoginPage()// OnBoardingScreen(),
    );
  }
}
