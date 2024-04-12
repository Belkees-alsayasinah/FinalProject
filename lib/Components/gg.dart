import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Style/constant.dart';

class customButton extends StatelessWidget {
  const customButton({
    required this.text,
    required this.radius,
    required this.function,
    this.background,
    this.width,
    required this.onTap,
    this.hoverElevation,
  });

  final double? width;
  final double? hoverElevation;

  final Color? background;
  final Function() function;
  final String text;
  final double radius;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius
            .all(
             Radius.circular(radius),),

            color: black.withOpacity(0.7), // Color.fromARGB(255, 78, 21, 111),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                spreadRadius: 2,
                blurRadius: 10,
                offset: Offset(0, 7),
              )
            ]),
        width: width,
        height: 40,
        child: MaterialButton(
          onPressed: () {
            function();
          },
          child: Text(
            text,
            style: TextStyle(
              fontFamily: 'Rubik',
              fontSize: 18.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}