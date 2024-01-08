import 'package:flutter/material.dart';

class MyBoldText extends StatelessWidget {
  String text;
  double fontsize;
  FontWeight fontWeight;
  Color color;
  MyBoldText({required this.text,required this.fontsize,required this.fontWeight,required this.color});


  @override
  Widget build(BuildContext context) {
    return  Text(
            text,
      style: TextStyle(
          fontSize: fontsize,
          fontWeight: fontWeight,
          color: color,
          fontFamily: 'Brand-Bold'),
    );
  }

}
