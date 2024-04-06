import 'package:flutter/material.dart';

const Color white = Colors.white;
const Color black = Colors.black;
const Color red = Colors.red;
const Color darkBlue = Color.fromRGBO(19, 26, 44, 1.0);
const Color themeApp = Color.fromARGB(255, 222, 95, 236);
const Color buttonTheme = Color.fromARGB(255, 170, 186, 162);
const double appPadding = 30.0;
Color buttonColor = Color(0xFF659B5E);
const Color firstBackColor = Color.fromARGB(255, 78, 21, 111);
const Color secondBackColor = Color.fromARGB(255, 222, 95, 236);
const Color thirdBackColor = Color.fromARGB(255, 186, 162, 168);
const BoxDecoration gradienBackground = BoxDecoration(
  gradient: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        firstBackColor,
        secondBackColor,
        thirdBackColor,
      ]
  ),
);


const Color c = Color.fromARGB(255, 147, 122, 128);

void printFullText(String text) {
  final Pattern = RegExp('.{1,800}');
  Pattern.allMatches(text).forEach((match) => print(match.group(0)));
}

late String token = '';

//     Size size = MediaQuery.of(context).size;

// {status: true, message: Registration done successfully, data: {email: barkes@gmail.com, name: barkes, phone: 0998055117, id: 16360, image: https://student.valuxapps.com/storage/assets/defaults/user.jpg, token: GadMj4gpqJGg2pgPvoD9QSmFPnP0Um92vR1b9wkjrYZCGvQtLdK7M9CIzlHhiz2303uYgs}}
