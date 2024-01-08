import 'package:flutter/material.dart';
import 'package:gif/gif.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/app_colors.dart';
class ProgressDialog extends StatelessWidget {
  const ProgressDialog({Key? key}) : super(key: key);

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
              'LOADING . .',
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
