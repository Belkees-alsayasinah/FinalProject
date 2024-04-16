import 'package:flutter/material.dart';
const Color white = Colors.white;
const Color black = Colors.black;
const Color red = Colors.red;
const Color grey = Colors.grey;

const double appPadding = 30.0;
Color buttonColor = Color(0xFF659B5E);
//Color buttonColorOpa0 = Color(0xFF96B990);
Color buttonColorOpa = Color(0xFF92A78E);

//Color buttonColorOpa = Color(0xC196B990);
Color textColor = Color(0xFF556F44);
Color fieldColor = Color(0xFFE8E8E8);

void printFullText(String text) {
  final Pattern = RegExp('.{1,800}');
  Pattern.allMatches(text).forEach((match) => print(match.group(0)));
}
late String token = '';

// Size size = MediaQuery.of(context).size;

// {status: true, message: Registration done successfully, data: {email: barkes@gmail.com, name: barkes, phone: 0998055117, id: 16360, image: https://student.valuxapps.com/storage/assets/defaults/user.jpg, token: GadMj4gpqJGg2pgPvoD9QSmFPnP0Um92vR1b9wkjrYZCGvQtLdK7M9CIzlHhiz2303uYgs}}
