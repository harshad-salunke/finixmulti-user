import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class MyLableTextField extends StatelessWidget {
  String hinttext;
  String labletext;
  double height;
  double width;
  double radius;
  TextInputType textInputType;
  TextEditingController textEditingController;

  MyLableTextField({
    required this.labletext,
    required this.hinttext,
    required this.height,
    required this.width,
    required this.radius,
    required this.textEditingController,
    required this.textInputType
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textEditingController,
      keyboardType: textInputType,
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        hintText: hinttext,
        labelText: labletext,
        isDense: true,

        contentPadding: EdgeInsets.symmetric(
          vertical: height,
          horizontal: width,
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius),
            borderSide: BorderSide(color: Color(0xff9e0093))),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius),
        ),
      ),
    );
  }
}
