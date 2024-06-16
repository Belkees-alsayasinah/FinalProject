import 'package:flutter/material.dart';

class MyLabelText extends StatelessWidget {
  final String text;

  MyLabelText({
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 18,
        fontFamily: 'font1',
        fontWeight: FontWeight.bold,
      ),
      textDirection: TextDirection.rtl,
    );
  }
}
