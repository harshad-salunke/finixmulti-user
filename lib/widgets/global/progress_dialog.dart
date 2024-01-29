import 'package:flutter/material.dart';
import 'package:gif/gif.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/app_colors.dart';
class ProgressDialog extends StatelessWidget {
  String text;
   ProgressDialog({required this.text}) ;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,

      child: Container(
        width: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [
            Gif(
              image:
              AssetImage("assets/images/loading.gif"),
              autostart: Autostart.loop,
              height: 50,
            ),
            SizedBox(width: 5,),
            Text(
              '${text} . .',
              style: GoogleFonts.ubuntu(
                color:MyAppColor.golden_color,
                fontSize: 14,
                fontWeight: FontWeight.w900,
              ),
            ),


          ],
        ),
      ),
    );
  }
}
