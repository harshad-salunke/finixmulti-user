import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/app_colors.dart';
class RadioButtonPaymentCard extends StatelessWidget {
  String name;
  String img;
  Color color;
  RadioButtonPaymentCard({required this.name,required this.img,required this.color});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom:6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(
          color: MyAppColor.white_light,
          width: 1.0,
        ),
      ),
      padding: EdgeInsets.all(10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 10,
          ),
          Image(
            image: AssetImage("assets/icons/${img}"),
            height: 35,
            width: 35,

          ),
          SizedBox(
            width: 15,
          ),
          Text(
            name,
            style:
            GoogleFonts.openSans(fontSize: 17, fontWeight: FontWeight.w500),
          ),
          Expanded(child: Container()),
          Container(
            height: 25,
            width: 25,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(50),
              border: Border.all(
                color: MyAppColor.white_light
              )
            ),
          )
        ],
      ),
    );
  }
}


