import 'package:finixmulti_user/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PaymentCard extends StatelessWidget {
  String name;
  String img;
   PaymentCard({required this.name,required this.img});

  @override
  Widget build(BuildContext context) {
    return Container(
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
        ],
      ),
    );
  }
}
