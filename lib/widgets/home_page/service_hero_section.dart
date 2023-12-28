import 'package:finixmulti_user/utils/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class ServiceHeroSection extends StatelessWidget {
  const ServiceHeroSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 20, 15, 0),
      margin: EdgeInsets.only(top: 15),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "Book Service in 15 Seconds",
            style: GoogleFonts.openSans(fontSize: 18, fontWeight: FontWeight.w700),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            "Select Service you want and get  lighting fast experience",
            style: GoogleFonts.openSans(fontSize: 14, fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 20,
          ),
          Column(
            children:[
              Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                Container(
                  decoration: BoxDecoration(
                      color: MyAppColor.primary_light,
                      borderRadius: BorderRadius.all(Radius.circular(50))),
                  padding: EdgeInsets.all(20),
                  child: Image(
                    image: AssetImage("assets/serviceImg/switch_icon.png"),
                    width: 40,
                    height: 40,
                    color: MyAppColor.primary_color,
                  ),
                ),
                Icon(
                  Icons.arrow_forward,
                  color: MyAppColor.primary_color,
                  size: 35,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: MyAppColor.primary_light,
                      borderRadius: BorderRadius.all(Radius.circular(50))),
                  padding: EdgeInsets.all(20),
                  child: Icon(
                    Icons.alarm,
                   size: 40,
                    color: MyAppColor.primary_color,
                  ),
                ),
                Icon(
                  Icons.arrow_forward,
                  color: MyAppColor.primary_color,
                  size: 35,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: MyAppColor.primary_light,
                      borderRadius: BorderRadius.all(Radius.circular(50))),
                  padding: EdgeInsets.all(20),
                  child: Icon(
                    Icons.check_circle_outlined,
                    size: 40,
                    color: MyAppColor.primary_color,
                  ),
                ),

              ],
            ),

              Container(
                margin: EdgeInsets.fromLTRB(15, 10, 15, 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                   
                    Text(" Select\nService",
                      style: GoogleFonts.openSans(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 12
                
                      ),),
                    Text("   Schedule\n Date & Time",
                      style: GoogleFonts.openSans(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 12
                
                      ),),
                    Text("Booked\nService",
                      style: GoogleFonts.openSans(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 12
                
                      ),)
                
                
                  ],
                ),
              )
          ]),
          Padding(
            padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
            child: ElevatedButton(

                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: MyAppColor.primary_color,

                    shape: RoundedRectangleBorder(

                        borderRadius: BorderRadius.all(Radius.circular(5)))),
                child: Text("Book Now",
                    style: GoogleFonts.openSans(
                    color: Colors.white
                ),)),
          ),
        ],
      ),
    );
  }
}
