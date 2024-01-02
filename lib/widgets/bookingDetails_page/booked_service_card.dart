import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/app_colors.dart';
import '../services_onboarding/orderSummary_page/order_summary_service_card.dart';

class BookedServiceCard extends StatelessWidget {
  String title;
  BookedServiceCard({required this.title}) ;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin:EdgeInsets.fromLTRB(10,0,10,5),
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: MyAppColor.primary_light,
                  blurRadius: 10.0,
                  spreadRadius: 0.5,
                  offset: Offset(0.7,0.7)
              )]
        ),
        child:   Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image(
              image: AssetImage(
                  "assets/images/newlogo.png"
              ),
              fit: BoxFit.cover,
              height: 60,
              width: 60,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Fan Service",
                  style: GoogleFonts.openSans(
                      fontSize: 14,
                      fontWeight: FontWeight.w700
                  ),
                ),

                Text("Pick up time",
                  style: GoogleFonts.openSans(
                      fontSize: 12,
                      fontWeight: FontWeight.w700
                  ),),
                Text("12 April, 2023, 11:00 PM ",
                  style: GoogleFonts.ubuntu(
                    fontSize: 12,
                    color: MyAppColor.black_light,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            Expanded(child: Container()),

            Icon(Icons.navigate_next)
          ],
        )
    );
  }
}
