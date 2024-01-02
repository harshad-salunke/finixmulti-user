import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CircularIconButton extends StatelessWidget {
  String title;
  IconData icon;
  Color bgcolor;
  Color iconColor;
  int index;
  double height;
  double width;
  double iconsize;
  bool hastext;
  Function(int) callback;
  CircularIconButton({required this.index,
     this.title='',
    required this.icon,required
    this.bgcolor,
    required this.iconColor,
    required this.height,
    required this.width,
    required this.iconsize,
    required this.hastext,
    required this.callback});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: (){
            callback(index);
          },
          child: Container(
            height: height,
            width: width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: bgcolor,

            ),
            child: Icon(
                icon,
              color: iconColor,
              size: iconsize,
            ),

          ),
        ),
     hastext?SizedBox(height: 4,):SizedBox(),
        hastext?   Text(title,
        style: TextStyle(
          fontFamily: "Brand-Bold"
        ),):SizedBox()
      ],
    );
  }
}
