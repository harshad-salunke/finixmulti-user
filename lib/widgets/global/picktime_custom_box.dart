import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';
class PickTimeCustomBox extends StatelessWidget {
 final String text;
 final bool isSelected;
 final double height;
 final double width;
 PickTimeCustomBox({required this.text,required this.isSelected,required this.height,required this.width});


  @override
  Widget build(BuildContext context) {
    return  Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color:isSelected? MyAppColor.primary_color:MyAppColor.white_light,

      ),
      padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
      margin: EdgeInsets.all(5),
      child: Center(
        child: Text(text,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontWeight: FontWeight.w600,
              color:isSelected? Colors.white:MyAppColor.black_light,
              fontSize: 14
          ),
        
        ),
      ),

    );

  }
}
