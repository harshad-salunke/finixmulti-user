import 'package:finixmulti_user/utils/app_colors.dart';
import 'package:flutter/material.dart';
class StarCardWidget extends StatelessWidget {
  bool isClicked;
  int index;
  Function callback;
   StarCardWidget({required this.isClicked,required this.index,required this.callback});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: 55,
      margin: EdgeInsets.only(left: 9),
      child: Card(
        child: InkWell(
          onTap: (){
            callback(index);
          },
          child: Container(
            child: Icon(
               Icons.star,
              size: 28,
              color:  isClicked?Colors.orange:MyAppColor.primary_light,
            ),
          ),
        ),
      ),
    );
  }
}
