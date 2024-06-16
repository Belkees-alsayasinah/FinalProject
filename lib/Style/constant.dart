import 'package:flutter/material.dart';
const Color white = Colors.white;
const Color black = Colors.black;
const Color red = Colors.red;
const Color grey = Colors.grey;
const double appPadding = 30.0;
Color buttonColor = Color(0xFF659B5E);
Color buttonColorOpa = Color(0xFF92A78E);
const Color textColor = Color(0xFF556F44);
Color fieldColor = Color(0xFFE8E8E8);
Color cardColor = Color(0xFFF3F3F3);
void printFullText(String text) {
  final Pattern = RegExp('.{1,800}');
  Pattern.allMatches(text).forEach((match) => print(match.group(0)));
}
late String token = '';
const titleStyle =
TextStyle(
  color: textColor,
  fontFamily: 'font1',
  fontSize: 30,
);
