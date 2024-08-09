
import 'dart:ui';

import 'package:flutter/material.dart';

class LoginPageStyles {
  final Size screenSize;
  final Color textColor = const Color(0xFF556F44); // Example color
  final Color buttonColor = const Color(0xFF659B5E); // Example color
  final TextStyle titleStyle;
  final TextStyle labelStyle;
  final TextStyle buttonTextStyle;
  final TextStyle linkTextStyle;

  LoginPageStyles(this.screenSize)
      : titleStyle = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: screenSize.width * 0.08,
    fontFamily: 'font1',
    color: const Color(0xFF556F44),
  ),
        labelStyle = TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: screenSize.width * 0.05,
          fontFamily: 'font1',
        ),
        buttonTextStyle = TextStyle(
          fontSize: screenSize.width * 0.07,
          color: Colors.white,
        ),
        linkTextStyle = TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: screenSize.width * 0.05,
          fontFamily: 'font1',
          color: const Color(0xFF556F44),
        );

  double get textFieldWidth => screenSize.width * 0.9;
  double get textFieldHeight => screenSize.height * 0.08;
  double get buttonWidth => screenSize.width * 0.9;
  double get buttonHeight => screenSize.height * 0.08;
  double get loadingSize => screenSize.width * 0.1;
}
