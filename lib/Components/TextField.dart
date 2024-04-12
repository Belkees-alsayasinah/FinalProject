import 'package:bloom_project/Style/constant.dart';
import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController? control;
  final String label;
  final String hint;
  final IconData? icon;
  final TextInputAction textInputAction;
  final Function(String?)? onsave;
  final String? Function(String?)? validator;
  final double? radius;
  final Function()? suffixPressed;
  final TextInputType keyboardType;
  final bool obscureText;
  final int max;
  final double blurRadius;
  final double offset;

  const MyTextField({
    Key? key,
    this.control,
    required this.label,
    required this.hint,
    this.icon,
    required this.textInputAction,
    required this.onsave,
    this.validator,
    this.radius,
    this.suffixPressed,
    required this.keyboardType,
    this.obscureText = false,
    required this.blurRadius,
    required this.offset,
    this.max = 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: fieldColor,
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(143, 205, 204, 208),
            blurRadius: blurRadius,
            offset: Offset(10, offset),
            spreadRadius: -3, // Controls the shadow spread inward
          )
        ],
      ),
      child:ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: 348 - 16, // Adjust for padding
          maxHeight: 62 - 16, // Adjust for padding
        ),
        child: TextField(
        controller: control,
        onChanged: onsave,
        obscureText: obscureText,
        textInputAction: textInputAction,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          border: InputBorder.none,
          labelText: label,
          hintText: hint,
          hintStyle: TextStyle(
            color: Colors.grey[400],
          ),
          icon: icon != null ? Icon(icon) : null,
          suffixIcon: suffixPressed != null ? IconButton(onPressed: suffixPressed!, icon: Icon(Icons.clear)) : null,
        ),
      ),
    ),
    );
  }
}
