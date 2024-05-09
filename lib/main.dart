import 'package:bloom_project/FirstPage/first_page.dart';
import 'package:bloom_project/HomePage/basic_page.dart';
import 'package:bloom_project/HomePage/home_page_View.dart';
import 'package:bloom_project/Interests/interests_view.dart';
import 'package:bloom_project/LoginPage/login_page.dart';
import 'package:bloom_project/ProfilePage/profile_page.dart';
import 'package:bloom_project/RegisterPage/confirm_account.dart';
import 'package:bloom_project/RegisterPage/register_page.dart';
import 'package:bloom_project/SearchPage/search_page_view.dart';
import 'package:bloom_project/SectorPage/sector_page_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'Articles/articles_page.dart';
import 'OnBoarding/on_boarding.dart';
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
