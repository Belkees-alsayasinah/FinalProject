import 'package:flutter/material.dart';

class MyTextField extends StatefulWidget {
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
  final int? max;
  final double blurRadius;
  final double offset;
  final double width;
  final double height;

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
    required this.width,
    required this.height,
    this.max,
  }) : super(key: key);

  @override
  _MyTextFieldState createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  bool _obscureText = true;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Container(
      width: widget.width,
      height: screenSize.height * 0.08,
      padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey[200],
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(143, 205, 204, 208),
            blurRadius: widget.blurRadius,
            offset: Offset(10, widget.offset),
            spreadRadius: -3,
          ),
        ],
      ),
      child: TextField(
        textDirection: TextDirection.rtl,
        controller: widget.control,
        onChanged: widget.onsave,
        obscureText: _obscureText,
        textInputAction: widget.textInputAction,
        keyboardType: widget.keyboardType,
        maxLines: widget.max ?? 1,
        decoration: InputDecoration(
          border: InputBorder.none,
          labelText: widget.label,
          hintText: widget.hint,
          hintStyle: TextStyle(
            color: Colors.grey[400],
          ),
          suffix: widget.icon != null ? Icon(widget.icon) : null,
          suffixIcon: widget.obscureText ? IconButton(
            icon: Icon(_obscureText ? Icons.visibility : Icons.visibility_off),
            onPressed: () {
              setState(() {
                _obscureText = !_obscureText;
              });
            },
          ) : null,
          contentPadding:
          EdgeInsets.symmetric(vertical: 10.0), // Adjusted content padding
        ),
        textAlign: TextAlign.right,
      ),
    );
  }
}
