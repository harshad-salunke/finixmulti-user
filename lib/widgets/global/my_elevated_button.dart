import 'dart:ui';

import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';

class MyElevatedButton extends StatelessWidget {
  String title;
  double height;
  double width;
  Function() onPressed;
  double fontsize;
double radius;
FontWeight fontWeight;
Color bg_color;
  MyElevatedButton(
      {required this.title,
      required this.height,
      required this.width,
        required this.fontsize,
        required this.radius,
        required this.bg_color,
      required  this.fontWeight,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          minimumSize: Size(width, height),
          backgroundColor:bg_color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
          ),
        ),
        child: Text(
          title,
          style: TextStyle(

            color: MyAppColor.white_light,
            fontWeight: fontWeight,
            fontFamily: "Brand-Bold",
            fontSize: fontsize,
          ),
        ),
      ),
    );
  }
}
