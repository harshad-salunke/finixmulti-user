import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';
class TextCard extends StatelessWidget {
  final bool isPast;
  String text;
  Color color;
   TextCard({required this.isPast,required this.text,required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 4),
      child: Text(
        text,
        style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: isPast?color:MyAppColor.primary_light,
            fontFamily: 'Brand-Bold'),
      ),

    );
  }
}
