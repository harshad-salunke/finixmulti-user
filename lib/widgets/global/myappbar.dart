import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';

class MyAppBar extends StatelessWidget {
  String title;
  MyAppBar({required this.title}) ;

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: EdgeInsets.fromLTRB(0, 0, 8, 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 40,
                width: 40,
                margin: EdgeInsets.only(left: 10),
                child: IconButton(

                    icon: const Icon(
                      Icons.arrow_back_outlined,
                      size: 28,
                      color:Color(0xff9e0093),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    }),
              ),
              SizedBox(
                width: 20,
              ),
              Text(
                title,
                style:TextStyle(
                  color: MyAppColor.primary_color,
                  fontFamily: "Brand-Bold",

                  fontSize: 23, fontWeight: FontWeight.bold,

                ),
              ),
            ],
          ),


        ],
      ),
    );
  }
}



