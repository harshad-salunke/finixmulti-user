import 'package:flutter/material.dart';
import 'package:gif/gif.dart';
import 'package:google_fonts/google_fonts.dart';

class DiscountCard extends StatefulWidget {
  const DiscountCard({Key? key}) : super(key: key);

  @override
  State<DiscountCard> createState() => _DiscountCardState();
}

class _DiscountCardState extends State<DiscountCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Color(0xff6ec3df),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "20 % off ",
                style: GoogleFonts.openSans(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w900,
                    ),
              ),
              Text(
                "Today Special !",
                style: GoogleFonts.openSans(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 18),
              ),
              Text(
                "Get Discount on service & \n product only valid of today",
                style: GoogleFonts.openSans(
                    color: Colors.white70, fontWeight: FontWeight.w300,
                    fontSize: 13),
              )
            ],
          ),
          Gif(
            image: AssetImage("assets/images/product_banner.gif"),
            height: 155,
            width: 130,
            autostart: Autostart.once,
            fit: BoxFit.contain,
          )

        ],
      ),
    );
  }
}
