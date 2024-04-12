import 'package:bloom_project/FirstPage/first_page.dart';
import 'package:bloom_project/LoginPage/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'OnBoarding/on_boarding.dart';
//gg
void main() {
  runApp(const MyApp());
}
MaterialColor customSwatch = MaterialColor(0xFF659B5E, {
  50: Color(0xFF659B5E),
  100: Color(0xFF659B5E),
  200: Color(0xFF659B5E),
  300: Color(0xFF659B5E),
  400: Color(0xFF659B5E),
  500: Color(0xFF659B5E),
  600: Color(0xFF659B5E),
  700: Color(0xFF659B5E),
  800: Color(0xFF659B5E),
  900: Color(0xFF659B5E),
});

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: FirstPage(),
    );
  }
}
