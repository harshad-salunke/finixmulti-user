import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';
class TextCard extends StatelessWidget {
  final bool isPast;
  String text;
   TextCard({required this.isPast,required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        text,
        style: TextStyle(
            fontSize: isPast? 14:10,
            fontWeight: FontWeight.bold,
            color: isPast?MyAppColor.primary_color:MyAppColor.primary_light,
            fontFamily: 'Brand-Bold'),
      ),

    );
  }
}
