import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LocationAddButton extends StatelessWidget {
  String title;
  IconData icon;
  Color bgcolor;
  Color iconColor;
  int index;
  Function(int) callback;
   LocationAddButton({required this.index,required this.title,required this.icon,required this.bgcolor,required this.iconColor,required this.callback});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: (){
            callback(index);
          },
          child: Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: bgcolor,

            ),
            child: Icon(
                icon,
              color: iconColor,
              size: 30,
            ),

          ),
        ),
        SizedBox(height: 4,),
        Text(title,
        style: TextStyle(
          fontFamily: "Brand-Bold"
        ),)
      ],
    );
  }
}
