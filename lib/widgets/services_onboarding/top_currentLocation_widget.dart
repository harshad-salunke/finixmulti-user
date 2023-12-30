import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';
class TopCurrentLocaton extends StatefulWidget {
  const TopCurrentLocaton({Key? key}) : super(key: key);

  @override
  State<TopCurrentLocaton> createState() => _TopCurrentLocatonState();
}

class _TopCurrentLocatonState extends State<TopCurrentLocaton> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child:Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.fromLTRB(10, 5, 5, 5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            color: Colors.white
        ),
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Your Current Location",
              style: TextStyle(fontFamily: "Brand-Bold"),
            ),

            Row(
              children: [

                Icon(
                  Icons.edit_location,
                  size: 30,
                  color: MyAppColor.primary_color,
                ),
                Text(
                  "Pune , Hadapsur,412203",
                  style: TextStyle(fontFamily: "Brand-Bold"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
