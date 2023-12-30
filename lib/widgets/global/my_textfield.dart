import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MyTextField extends StatelessWidget {
  String hinttext;
  double height;
  double width;
  double radius;
  TextEditingController textEditingController;
  Widget? iconData;

  MyTextField({
    required this.hinttext,
    required this.height,
    required this.width,
    required this.radius,
    this.iconData,
    required this.textEditingController,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textEditingController,
      decoration: InputDecoration(
        hintText: hinttext,
        prefixIcon: iconData ?? Container(),
        contentPadding: EdgeInsets.symmetric(
          vertical: height,
          horizontal: width,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius),
          borderSide: BorderSide(color: Color(0xff9e0093)),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius),
        ),
      ),
    );
  }
}
