import 'package:finixmulti_user/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class OrderSummaryServiceCard extends StatelessWidget {
  const OrderSummaryServiceCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        color: MyAppColor.white_light,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image(
            image: AssetImage(
                "assets/images/newlogo.png"
            ),
            fit: BoxFit.cover,
            height: 80,
            width: 80,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("Fan Service",
                style: GoogleFonts.openSans(
                    fontSize: 14,
                    fontWeight: FontWeight.w700
                ),
              ),
              SizedBox(
                height: 8,
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
        ],
      ),
    );
  }
}
