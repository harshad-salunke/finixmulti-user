import 'package:finixmulti_user/utils/app_colors.dart';
import 'package:finixmulti_user/widgets/home_page/popular_service_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ServiceSection extends StatefulWidget {
  const ServiceSection({Key? key}) : super(key: key);

  @override
  State<ServiceSection> createState() => _ServiceSectionState();
}

class _ServiceSectionState extends State<ServiceSection> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(15, 5, 15, 0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Popular Services",
                style: GoogleFonts.openSans(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text(
                'View all',
                style: GoogleFonts.openSans(fontSize: 13, color: MyAppColor.primary_color),
              )
            ],
          ),
         SizedBox(
           height: 10,
         ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                ServiceCard(
                  img: "cctv_icon.png",
                  title: "CCTV Service",
                  bg_color:Color(0xfffff7d8),
                  icon_color: Color(0xfff4d03e),
                ),
                ServiceCard(
                  img: "switch_icon.png",
                  title: "Switches Service",
                  bg_color:Color(0xffe7fbff),
                  icon_color: Color(0xff7ec5d4),
                ),
                ServiceCard(
                  img: "fan_icon.png",
                  title: "Fan Service",
                  bg_color:Color(0xfff5f0ff),
                  icon_color: Color(0xff9769ff),
                ),
                ServiceCard(
                  img: "cctv_icon.png",
                  title: "CCTV Service",
                  bg_color:Color(0xfffff7d8),
                  icon_color: Color(0xfff4d03e),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
